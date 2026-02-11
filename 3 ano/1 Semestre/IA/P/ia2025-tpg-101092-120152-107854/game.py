import asyncio
import logging
import random
import math
from collections import deque
from unicodedata import name


from consts import (
    KILL_CENTIPEDE_BODY_POINTS,
    KILL_FLEE_POINTS,
    TIMEOUT,
    Direction,
    HISTORY_LEN,
    COOL_DOWN,
    KILL_MUSHROOM_POINTS,
    KILL_SPIDER_POINTS,
    MUSHROOM_SPAWN_RATE,
)
from mapa import Map
from debug_map_drawer import draw_game_state, draw_game_state_compact

logger = logging.getLogger("Game")
logger.setLevel(logging.DEBUG)

# `next_frame()` uses a separate logger name for map debug output.
# Some project variants define this elsewhere; keep it here to avoid NameError.
map_logger = logging.getLogger("Map")

INITIAL_SCORE = 0
GAME_SPEED = 60  # frames per second
MAP_SIZE = (40, 24)


class Centipede:
    def __init__(
        self,
        player_name: str,
        segments: list[tuple[int, int]],
        dir: Direction = Direction.EAST,
    ):
        self._name = player_name
        self._body = segments
        logger.info(f"Centipede {self._name} created with body {self._body}")
        self._direction = dir
        self._history = deque(maxlen=HISTORY_LEN)
        self._alive = True
        self.lastkey = ""
        self.to_grow = 1
        self.range = 3
        self.reverse_next_move = False
        self.move_dir = 1  # 1 means moving down, -1 means moving up
        self.waiting_to_move_vertically = False

    def grow(self, amount=1):
        self.to_grow += amount
        self.to_grow = max(-len(self._body) + 1, self.to_grow)

    @property
    def head(self):
        return self._body[-1]

    @property
    def tail(self):
        return self._body[:-1]

    @property
    def body(self):
        return self._body

    @property
    def alive(self):
        return self._alive

    def kill(self):
        self._alive = False

    @property
    def name(self):
        return self._name

    @property
    def history(self):
        return str(list(self._history))

    @property
    def direction(self):
        return self._direction

    @property
    def x(self):
        return self._pos[0]

    @property
    def y(self):
        return self._pos[1]

    @property
    def __str__(self) -> str:
        return f"{self.name}({self._body}) - dir={self.direction}"

    @property
    def json(self):
        return {"name": self._name, "body": self._body, "direction": self._direction}

    def exists(self):
        return len(self._body) > 0 and self._alive

    def move(self, mapa, mushrooms, centipedes):
        # debt resolution first - prioritize vertical movement if waiting
        if self.waiting_to_move_vertically:
            new_pos_vert = (self.head[0], self.head[1] + self.move_dir)

            if 0 <= new_pos_vert[1] < mapa.size[1] and new_pos_vert not in [
                m.pos for m in mushrooms
            ]:
                self._body.append(new_pos_vert)
                self._body.pop(0)
                self._history.append(new_pos_vert)
                self.waiting_to_move_vertically = False
                return

        # check map collisions
        new_pos = mapa.calc_pos(self.head, self.direction, traverse=False)

        # check collisions with other centipedes
        for centipede in centipedes:
            if (
                centipede.exists()
                and centipede.name != self.name
                and new_pos in centipede.body
            ):
                logger.info(
                    "Centipede <%s> collided with <%s>", centipede.name, self.name
                )
                self.reverse_direction()
                return

        # check mushroom collisions
        if new_pos in [mushroom.pos for mushroom in mushrooms]:
            logger.info(f"Centipede <{self.name}> hit mushroom at {new_pos}")
            new_pos = self.head

        # wall hit
        if new_pos == self.head or self.reverse_next_move:
            # if we can't move to the new position, we banged against a wall
            logger.info(
                "Head %s can't move to %s with direction %s. Turning.",
                self.head,
                new_pos,
                self.direction,
            )
            # so we change direction and move down/up instead
            if self.head[1] == 0:
                self.move_dir = 1
            elif self.head[1] >= (mapa.size[1] - 1):
                self.move_dir = -1

            # vertical position
            new_pos_vert = (self.head[0], self.head[1] + self.move_dir)

            # check if it's blocked vertically
            if 0 <= new_pos_vert[1] < mapa.size[1] and new_pos_vert not in [
                m.pos for m in mushrooms
            ]:
                # it moves vertically on this tick
                new_pos = new_pos_vert
                logger.info(f"Centipede <{self.name}> moving vertically to {new_pos}")
            else:
                # can't move vertically right now, set up a debt
                logger.info(f"Centipede <{self.name}> vertical move blocked at {new_pos_vert}. Waiting.")
                new_pos = self.head
                self.waiting_to_move_vertically = True

            self._direction = (
                Direction.EAST if self.direction == Direction.WEST else Direction.WEST
            )
            self.reverse_next_move = False

        # debt resolution
        if self.waiting_to_move_vertically:
            # recalculate new vertical position
            new_pos_vert = (self.head[0], self.head[1] + self.move_dir)

            # check if it's blocked vertically
            if 0 <= new_pos_vert[1] < mapa.size[1] and new_pos_vert not in [
                m.pos for m in mushrooms
            ]:
                new_pos = new_pos_vert
                self.waiting_to_move_vertically = False
                logger.info(f"Centipede <{self.name}> resolving debt, moving vertically to {new_pos}")
            else:
                 logger.info(f"Centipede <{self.name}> debt resolution still blocked at {new_pos_vert}.")

        self._body.append(new_pos)
        self._body.pop(0)

        self._history.append(new_pos)

    def collision(self, pos):
        return pos in self._body

    def reverse_direction(self):
        self._body.reverse()
        if self.direction == Direction.EAST:
            self._direction = Direction.WEST
        elif self.direction == Direction.WEST:
            self._direction = Direction.EAST
        elif self.direction == Direction.NORTH:
            self._direction = Direction.SOUTH
        elif self.direction == Direction.SOUTH:
            self._direction = Direction.NORTH

    def take_hit(self, blast):
        if blast in self._body:
            index = self._body.index(blast)
            old_body = self._body.copy()
            new_body = self._body[index + 1 :]
            self._body = self._body[:index]

            logger.info(
                f"Centipede {self.name}({old_body}) was hit at {blast}, new body {self._body}, new centipede {new_body}"
            )

            if len(self._body) < 1:
                self.kill()
            return new_body
        return []

    def _calc_dir(self, old_pos, new_pos):
        if old_pos[0] < new_pos[0]:
            return Direction.EAST
        elif old_pos[0] > new_pos[0]:
            return Direction.WEST
        elif old_pos[1] < new_pos[1]:
            return Direction.SOUTH
        elif old_pos[1] > new_pos[1]:
            return Direction.NORTH
        logger.error(
            "Can't calculate direction from %s to %s, please report as this is a bug",
            old_pos,
            new_pos,
        )
        return None


