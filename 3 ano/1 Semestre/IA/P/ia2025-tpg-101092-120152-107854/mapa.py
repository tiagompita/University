import logging
import random

from consts import Direction, Tiles, CENTIPEDE_LENGTH

logger = logging.getLogger("Map")
logger.setLevel(logging.DEBUG)

BOTTOM_ROWS = 5


class Map:
    def __init__(
        self,
        level=1,
        size=(100, 100),
        mushroom_percentage=0.1,  # TODO set to 0.1
        mapa=None,
    ):
        self._level = level
        self._size = size
        self._stones = []
        self._mushrooms = []
        self._queue_mushrooms = []
        self._snake_nests = []

        if not mapa:
            logger.info("Generating a MAP")
            self.map = [[Tiles.PASSAGE] * self.ver_tiles for _ in range(self.hor_tiles)]

            # add stones TODO if required more difficult levels
            """
            for _ in range(10):
                x, y = random.randint(0, self.hor_tiles - 1), random.randint(
                    0, self.ver_tiles - 1
                )
                wall_length = 5
                for yy in range(
                    y, (y + random.choice([-wall_length, wall_length])) % self.ver_tiles
                )[:wall_length]:
                    self.map[x][yy] = Tiles.STONE
                    self._stones.append((x, yy))
                for xx in range(
                    x, (x + random.choice([-wall_length, wall_length])) % self.hor_tiles
                )[:wall_length]:
                    self.map[xx][y] = Tiles.STONE
                    self._stones.append((xx, y))
            """
            # add mushrooms
            while len(self._mushrooms) < (
                self.hor_tiles * self.ver_tiles * mushroom_percentage
            ):  # 10% of map
                x, y = random.randint(0, self.hor_tiles - 1), random.randint(
                    0, self.ver_tiles - 1
                )
                if self.map[x][y] == Tiles.PASSAGE:
                    self.map[x][y] = Tiles.FOOD
                    self._mushrooms.append((x, y))

            # queue some more mushrooms to be spawned later
            self.spawn_mushroom()

            # clean up bottom rows for bug blaster
            for x in range(self.hor_tiles):
                for y in range(self.ver_tiles - BOTTOM_ROWS, self.ver_tiles):
                    if self.map[x][y] == Tiles.FOOD and (x, y) in self._mushrooms:
                        self._mushrooms.remove((x, y))
                    if self.map[x][y] == Tiles.STONE:
                        self._stones.remove((x, y))
                    self.map[x][y] = Tiles.PASSAGE

        else:
            logger.info("Loading MAP")
            self.map = mapa

    @property
    def mushrooms(self):
        return [(x, y, self.map[x][y].name) for x, y in self._mushrooms]

    def spawn_mushroom(self):
        if not self._queue_mushrooms or len(self._queue_mushrooms) == 0:
            logger.warning("No more mushrooms to spawn")
            while len(self._queue_mushrooms) < (
                self.hor_tiles * self.ver_tiles * 0.1
            ):  # generate packs corresponding to 10% of map
                x, y = random.randint(0, self.hor_tiles - 1), random.randint(
                    0, self.ver_tiles - BOTTOM_ROWS
                )
                if self.map[x][y] == Tiles.PASSAGE:
                    self.map[x][y] = Tiles.FOOD
                    self._queue_mushrooms.append((x, y))
        return self._queue_mushrooms.pop(0)

    @property
    def hor_tiles(self):
        return self.size[0]

    @property
    def ver_tiles(self):
        return self.size[1]

    def __getstate__(self):
        return self.map

    def __setstate__(self, state):
        self.map = state

    @property
    def size(self):
        return self._size

    @property
    def level(self):
        return self._level

    def spawn_centipede(self):
        return [(x, 0) for x in range(CENTIPEDE_LENGTH)]

    def spawn_bug_blaster(self):
        pos = (int(self.hor_tiles / 2), self.ver_tiles - 1)
        print("spawn bug blaster %s", pos)
        return pos

    def get_tile(self, pos: tuple[int, int]):
        x, y = pos
        return self.map[x][y]

    def is_blocked(self, pos, traverse):
        x, y = pos
        if not traverse and (
            x not in range(self.hor_tiles) or y not in range(self.ver_tiles)
        ):
            logger.debug("Crash against map edge(%s, %s)", x, y)
            return True
        if self.map[x][y] == Tiles.PASSAGE:
            return False
        if self.map[x][y] == Tiles.STONE:
            if traverse:
                return False
            else:
                logger.debug("Crash against Stone(%s, %s)", x, y)
                return True
        if self.map[x][y] in [Tiles.FOOD, Tiles.SUPER]:
            return False

        assert False, "Unknown tile type"

    def calc_pos(self, cur, direction: Direction, traverse=False):
        cx, cy = cur
        npos = cur
        if direction == Direction.NORTH:
            if traverse and cy - 1 < 0:  # wrap around
                npos = cx, self.ver_tiles - 1
            else:
                npos = cx, cy - 1
        if direction == Direction.WEST:
            if traverse and cx - 1 < 0:  # wrap around
                npos = self.hor_tiles - 1, cy
            else:
                npos = cx - 1, cy
        if direction == Direction.SOUTH:
            if traverse and cy + 1 >= self.ver_tiles:  # wrap around
                npos = cx, 0
            else:
                npos = cx, cy + 1
        if direction == Direction.EAST:
            if traverse and cx + 1 >= self.hor_tiles:  # wrap around
                npos = 0, cy
            else:
                npos = cx + 1, cy

        # test blocked
        if self.is_blocked(npos, traverse):
            logger.debug("%s is blocked", npos)
            return cur

        return npos
