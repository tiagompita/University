from . import SearchDomain, SearchProblem, SearchTree
import math
from tree_search import SearchNode
from collections import deque
from tree_search.multi_objective_search import MultiObjectiveSearch
import consts
from tree_search.centipede import Centipede
import time
import logging
import os
import random
from dataclasses import dataclass
from typing import Optional, Iterable, Literal

# Configure logger after imports to avoid being overwritten by game imports.
logger = logging.getLogger(__name__)
logger.setLevel(logging.DEBUG)
log_path = os.path.abspath("agent.log")
fh = logging.FileHandler(log_path, mode='w', encoding='utf-8')
fh.setLevel(logging.DEBUG)
fmt = logging.Formatter('%(asctime)s %(levelname)s %(name)s: %(message)s')
fh.setFormatter(fmt)
logger.addHandler(fh)

logging.getLogger().setLevel(logging.DEBUG)

@dataclass(frozen=True)
class FiringSolution:
    target_kind: Literal["segment", "predicted", "mushroom", "spider", "flee"]
    target_pos: tuple[int, int]
    firing_column_x: int
    aim_y: int
    pre_shot_pos: tuple[int, int]
    required_direction: consts.Direction
    post_move_pos: tuple[int, int]
    line_of_fire_clear: bool
    blocking_mushroom: Optional[tuple[int, int]]
    safe_pre: bool
    safe_post: bool
    pre_in_danger: bool
    post_in_danger: bool
    can_shoot_now: bool
    est_time_to_pre_shot: int
    score: float

"""
Important engine quirk (game.py):
When the agent sends action 'A' (shoot), the game first moves the bug blaster
using its current direction (if the last key was not a movement key) and only
then spawns the projectile. This makes "shooting from pre-shot" positions
more reliable: we stand one tile beside the desired firing column with the
right direction context, then press 'A' to step into the column and fire.
"""