class Spider:
    def __init__(self, pos):
        self._pos = pos
        self._alive = True
        # _origin_y is the baseline vertical position for the sinusoidal motion
        self._origin_y = pos[1]
        self._vx = 1
        # internal time/phase for the sine function
        self._t = 0.0
        self._frequency = random.uniform(0.1, 1.0)

    def move(self, mapa):
        """
        Move the spider horizontally across the map, bouncing off left/right edges
        and following a sinusoidal vertical path.

        """

        # advance phase
        self._t += +self._frequency

        # desired next x (horizontal movement)
        new_x = self._pos[0] + self._vx

        # bounce on horizontal edges
        if new_x < 0:
            new_x = 0
            self._vx *= -1
        elif new_x > mapa.size[0] - 1:
            new_x = mapa.size[0] - 1
            self._vx *= -1

        # compute sinusoidal vertical offset around origin
        sin_offset = math.sin(self._t) * mapa.size[1] // 2
        new_y = int(round(self._origin_y + sin_offset))

        # clamp vertical within map
        new_y = max(0, min(mapa.size[1] - 1, new_y))

        self._pos = (new_x, new_y)

    def exists(self):
        return self._alive

    @property
    def pos(self):
        return self._pos

    @property
    def json(self):
        return {"pos": self._pos, "alive": self._alive}

    def kill(self):
        self._alive = False
        logger.info("Spider <%s> was killed", self.pos)


class Flee:
    def __init__(self, pos):
        self._pos = pos
        self._alive = True

    def exists(self):
        return self._alive
    
    def move(self, mapa):
        new_pos = (self._pos[0], self._pos[1] + 1)
        if new_pos[1] >= mapa.size[1]:
            self.kill()
        else:
            self._pos = new_pos

    @property
    def pos(self):
        return self._pos

    @property
    def json(self):
        return {"pos": self._pos, "alive": self._alive}

    def kill(self):
        self._alive = False
        logger.info("Flee <%s> was killed", self.pos)


class BugBlaster:
    def __init__(self, pos):
        self._pos = pos
        self._alive = True
        self.lastkey = ""
        self._direction: Direction = Direction.EAST

    @property
    def direction(self):
        return self._direction

    def move(self, mapa, direction: Direction, mushrooms):
        if direction is None:
            return

        new_pos = self._pos

        if direction == Direction.NORTH:
            if self._pos[1] > 0:
                new_pos = (self._pos[0], self._pos[1] - 1)
        elif direction == Direction.SOUTH:
            if self._pos[1] < mapa.size[1] - 1:
                new_pos = (self._pos[0], self._pos[1] + 1)
        elif direction == Direction.WEST:
            if self._pos[0] > 0:
                new_pos = (self._pos[0] - 1, self._pos[1])
        elif direction == Direction.EAST:
            if self._pos[0] < mapa.size[0] - 1:
                new_pos = (self._pos[0] + 1, self._pos[1])
        self._direction = direction

        if new_pos not in [mushroom.pos for mushroom in mushrooms]:
            self._pos = new_pos
        else:
             logger.info(f"BugBlaster move to {new_pos} blocked by mushroom")

    def exists(self):
        return self._alive

    @property
    def pos(self):
        return self._pos

    @property
    def json(self):
        return {"pos": self._pos, "alive": self._alive}

    def kill(self):
        self._alive = False
        logger.info("BugBlaster <%s> was killed", self.pos)


class Mushroom:
    def __init__(self, x=1, y=1):
        self._pos = (x, y)
        self._health = 4

    def __str__(self):
        return f"Mushroom({self._pos}, health={self._health})"

    def take_damage(self):
        self._health -= 1

    def exists(self):
        return self._health > 0

    @property
    def pos(self):
        return self._pos

    @property
    def health(self):
        return self._health

    def collision(self, pos):
        return pos == self._pos

    @property
    def json(self):
        return {"pos": self._pos, "health": self._health}


def key2direction(key):
    if key == "w":
        return Direction.NORTH
    elif key == "a":
        return Direction.WEST
    elif key == "s":
        return Direction.SOUTH
    elif key == "d":
        return Direction.EAST
    return None