class CentipedeDomain(SearchDomain):
    def __init__(self, map:dict):
        self.dim = tuple(map["size"])
        self.time_per_frame = 1.0 / int(map["fps"])
        self.board = map["map"]

        self.plan=[]

        # Centipede state
        self.centipedes_segment_in_map:set=set()

        # Mushrooms
        self.mushrooms_in_map:set=set()
        self.mushroom_hits:dict = {}  # {(x,y): hits_count} - tracks hits on mushrooms (need 4 to destroy)
        self.clearing_mushroom_target = None  # mushroom we are trying to destroy
        
        # Multi-objective search for dynamic goals
        self.multi_objectives = MultiObjectiveSearch([])
        self.counter = 0
        
        # High-level strategy
        self.current_strategy = "ATTACK"  # ATTACK, ESCAPE ou REPOSITION
        self.danger_threshold = 3  # critical distance to trigger ESCAPE
        self.safe_zone_y = self.dim[1] - 5  # safe area near the bottom
        self.combat_zone_y = self.dim[1]  # preferred combat band (lower part of the map)
        self.top_zone_y = self.dim[1] // 3  # "too high" zone
        
        # Danger cache
        self.dangerous_positions:set = set()  # tiles threatened by centipedes
        self.npc_hazards:set = set()  # tiles occupied by spider/flee (hard-avoid)
        # Next-frame lethal tiles (used as a hard avoid even when all moves are otherwise "dangerous")
        self.imminent_hazards: set[tuple[int, int]] = set()
        # Subset of imminent_hazards that represent *certain* death if entered.
        # Used to avoid "desperation" moves that are guaranteed to die (notably flea reaching bottom).
        self.hard_imminent_hazards: set[tuple[int, int]] = set()
        self.last_blaster_pos = None
        self.stuck_counter = 0  # detects when the agent is stuck

        # Escape lookahead (anti-encirclement): reason about future danger, not only immediate distance.
        self._escape_lookahead: int = 10
        self._escape_bfs_max_nodes: int = 700
        self._future_danger: list[set[tuple[int, int]]] = []
        self._future_danger_turn: Optional[int] = None

        # Strategy hysteresis to prevent ATTACK<->ESCAPE thrashing
        self._escape_lock_frames = 0
        self._escape_exit_min_dist = 6  # must be at least this far to exit ESCAPE
        self._escape_min_lock_frames = 5  # minimum frames to keep ESCAPE once entered
        
        # Dynamic cost weights
        self.cost_weights = {
            'movement': 1.0,
            'shoot': 0.5,
            'danger_penalty': 10.0,
            'mushroom_penalty': 2.0,
            'alignment_bonus': -5.0,  # negative means reward
        }
        
        # Prediction
        self.prediction_enabled = True
        self.prediction_steps = 2  # predict N frames ahead
        self.predicted_positions:dict = {}  # {centipede_name: [future_positions]}
        
        # Current plan (A*)
        self.plan = []
        self.backup_plan = []

        # Track blaster movement direction (game uses this when action == 'A')
        self.blaster_direction: consts.Direction = consts.Direction.EAST

        # Current blaster position cache (used for global safety checks on action 'A')
        self._current_blaster_pos: Optional[tuple[int, int]] = None

        # Cache of current centipede head positions (x, y) for targeted safety checks
        self._current_centipede_heads: list[tuple[int, int]] = []

        # Planning mode flag: when running A* we typically want movement-only plans
        self._planning_allow_shoot: bool = True

        # Cache current attack goal to keep/reuse A* plans only while they remain relevant
        self._attack_goal_key: Optional[tuple] = None

        # Opening behavior: focus spider early (observational prediction)
        self._opening_spider_focus_frames: int = 80
        # Keep enough history to infer spider horizontal direction and detect short cycles in Y.
        self._spider_track = deque(maxlen=40)  # stores (x, y)
        self._spider_prediction_horizon: int = 28
        self._opening_spider_enabled: bool = True

        # Spider focus: timing intercept planning horizon
        self._spider_intercept_horizon: int = 80

        # Flee (flea) focus: timing intercept planning horizon
        self._flee_intercept_horizon: int = 80

        # Timed-shot caches (to avoid recomputing expensive intercept search every frame)
        self._spider_timed_goal: Optional[tuple[tuple[int, int], consts.Direction]] = None
        self._spider_timed_fire_turn: Optional[int] = None
        self._flee_timed_goal: Optional[tuple[tuple[int, int], consts.Direction]] = None
        self._flee_timed_fire_turn: Optional[int] = None

        # Attack focus phases (defense is handled separately via ESCAPE)
        # CENTIPEDE: reduce centipede until <= threshold segments
        # SPIDER: focus only the spider (no centipede targets)
        # FLEE: focus only the flea (no centipede targets)
        self.attack_focus: Literal["CENTIPEDE", "SPIDER", "FLEE"] = "CENTIPEDE"
        self._centipede_reduce_threshold_segments: int = 5
        self._spider_seen_ever: bool = False
        self._flee_seen_ever: bool = False
        self._spider_focus_started_turn: Optional[int] = None



    def actions(self, state) -> list[str]:
        """Return available actions, optionally ordered by the current strategy."""
        x, y = state[0], state[1]
        has_dir = isinstance(state, tuple) and len(state) >= 3
        actions: list[str] = []

        # Movement actions
        # For direction-augmented planning, we must allow "bumping" into BOTH mushrooms and walls:
        # it doesn't move but it DOES change direction in the real game. This is required to reach
        # goals that depend on direction at borders (e.g., bottom row + SOUTH).
        if has_dir:
            actions.extend(['w', 's', 'a', 'd'])
        else:
            if y > 0 and (x, y - 1) not in self.mushrooms_in_map:
                actions.append('w')
            if y < self.dim[1] - 1 and (x, y + 1) not in self.mushrooms_in_map:
                actions.append('s')
            if x > 0 and (x - 1, y) not in self.mushrooms_in_map:
                actions.append('a')
            if x < self.dim[0] - 1 and (x + 1, y) not in self.mushrooms_in_map:
                actions.append('d')
        
        # Shooting is always available (except when we intentionally plan movement-only)
        if self._planning_allow_shoot:
            actions.append('A')
        
        # Strategy-specific prioritization
        if self.current_strategy == "ESCAPE":
            # In ESCAPE mode, prioritize movement over shooting
            actions = [a for a in actions if a != 'A'] + ['A']
        
        return actions

    def result(self, state, action):
        """Return the next state after applying action."""
        # State may be (x, y) or (x, y, direction)
        x, y = state[0], state[1]
        direction = state[2] if isinstance(state, tuple) and len(state) >= 3 else None
        
        if action == 'w':
            new_dir = consts.Direction.NORTH if direction is not None else None
            if y == 0:
                return (x, y, new_dir) if direction is not None else (x, y)
            attempted = (x, y - 1)
            if attempted in self.mushrooms_in_map:
                return (x, y, new_dir) if direction is not None else (x, y)
            return (attempted[0], attempted[1], new_dir) if direction is not None else attempted
        elif action == 's':
            new_dir = consts.Direction.SOUTH if direction is not None else None
            if y >= self.dim[1] - 1:
                return (x, y, new_dir) if direction is not None else (x, y)
            attempted = (x, y + 1)
            if attempted in self.mushrooms_in_map:
                return (x, y, new_dir) if direction is not None else (x, y)
            return (attempted[0], attempted[1], new_dir) if direction is not None else attempted
        elif action == 'a':
            new_dir = consts.Direction.WEST if direction is not None else None
            if x == 0:
                return (x, y, new_dir) if direction is not None else (x, y)
            attempted = (x - 1, y)
            if attempted in self.mushrooms_in_map:
                return (x, y, new_dir) if direction is not None else (x, y)
            return (attempted[0], attempted[1], new_dir) if direction is not None else attempted
        elif action == 'd':
            new_dir = consts.Direction.EAST if direction is not None else None
            if x >= self.dim[0] - 1:
                return (x, y, new_dir) if direction is not None else (x, y)
            attempted = (x + 1, y)
            if attempted in self.mushrooms_in_map:
                return (x, y, new_dir) if direction is not None else (x, y)
            return (attempted[0], attempted[1], new_dir) if direction is not None else attempted
        elif action == 'A':
            # For planning, we treat 'A' as no-op; real game applies movement using current direction.
            return state
        
        return state
    
    def cost(self, state, action):
        """Dynamic action cost with danger-aware penalties."""
        base_cost = self.cost_weights['movement']
        
        if action == 'A':
            base_cost = self.cost_weights['shoot']
        
        new_state = self.result(state, action)
        new_xy = (new_state[0], new_state[1]) if isinstance(new_state, tuple) and len(new_state) >= 2 else new_state
        
        # Penalize dangerous tiles (close to centipedes)
        if new_xy in self.dangerous_positions:
            base_cost += self.cost_weights['danger_penalty']
        
        # Penalize stepping onto mushrooms
        if new_xy in self.mushrooms_in_map:
            base_cost += self.cost_weights['mushroom_penalty']
        
        # Reward actions that lead to a good firing alignment
        if self._is_aligned_for_shot(new_xy):
            base_cost += self.cost_weights['alignment_bonus']
        
        # In ESCAPE mode, prefer moving down and de-prioritize shooting
        if self.current_strategy == "ESCAPE":
            if action in ['s']:  # moving down (towards safe area)
                base_cost *= 0.5
            elif action == 'A':
                base_cost *= 2.0  # desincentiva atirar no modo escape
        
        return max(0.1, base_cost)  # keep costs strictly positive

    def heuristic(self, state, goal=None):
        """Heuristic that mixes distance, danger and line-of-fire mushroom penalties."""
        if goal is None:
            return 0
        
        x1, y1 = state[0], state[1]
        if isinstance(goal, tuple):
            x2, y2 = goal[0], goal[1]
        elif isinstance(goal, dict) and 'align_x' in goal:
            x2, y2 = goal['align_x'], y1
        else:
            return 0
        
        # Base Manhattan distance
        manhattan = abs(x1 - x2) + abs(y1 - y2)
        
        # Danger factor: closer to centipedes increases the heuristic
        danger_factor = 0
        for danger_pos in self.dangerous_positions:
            dx, dy = danger_pos
            dist = abs(x1 - dx) + abs(y1 - dy)
            if dist < self.danger_threshold:
                danger_factor += (self.danger_threshold - dist) * 2
        
        # Mushroom factor (simple estimate)
        mushroom_factor = 0
        if x1 == x2:  # mesma coluna (ideal para atirar)
            for y in range(min(y1, y2), max(y1, y2) + 1):
                if (x1, y) in self.mushrooms_in_map:
                    mushroom_factor += 3
        
        # In ATTACK mode, minimize distance to the goal
        if self.current_strategy == "ATTACK":
            return manhattan + mushroom_factor + danger_factor * 0.3
        
        # In ESCAPE mode, prioritize reaching the safe band
        else:
            # Escape heuristic: move towards safe zone
            distance_to_safe_zone = abs(y1 - self.safe_zone_y)
            return distance_to_safe_zone - danger_factor * 0.5

    def satisfies(self, state, goal=None):
        """Returns True if the given goal is satisfied in state."""
        if goal is None:
            return True
        
        # Position goal
        if isinstance(goal, tuple) and len(goal) == 2:
            return (state[0], state[1]) == goal

        # Position + direction goal
        if isinstance(goal, tuple) and len(goal) == 3:
            if not (isinstance(state, tuple) and len(state) >= 3):
                return False
            return state[0] == goal[0] and state[1] == goal[1] and state[2] == goal[2]
        
        # Alignment goal (same column as target)
        if isinstance(goal, dict) and 'align_x' in goal:
            return state[0] == goal['align_x']
        
        return state == goal

    def _is_aligned_for_shot(self, pos):
        """Returns True if there is a centipede segment above in the same column with no mushrooms blocking."""
        if not self.centipedes_segment_in_map:
            return False
        
        x, y = pos[0], pos[1]
        # Same column and above (lower y)
        for seg_pos in self.centipedes_segment_in_map:
            if seg_pos[0] == x and seg_pos[1] < y:
                # Check line-of-fire is clear of mushrooms
                path_clear = True
                for check_y in range(seg_pos[1], y):
                    if (x, check_y) in self.mushrooms_in_map:
                        path_clear = False
                        break
                if path_clear:
                    return True
        return False
    
    def _should_clear_mushroom_path(self, blaster_pos, escape_directions):
        """
        Decides whether to shoot a mushroom to open at least one escape route.
        Returns (should_clear, mushroom_pos) or (False, None).
        """
        logger.debug(f"    _should_clear_mushroom_path: checking escape routes")
        bx, by = blaster_pos
        
        # Check whether mushrooms block most escape directions
        blocked_directions = []
        mushroom_candidates = []
        
        for action in escape_directions:
            next_pos = self.result(blaster_pos, action)
            if next_pos in self.mushrooms_in_map:
                blocked_directions.append(action)
                mushroom_candidates.append(next_pos)
                logger.debug(f"      Direction '{action}' blocked by mushroom at {next_pos}")
        
        # If most directions are blocked, pick a mushroom to destroy.
        if len(blocked_directions) >= 3:
            # Prefer mushrooms already damaged (closer to being destroyed)
            best_mushroom = None
            max_hits = -1
            
            for mush_pos in mushroom_candidates:
                # Only consider mushrooms we can shoot (same column, above)
                if mush_pos[0] == bx and mush_pos[1] < by:
                    hits = self.mushroom_hits.get(mush_pos, 0)
                    if hits > max_hits:
                        max_hits = hits
                        best_mushroom = mush_pos
            
            if best_mushroom:
                logger.info(f"    -> CLEARING PATH: targeting mushroom at {best_mushroom} (hits: {max_hits}/4)")
                return True, best_mushroom
        
        return False, None
    
    def _predict_centipede_movement(self, centipede, steps=3):
        """
        Predict the centipede head position for the next N frames.

        Model (based on game.py):
        1) Move in the current horizontal direction (EAST/WEST).
        2) If it hits a wall/mushroom, it moves vertically (down/up) and flips direction.
        """
        predicted = []
        
        # Simulated state
        head = centipede['head']
        current_pos = (head.x, head.y)
        current_dir = centipede['direction']  # Direction.EAST=1 or WEST=3
        move_dir = 1  # 1=down, -1=up
        
        for step in range(steps):
            # Compute next position based on direction
            if current_dir == consts.Direction.EAST:  # moving right
                next_x = current_pos[0] + 1
                next_y = current_pos[1]
            elif current_dir == consts.Direction.WEST:  # moving left
                next_x = current_pos[0] - 1
                next_y = current_pos[1]
            else:
                # Non-horizontal direction (defensive)
                predicted.append(current_pos)
                continue
            
            next_pos = (next_x, next_y)
            
            # Collision with wall or mushroom
            hit_wall = (next_x < 0 or next_x >= self.dim[0])
            hit_mushroom = next_pos in self.mushrooms_in_map
            
            if hit_wall or hit_mushroom:
                # On hit, centipede moves vertically and flips direction
                
                # Choose vertical direction
                if current_pos[1] == 0:
                    move_dir = 1  # top: can only go down
                elif current_pos[1] >= self.dim[1] - 1:
                    move_dir = -1  # bottom: can only go up
                
                # Apply vertical move
                next_pos = (current_pos[0], current_pos[1] + move_dir)
                
                # Flip horizontal direction for next iteration
                current_dir = (consts.Direction.WEST 
                              if current_dir == consts.Direction.EAST 
                              else consts.Direction.EAST)
            
            # Record prediction
            predicted.append(next_pos)
            current_pos = next_pos
        
        return predicted
    
    def _update_predictions(self, centipedes_list):
        """Update all centipede movement predictions."""
        self.predicted_positions.clear()
        
        if not self.prediction_enabled:
            return
        
        for centipede in centipedes_list:
            name = centipede['name']
            predictions = self._predict_centipede_movement(centipede, self.prediction_steps)
            self.predicted_positions[name] = predictions
    
    def _update_dangerous_positions(self, centipedes_list):
        """Update danger tiles based on current and predicted centipede positions."""
        self.dangerous_positions.clear()
        self.centipedes_segment_in_map.clear()
        
        for centipede in centipedes_list:
            # Current positions
            for segment in centipede['body']:
                seg_pos = (segment.x, segment.y)
                self.centipedes_segment_in_map.add(seg_pos)
                
                # Mark segment tile and immediate neighbors as dangerous
                for dx in range(-1, 2):
                    for dy in range(-1, 2):
                        danger_x = seg_pos[0] + dx
                        danger_y = seg_pos[1] + dy
                        if (0 <= danger_x < self.dim[0] and 
                            0 <= danger_y < self.dim[1]):
                            self.dangerous_positions.add((danger_x, danger_y))
            
            # Predicted positions (also mark only immediate neighbors)
            name = centipede['name']
            if name in self.predicted_positions:
                for future_pos in self.predicted_positions[name]:
                    # Mark predicted tile and immediate neighbors
                    for dx in range(-1, 2):
                        for dy in range(-1, 2):
                            danger_x = future_pos[0] + dx
                            danger_y = future_pos[1] + dy
                            if (0 <= danger_x < self.dim[0] and 
                                0 <= danger_y < self.dim[1]):
                                self.dangerous_positions.add((danger_x, danger_y))
    
    def _assess_danger_level(self, blaster_pos, centipedes_list):
        """Assess danger and pick a high-level strategy: ATTACK, ESCAPE or REPOSITION."""
        if not centipedes_list:
            # If only NPCs are present, they are added into dangerous_positions.
            if blaster_pos in self.dangerous_positions:
                logger.debug("  _assess_danger_level: No centipedes but in danger -> ESCAPE")
                return "ESCAPE"
            logger.debug(f"  _assess_danger_level: No centipedes, defaulting to ATTACK")
            return "ATTACK"
        
        min_dist = float('inf')
        closest_segment = None
        max_threat_y = -1  # largest Y (closest to player area)
        
        for centipede in centipedes_list:
            for segment in centipede['body']:
                seg_pos = (segment.x, segment.y)
                dist = abs(blaster_pos[0] - seg_pos[0]) + abs(blaster_pos[1] - seg_pos[1])
                if dist < min_dist:
                    min_dist = dist
                    closest_segment = seg_pos
                max_threat_y = max(max_threat_y, seg_pos[1])

        # Hysteresis: if we were escaping recently, don't switch back to ATTACK too early.
        # This prevents oscillation when min_dist hovers around the threshold.
        if self.current_strategy == "ESCAPE":
            if self._escape_lock_frames > 0:
                logger.debug(f"  _assess_danger_level: ESCAPE (locked {self._escape_lock_frames} frames remaining)")
                return "ESCAPE"
            # Only exit ESCAPE if we are clearly safe.
            if (min_dist < self._escape_exit_min_dist) or (blaster_pos in self.dangerous_positions):
                logger.debug(
                    f"  _assess_danger_level: ESCAPE (hysteresis) - min_dist={min_dist}, in_danger={blaster_pos in self.dangerous_positions}"
                )
                return "ESCAPE"
        
        # ESCAPE criteria:
        # 1) Very close centipede (critical distance)
        # 2) Centipede at similar/below height (immediate threat)
        # 3) Current tile is dangerous
        if closest_segment:
            # Escape if critical distance
            if min_dist <= 2:
                logger.debug(f"  _assess_danger_level: ESCAPE - distance {min_dist} <= 2 (CRITICAL)")
                self._escape_lock_frames = max(self._escape_lock_frames, self._escape_min_lock_frames)
                return "ESCAPE"
            
            # Escape if centipede is at/below the blaster
            if closest_segment[1] >= blaster_pos[1] and min_dist<=2:
                logger.debug(f"  _assess_danger_level: ESCAPE - centipede at/below blaster Y")
                self._escape_lock_frames = max(self._escape_lock_frames, self._escape_min_lock_frames)
                return "ESCAPE"
            
            # Escape if close and at similar height
            if min_dist <= 4 and closest_segment[1] >= blaster_pos[1] - 3:
                logger.debug(f"  _assess_danger_level: ESCAPE - close ({min_dist}) and same height")
                self._escape_lock_frames = max(self._escape_lock_frames, self._escape_min_lock_frames)
                return "ESCAPE"
            
            # Escape if current tile is marked dangerous
            if blaster_pos in self.dangerous_positions:
                logger.debug(f"  _assess_danger_level: ESCAPE - in dangerous position")
                self._escape_lock_frames = max(self._escape_lock_frames, self._escape_min_lock_frames)
                return "ESCAPE"
        
        # Reposition if safe but too high on the map.
        if min_dist >= 5 and blaster_pos[1] <= self.top_zone_y:
            # Only reposition if it is safe to go down
            centipedes_in_combat_zone = any(
                seg[1] >= self.combat_zone_y 
                for cent in centipedes_list 
                for seg in [(s.x, s.y) for s in cent['body']]
            )
            
            if not centipedes_in_combat_zone:
                logger.debug(f"  _assess_danger_level: REPOSITION - safe ({min_dist}) but too high (Y={blaster_pos[1]})")
                return "REPOSITION"
        
        logger.debug(f"  _assess_danger_level: ATTACK - safe distance {min_dist}")

        # Anti-encirclement: trigger ESCAPE early when future survivability collapses.
        try:
            trap_h = min(6, int(self._escape_lookahead))
            survivable = self._max_survival_steps(blaster_pos, horizon=trap_h, max_nodes=350)
            if survivable <= 2:
                logger.debug(f"  _assess_danger_level: ESCAPE - low survivability horizon ({survivable}/{trap_h})")
                self._escape_lock_frames = max(self._escape_lock_frames, self._escape_min_lock_frames)
                return "ESCAPE"
        except Exception:
            pass

        return "ATTACK"

    def _should_shoot(self, blaster_pos, target_pos, mushrooms):
        """
        Returns True if the agent should shoot now from a "pre-shot" position.

        Game quirk: action 'A' moves first (using the current direction) and only then shoots.
        A reliable pattern is to stand one tile away from the firing column and press 'A'.
        """
        if target_pos is None:
            return False
        
        bx, by = blaster_pos
        tx, ty = target_pos
        
        # Must be exactly one tile to the left/right of the firing column.
        horizontal_offset = abs(bx - tx)
        if horizontal_offset != 1:
            logger.debug(f"    _should_shoot: offset={horizontal_offset}, need offset=1")
            return False
        
        # Can only hit targets above (shots travel upward)
        if ty >= by:
            return False
        
        # Check mushrooms block the line-of-fire from the post-move position (tx, by).
        # If the target tile itself is a mushroom, that mushroom is the intended hit and
        # should not be treated as a blocker.
        for y in range(ty, by):
            if (tx, y) in mushrooms:
                if y == ty and (tx, y) == (tx, ty):
                    continue
                logger.debug(f"    _should_shoot: mushroom blocking at ({tx}, {y})")
                return False
        
        logger.debug(f"    _should_shoot: CAN SHOOT from {blaster_pos} to {target_pos}")
        return True
    
    def _should_shoot_anticipating_move(self, blaster_pos, target_pos, mushrooms, next_action):
        """
        Check if we should shoot while anticipating the next movement key.

        If next_action is a movement, simulate the post-move position and evaluate the shot there.
        """
        if target_pos is None or next_action not in ['w', 'a', 's', 'd']:
            return self._should_shoot(blaster_pos, target_pos, mushrooms)
        
        # Simulate post-move position
        future_pos = self.result(blaster_pos, next_action)
        
        # Check alignment from the post-move position
        return self._should_shoot(future_pos, target_pos, mushrooms)

    def _execute_reposition_strategy(self, blaster_pos):
        """
        REPOSITION strategy: move toward the preferred combat band when it is safe.
        """
        logger.info(f"  STRATEGY: _execute_reposition_strategy from {blaster_pos} to combat zone")
        bx, by = blaster_pos
        
        # Goal: move toward the combat band (larger Y)
        target_y = self.combat_zone_y
        
        # Evaluate moves, preferring downwards movement
        reposition_options = []
        
        # Priority: down, then sideways, then up
        for action in ['s', 'd', 'a', 'w']:
            new_pos = self.result(blaster_pos, action)
            
            # Basic validation
            if new_pos == blaster_pos:
                continue
            if new_pos in self.mushrooms_in_map:
                continue
            if new_pos in self.centipedes_segment_in_map:
                continue
            if new_pos in self.npc_hazards:
                continue
            
            # Score this reposition move
            score = self._calculate_reposition_score(new_pos, action, target_y)
            reposition_options.append((action, new_pos, score))
            logger.debug(f"    Reposition option: {action} -> {new_pos}, score={score:.1f}")
        
        if not reposition_options:
            logger.warning("  -> No reposition routes available!")
            # Try to clear a mushroom if needed
            should_clear, mushroom_target = self._should_clear_mushroom_path(blaster_pos, ['s', 'd', 'a', 'w'])
            if should_clear:
                self.clearing_mushroom_target = mushroom_target
                mx, my = mushroom_target
                if bx == mx:
                    logger.info(f"    -> SHOOTING at mushroom {mushroom_target} to clear path")
                    return 'A'
                elif bx < mx:
                    return 'd'
                else:
                    return 'a'
            return ''
        
        # Pick best reposition option
        reposition_options.sort(key=lambda x: x[2], reverse=True)
        best_action, best_pos, best_score = reposition_options[0]
        
        logger.info(f"  -> REPOSITIONING via '{best_action}' to {best_pos} (score: {best_score:.1f})")
        return best_action
    
    def _calculate_reposition_score(self, position, action, target_y):
        """
        Reposition score. Higher is better.
        """
        score = 100.0
        px, py = position
        
        # 1) Highest priority: approach combat band (larger Y)
        distance_to_target = abs(py - target_y)
        score -= distance_to_target * 20  # distance penalty
        
        # 2) Big bonus for moving down
        if action == 's':
            score += 50
        elif action in ['d', 'a']:  # lateral movement (mostly neutral)
            score += 5
        elif action == 'w':  # moving up is bad here
            score -= 100
        
        # 3) Keep a safe distance from centipedes
        min_centipede_dist = float('inf')
        for seg_pos in self.centipedes_segment_in_map:
            dist = abs(px - seg_pos[0]) + abs(py - seg_pos[1])
            min_centipede_dist = min(min_centipede_dist, dist)
        
        score += min_centipede_dist * 10  # menos peso que escape
        # NOTE: This weight is intentionally lower than ESCAPE scoring.
        
        # 4) Avoid predicted positions (lower weight)
        for predictions in self.predicted_positions.values():
            for future_pos in predictions:
                dist = abs(px - future_pos[0]) + abs(py - future_pos[1])
                if dist < 4:
                    score -= (4 - dist) * 5
        
        # 5) Small penalty for nearby mushrooms
        mushrooms_nearby = sum(
            1 for dx in [-1, 0, 1] for dy in [-1, 0, 1]
            if (px + dx, py + dy) in self.mushrooms_in_map
        )
        score -= mushrooms_nearby * 2

        # 6) Avoid getting cornered (prefer tiles with exits and local mobility)
        exits = self._count_safe_exits(position)
        if exits <= 1:
            score -= 80
        elif exits == 2:
            score -= 20
        score += min(30, self._local_mobility(position, max_nodes=30)) * 0.5

        if self._is_corner(position):
            score -= 40
        
        return score

    def _is_corner(self, pos: tuple[int, int]) -> bool:
        x, y = pos
        return (x == 0 or x == self.dim[0] - 1) and (y == 0 or y == self.dim[1] - 1)

    def _count_safe_exits(self, pos: tuple[int, int]) -> int:
        """Count immediate 4-neighborhood exits that are hard-safe and not marked dangerous."""
        x, y = pos
        exits = 0
        for nx, ny in ((x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)):
            if nx < 0 or nx >= self.dim[0] or ny < 0 or ny >= self.dim[1]:
                continue
            npos = (nx, ny)
            if not self._is_hard_safe(npos):
                continue
            if npos in self.dangerous_positions:
                continue
            exits += 1
        return exits

    def _upward_escape_allowed(self, from_pos: tuple[int, int], to_pos: tuple[int, int]) -> bool:
        """Allow ESCAPE moving up only when it is genuinely safe.

        Requirement: only go up if safe and there are no other centipedes threatening from
        the upper rows (nearby). This prevents moving up into another incoming body/head.
        """
        fx, fy = from_pos
        tx, ty = to_pos

        if to_pos == from_pos:
            return False
        if ty != fy - 1:
            return False
        if not self._is_hard_safe(to_pos):
            return False
        if to_pos in self.dangerous_positions:
            return False

        # Do not go up when already too high; it usually reduces survival.
        if fy <= self.top_zone_y:
            return False

        # Reject if there are centipede segments in the upper rows close to where we'd go.
        # (Heuristic: within 3 rows above and +/-2 columns).
        for sx, sy in self.centipedes_segment_in_map:
            if sy < fy and (fy - sy) <= 3 and abs(sx - tx) <= 2:
                return False

        # Also reject if short-horizon future danger predicts this tile soon.
        dangers = self._future_danger
        if dangers:
            max_t = min(4, len(dangers) - 1)
            for t in range(1, max_t + 1):
                if to_pos in dangers[t]:
                    return False

        return True

    def _should_prefer_upward_escape(self, blaster_pos: tuple[int, int]) -> bool:
        """Heuristic preference for moving up during ESCAPE.

        Use case: centipedes are on the same row coming towards us; moving sideways can
        push us into corners. Moving up (when safe) opens more exits.
        """
        bx, by = blaster_pos
        if by <= self.top_zone_y:
            return False

        # If we are already tight on exits, bias towards opening space.
        exits = self._count_safe_exits(blaster_pos)
        if exits <= 2:
            return True

        # Otherwise, only prefer up if there is an immediate same-row threat.
        for sx, sy in self.centipedes_segment_in_map:
            if sy == by and abs(sx - bx) <= 5:
                return True
        return False

    def _local_mobility(self, start: tuple[int, int], max_nodes: int = 40) -> int:
        """Cheap bounded BFS to estimate how much free space exists around a tile."""
        if max_nodes <= 0:
            return 0
        if not self._is_hard_safe(start) or start in self.dangerous_positions:
            return 0
        q: deque[tuple[int, int]] = deque([start])
        seen: set[tuple[int, int]] = {start}
        while q and len(seen) < max_nodes:
            x, y = q.popleft()
            for nx, ny in ((x + 1, y), (x - 1, y), (x, y + 1), (x, y - 1)):
                if nx < 0 or nx >= self.dim[0] or ny < 0 or ny >= self.dim[1]:
                    continue
                npos = (nx, ny)
                if npos in seen:
                    continue
                if not self._is_hard_safe(npos):
                    continue
                if npos in self.dangerous_positions:
                    continue
                seen.add(npos)
                q.append(npos)
        return len(seen)
    
    def _is_centipede_stuck(self, centipede_obj):
        """
        Detect whether a centipede is stuck in a small loop.

        Heuristics:
        1) Predicted positions indicate mostly vertical movement (X constant, Y varying).
        2) Mushrooms block both sides of the head.
        """
        name = centipede_obj['name']
        head = centipede_obj['head']
        head_pos = (head.x, head.y)
        
        # Predictions: mostly vertical movement suggests "stuck"
        if name in self.predicted_positions:
            predictions = self.predicted_positions[name]
            if len(predictions) >= 2:
                # Compare X across predictions
                x_positions = set(pos[0] for pos in predictions[:3])  # first 3 predictions
                y_positions = set(pos[1] for pos in predictions[:3])
                
                # If X constant but Y varies -> likely stuck
                if len(x_positions) <= 2 and len(y_positions) >= 2:
                    logger.debug(f"    STUCK DETECTION: '{name}' moving only vertically (X={x_positions}, Y={y_positions})")
                    return True
        
        # Mushrooms blocking horizontal movement
        hx, hy = head_pos
        mushroom_left = (hx - 1, hy) in self.mushrooms_in_map or (hx - 2, hy) in self.mushrooms_in_map
        mushroom_right = (hx + 1, hy) in self.mushrooms_in_map or (hx + 2, hy) in self.mushrooms_in_map
        
        # Mushrooms on both sides further supports stuck
        if mushroom_left and mushroom_right:
            logger.debug(f"    STUCK DETECTION: '{name}' has mushrooms on both sides")
            return True
        
        return False
    
    def _handle_stuck_centipede(self, blaster_pos, centipede_obj):
        """
        Strategy for killing a stuck centipede.
        """
        head = centipede_obj['head']
        head_pos = (head.x, head.y)
        bx, by = blaster_pos
        hx, hy = head_pos
        
        logger.info(f"    STUCK HANDLING: blaster at ({bx},{by}), stuck centipede at ({hx},{hy})")
        
        # Step 1: approach vertically if too far
        vertical_distance = abs(by - hy)
        horizontal_distance = abs(bx - hx)
        
        # If far below the stuck centipede, go up first
        if by > hy + 5:
            logger.info(f"    -> APPROACHING stuck centipede: moving UP (vertical dist={vertical_distance})")
            new_pos = self.result(blaster_pos, 'w')
            if new_pos not in self.mushrooms_in_map and new_pos not in self.centipedes_segment_in_map:
                return 'w'
        
        # Step 2: if close enough, try to shoot any segment
        for segment in centipede_obj['body']:
            seg_pos = (segment.x, segment.y)
            if self._should_shoot(blaster_pos, seg_pos, self.mushrooms_in_map):
                logger.info(f"    -> STUCK KILL: shooting at segment {seg_pos}")
                return 'A'
        
        # Step 3: move horizontally to align (use real head position, not prediction)
        if bx < hx:
            logger.info(f"    -> STUCK ALIGN: moving RIGHT toward X={hx}")
            new_pos = self.result(blaster_pos, 'd')
            if new_pos not in self.mushrooms_in_map and new_pos not in self.centipedes_segment_in_map:
                # Anticipate alignment after moving: shoot now if it will align
                if self._should_shoot_anticipating_move(blaster_pos, head_pos, self.mushrooms_in_map, 'd'):
                    logger.info(f"    -> STUCK ANTICIPATE: shooting before moving right")
                    return 'A'
                return 'd'
        elif bx > hx:
            logger.info(f"    -> STUCK ALIGN: moving LEFT toward X={hx}")
            new_pos = self.result(blaster_pos, 'a')
            if new_pos not in self.mushrooms_in_map and new_pos not in self.centipedes_segment_in_map:
                # Anticipate alignment after moving
                if self._should_shoot_anticipating_move(blaster_pos, head_pos, self.mushrooms_in_map, 'a'):
                    logger.info(f"    -> STUCK ANTICIPATE: shooting before moving left")
                    return 'A'
                return 'a'
        
        # Step 4: aligned in X, check line of fire and shoot/clear blockers
        if bx == hx:
            # Check line-of-fire
            path_clear = True
            for y in range(min(by, hy), max(by, hy)):
                if (hx, y) in self.mushrooms_in_map:
                    path_clear = False
                    logger.debug(f"    -> Mushroom blocking at ({hx}, {y})")
                    break
            
            if path_clear and hy < by:
                logger.info(f"    -> STUCK KILL: aligned and clear path, shooting!")
                return 'A'
            elif not path_clear:
                # Mushroom blocking: try to clear it
                logger.info(f"    -> STUCK CLEAR: shooting mushroom in path")
                return 'A'
        
        # Fallback: general safe movement
        logger.warning(f"    -> STUCK FALLBACK: using safe move")
        return self._safe_move_towards(blaster_pos, head_pos)

    def _execute_escape_strategy(self, blaster_pos):
        """
        ESCAPE strategy: prioritize survival.

        Priorities:
        1) Never step onto a centipede tile.
        2) Avoid danger tiles.
        3) If trapped by mushrooms, shoot to open an escape route.
        """
        logger.info(f"  STRATEGY: _execute_escape_strategy from {blaster_pos}")
        bx, by = blaster_pos
        
        # Evaluate possible moves
        escape_options = []
        strict_escape_options = []

        current_is_imminent = blaster_pos in self.imminent_hazards
        
        # Priority order: down, right, left, up (avoid going up into centipedes)
        priority_directions = ['s', 'd', 'a', 'w']
        
        for action in priority_directions:
            new_pos = self.result(blaster_pos, action)
            
            # Do not keep the same position (wall)
            if new_pos == blaster_pos:
                continue
            
            # Never move into a centipede (certain death)
            if new_pos in self.centipedes_segment_in_map:
                continue
            # Never move into a spider/flee tile (certain death)
            if new_pos in self.npc_hazards:
                continue

            # Never move into a tile that is plausibly lethal in the very next frame
            # (e.g., predicted head position or spider reach zone).
            if new_pos in self.hard_imminent_hazards:
                continue
            
            # Ignore mushrooms for now (handled separately)
            if new_pos in self.mushrooms_in_map:
                continue

            # Upwards escape is only allowed when it is safe and there are no nearby upper threats.
            if action == 'w' and not self._upward_escape_allowed(blaster_pos, new_pos):
                continue

            in_danger_now = new_pos in self.dangerous_positions

            survival = self._max_survival_steps(
                new_pos,
                horizon=int(self._escape_lookahead),
                max_nodes=int(self._escape_bfs_max_nodes),
            )
            safety_score = self._calculate_escape_score(new_pos, action)
            safety_score += float(survival) * 800.0
            if in_danger_now:
                safety_score -= 700.0

            # If we are at risk of being cornered by same-row pressure, prefer moving up (when allowed).
            if action == 'w' and self._should_prefer_upward_escape(blaster_pos):
                safety_score += 900.0

            escape_options.append((action, new_pos, safety_score))
            if not in_danger_now:
                strict_escape_options.append((action, new_pos, safety_score))
            logger.debug(f"    Escape option: {action} -> {new_pos}, score={safety_score:.1f}")
        
        # If no strictly safe routes, consider clearing a mushroom
        if not strict_escape_options:
            logger.warning(f"    -> No escape routes without mushrooms!")
            
            # Decide whether to shoot a mushroom to open a route
            should_clear, mushroom_target = self._should_clear_mushroom_path(blaster_pos, priority_directions)
            
            if should_clear:
                self.clearing_mushroom_target = mushroom_target
                # Align to shoot the mushroom
                mx, my = mushroom_target
                if bx == mx:  # already aligned
                    logger.info(f"    -> SHOOTING at mushroom {mushroom_target}")
                    return 'A'
                elif bx < mx:
                    logger.info(f"    -> Moving RIGHT to align with mushroom {mushroom_target}")
                    return 'd'
                else:
                    logger.info(f"    -> Moving LEFT to align with mushroom {mushroom_target}")
                    return 'a'
            
            # If we can't clear, attempt riskier moves
            logger.warning("  -> CRITICAL: No safe moves! Trying risky moves...")
            # Pass 1: still avoid imminent-hazard tiles whenever possible.
            for action in priority_directions:
                new_pos = self.result(blaster_pos, action)
                if (
                    new_pos != blaster_pos
                    and new_pos not in self.mushrooms_in_map
                    and new_pos not in self.npc_hazards
                    and new_pos not in self.centipedes_segment_in_map
                    and new_pos not in self.hard_imminent_hazards
                ):
                    survival = self._max_survival_steps(
                        new_pos,
                        horizon=max(4, int(self._escape_lookahead) // 2),
                        max_nodes=max(250, int(self._escape_bfs_max_nodes) // 2),
                    )
                    safety_score = self._calculate_escape_score(new_pos, action) + float(survival) * 600.0
                    escape_options.append((action, new_pos, safety_score))

            # Pass 2 (only if we're already on an imminent tile): allow moving into imminent tiles
            # as a last resort to try to break a forced-death situation.
            if current_is_imminent and not escape_options:
                for action in priority_directions:
                    new_pos = self.result(blaster_pos, action)
                    if (
                        new_pos != blaster_pos
                        and new_pos not in self.mushrooms_in_map
                        and new_pos not in self.npc_hazards
                        and new_pos not in self.centipedes_segment_in_map
                        and new_pos not in self.hard_imminent_hazards
                    ):
                        survival = self._max_survival_steps(
                            new_pos,
                            horizon=max(4, int(self._escape_lookahead) // 2),
                            max_nodes=max(250, int(self._escape_bfs_max_nodes) // 2),
                        )
                        safety_score = self._calculate_escape_score(new_pos, action) + float(survival) * 300.0
                        # Explicit penalty for stepping into imminent danger.
                        if new_pos in self.imminent_hazards:
                            safety_score -= 1500.0
                        escape_options.append((action, new_pos, safety_score))
        
        # If still no options, stay still (last resort)
        if not escape_options:
            logger.error("  -> TRAPPED: No moves possible!")
            return ''
        
        # Choose the move with highest safety score (prefer strict options if any)
        candidates = strict_escape_options if strict_escape_options else escape_options
        candidates.sort(key=lambda x: x[2], reverse=True)
        best_action, best_pos, best_score = candidates[0]
        
        logger.info(f"  -> ESCAPING to {best_pos} (score: {best_score:.1f}) via '{best_action}'")
        return best_action
    
    def _calculate_escape_score(self, position, action):
        """
        Safety score for an ESCAPE position. Higher is safer.
        """
        score = 100.0  # base
        px, py = position
        
        # 1) Distance from centipede segments (most important)
        min_centipede_dist = float('inf')
        for seg_pos in self.centipedes_segment_in_map:
            dist = abs(px - seg_pos[0]) + abs(py - seg_pos[1])
            min_centipede_dist = min(min_centipede_dist, dist)
        
        # Farther from centipedes is much better
        score += min_centipede_dist * 50
        
        # 2) Distance from predicted positions (future danger)
        for predictions in self.predicted_positions.values():
            for future_pos in predictions:
                dist = abs(px - future_pos[0]) + abs(py - future_pos[1])
                if dist < 4:  # penalty if close to predicted danger
                    score -= (4 - dist) * 15
        
        # 3) Mobility-aware vertical preference
        # Being too low (especially on the bottom row) is often dangerous because it removes
        # downward escape and can lead to wall cornering.
        height = self.dim[1]
        if py == height - 1:
            score -= 160
        elif py == height - 2:
            score -= 60
        
        # 4) Small penalty for nearby mushrooms (limits mobility)
        mushrooms_nearby = 0
        for dx in [-1, 0, 1]:
            for dy in [-1, 0, 1]:
                check_pos = (px + dx, py + dy)
                if check_pos in self.mushrooms_in_map:
                    mushrooms_nearby += 1
        score -= mushrooms_nearby * 3  # peso reduzido

        # 4b) Avoid side-wall traps during escape.
        width = self.dim[0]
        wall_dist = min(px, (width - 1) - px)
        if wall_dist == 0:
            score -= 180
        elif wall_dist == 1:
            score -= 90
        elif wall_dist == 2:
            score -= 40

        # 4c) If centipede segments are already on the bottom row, being on the bottom row is
        # especially risky (limits dodge options and enables row sweeps).
        if py >= height - 1:
            near_bottom_pressure = 0
            for seg_pos in self.centipedes_segment_in_map:
                if seg_pos[1] == height - 1 and abs(seg_pos[0] - px) <= 7:
                    near_bottom_pressure += 1
            if near_bottom_pressure:
                score -= 220 + min(280, near_bottom_pressure * 60)

        # 5) Anti-encirclement: avoid tiles with too few exits / low mobility.
        exits = self._count_safe_exits(position)
        if exits <= 1:
            score -= 250
        elif exits == 2:
            score -= 80
        # Prefer areas with more breathing room.
        score += min(60, self._local_mobility(position, max_nodes=60)) * 1.5

        # Strongly avoid literal corners unless forced.
        if self._is_corner(position):
            score -= 220

        # Penalize stepping into already-marked danger (buffer around threats)
        if position in self.dangerous_positions:
            score -= 300
        
        return score
    
    def _safe_move_towards(self, start, goal):
        """Safe movement towards goal (never move onto a centipede tile)."""
        logger.debug(f"    _safe_move_towards: from {start} to {goal}")
        sx, sy = start
        gx, gy = goal
        
        moves = []
        
        # Prioriza movimento horizontal
        if sx < gx:
            moves.append('d')
        elif sx > gx:
            moves.append('a')
        
        # Depois vertical
        if sy < gy:
            moves.append('s')
        elif sy > gy:
            moves.append('w')
        
        # Try prioritized moves (with safety checks)
        for move in moves:
            new_pos = self.result(start, move)
            if new_pos == start:
                continue
            
            # Never move onto a mushroom
            if new_pos in self.mushrooms_in_map:
                continue
            
            # Never move onto a centipede (certain death)
            if new_pos in self.centipedes_segment_in_map:
                continue

            # Never move onto a spider/flee tile
            if new_pos in self.npc_hazards:
                continue
            
            # Avoid dangerous tiles if possible
            if new_pos not in self.dangerous_positions:
                logger.debug(f"    -> Safe move found: '{move}' to {new_pos}")
                return move
        
        # If no fully safe movement, at least avoid mushrooms/centipede tiles
        for move in moves:
            new_pos = self.result(start, move)
            if (new_pos != start and 
                new_pos not in self.mushrooms_in_map and
                new_pos not in self.centipedes_segment_in_map and
                new_pos not in self.npc_hazards):
                return move
        
        # Last resort: any movement that is not onto a mushroom/centipede tile
        for action in ['s', 'd', 'a', 'w']:  # prefer down
            new_pos = self.result(start, action)
            if (new_pos != start and 
                new_pos not in self.mushrooms_in_map and
                new_pos not in self.centipedes_segment_in_map and
                new_pos not in self.npc_hazards):
                return action
        
        logger.warning("  -> WARNING: No safe move found in _safe_move_towards!")
        return ''
    
    def create_problem(self, state, goal, timestamp):
        """
        Create a search problem and solve it with A*.
        
        Args:
            state: current blaster state (x, y) or (x, y, direction)
            goal: goal state
            timestamp: frame timestamp used to compute a time budget
        
        Returns:
            A list of actions (plan) or None if no solution is found.
        """
        logger.debug(f"  create_problem: from {state} to {goal}")
        
        TOLERANCE = 0.01  # 10ms tolerance
        timeout = self.time_per_frame - (time.time() - timestamp) - TOLERANCE
        
        if timeout <= 0:
            logger.warning(f"  -> create_problem: No time left! timeout={timeout}")
            return None
        
        # Run A* with movement-only by default (shooting is handled separately in the policy)
        previous_allow_shoot = self._planning_allow_shoot
        self._planning_allow_shoot = False
        try:
            problem = SearchProblem(self, state, goal)
            tree = SearchTree(problem, "a*")  # A* search
        
            result = tree.search(timeout=timeout, limit=15)  # depth limit
        
            if result is None:
                logger.warning(f"  -> create_problem: No solution found for {state} -> {goal}")
                return None
        
            plan = tree.plan()
            logger.debug(f"  -> create_problem: Found plan with {len(plan)} steps: {plan}")
            return plan
        finally:
            self._planning_allow_shoot = previous_allow_shoot

    def _action_to_direction(self, action: str) -> Optional[consts.Direction]:
        if action == 'w':
            return consts.Direction.NORTH
        if action == 's':
            return consts.Direction.SOUTH
        if action == 'a':
            return consts.Direction.WEST
        if action == 'd':
            return consts.Direction.EAST
        return None

    def _choose_blocked_hold_key(self, pos: tuple[int, int]) -> Optional[str]:
        """Return a movement key that keeps the blaster in place.

        In this engine there is no explicit no-op key. Sending an empty key is
        error-prone, so when we want to "wait" we instead send a movement key
        that is blocked by a wall/mushroom, which keeps position unchanged.
        """
        for key in ('s', 'w', 'a', 'd'):
            if self.result(pos, key) == pos:
                return key
        return None

    def _finalize_action(self, action: str) -> str:
        """Updates internal direction tracking to match game semantics, then returns the action."""
        if self._current_blaster_pos is not None:
            cur = self._current_blaster_pos

            # Hard safety: do not choose actions that land on an imminent hazard tile.
            if action in ('w', 'a', 's', 'd'):
                nxt = self.result(cur, action)
                if nxt != cur and nxt in self.hard_imminent_hazards:
                    logger.info(f"  -> SAFETY: blocking move '{action}' into imminent hazard at {nxt}")
                    fallback = self._execute_escape_strategy(cur)
                    action = fallback if fallback is not None else ''

            # If we plan to stay/shoot while standing on an imminent hazard, force an escape move.
            if action in ('', 'A') and cur in self.hard_imminent_hazards:
                logger.info(f"  -> SAFETY: blocking '{action}' while on imminent hazard at {cur}")
                fallback = self._execute_escape_strategy(cur)
                action = fallback if fallback is not None else ''

            # Movement safety (near bottom): avoid stepping into danger buffers when possible.
            # This prevents situations where a predicted head/segment drop (due to wall/mushroom) lands on us.
            if action in ('w', 'a', 's', 'd'):
                nxt = self.result(cur, action)
                bottom_band_y = self.dim[1] - 2
                if nxt != cur and (cur[1] >= bottom_band_y or nxt[1] >= bottom_band_y):
                    if nxt in self.dangerous_positions or nxt in self.npc_hazards:
                        logger.info(f"  -> SAFETY: blocking move '{action}' into danger at {nxt}")
                        fallback = self._execute_escape_strategy(cur)
                        action = fallback if fallback is not None else ''

            # Treat 'A' as movement+shoot (engine may move first, then fire).
            # Apply the same safety checks to the post-move position.
            if action == 'A':
                post = self._simulate_shot_origin_after_A(cur, self.blaster_direction)

                # Never allow 'A' to step onto certain-death tiles.
                if post != cur and (post in self.centipedes_segment_in_map or post in self.npc_hazards):
                    logger.info(f"  -> SAFETY: blocking shot 'A' (post_move_pos on hard hazard at {post})")
                    fallback = self._execute_escape_strategy(cur)
                    action = fallback if fallback is not None else ''
                else:
                    # Targeted bottom-row safety: avoid stepping onto the bottom row directly
                    # under a centipede head (a bounce can drop into us next frame).
                    height = self.dim[1]
                    if post != cur and post[1] == height - 1:
                        above = (post[0], height - 2)
                        if above in self._current_centipede_heads:
                            logger.info(f"  -> SAFETY: blocking shot 'A' (post_move_pos under head at {above})")
                            fallback = self._execute_escape_strategy(cur)
                            action = fallback if fallback is not None else ''

                    # Hard avoid: do not allow 'A' to land on next-frame lethal tiles.
                    if action == 'A' and post in self.hard_imminent_hazards:
                        logger.info(f"  -> SAFETY: blocking shot 'A' (post_move_pos in imminent hazard at {post})")
                        fallback = self._execute_escape_strategy(cur)
                        action = fallback if fallback is not None else ''

            # Never send an empty key to the engine: convert "wait" into a blocked movement key.
            # If we can't hold in-place, take a conservative escape step instead.
            if action == '':
                hold_key = self._choose_blocked_hold_key(cur)
                if hold_key is not None:
                    action = hold_key
                else:
                    fallback = self._execute_escape_strategy(cur)
                    action = fallback if fallback not in (None, '') else 's'

        # Global safety: never fire when a centipede segment is immediately above the firing column.
        # This avoids the lethal split+spawn-mushroom pattern that can force an immediate vertical drop.
        if action == 'A' and self._current_blaster_pos is not None:
            bx, by = self._current_blaster_pos
            if by > 0:
                # The real firing column depends on the engine quirk: 'A' may move first then shoot.
                sx, sy = self._simulate_shot_origin_after_A((bx, by), self.blaster_direction)

                immediate_above_current = (bx, by - 1) in self.centipedes_segment_in_map
                immediate_above_shot = (sx, sy - 1) in self.centipedes_segment_in_map if sy > 0 else False

                if immediate_above_current or immediate_above_shot:
                    logger.info(
                        f"  -> SAFETY: blocking shot 'A' (segment_above_current={immediate_above_current}, segment_above_shot={immediate_above_shot})"
                    )
                    fallback = self._execute_escape_strategy((bx, by))
                    action = fallback if fallback is not None else ''

        new_dir = self._action_to_direction(action)
        if new_dir is not None:
            self.blaster_direction = new_dir
        return action

    def _simulate_shot_origin_after_A(self, blaster_pos: tuple[int, int], blaster_dir: consts.Direction) -> tuple[int, int]:
        """
        Approximates the bug blaster position used to fire on action 'A':
        game updates position using current direction, then shoots from that position.
        """
        x, y = blaster_pos
        nx, ny = x, y
        if blaster_dir == consts.Direction.NORTH and y > 0:
            ny -= 1
        elif blaster_dir == consts.Direction.SOUTH and y < self.dim[1] - 1:
            ny += 1
        elif blaster_dir == consts.Direction.WEST and x > 0:
            nx -= 1
        elif blaster_dir == consts.Direction.EAST and x < self.dim[0] - 1:
            nx += 1

        # Mushrooms block movement but still update direction in the real game.
        if (nx, ny) in self.mushrooms_in_map:
            return (x, y)
        return (nx, ny)

    def _first_blocking_mushroom_in_column(self, x: int, aim_y: int, blaster_y: int) -> Optional[tuple[int, int]]:
        """Returns the first mushroom (lowest y) that would block a shot from (x, blaster_y) to aim_y."""
        if aim_y >= blaster_y:
            return None
        for y in range(aim_y, blaster_y):
            pos = (x, y)
            if pos in self.mushrooms_in_map:
                return pos
        return None

    def _is_hard_safe(self, pos: tuple[int, int]) -> bool:
        """Hard safety: never step into a mushroom or a centipede segment."""
        return (
            pos not in self.mushrooms_in_map
            and pos not in self.centipedes_segment_in_map
            and pos not in self.npc_hazards
        )

    def _add_danger_neighborhood(self, pos: tuple[int, int], radius: int = 1) -> None:
        """Adds a (2r+1)x(2r+1) neighborhood around pos into dangerous_positions (clamped to map)."""
        x, y = pos
        for dx in range(-radius, radius + 1):
            for dy in range(-radius, radius + 1):
                nx = x + dx
                ny = y + dy
                if 0 <= nx < self.dim[0] and 0 <= ny < self.dim[1]:
                    self.dangerous_positions.add((nx, ny))

    def _add_neighborhood_to_set(self, out: set[tuple[int, int]], pos: tuple[int, int], radius: int = 1) -> None:
        """Adds a (2r+1)x(2r+1) neighborhood around pos into an arbitrary set (clamped to map)."""
        x, y = pos
        for dx in range(-radius, radius + 1):
            for dy in range(-radius, radius + 1):
                nx = x + dx
                ny = y + dy
                if 0 <= nx < self.dim[0] and 0 <= ny < self.dim[1]:
                    out.add((nx, ny))

    def _compute_future_danger(self, centipede: Centipede, horizon: int) -> list[set[tuple[int, int]]]:
        """Build per-timestep conservative danger sets for ESCAPE lookahead."""
        h = max(0, int(horizon))
        base_now = set(self.dangerous_positions) | set(self.centipedes_segment_in_map) | set(self.npc_hazards)
        dangers: list[set[tuple[int, int]]] = [set() for _ in range(h + 1)]
        dangers[0] = base_now

        # Spider future (observational prediction)
        spider_pred: list[tuple[int, int]] = []
        if self._spider_track:
            try:
                spider_pred = self._predict_spider_path_observed(h)
            except Exception:
                spider_pred = []

        # Flee future (downward)
        flee_start: Optional[tuple[int, int]] = None
        if getattr(centipede, "flee_pos", None) is not None:
            flee_start = (centipede.flee_pos.x, centipede.flee_pos.y)

        for t in range(1, h + 1):
            s = set(base_now)

            # Centipede predicted positions
            for preds in self.predicted_positions.values():
                if t - 1 < len(preds):
                    self._add_neighborhood_to_set(s, preds[t - 1], radius=1)

            # Spider predicted position (+ conservative horizontal next)
            if spider_pred and t - 1 < len(spider_pred):
                self._add_neighborhood_to_set(s, spider_pred[t - 1], radius=1)
                sx, sy = spider_pred[t - 1]
                for nx in (sx - 1, sx + 1):
                    if 0 <= nx < self.dim[0]:
                        self._add_neighborhood_to_set(s, (nx, sy), radius=1)

            # Flee predicted path (straight down)
            if flee_start is not None:
                fx, fy = flee_start
                nfy = fy + t
                if 0 <= nfy < self.dim[1]:
                    self._add_neighborhood_to_set(s, (fx, nfy), radius=1)

            dangers[t] = s

        return dangers

    def _max_survival_steps(self, start_pos: tuple[int, int], horizon: int, max_nodes: int) -> int:
        """How many steps (0..horizon) we can stay alive, via a bounded time-expanded BFS."""
        h = max(0, int(horizon))
        if h <= 0:
            return 0

        dangers = self._future_danger
        if not dangers or len(dangers) <= h:
            dangers = [
                set(self.dangerous_positions) | set(self.centipedes_segment_in_map) | set(self.npc_hazards)
                for _ in range(h + 1)
            ]

        if start_pos in self.mushrooms_in_map or start_pos in self.centipedes_segment_in_map or start_pos in self.npc_hazards:
            return 0

        q = deque([(start_pos, 0)])
        seen = {(start_pos[0], start_pos[1], 0)}
        best_t = 0

        actions = ('', 'w', 'a', 's', 'd')  # include "stay" (send empty key)

        limit = max(1, int(max_nodes))
        while q and len(seen) < limit:
            pos, t = q.popleft()
            if t > best_t:
                best_t = t
            if t >= h:
                continue

            nt = t + 1
            danger_nt = dangers[min(nt, len(dangers) - 1)]
            for a in actions:
                npos = pos if a == '' else self.result(pos, a)
                if npos == pos and a != '':
                    continue

                if npos in self.mushrooms_in_map:
                    continue
                if npos in self.centipedes_segment_in_map:
                    continue
                if npos in self.npc_hazards:
                    continue
                if npos in danger_nt:
                    continue

                key = (npos[0], npos[1], nt)
                if key in seen:
                    continue
                seen.add(key)
                q.append((npos, nt))

        return best_t

    def _update_npc_hazards_and_danger(self, centipede: Centipede) -> None:
        """
        Updates npc_hazards and adds conservative danger around spider/flee.

        Notes:
        - Spider: state does not include its internal phase/vx, so we conservatively mark
          current neighborhood plus potential next horizontal tiles.
        - Flee/Flea: moves straight down: (x, y+1).
        """
        self.npc_hazards.clear()

        # Spider
        if getattr(centipede, "spider_pos", None) is not None:
            sx, sy = centipede.spider_pos.x, centipede.spider_pos.y
            s_pos = (sx, sy)
            self.npc_hazards.add(s_pos)
            self._add_danger_neighborhood(s_pos, radius=1)
            # conservative next-step horizontals
            for nx in (sx - 1, sx + 1):
                if 0 <= nx < self.dim[0]:
                    self._add_danger_neighborhood((nx, sy), radius=1)

        # Flee / Flea
        if getattr(centipede, "flee_pos", None) is not None:
            fx, fy = centipede.flee_pos.x, centipede.flee_pos.y
            f_pos = (fx, fy)
            self.npc_hazards.add(f_pos)
            self._add_danger_neighborhood(f_pos, radius=1)
            # conservative next steps (down)
            for dy in range(1, 4):
                nfy = fy + dy
                if 0 <= nfy < self.dim[1]:
                    self._add_danger_neighborhood((fx, nfy), radius=1)
                else:
                    break

    def _update_imminent_hazards(self, centipede: Centipede) -> None:
        """Update next-frame lethal tiles.

        This is intentionally conservative: it's used as a *hard* avoid. When the agent is
        forced to pick between multiple "danger" tiles, this helps it avoid stepping into
        tiles that are plausibly occupied in the *very next* frame.
        """
        self.imminent_hazards.clear()
        self.hard_imminent_hazards.clear()

        # Centipede: next head tiles (t+1 and t+2), conservatively.
        # Our prediction model does not know the internal vertical move_dir; when a head hits a
        # wall/mushroom it can move either up or down depending on its internal state. For safety
        # we include BOTH vertical outcomes when a bounce occurs.
        width, height = self.dim

        def _opp_dir(d: consts.Direction) -> consts.Direction:
            return consts.Direction.WEST if d == consts.Direction.EAST else consts.Direction.EAST

        def _step_head(pos: tuple[int, int], d: consts.Direction) -> tuple[set[tuple[int, int]], consts.Direction]:
            hx, hy = pos
            dx = 1 if d == consts.Direction.EAST else -1
            attempted = (hx + dx, hy)
            hit_wall = attempted[0] < 0 or attempted[0] >= width
            hit_mushroom = attempted in self.mushrooms_in_map

            if not hit_wall and not hit_mushroom:
                return {attempted}, d

            # Bounce: vertical move, then flip horizontal direction.
            candidates: set[tuple[int, int]] = set()
            if hy > 0:
                candidates.add((hx, hy - 1))
            if hy < height - 1:
                candidates.add((hx, hy + 1))
            return candidates, _opp_dir(d)

        for c in centipede.centipedes_list:
            head = c.get('head')
            if head is None:
                continue
            d_raw = c.get('direction')
            try:
                d = consts.Direction(d_raw)
            except Exception:
                # Accept plain ints (1/3) as well.
                d = consts.Direction.EAST if int(d_raw) == int(consts.Direction.EAST) else consts.Direction.WEST

            pos0 = (head.x, head.y)

            step1, d1 = _step_head(pos0, d)
            for p1 in step1:
                self.imminent_hazards.add(p1)
                self.hard_imminent_hazards.add(p1)

            # 2nd step candidates from each step-1 position.
            step2: set[tuple[int, int]] = set()
            for p1 in step1:
                s2, _d2 = _step_head(p1, d1)
                step2 |= s2
            for p2 in step2:
                self.imminent_hazards.add(p2)
                self.hard_imminent_hazards.add(p2)

        # Spider: can move diagonally and its Y can change by more than 1 per frame.
        # We do not have access to the spider's internal phase/frequency, so avoid using
        # full-height "next X column" blocks here (too conservative; can force corner traps).
        # Instead, use short-horizon prediction + local neighborhoods, and only tighten when
        # the spider is vertically near the BugBlaster.
        sp = getattr(centipede, "spider_pos", None)
        if sp is not None:
            sx, sy = sp.x, sp.y

            width, height = self.dim

            # Local neighborhood around current position (soft imminent).
            self._add_neighborhood_to_set(self.imminent_hazards, (sx, sy), radius=2)

            # Short-horizon observed prediction (soft imminent), with a small hard zone only
            # when predicted positions are very close to the current BugBlaster row.
            spider_pred: list[tuple[int, int]] = []
            if self._spider_track:
                try:
                    spider_pred = self._predict_spider_path_observed(3)
                except Exception:
                    spider_pred = []

            bb = self._current_blaster_pos
            if spider_pred:
                for p in spider_pred[:3]:
                    self._add_neighborhood_to_set(self.imminent_hazards, p, radius=2)
                    if bb is not None:
                        bx, by = bb
                        if abs(p[1] - by) <= 2:
                            self._add_neighborhood_to_set(self.hard_imminent_hazards, p, radius=1)

            # If the spider is vertically near the blaster row, also avoid its next-X columns
            # in a limited Y window (soft), to reduce close-range diagonal surprises.
            if bb is not None:
                bx, by = bb
                close_hard = abs(sy - by) <= 6
                close_soft = (abs(sy - by) <= 10 and abs(sx - bx) <= 6)
                if close_hard or close_soft:
                    vx_candidates = (-1, 1)
                    if len(self._spider_track) >= 2:
                        x0, _y0 = self._spider_track[-2]
                        dx_obs = sx - x0
                        if dx_obs < 0:
                            vx_candidates = (-1,)
                        elif dx_obs > 0:
                            vx_candidates = (1,)

                    def _step_x(x: int, vx: int) -> tuple[int, int]:
                        nx = x + vx
                        nvx = vx
                        if nx < 0:
                            nx = 0
                            nvx *= -1
                        elif nx > width - 1:
                            nx = width - 1
                            nvx *= -1
                        return nx, nvx

                    x1_cols: set[int] = set()
                    x2_cols: set[int] = set()
                    for vx in vx_candidates:
                        x1, vx1 = _step_x(sx, vx)
                        x1_cols.add(x1)
                        x2, _vx2 = _step_x(x1, vx1)
                        x2_cols.add(x2)

                    y_min = max(0, min(sy, by) - 6)
                    y_max = min(height, max(sy, by) + 7)
                    for xcol in x1_cols:
                        for y in range(y_min, y_max):
                            self.imminent_hazards.add((xcol, y))
                            if close_hard and abs(y - by) <= 2:
                                self.hard_imminent_hazards.add((xcol, y))

                    # Two-step horizontal reach (helps avoid "diagonal sweep" kills near us).
                    for xcol in x2_cols:
                        for y in range(y_min, y_max):
                            self.imminent_hazards.add((xcol, y))
                            if close_hard and abs(y - by) <= 2:
                                self.hard_imminent_hazards.add((xcol, y))

        # Flee/Flea: moves down.
        fp = getattr(centipede, "flee_pos", None)
        if fp is not None:
            fx, fy = fp.x, fp.y
            # Important ordering quirk: NPCs move before the player each frame.
            # If the flea is within 2 steps of the BugBlaster row, stepping into its
            # column can become an unavoidable next-frame death.
            if 0 <= fx < self.dim[0] and 0 <= fy < self.dim[1]:
                # Mark several next positions (the state the agent sees can be one tick behind).
                for dy in range(0, 4):
                    nfy = fy + dy
                    if 0 <= nfy < self.dim[1]:
                        self.imminent_hazards.add((fx, nfy))
                        self.hard_imminent_hazards.add((fx, nfy))
                    else:
                        break

                # Additionally: when the flea is close to the bottom row, treat the
                # bottom-row tile in its column as imminent to avoid stepping into a
                # "can't-dodge" situation.
                _width, height = self.dim
                bottom_y = height - 1
                if bottom_y >= 0 and (bottom_y - fy) <= 4:
                    self.imminent_hazards.add((fx, bottom_y))
                    self.hard_imminent_hazards.add((fx, bottom_y))

    def _update_spider_track(self, centipede: Centipede) -> None:
        """Track last observed spider positions (only what the server provides)."""
        sp = getattr(centipede, "spider_pos", None)
        if sp is None:
            return
        self._spider_track.append((sp.x, sp.y))

    def _predict_spider_path_observed(self, frames: int) -> list[tuple[int, int]]:
        """Predict spider path using only observed positions (short horizon).

        We do not have access to game.Spider internal state (_t/_frequency/_origin_y/_vx),
        so this is an approximation:
        - X: inferred constant velocity with wall bounce.
        - Y: low-pass extrapolation from recent delta.
        """
        if not self._spider_track:
            return []

        width, height = self.dim
        x, y = self._spider_track[-1]

        # Infer vx from last step (default to +1)
        vx = 1
        if len(self._spider_track) >= 2:
            x0, _y0 = self._spider_track[-2]
            dx = x - x0
            if dx < 0:
                vx = -1
            elif dx > 0:
                vx = 1

        # Try to detect a periodic Y pattern (spider vertical is sinusoidal with fixed frequency).
        # This is much more accurate than linear extrapolation when frequency is high.
        y_series = [p[1] for p in self._spider_track]
        cycle: Optional[list[int]] = None
        max_period = min(30, max(3, len(y_series) // 2))
        for p in range(3, max_period + 1):
            if len(y_series) < 2 * p:
                continue
            if y_series[-p:] == y_series[-2 * p : -p]:
                cycle = y_series[-p:]
                break

        # Infer dy (damped fallback) when no clear cycle is detected.
        dy = 0.0
        if cycle is None and len(self._spider_track) >= 2:
            _x0, y0 = self._spider_track[-2]
            dy = float(y - y0)

        preds: list[tuple[int, int]] = []
        sim_x = int(x)
        sim_y = float(y)
        sim_vx = int(vx)
        sim_dy = float(dy)

        for _ in range(max(0, int(frames))):
            # Horizontal movement + bounce
            nx = sim_x + sim_vx
            if nx < 0:
                nx = 0
                sim_vx *= -1
            elif nx > width - 1:
                nx = width - 1
                sim_vx *= -1
            sim_x = nx

            # Vertical movement
            if cycle is not None:
                # If last 2*p matched, last value corresponds to end of a cycle; next y is cycle[1].
                idx = (len(preds) + 1) % len(cycle)
                pred_y = cycle[idx]
            else:
                # Damped extrapolation + clamp
                sim_dy *= 0.85
                sim_y = sim_y + sim_dy
                if sim_y < 0:
                    sim_y = 0.0
                    sim_dy *= -0.5
                elif sim_y > height - 1:
                    sim_y = float(height - 1)
                    sim_dy *= -0.5
                pred_y = int(round(sim_y))

            preds.append((sim_x, int(pred_y)))

        return preds

    def _is_blocked_step(self, pos: tuple[int, int], direction: consts.Direction) -> bool:
        """True if moving one step in direction would NOT change position (wall or mushroom)."""
        x, y = pos
        nx, ny = x, y
        if direction == consts.Direction.NORTH:
            ny = y - 1
        elif direction == consts.Direction.SOUTH:
            ny = y + 1
        elif direction == consts.Direction.WEST:
            nx = x - 1
        elif direction == consts.Direction.EAST:
            nx = x + 1
        else:
            return True

        if nx < 0 or nx >= self.dim[0] or ny < 0 or ny >= self.dim[1]:
            return True
        return (nx, ny) in self.mushrooms_in_map

    def _shortest_steps_dir(
        self,
        start_state: tuple[int, int, consts.Direction],
        goal_state: tuple[int, int, consts.Direction],
        max_steps: int,
    ) -> Optional[int]:
        """Return minimal number of movement actions to reach goal_state (BFS), or None."""
        if start_state == goal_state:
            return 0

        q: deque[tuple[tuple[int, int, consts.Direction], int]] = deque([(start_state, 0)])
        seen: set[tuple[int, int, consts.Direction]] = {start_state}

        while q:
            state, dist = q.popleft()
            if dist >= max_steps:
                continue

            for a in ('w', 'a', 's', 'd'):
                ns = self.result(state, a)
                if not (isinstance(ns, tuple) and len(ns) >= 3):
                    continue
                ns3 = (ns[0], ns[1], ns[2])
                ns_xy = (ns[0], ns[1])

                # Never path through hard hazards.
                if ns_xy in self.centipedes_segment_in_map:
                    continue
                if ns_xy in self.npc_hazards:
                    continue

                if ns3 == goal_state:
                    return dist + 1
                if ns3 not in seen:
                    seen.add(ns3)
                    q.append((ns3, dist + 1))

        return None

    def _column_clear_for_bullet(self, x: int, y_from: int, y_to_inclusive: int) -> bool:
        """True if there is no mushroom at (x,y) for y in [y_from, y_to_inclusive]."""
        if y_from > y_to_inclusive:
            return True
        for y in range(y_from, y_to_inclusive + 1):
            if (x, y) in self.mushrooms_in_map:
                return False
        return True

    def _select_spider_intercept_bottom_wait(
        self,
        blaster_pos: tuple[int, int],
        blaster_dir: consts.Direction,
    ) -> Optional[tuple[tuple[int, int], consts.Direction, int]]:
        """Choose a bottom-row hold (x,bottom) + dir SOUTH + dt_fire to intercept the spider.

        Returns (goal_pos, goal_dir, dt_fire) where dt_fire is frames from *now*.
        """
        if len(self._spider_track) < 2:
            return None

        horizon = max(10, int(self._spider_intercept_horizon))
        spider_pred = self._predict_spider_path_observed(horizon)
        if not spider_pred:
            return None

        width, height = self.dim
        bottom_y = height - 1

        candidate_xs = list({p[0] for p in spider_pred[:horizon]})
        if not candidate_xs:
            return None

        start_state = (blaster_pos[0], blaster_pos[1], blaster_dir)

        best: Optional[tuple[tuple[int, int], consts.Direction, int]] = None
        best_score = float('inf')

        for x_fire in candidate_xs:
            goal_pos = (x_fire, bottom_y)
            goal_dir = consts.Direction.SOUTH
            goal_state = (goal_pos[0], goal_pos[1], goal_dir)

            # Don't choose an obviously unsafe waiting tile.
            if goal_pos in self.centipedes_segment_in_map or goal_pos in self.npc_hazards:
                continue

            move_steps = self._shortest_steps_dir(start_state, goal_state, max_steps=horizon)
            if move_steps is None:
                continue

            danger_penalty = 25 if goal_pos in self.dangerous_positions else 0

            # If we reach early, we can wait safely because SOUTH is blocked at bottom.
            for dt_fire in range(move_steps, horizon - 1):
                for dt_hit in range(dt_fire, horizon):
                    # When firing at dt_fire:
                    # blast spawns at (x_fire,bottom_y) and immediately moves to bottom_y-1 that frame.
                    y_bullet = (bottom_y - 1) - (dt_hit - dt_fire)
                    if y_bullet < 0:
                        break

                    if spider_pred[dt_hit] != (x_fire, y_bullet):
                        continue

                    # Ensure mushrooms won't stop the shot before this y.
                    if not self._column_clear_for_bullet(x_fire, y_bullet, bottom_y - 1):
                        continue

                    wait_steps = dt_fire - move_steps
                    score = dt_hit * 10 + move_steps * 2 + wait_steps + danger_penalty
                    if score < best_score:
                        best_score = score
                        best = (goal_pos, goal_dir, dt_fire)
                    break

        return best

    def _select_flee_intercept_bottom_wait(
        self,
        blaster_pos: tuple[int, int],
        blaster_dir: consts.Direction,
        flee_pos: tuple[int, int],
    ) -> Optional[tuple[tuple[int, int], consts.Direction, int]]:
        """Choose a *pre-shot* hold adjacent to flee's column and a fire time to hit it.

        Waiting in the same column can be fatal if the flee reaches the blaster.
        We instead wait one tile to the side with direction set so that pressing 'A'
        steps into the flee column and shoots.

        Assumes flee moves straight down 1 tile per frame.
        Returns (goal_pos, goal_dir, dt_fire) where dt_fire is frames from *now*.
        """
        width, height = self.dim
        bottom_y = height - 1

        fx, fy0 = flee_pos
        if fy0 >= bottom_y:
            return None

        horizon = max(10, int(self._flee_intercept_horizon))
        # Flee dies after moving beyond map bottom.
        horizon = min(horizon, (height - fy0) + 1)

        # Candidate pre-shot states: stand beside the column at bottom row and face into it.
        preshot_candidates: list[tuple[tuple[int, int], consts.Direction]] = []
        if fx - 1 >= 0:
            preshot_candidates.append(((fx - 1, bottom_y), consts.Direction.EAST))
        if fx + 1 < width:
            preshot_candidates.append(((fx + 1, bottom_y), consts.Direction.WEST))

        preshot_candidates = [
            (p, d)
            for (p, d) in preshot_candidates
            if p not in self.mushrooms_in_map and p not in self.centipedes_segment_in_map and p not in self.npc_hazards
        ]
        if not preshot_candidates:
            return None

        best: Optional[tuple[tuple[int, int], consts.Direction, int]] = None
        best_score = float('inf')
        start_state = (blaster_pos[0], blaster_pos[1], blaster_dir)

        # Intercept timeline model (from game.py order):
        # - Flee moves first each frame.
        # - BugBlaster moves/shoots after that.
        # - Blasts then move up one tile and collisions are checked.
        # For frame index n (n=0 is next frame), flee y is fy0 + (n+1).
        # If we press 'A' at frame n_fire, a blast is spawned at (fx, bottom_y) and
        # immediately moves to y=bottom_y-1 that same frame.
        # Solve for n_hit >= n_fire:
        #   (bottom_y-1) - (n_hit - n_fire) == fy0 + (n_hit + 1)
        # => 2*n_hit = (bottom_y - 2) + n_fire - fy0
        n_bottom = bottom_y - fy0 - 1  # flee reaches bottom_y after moving at this frame

        for goal_pos, goal_dir in preshot_candidates:
            goal_state = (goal_pos[0], goal_pos[1], goal_dir)
            move_steps = self._shortest_steps_dir(start_state, goal_state, max_steps=horizon)
            if move_steps is None:
                continue

            danger_penalty = 25 if goal_pos in self.dangerous_positions else 0

            for n_fire in range(move_steps, horizon):
                numerator = (bottom_y - 2) + n_fire - fy0
                if numerator < 0 or (numerator % 2) != 0:
                    continue
                n_hit = numerator // 2
                if n_hit < n_fire or n_hit >= horizon:
                    continue
                if n_hit >= n_bottom:
                    continue

                y_hit = fy0 + (n_hit + 1)
                if y_hit < 0 or y_hit >= height:
                    continue

                # Ensure mushrooms won't stop the blast before it reaches y_hit.
                if not self._column_clear_for_bullet(fx, y_hit, bottom_y - 1):
                    continue

                wait_steps = n_fire - move_steps
                score = n_hit * 10 + move_steps * 2 + wait_steps + danger_penalty
                if score < best_score:
                    best_score = score
                    best = (goal_pos, goal_dir, n_fire)

        return best

    def _opening_can_hit_spider_if_press_A_next_frame(
        self,
        blaster_pos: tuple[int, int],
        blaster_dir: consts.Direction,
        spider_pred: list[tuple[int, int]],
    ) -> bool:
        """Checks if choosing key 'A' now (applied next frame) can hit the spider within horizon.

        Timing notes (from game.py loop order):
        - Spider moves before bug blaster each frame.
        - On 'A' with cooldown==0: bug blaster moves first (using current direction),
          a blast is spawned at bug_blaster.pos, then blasts immediately move to y-1,
          then collision is checked.
        Therefore, if we fire on the next frame, the blast is already at (origin_x, origin_y-1)
        on that same frame.
        """
        if not spider_pred:
            return False

        origin_x, origin_y = self._simulate_shot_origin_after_A(blaster_pos, blaster_dir)

        # Evaluate future frames k=0..H-1 where spider_pred[k] is spider position at next_frame+k
        for k, (sx, sy) in enumerate(spider_pred):
            blast_y = origin_y - 1 - k
            if blast_y < 0:
                break
            if sx != origin_x or sy != blast_y:
                continue

            # Ensure no mushroom blocks before reaching this cell (blast is removed on first mushroom hit).
            blocked = False
            for yy in range(sy, origin_y):
                if (origin_x, yy) in self.mushrooms_in_map:
                    blocked = True
                    break
            if blocked:
                continue

            # Hard avoid if spider is below/equal to origin (shouldn't happen due to blast_y)
            return True

        return False

    def _select_opening_spider_hold_goal(
        self,
        blaster_pos: tuple[int, int],
        blaster_dir: consts.Direction,
        spider_pos: tuple[int, int],
    ) -> Optional[tuple[tuple[int, int], consts.Direction]]:
        """Choose a 'hold position' where we can wait (no drift) and time the shot.

        Idea:
        - The spider is usually faster than the blaster, so chasing is inefficient.
        - Instead, pick a column where the spider will pass, move there, then keep direction
          pointing into a blocked horizontal step (wall or side-mushroom) so we can send ''
          to effectively wait without moving.
        - When prediction indicates the blast will intersect the spider, press 'A'.
        """
        bx, by = blaster_pos
        sx, sy = spider_pos

        pred = self._predict_spider_path_observed(self._spider_prediction_horizon)
        if not pred:
            pred = [(sx, sy)]

        # Candidate hold Y levels: allow slight advance upwards, but keep it small for tempo.
        min_y = max(0, by - 3)
        candidate_ys = list(range(by, min_y - 1, -1))

        best_goal: Optional[tuple[tuple[int, int], consts.Direction]] = None
        best_score = float("-inf")

        # Consider columns where the spider is predicted to be.
        candidate_xs = list(dict.fromkeys([p[0] for p in pred]))
        if sx not in candidate_xs:
            candidate_xs.insert(0, sx)

        for hold_x in candidate_xs:
            for hold_y in candidate_ys:
                hold_pos = (hold_x, hold_y)

                # Must be a legal, hard-safe tile.
                if not (0 <= hold_x < self.dim[0] and 0 <= hold_y < self.dim[1]):
                    continue
                if not self._is_hard_safe(hold_pos):
                    continue
                if hold_pos in self.dangerous_positions:
                    continue

                # Determine a horizontal direction that is blocked (so '' won't drift).
                candidates: list[consts.Direction] = []
                if self._is_blocked_step(hold_pos, consts.Direction.WEST):
                    candidates.append(consts.Direction.WEST)
                if self._is_blocked_step(hold_pos, consts.Direction.EAST):
                    candidates.append(consts.Direction.EAST)
                if not candidates:
                    continue

                for hold_dir in candidates:
                    # Estimate time to get to the hold state.
                    est_steps = self._estimate_steps_to_goal(blaster_pos, blaster_dir, hold_pos, hold_dir)

                    # If we can arrive quickly, check if there exists a future frame where a timed shot is possible.
                    # Use the exact timing model: if we press 'A' at time t_fire (>= est_steps), we hit at time t_hit.
                    found_timing = False
                    best_t_hit = None
                    # Evaluate spider passes through this column.
                    for t_hit, (px, py) in enumerate(pred, start=1):
                        if px != hold_x:
                            continue
                        # Must be above the hold origin (blast goes up).
                        if py >= hold_y:
                            continue
                        # Blast position on hit frame is (hold_x, hold_y-1-(t_hit-t_fire)).
                        # Solve for t_fire so that blast_y == py:
                        # py = (hold_y - 1) - (t_hit - t_fire)  =>  t_fire = t_hit - ((hold_y - 1) - py)
                        travel = (hold_y - 1) - py
                        if travel < 0:
                            continue
                        t_fire = t_hit - travel
                        if t_fire < 1:
                            continue
                        if t_fire < est_steps:
                            continue

                        # Ensure no mushrooms block the line of fire between py..hold_y-1
                        blocked = False
                        for yy in range(py, hold_y):
                            if (hold_x, yy) in self.mushrooms_in_map:
                                blocked = True
                                break
                        if blocked:
                            continue

                        found_timing = True
                        best_t_hit = t_hit if best_t_hit is None else min(best_t_hit, t_hit)
                        break

                    if not found_timing:
                        continue

                    # Score: earlier hit is better; faster arrival is better; slight "advance" upwards.
                    score = 0.0
                    score -= est_steps * 120.0
                    score -= (best_t_hit or 999) * 60.0
                    score += (by - hold_y) * 20.0
                    # Prefer wall-based blocks (more stable than mushroom blocks).
                    if hold_dir == consts.Direction.WEST and hold_x == 0:
                        score += 80.0
                    if hold_dir == consts.Direction.EAST and hold_x == self.dim[0] - 1:
                        score += 80.0

                    if score > best_score:
                        best_score = score
                        best_goal = (hold_pos, hold_dir)

        return best_goal

    def _select_opening_spider_solution(
        self,
        blaster_pos: tuple[int, int],
        blaster_dir: consts.Direction,
        spider_pos: tuple[int, int],
    ) -> Optional[FiringSolution]:
        """Pick a spider solution optimized for timing (opening only).

        We evaluate predicted spider positions at time t (frames ahead), and score each
        firing solution by how well (time_to_preshot + shoot_frame + bullet_time) matches t.
        """
        bx, by = blaster_pos
        sx, sy = spider_pos

        horizon = max(1, int(self._spider_prediction_horizon))
        predicted = self._predict_spider_path_observed(horizon)
        if not predicted:
            predicted = [(sx, sy)]

        best: Optional[FiringSolution] = None
        best_score = float("-inf")

        shoot_frame_cost = 1  # pressing 'A' consumes a frame

        for t, (tx, ty) in enumerate(predicted, start=1):
            # Only shoot upwards
            if ty >= by:
                continue

            sols = self._enumerate_firing_solutions_for_targets(
                blaster_pos=blaster_pos,
                blaster_dir=blaster_dir,
                targets=[(tx, ty)],
                target_kind="spider",
            )

            for sol in sols:
                # Require hard safety and avoid shooting into immediate danger
                if not sol.safe_pre or not sol.safe_post:
                    continue
                if sol.post_in_danger:
                    continue

                bullet_time = max(0, by - ty)
                total_time = sol.est_time_to_pre_shot + shoot_frame_cost + bullet_time
                timing_error = abs(total_time - t)

                # Start from the normal score, then apply timing preference.
                score = sol.score
                score -= timing_error * 600.0

                # Prefer being "advanced" (upwards) but not at any cost.
                score += (by - sol.pre_shot_pos[1]) * 3.0

                # Slightly prefer shorter paths to avoid wasting opening frames.
                score -= sol.est_time_to_pre_shot * 5.0

                if score > best_score:
                    best_score = score
                    best = sol

        # If best lane is blocked, prefer clearing the blocker as a subgoal.
        if best is not None and (not best.line_of_fire_clear) and best.blocking_mushroom is not None:
            mush_solutions = self._enumerate_firing_solutions_for_targets(
                blaster_pos,
                blaster_dir,
                [best.blocking_mushroom],
                "mushroom",
            )
            if mush_solutions:
                return mush_solutions[0]

        return best

    def _estimate_steps_to_goal(self, blaster_pos: tuple[int, int], blaster_dir: consts.Direction,
                                goal_pos: tuple[int, int], goal_dir: consts.Direction) -> int:
        """Cheap estimate for scoring; we still compute exact A* for the chosen goal."""
        dist = abs(blaster_pos[0] - goal_pos[0]) + abs(blaster_pos[1] - goal_pos[1])
        # Turning the direction typically costs at least one move (often more)
        if blaster_dir != goal_dir:
            dist += 1
        return dist

    def _enumerate_firing_solutions_for_targets(
        self,
        blaster_pos: tuple[int, int],
        blaster_dir: consts.Direction,
        targets: Iterable[tuple[int, int]],
        target_kind: Literal["segment", "predicted", "mushroom", "spider", "flee"],
    ) -> list[FiringSolution]:
        bx, by = blaster_pos
        solutions: list[FiringSolution] = []

        for (tx, ty) in targets:
            # Only shoot upwards
            if ty >= by:
                continue

            # Safety rule: never shoot a centipede segment in the row immediately above the blaster.
            # Hitting/splitting on that row can create a new head that drops into the blaster next frame.
            # It is also unreliable because of the 'A' quirk (projectile advances before collision).
            suicidal_above_row = (target_kind in ("segment", "predicted") and ty == by - 1)

            firing_x = tx
            aim_y = ty
            post_move_pos = (firing_x, by)

            blocker = self._first_blocking_mushroom_in_column(firing_x, aim_y, by)
            # For centipede targets: any mushroom blocks the shot.
            # For mushroom targets: we WANT the first mushroom (the target itself) to be hit.
            if target_kind == "mushroom":
                line_clear = (blocker is None) or (blocker == (tx, ty))
                if blocker == (tx, ty):
                    blocker = None
            else:
                line_clear = blocker is None

            # Two pre-shot options: left-to-right or right-to-left
            candidates: list[tuple[tuple[int, int], consts.Direction]] = []
            if firing_x - 1 >= 0:
                candidates.append(((firing_x - 1, by), consts.Direction.EAST))
            if firing_x + 1 < self.dim[0]:
                candidates.append(((firing_x + 1, by), consts.Direction.WEST))

            for pre_pos, required_dir in candidates:
                safe_pre = self._is_hard_safe(pre_pos)
                safe_post = self._is_hard_safe(post_move_pos)
                pre_in_danger = pre_pos in self.dangerous_positions
                post_in_danger = post_move_pos in self.dangerous_positions

                can_shoot_now = (
                    pre_pos == blaster_pos
                    and blaster_dir == required_dir
                    and safe_post
                    and line_clear
                    and not suicidal_above_row
                )

                est_steps = self._estimate_steps_to_goal(blaster_pos, blaster_dir, pre_pos, required_dir)

                # Scoring: strongly prefer "can shoot now", otherwise prefer shorter, clear and safe shots.
                score = 0.0
                if can_shoot_now:
                    score += 10_000.0
                score -= est_steps * 20.0

                if suicidal_above_row:
                    score -= 50_000.0

                # Prefer lower targets (more urgent / more likely to hit soon)
                score += aim_y * 3.0

                # Prefer clear lanes; if blocked, still keep solution but penalize heavily
                if line_clear:
                    score += 250.0
                else:
                    score -= 600.0

                # Safety first: hard rejects get huge penalties (still enumerable for debugging)
                if not safe_pre:
                    score -= 20_000.0
                if not safe_post:
                    score -= 20_000.0

                # Soft avoid danger zones
                if pre_in_danger:
                    score -= 400.0
                if post_in_danger:
                    score -= 600.0

                # Predictions are slightly less reliable
                if target_kind == "predicted":
                    score -= 150.0

                # NPC scoring priority (spec: spider is very valuable)
                if target_kind == "spider":
                    score += 2_500.0
                elif target_kind == "flee":
                    score += 600.0

                solutions.append(
                    FiringSolution(
                        target_kind=target_kind,
                        target_pos=(tx, ty),
                        firing_column_x=firing_x,
                        aim_y=aim_y,
                        pre_shot_pos=pre_pos,
                        required_direction=required_dir,
                        post_move_pos=post_move_pos,
                        line_of_fire_clear=line_clear,
                        blocking_mushroom=blocker,
                        safe_pre=safe_pre,
                        safe_post=safe_post,
                        pre_in_danger=pre_in_danger,
                        post_in_danger=post_in_danger,
                        can_shoot_now=can_shoot_now,
                        est_time_to_pre_shot=est_steps,
                        score=score,
                    )
                )

        # Highest score first
        solutions.sort(key=lambda s: s.score, reverse=True)
        return solutions

    def _select_best_attack_solution(
        self,
        blaster_pos: tuple[int, int],
        blaster_dir: consts.Direction,
        centipedes_list: list[dict],
        spider_pos: Optional[tuple[int, int]] = None,
        flee_pos: Optional[tuple[int, int]] = None,
        allow_mushroom_clear: bool = True,
    ) -> Optional[FiringSolution]:
        """Select best firing solution; if blocked, returns a mushroom-clear solution for the first blocker."""
        if not centipedes_list:
            # Still allow targeting NPCs even with no centipedes (defensive)
            if spider_pos is None and flee_pos is None:
                return None

        # Collect segment targets (any segment) for better reliability than only head.
        segment_targets: list[tuple[int, int]] = []
        for cent in centipedes_list:
            for seg in cent.get('body', []):
                segment_targets.append((seg.x, seg.y))

        predicted_targets: list[tuple[int, int]] = []
        if self.prediction_enabled:
            for cent in centipedes_list:
                name = cent.get('name')
                if name in self.predicted_positions:
                    predicted_targets.extend(self.predicted_positions[name])

        solutions: list[FiringSolution] = []
        solutions.extend(self._enumerate_firing_solutions_for_targets(blaster_pos, blaster_dir, segment_targets, "segment"))
        solutions.extend(self._enumerate_firing_solutions_for_targets(blaster_pos, blaster_dir, predicted_targets, "predicted"))

        # NPC targets (optional)
        if spider_pos is not None:
            solutions.extend(self._enumerate_firing_solutions_for_targets(blaster_pos, blaster_dir, [spider_pos], "spider"))
        if flee_pos is not None:
            solutions.extend(self._enumerate_firing_solutions_for_targets(blaster_pos, blaster_dir, [flee_pos], "flee"))

        solutions.sort(key=lambda s: s.score, reverse=True)

        if not solutions:
            return None

        best = solutions[0]
        if not allow_mushroom_clear:
            # In spider/flee focus we do not spend shots clearing mushrooms.
            clear = [s for s in solutions if s.line_of_fire_clear]
            return clear[0] if clear else None

        if best.line_of_fire_clear:
            return best

        # Blocked: pick the first blocking mushroom in that lane as a "clear lane" subgoal.
        if best.blocking_mushroom is None:
            return best

        blocker = best.blocking_mushroom
        mush_solutions = self._enumerate_firing_solutions_for_targets(blaster_pos, blaster_dir, [blocker], "mushroom")
        return mush_solutions[0] if mush_solutions else best

    def _count_centipede_segments(self, centipedes_list: list[dict]) -> int:
        total = 0
        for c in centipedes_list:
            body = c.get('body', [])
            try:
                total += len(body)
            except Exception:
                continue
        return total

    def _update_attack_focus(self, centipede: Centipede) -> None:
        """Update attack focus phase based on remaining segments and NPC deaths.

        Note: We intentionally ignore the CENTIPEDE_FINISH phase. Once we reach FLEE,
        we stay in FLEE until TIMEOUT (frame 3600).
        """
        spider_now = getattr(centipede, "spider_pos", None) is not None
        flee_now = getattr(centipede, "flee_pos", None) is not None
        if spider_now:
            self._spider_seen_ever = True
        if flee_now:
            self._flee_seen_ever = True

        # Ignore endgame override / CENTIPEDE_FINISH.
        # If some older state sets it, treat it as CENTIPEDE.
        if self.attack_focus == "CENTIPEDE_FINISH":
            self.attack_focus = "CENTIPEDE"

        remaining_segments = self._count_centipede_segments(centipede.centipedes_list)
        remaining_centipedes = len(centipede.centipedes_list)

        # Phase transitions
        if self.attack_focus == "CENTIPEDE":
            if (
                remaining_segments > self._centipede_reduce_threshold_segments
                or remaining_centipedes > 3
            ):
                self.attack_focus = "CENTIPEDE"
                return
            # Reduced enough: switch to spider focus (even if spider hasn't spawned yet).
            self.attack_focus = "SPIDER"
            if self._spider_focus_started_turn is None:
                self._spider_focus_started_turn = centipede.turn
            return

        if self.attack_focus == "SPIDER":
            if spider_now:
                return
            # Only consider spider "dead" after we've seen it at least once.
            if self._spider_seen_ever:
                self.attack_focus = "FLEE"
            return

        # FLEE: stay here until TIMEOUT.
        return

    def get_emergency_move(self, centipede: Centipede) -> str:
        """Very fast fallback move when we're behind schedule.

        Updates only lightweight hazard structures and returns a single-step action that
        avoids immediate death (imminent hazards, NPC tiles, mushrooms, centipede tiles).
        """
        # Minimal state updates
        self.mushrooms_in_map = centipede.mushrooms
        blaster_pos = (centipede.blaster_pos.x, centipede.blaster_pos.y)
        self._current_blaster_pos = blaster_pos
        self._current_centipede_heads = [
            (c['head'].x, c['head'].y)
            for c in (centipede.centipedes_list or [])
            if c.get('head') is not None
        ]

        # Current centipede + NPC hazard maps (no prediction/intercept planning)
        try:
            self._update_dangerous_positions(centipede.centipedes_list)
        except Exception:
            self.dangerous_positions.clear()
            self.centipedes_segment_in_map.clear()

        try:
            self._update_npc_hazards_and_danger(centipede)
        except Exception:
            self.npc_hazards.clear()

        try:
            self._update_spider_track(centipede)
        except Exception:
            pass

        try:
            self._update_imminent_hazards(centipede)
        except Exception:
            self.imminent_hazards.clear()

        # Prefer moves that avoid hard hazards and imminent tiles.
        for a in ('w', 'a', 'd', 's'):
            nxt = self.result(blaster_pos, a)
            if nxt == blaster_pos:
                continue
            if nxt in self.mushrooms_in_map:
                continue
            if nxt in self.centipedes_segment_in_map:
                continue
            if nxt in self.npc_hazards:
                continue
            if nxt in self.hard_imminent_hazards:
                continue
            return self._finalize_action(a)

        # If we're currently on an imminent tile, try *any* move that exits imminent.
        if blaster_pos in self.imminent_hazards:
            for a in ('w', 'a', 'd', 's'):
                nxt = self.result(blaster_pos, a)
                if nxt == blaster_pos:
                    continue
                if nxt in self.mushrooms_in_map or nxt in self.centipedes_segment_in_map or nxt in self.npc_hazards:
                    continue
                if nxt in self.hard_imminent_hazards:
                    continue
                return self._finalize_action(a)

        # Otherwise, hold (domain will convert '' to a blocked move key).
        return self._finalize_action('')

    def get_next_move(self, centipede: Centipede) -> str:
        """Main policy: decide between ATTACK, ESCAPE and REPOSITION."""
        
        # Update game state
        self.mushrooms_in_map = centipede.mushrooms
        
        # Remove destroyed mushrooms from tracking
        destroyed_mushrooms = set(self.mushroom_hits.keys()) - self.mushrooms_in_map
        for mush_pos in destroyed_mushrooms:
            logger.info(f"  Mushroom at {mush_pos} was DESTROYED!")
            del self.mushroom_hits[mush_pos]
            if self.clearing_mushroom_target == mush_pos:
                self.clearing_mushroom_target = None
        
        blaster_pos = (centipede.blaster_pos.x, centipede.blaster_pos.y)

        # Cache for global 'A' safety checks inside _finalize_action
        self._current_blaster_pos = blaster_pos

        # Cache current heads for targeted bottom-row safety checks
        self._current_centipede_heads = [
            (c['head'].x, c['head'].y)
            for c in (centipede.centipedes_list or [])
            if c.get('head') is not None
        ]

        # Update attack focus phase (independent of defense)
        self._update_attack_focus(centipede)
        
        # Update movement predictions
        self._update_predictions(centipede.centipedes_list)
        
        # Update danger map (includes predictions)
        self._update_dangerous_positions(centipede.centipedes_list)

        # Update spider/flee hard hazards + add conservative danger around them
        self._update_npc_hazards_and_danger(centipede)

        # Track spider observations (used for safety + optional opening prediction)
        self._update_spider_track(centipede)

        # Update next-frame lethal tiles (hard avoid)
        self._update_imminent_hazards(centipede)

        # Cache future danger sets for escape lookahead (per turn)
        if self._future_danger_turn != centipede.turn:
            try:
                self._future_danger = self._compute_future_danger(centipede, horizon=int(self._escape_lookahead))
            except Exception:
                self._future_danger = []
            self._future_danger_turn = centipede.turn
        
        # Emergency: blaster is on a centipede tile (should not happen)
        if blaster_pos in self.centipedes_segment_in_map:
            logger.error(f"Turn {centipede.turn}: EMERGENCY! Blaster at centipede position!")
            # Try to escape immediately
            for emergency_action in ['s', 'd', 'a', 'w']:
                emergency_pos = self.result(blaster_pos, emergency_action)
                if (emergency_pos != blaster_pos and 
                    emergency_pos not in self.centipedes_segment_in_map and
                    emergency_pos not in self.mushrooms_in_map):
                    logger.warning(f"  -> EMERGENCY ESCAPE: {emergency_action}")
                    return self._finalize_action(emergency_action)
            logger.critical("  -> NO ESCAPE POSSIBLE! Agent will likely die.")
            return self._finalize_action('')

        # Emergency: blaster is on a spider/flee tile (should not happen)
        if blaster_pos in self.npc_hazards:
            logger.error(f"Turn {centipede.turn}: EMERGENCY! Blaster at npc hazard position!")
            for emergency_action in ['s', 'd', 'a', 'w']:
                emergency_pos = self.result(blaster_pos, emergency_action)
                if (
                    emergency_pos != blaster_pos
                    and emergency_pos not in self.centipedes_segment_in_map
                    and emergency_pos not in self.mushrooms_in_map
                    and emergency_pos not in self.npc_hazards
                ):
                    logger.warning(f"  -> EMERGENCY NPC ESCAPE: {emergency_action}")
                    return self._finalize_action(emergency_action)
            logger.critical("  -> NO NPC ESCAPE POSSIBLE! Agent will likely die.")
            return self._finalize_action('')
        
        # Agent stuck detection
        if self.last_blaster_pos == blaster_pos:
            self.stuck_counter += 1
            if self.stuck_counter > 5:
                # Force a random movement to break out
                self.multi_objectives.clear_goals()
                self.stuck_counter = 0
        else:
            self.stuck_counter = 0
        self.last_blaster_pos = blaster_pos

        # Decay escape hysteresis lock
        if self._escape_lock_frames > 0:
            self._escape_lock_frames -= 1
        
        # Decide strategy based on danger assessment
        self.current_strategy = self._assess_danger_level(blaster_pos, centipede.centipedes_list)

        # In SPIDER/FLEE focus, do not "reposition to combat" based on centipedes.
        # That can look like chasing centipedes while we should be focusing NPCs.
        if self.attack_focus in ("SPIDER", "FLEE") and self.current_strategy == "REPOSITION":
            logger.info(f"Turn {centipede.turn}: Focus={self.attack_focus} overrides REPOSITION -> ATTACK")
            self.current_strategy = "ATTACK"
        
        # Debug: show predictions
        if self.prediction_enabled and self.predicted_positions:
            for name, predictions in self.predicted_positions.items():
                logger.debug(f"  -> Centipede '{name}' predicted path: {predictions[:2]}...") # mostra apenas 2 primeiras
        
        logger.info(
            f"Turn {centipede.turn}: Strategy = {self.current_strategy}, Focus = {self.attack_focus}, Blaster at {blaster_pos}"
        )
        
        # ESCAPE mode
        if self.current_strategy == "ESCAPE":
            self.multi_objectives.clear_goals()
            # Drop any cached timed-shot objectives; defense must dominate.
            self._spider_timed_goal = None
            self._spider_timed_fire_turn = None
            self._flee_timed_goal = None
            self._flee_timed_fire_turn = None
            # Opportunistic safe shot in ESCAPE: if we can shoot now and the post-move tile is also safe,
            # it's often better to take the shot (especially against trapped centipedes) than to keep running.
            esc_centipedes = centipede.centipedes_list if self.attack_focus == "CENTIPEDE" else []
            esc_spider = (
                (centipede.spider_pos.x, centipede.spider_pos.y)
                if self.attack_focus == "SPIDER" and getattr(centipede, "spider_pos", None)
                else None
            )
            esc_flee = (
                (centipede.flee_pos.x, centipede.flee_pos.y)
                if self.attack_focus == "FLEE" and getattr(centipede, "flee_pos", None)
                else None
            )

            esc_solution = self._select_best_attack_solution(
                blaster_pos,
                self.blaster_direction,
                esc_centipedes,
                spider_pos=esc_spider,
                flee_pos=esc_flee,
            )
            panic_close_segment = False
            suicidal_above_row = False
            if esc_solution is not None and esc_solution.target_pos is not None:
                # When a centipede segment is very close above (often 2 tiles), the blast can
                # hit immediately (spawn at y-1 then moves to y-2 in the same frame).
                # In that case, being briefly in a "danger" buffer is acceptable and
                # prevents the agent from wasting frames "escaping" sideways.
                by = blaster_pos[1]
                ty = esc_solution.target_pos[1]
                suicidal_above_row = (
                    esc_solution.target_kind in ("segment", "predicted")
                    and ty == by - 1
                )
                panic_close_segment = (
                    esc_solution.target_kind == "segment"
                    and esc_solution.line_of_fire_clear
                    and (by - ty) == 2
                )

            if (
                esc_solution is not None
                and esc_solution.can_shoot_now
                and esc_solution.safe_post
                and not suicidal_above_row
                and (panic_close_segment or not esc_solution.post_in_danger)
            ):
                logger.info(
                    f"  -> ESCAPE: opportunistic shot ({esc_solution.target_kind} at {esc_solution.target_pos})"
                )
                return self._finalize_action('A')
            if esc_solution is not None and esc_solution.can_shoot_now and suicidal_above_row:
                logger.info(
                    f"  -> ESCAPE: skipping shot (suicidal_above_row target={esc_solution.target_kind} {esc_solution.target_pos})"
                )
            if esc_solution is not None and esc_solution.can_shoot_now and esc_solution.safe_post and esc_solution.post_in_danger and not panic_close_segment:
                logger.debug(
                    f"  -> ESCAPE: skipping shot due to post_in_danger (target={esc_solution.target_kind} {esc_solution.target_pos})"
                )
            action = self._execute_escape_strategy(blaster_pos)
            logger.info(f"  -> ESCAPING: {action}")
            return self._finalize_action(action)
        
        # REPOSITION mode
        if self.current_strategy == "REPOSITION":
            self.multi_objectives.clear_goals()
            action = self._execute_reposition_strategy(blaster_pos)
            logger.info(f"  -> REPOSITIONING: {action}")
            return self._finalize_action(action)
        
        # ATTACK mode
        # If there are no centipedes and no NPCs, do nothing.
        if not centipede.centipedes_list and getattr(centipede, "spider_pos", None) is None and getattr(centipede, "flee_pos", None) is None:
            logger.debug(f"Turn {centipede.turn}: No targets - idle")
            return self._finalize_action('')

        # If all centipedes appear stuck, proactively clear mushrooms around their heads
        # to avoid endless lateral oscillation.
        forced_solution: Optional[FiringSolution] = None
        if self.current_strategy == "ATTACK" and self.attack_focus == "CENTIPEDE" and centipede.centipedes_list:
            stuck_centipedes = [c for c in centipede.centipedes_list if self._is_centipede_stuck(c)]
            if stuck_centipedes and len(stuck_centipedes) == len(centipede.centipedes_list):
                mush_targets: list[tuple[int, int]] = []
                for c in stuck_centipedes:
                    head = c.get('head')
                    if head is None:
                        continue
                    hx, hy = head.x, head.y
                    for dx in (-1, 1, -2, 2):
                        mx = hx + dx
                        my = hy
                        pos = (mx, my)
                        if 0 <= mx < self.dim[0] and pos in self.mushrooms_in_map and my < blaster_pos[1]:
                            mush_targets.append(pos)

                if mush_targets:
                    sols = self._enumerate_firing_solutions_for_targets(
                        blaster_pos=blaster_pos,
                        blaster_dir=self.blaster_direction,
                        targets=mush_targets,
                        target_kind="mushroom",
                    )
                    # Prefer safe options (still keep ordering by score).
                    safe_sols = [s for s in sols if s.safe_pre and s.safe_post]
                    forced_solution = safe_sols[0] if safe_sols else (sols[0] if sols else None)

                if forced_solution is None:
                    # Fall back to the legacy stuck handler (may shoot/approach).
                    action = self._handle_stuck_centipede(blaster_pos, stuck_centipedes[0])
                    logger.info(f"  -> STUCK MODE: {action}")
                    return self._finalize_action(action)

        # SPIDER focus: timing-based intercept from bottom row.
        # Move to a column the spider will cross, wait safely (SOUTH blocked), then shoot on timing.
        if (
            self.current_strategy == "ATTACK"
            and self.attack_focus == "SPIDER"
            and getattr(centipede, "spider_pos", None) is not None
        ):
            # Reuse cached timed plan when available.
            if self._spider_timed_goal is not None and self._spider_timed_fire_turn is not None:
                goal_pos, goal_dir = self._spider_timed_goal
                fire_turn = self._spider_timed_fire_turn

                goal_key = ("spider_bottom_wait", goal_pos, goal_dir)
                if self._attack_goal_key != goal_key:
                    self.plan = []
                    self._attack_goal_key = goal_key

                if blaster_pos == goal_pos and self.blaster_direction == goal_dir:
                    if centipede.turn >= fire_turn:
                        logger.info("  -> SPIDER: bottom-wait timed shot")
                        # After shooting, drop cache and re-evaluate next frame.
                        self._spider_timed_goal = None
                        self._spider_timed_fire_turn = None
                        return self._finalize_action('A')
                    return self._finalize_action('')

                if self.plan:
                    return self._finalize_action(self.plan.pop(0))

                start_state = (blaster_pos[0], blaster_pos[1], self.blaster_direction)
                goal_state = (goal_pos[0], goal_pos[1], goal_dir)
                ts_now = getattr(centipede, "timestamp", None) or time.time()
                plan = self.create_problem(start_state, goal_state, ts_now)
                if plan and len(plan) > 0:
                    self.plan = plan.copy()
                    return self._finalize_action(self.plan.pop(0))

                # If we can't plan to the cached goal anymore, drop cache.
                self._spider_timed_goal = None
                self._spider_timed_fire_turn = None
            else:
                intercept = self._select_spider_intercept_bottom_wait(blaster_pos, self.blaster_direction)
                if intercept is not None:
                    goal_pos, goal_dir, dt_fire = intercept
                    self._spider_timed_goal = (goal_pos, goal_dir)
                    self._spider_timed_fire_turn = centipede.turn + dt_fire
                    # Continue in cached branch next frame.

        # FLEE focus: stay centered when there is no flee, or when intercept is infeasible.
        # If feasible, go to flee's column on bottom row, wait safely, and shoot on timing.
        if self.current_strategy == "ATTACK" and self.attack_focus == "FLEE":
            width, height = self.dim
            bottom_y = height - 1
            center_x = width // 2
            center_goal_pos = (center_x, bottom_y)
            center_goal_dir = consts.Direction.SOUTH

            def _go_center_bottom_wait() -> str:
                goal_key = ("flee_center_hold", center_goal_pos, center_goal_dir)
                if self._attack_goal_key != goal_key:
                    self.plan = []
                    self._attack_goal_key = goal_key

                if blaster_pos == center_goal_pos and self.blaster_direction == center_goal_dir:
                    return self._finalize_action('')

                if self.plan:
                    return self._finalize_action(self.plan.pop(0))

                start_state = (blaster_pos[0], blaster_pos[1], self.blaster_direction)
                goal_state = (center_goal_pos[0], center_goal_pos[1], center_goal_dir)
                ts_now = getattr(centipede, "timestamp", None) or time.time()
                plan = self.create_problem(start_state, goal_state, ts_now)
                if plan and len(plan) > 0:
                    self.plan = plan.copy()
                    return self._finalize_action(self.plan.pop(0))

                # If A* can't find a path (time/limit/blocked), still take a cheap safe step toward center.
                step = self._safe_move_towards(blaster_pos, center_goal_pos)
                return self._finalize_action(step)

            flee_pos = (centipede.flee_pos.x, centipede.flee_pos.y) if getattr(centipede, "flee_pos", None) else None
            if flee_pos is None:
                logger.info("  -> FLEE: no flee present; holding center")
                self._flee_timed_goal = None
                self._flee_timed_fire_turn = None
                return _go_center_bottom_wait()

            # Reuse cached timed plan when available.
            if self._flee_timed_goal is None or self._flee_timed_fire_turn is None:
                intercept = self._select_flee_intercept_bottom_wait(blaster_pos, self.blaster_direction, flee_pos)
                if intercept is None:
                    logger.info("  -> FLEE: cannot reach intercept in time; re-centering")
                    self._flee_timed_goal = None
                    self._flee_timed_fire_turn = None
                    return _go_center_bottom_wait()

                goal_pos, goal_dir, dt_fire = intercept
                self._flee_timed_goal = (goal_pos, goal_dir)
                self._flee_timed_fire_turn = centipede.turn + dt_fire

            goal_pos, goal_dir = self._flee_timed_goal
            fire_turn = self._flee_timed_fire_turn

            goal_key = ("flee_bottom_wait", goal_pos, goal_dir)
            if self._attack_goal_key != goal_key:
                self.plan = []
                self._attack_goal_key = goal_key

            if blaster_pos == goal_pos and self.blaster_direction == goal_dir:
                if centipede.turn >= fire_turn:
                    logger.info("  -> FLEE: bottom-wait timed shot")
                    self._flee_timed_goal = None
                    self._flee_timed_fire_turn = None
                    return self._finalize_action('A')
                return self._finalize_action('')

            if self.plan:
                return self._finalize_action(self.plan.pop(0))

            start_state = (blaster_pos[0], blaster_pos[1], self.blaster_direction)
            goal_state = (goal_pos[0], goal_pos[1], goal_dir)
            ts_now = getattr(centipede, "timestamp", None) or time.time()
            plan = self.create_problem(start_state, goal_state, ts_now)
            if plan and len(plan) > 0:
                self.plan = plan.copy()
                return self._finalize_action(self.plan.pop(0))

            # If planning fails, do not chase—fallback to center.
            self._flee_timed_goal = None
            self._flee_timed_fire_turn = None
            return _go_center_bottom_wait()

        # Opening (SPIDER focus): prefer a stationary hold + timed shot against the spider (do not chase).
        if (
            self._opening_spider_enabled
            and self.current_strategy == "ATTACK"
            and self.attack_focus == "SPIDER"
            and self._spider_focus_started_turn is not None
            and (centipede.turn - self._spider_focus_started_turn) <= self._opening_spider_focus_frames
            and getattr(centipede, "spider_pos", None) is not None
        ):
            spider_pos = (centipede.spider_pos.x, centipede.spider_pos.y)
            hold_goal = self._select_opening_spider_hold_goal(blaster_pos, self.blaster_direction, spider_pos)

            if hold_goal is not None:
                (goal_pos, goal_dir) = hold_goal
                goal_key = ("opening_spider_hold", goal_pos, goal_dir)
                if self._attack_goal_key != goal_key:
                    self.plan = []
                    self._attack_goal_key = goal_key

                # If we are already in the hold state, either fire (if timing says it will hit) or wait ('').
                if blaster_pos == goal_pos and self.blaster_direction == goal_dir:
                    spider_pred = self._predict_spider_path_observed(self._spider_prediction_horizon)
                    if self._opening_can_hit_spider_if_press_A_next_frame(blaster_pos, self.blaster_direction, spider_pred):
                        logger.info("  -> OPENING HOLD: timed shot on spider")
                        return self._finalize_action('A')

                    # Only wait if we won't drift.
                    if self._is_blocked_step(blaster_pos, self.blaster_direction):
                        return self._finalize_action('')

                    # If we would drift, fall back to normal attack selection.
                else:
                    # Move to the hold state with A* (movement-only)
                    start_state = (blaster_pos[0], blaster_pos[1], self.blaster_direction)
                    goal_state = (goal_pos[0], goal_pos[1], goal_dir)

                    if self.plan:
                        action = self.plan.pop(0)
                        return self._finalize_action(action)

                    ts_now = getattr(centipede, "timestamp", None) or time.time()
                    plan = self.create_problem(start_state, goal_state, ts_now)
                    if plan and len(plan) > 0:
                        self.plan = plan.copy()
                        action = self.plan.pop(0)
                        return self._finalize_action(action)

                    # If planning fails, don't chase: just continue with normal logic.

        solution: Optional[FiringSolution] = forced_solution

        # Opening (SPIDER focus): prioritize spider intercept early
        if (
            self._opening_spider_enabled
            and self.attack_focus == "SPIDER"
            and self._spider_focus_started_turn is not None
            and (centipede.turn - self._spider_focus_started_turn) <= self._opening_spider_focus_frames
            and getattr(centipede, "spider_pos", None) is not None
        ):
            spider_pos = (centipede.spider_pos.x, centipede.spider_pos.y)
            opening_sol = self._select_opening_spider_solution(blaster_pos, self.blaster_direction, spider_pos)
            if opening_sol is not None:
                solution = opening_sol
                logger.info(f"  -> OPENING: focusing spider ({solution.target_kind} at {solution.target_pos})")

        if solution is None:
            if self.attack_focus == "CENTIPEDE":
                # Centipede-only focus
                solution = self._select_best_attack_solution(
                    blaster_pos,
                    self.blaster_direction,
                    centipede.centipedes_list,
                    spider_pos=None,
                    flee_pos=None,
                    allow_mushroom_clear=True,
                )
            elif self.attack_focus == "SPIDER":
                # Spider-only focus (no centipede targets, no mushroom clearing)
                spider_pos = (centipede.spider_pos.x, centipede.spider_pos.y) if getattr(centipede, "spider_pos", None) else None
                solution = self._select_best_attack_solution(
                    blaster_pos,
                    self.blaster_direction,
                    [],
                    spider_pos=spider_pos,
                    flee_pos=None,
                    allow_mushroom_clear=False,
                )
            else:  # FLEE
                flee_pos = (centipede.flee_pos.x, centipede.flee_pos.y) if getattr(centipede, "flee_pos", None) else None
                solution = self._select_best_attack_solution(
                    blaster_pos,
                    self.blaster_direction,
                    [],
                    spider_pos=None,
                    flee_pos=flee_pos,
                    allow_mushroom_clear=False,
                )
        if solution is None:
            logger.debug(f"  -> No firing solution available (likely targets at/below blaster); repositioning to regain shots")
            # If we can't shoot anything (e.g., centipedes are below us), move toward combat zone safely.
            action = self._execute_reposition_strategy(blaster_pos)
            return self._finalize_action(action)
        
        # If goal changed, drop any existing plan
        goal_key = (solution.target_kind, solution.target_pos, solution.pre_shot_pos, solution.required_direction)
        if self._attack_goal_key != goal_key:
            self.plan = []
            self._attack_goal_key = goal_key

        # If we can shoot from the pre-shot position with correct direction and a clear lane: fire now.
        if solution.can_shoot_now:
            logger.info(f"  -> ATTACK: firing solution ready now ({solution.target_kind} at {solution.target_pos})")
            action = 'A'
            # Mushroom hit tracking (approximate correct origin after moving on 'A')
            shot_origin = self._simulate_shot_origin_after_A(blaster_pos, self.blaster_direction)
            sx, sy = shot_origin
            for y in range(0, sy):
                mush_pos = (sx, y)
                if mush_pos in self.mushrooms_in_map:
                    self.mushroom_hits[mush_pos] = self.mushroom_hits.get(mush_pos, 0) + 1
                    hits = self.mushroom_hits[mush_pos]
                    logger.info(f"  -> HIT mushroom at {mush_pos} ({hits}/4 hits)")
                    break
            return self._finalize_action(action)

        # Plan to the pre-shot position (with direction context)
        start_state = (blaster_pos[0], blaster_pos[1], self.blaster_direction)
        goal_state = (solution.pre_shot_pos[0], solution.pre_shot_pos[1], solution.required_direction)

        # Follow existing plan if valid
        if self.plan:
            action = self.plan.pop(0)
            logger.info(f"  -> Following A* plan: {action} (remaining: {len(self.plan)})")
            if action in ['w', 'a', 's', 'd']:
                next_state = self.result(start_state, action)
                future_pos = (next_state[0], next_state[1])
                if future_pos in self.centipedes_segment_in_map or future_pos in self.mushrooms_in_map:
                    logger.warning(f"  -> Plan action '{action}' is now unsafe, recalculating...")
                    self.plan = []
                else:
                    return self._finalize_action(action)
            else:
                # Should not happen (movement-only planning), but handle defensively
                self.plan = []
        
        # ATTACK mushroom-clear bookkeeping
        if solution.target_kind == "mushroom":
            self.clearing_mushroom_target = solution.target_pos

        logger.debug(f"  -> Calculating A* plan to pre-shot {solution.pre_shot_pos} with dir={solution.required_direction}")
        ts_now = getattr(centipede, "timestamp", None) or time.time()
        plan = self.create_problem(
            start_state,
            goal_state,
            ts_now
        )

        if plan and len(plan) > 0:
            self.plan = plan.copy()
            self.backup_plan = plan.copy()
            action = self.plan.pop(0)
            logger.info(f"  -> A* SUCCESS: {action} (plan length: {len(plan)})")
        else:
            logger.warning(f"  -> A* FAILED to reach pre-shot, falling back to safe move")
            action = self._safe_move_towards(blaster_pos, solution.pre_shot_pos)
        
        # Final safety check before executing a movement action
        if action in ['w', 'a', 's', 'd']:
            future_pos = self.result(blaster_pos, action)
            if future_pos in self.centipedes_segment_in_map:
                logger.warning(f"  -> SAFETY OVERRIDE: action '{action}' would hit centipede!")
                # Override with ESCAPE
                action = self._execute_escape_strategy(blaster_pos)
                logger.info(f"  -> Changing to ESCAPE: {action}")
        
        logger.info(f"  -> ATTACKING ({solution.target_kind} at {solution.target_pos}) via pre-shot {solution.pre_shot_pos}: {action}")
        return self._finalize_action(action)