class Game:
    def __init__(self, level=1, timeout=TIMEOUT, size=MAP_SIZE, game_speed=GAME_SPEED):
        logger.info(f"Game(level={level})")
        self.initial_level = level
        self._game_speed = game_speed
        self._running = False
        self._timeout = timeout
        self._step = 0
        self._state = {}
        self._centipedes = []
        self._bug_blaster = None
        self._blasts = []
        self._spider = Spider(pos=(0, random.randint(0, size[1] // 2)))
        self._flee = None
        self._last_key = ""
        self._score = 0
        self._cooldown = 0  # frames until next shot
        self.map = Map(size=size)

    @property
    def score(self):
        return self._score

    @score.setter
    def score(self, value):
        self._score = value

    @property
    def centipedes(self):
        return self._centipedes

    @property
    def bug_blaster(self):
        return self._bug_blaster

    @property
    def level(self):
        return self.map.level

    @property
    def running(self):
        return self._running

    @property
    def total_steps(self):
        return self._total_steps

    def start(self, players_names):
        logger.debug("Reset world")
        self._running = True
        self._centipedes = [Centipede("mother", self.map.spawn_centipede())]
        self._bug_blaster = BugBlaster(self.map.spawn_bug_blaster())
        self._mushrooms = [Mushroom(x, y) for x, y, _ in self.map.mushrooms]
        self._blasts = []
        logger.info(f"Game started for {players_names}. Blaster at {self._bug_blaster.pos}")


    def stop(self):
        logger.info("GAME OVER")
        self._running = False

    def quit(self):
        logger.debug("Quit")
        self._running = False

    def keypress(self, player_name, key):
        self._last_key = key


    def update_flee(self):
        if self._flee is None or not self._flee.exists():
            self._flee = None
            return  # if flee doesn't exist, we don't need to update it

        self._flee.move(self.map)

        if self._flee.pos == self._bug_blaster.pos:
            self._bug_blaster.kill()
            logger.info("BugBlaster was killed by flee at %s", self._flee.pos)
     

    def update_spider(self):
        if not self._spider.exists():
            return  # if spider is dead, we don't need to update it

        self._spider.move(self.map)

        if self._spider.pos == self._bug_blaster.pos:
            self._bug_blaster.kill()
            logger.info("BugBlaster was killed by spider at %s", self._spider.pos)

        if self._spider.pos in [m.pos for m in self._mushrooms]:
            self._mushrooms = [m for m in self._mushrooms if m.pos != self._spider.pos]
            logger.info("Mushroom at %s was destroyed by spider", self._spider.pos)

        if self._spider.pos == self._bug_blaster.pos:
            self._bug_blaster.kill()
            logger.info("BugBlaster was killed by spider at %s", self._spider.pos)

    def update_blasts(self):
        self._blasts = [(b_x, b_y - 1) for (b_x, b_y) in self._blasts if b_y - 1 >= 0]
        to_be_removed = set()

        for blast in self._blasts:
            for mushroom in self._mushrooms:
                if mushroom.collision(blast):
                    to_be_removed.add(blast)
                    mushroom.take_damage()
                    logger.info(f"Mushroom {mushroom.pos} was hit by a blast. Health: {mushroom.health}")
                    if not mushroom.exists():
                        logger.info(f"Mushroom {mushroom.pos} was destroyed")
                        self._score += KILL_MUSHROOM_POINTS
                    break

            if self._spider.exists() and blast == self._spider.pos:
                to_be_removed.add(blast)
                self._spider.kill()
                self._score += KILL_SPIDER_POINTS
                logger.debug("Spider was hit by a blast", self._spider)

            if self._flee and self._flee.exists() and blast == self._flee.pos:
                to_be_removed.add(blast)
                self._flee.kill()
                self._score += KILL_FLEE_POINTS
                logger.debug("Flee was hit by a blast", self._flee)

        for blast in to_be_removed:
            logger.info(f"Blast {blast} removed after hitting a mushroom")
            self._blasts.remove(blast)

    def update_bug_blaster(self):
        try:
            if not self._bug_blaster.exists():
                return  # if bug_blaster is dead, we don't need to update it
            lastkey = self._last_key

            assert lastkey in "wasdA"

            # Update position
            self._bug_blaster.move(
                self.map,
                key2direction(lastkey)
                if lastkey in "wasd"
                else self._bug_blaster.direction,
                self._mushrooms,
            )

            # Shoot
            if lastkey == "A" and self._cooldown == 0:
                self._blasts.append(self._bug_blaster.pos)
                logger.info(f"BugBlaster <{self._bug_blaster.pos}> fired a blast")
                self._last_key = ""
                self._cooldown = COOL_DOWN  # frames until next shot

            if self._cooldown > 0:
                self._cooldown -= 1

        except AssertionError:
            logger.error("Invalid key <%s> pressed. Valid keys: w,a,s,d", lastkey)

        return True

    def collision(self):
        if (
            not self._running
        ):  # if game is not running, we don't need to check collisions
            return

        for centipede in self._centipedes:
            if not centipede.exists():
                continue

            # check collisions with blasters
            to_be_removed = set()
            for blast in self._blasts:
                if centipede.collision(blast):
                    if (new_body := centipede.take_hit(blast)) != []:
                        new_centipede = Centipede(
                            centipede.name + "_" + str(random.randint(1, 100)),
                            new_body,
                            centipede.direction,
                        )  # TODO proper naming for child centipede

                        self._centipedes.append(new_centipede)

                    self._score += (
                        KILL_CENTIPEDE_BODY_POINTS - blast[1]
                    )  # higher points for hitting higher up the screen
                    logger.info(
                        f"Centipede <{centipede.name}> was hit by a blast and split. Score: {self._score}"
                    )

                    self._mushrooms.append(Mushroom(x=blast[0], y=blast[1]))
                    logger.info(f"New mushroom spawned at {blast} from centipede hit") 

                    to_be_removed.add(blast)
            self._blasts = [b for b in self._blasts if b not in to_be_removed]

            # check collisions with bug blaster
            if self._bug_blaster.exists() and centipede.collision(
                self._bug_blaster._pos
            ):
                self._bug_blaster.kill()
                logger.info(f"BugBlaster was killed by centipede <{centipede.name}>")

            # TODO move blasts collision with mushrooms to here

    async def next_frame(self):
        await asyncio.sleep(1.0 / self._game_speed)

        if not self._running:
            logger.info("Waiting for player 1")
            return

        self._step += 1
        if self._step == self._timeout:
            self.stop()

        if self._step % 100 == 0:
            logger.info(f"[{self._step}] SCORE: {self.score}")
        
        # ============================================================
        # DEBUG: Desenhar estado do mapa ANTES de processar movimento
        # ============================================================
        if self._step % 1 == 0:  # A cada frame
            centipedes_data = [
                {
                    'name': c.name,
                    'body': list(c.body),
                    'direction': c.direction
                } for c in self._centipedes if c.alive
            ]
            mushrooms_pos = [m.pos for m in self._mushrooms]
            
            # --- ALTERAR AQUI (Relatório V.A) ---
            map_logger.debug(f"\n{'='*50}")
            map_logger.debug(f"FRAME {self._step} - MAP STATE")
            map_logger.debug(f"{'='*50}")
            map_ascii = draw_game_state(
                centipedes_data, 
                mushrooms_pos, 
                self._bug_blaster.pos, 
                self._blasts,
                self.map.size
            )
            map_logger.debug(f"\n{map_ascii}")
            map_logger.debug(f"{'='*50}\n")
            # --- FIM DA ALTERAÇÃO ---

        for centipede in self._centipedes:
            if centipede.alive:
                centipede.move(self.map, self._mushrooms, self.centipedes)

        self.update_spider()
        self.update_flee()
        self.collision()
        self.update_bug_blaster()
        self.update_blasts()

        self.collision()

        # clean up dead mushrooms
        self._mushrooms = [
            mushroom for mushroom in self._mushrooms if mushroom.exists()
        ]

        # spawn new mushrooms over time
        if self._step % MUSHROOM_SPAWN_RATE == 0 and self._flee is None:
            logger.info("Spawning new mushroom")
            x, y = self.map.spawn_mushroom()
            if (x, y) != self._bug_blaster.pos:
                self._mushrooms.append(Mushroom(x=x, y=y))
                # spawn flee
                self._flee = Flee(pos=(x, y))
                logger.info("Flee spawned at %s", (x, y))

        self._state = {
            "centipedes": [
                centipede.json for centipede in self._centipedes if centipede.alive
            ],
            "bug_blaster": self._bug_blaster.json,
            "mushrooms": [mushroom.json for mushroom in self._mushrooms],
            "blasts": self._blasts,
            "step": self._step,
            "timeout": self._timeout,
            "score": self.score,
        }
        if self._spider.exists():
            self._state["spider"] = self._spider.json

        if self._flee and self._flee.exists():
            self._state["flee"] = self._flee.json

        if not self.bug_blaster.exists() or all(
            [not centipede.alive for centipede in self._centipedes]
        ):
            self.stop()

        return self._state

    def info(self):
        return {
            "size": self.map.size,
            "map": self.map.map,
            "fps": self._game_speed,
            "timeout": self._timeout,
            "level": self.map.level,
        }