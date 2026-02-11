from collections import namedtuple
import datetime

# Lightweight coordinate type
Point = namedtuple('Point', ['x', 'y'])

class Centipede:
    """
    Holds the current game state parsed from the websocket JSON payload.
    """
    def __init__(self):
        self.turn = 0
        self.score = 0
        self.timestamp = None  # float seconds since epoch (best-effort)
        self.blaster_pos = Point(0, 0)
        self.centipedes_list = [] 
        self.mushrooms = set()
        self.blasts = []  # list[Point]
        self.spider_pos = None  # Point | None
        self.flee_pos = None  # Point | None (accepts server key "flee" or "flea")
        # Default dimensions (the domain uses the map_info values).
        self.dimensions = (40, 24)

    def update(self, state_dict):
        """
        Update state from the websocket JSON message.
        """
        self.turn = state_dict.get('step', 0)
        self.score = state_dict.get('score', 0)

        # Frame timestamp (server attaches ts per-player; best-effort parsing)
        self.timestamp = None
        ts = state_dict.get("ts")
        if isinstance(ts, str):
            try:
                self.timestamp = datetime.datetime.fromisoformat(ts).timestamp()
            except Exception:
                self.timestamp = None
        
        # Bug blaster
        bb_data = state_dict.get('bug_blaster', {})
        if bb_data:
            self.blaster_pos = Point(*bb_data.get('pos', [0, 0]))

        # Centipedes
        self.centipedes_list = []
        raw_centipedes = state_dict.get('centipedes', [])
        for c in raw_centipedes:
            body_coords = c.get('body', [])
            body_points = [Point(p[0], p[1]) for p in body_coords]
            
            if body_points:
                self.centipedes_list.append({
                    'name': c.get('name'),
                    'body': body_points,
                    'direction': c.get('direction'),
                    # Head is the last segment (convenience field).
                    'head': body_points[-1],
                })

        # Mushrooms
        self.mushrooms = set()
        raw_mushrooms = state_dict.get('mushrooms', [])
        for m in raw_mushrooms:
            self.mushrooms.add(tuple(m.get('pos')))

        # Blasts (optional)
        self.blasts = []
        for b in state_dict.get("blasts", []) or []:
            try:
                self.blasts.append(Point(b[0], b[1]))
            except Exception:
                continue

        # NPCs (optional)
        self.spider_pos = None
        spider_data = state_dict.get("spider")
        if isinstance(spider_data, dict):
            alive = spider_data.get("alive", True)
            pos = spider_data.get("pos")
            if alive and isinstance(pos, (list, tuple)) and len(pos) == 2:
                self.spider_pos = Point(pos[0], pos[1])

        self.flee_pos = None
        flee_data = state_dict.get("flee")
        flea_data = state_dict.get("flea")
        npc_data = flee_data if isinstance(flee_data, dict) else flea_data
        if isinstance(npc_data, dict):
            alive = npc_data.get("alive", True)
            pos = npc_data.get("pos")
            if alive and isinstance(pos, (list, tuple)) and len(pos) == 2:
                self.flee_pos = Point(pos[0], pos[1])

    def get_lowest_centipede_head(self):
        """
        Return the centipede whose head is lowest (highest Y).
        This is typically the most immediate threat.
        """
        lowest_y = -1
        target = None
        
        for c in self.centipedes_list:
            head = c['head']
            if head.y > lowest_y:
                lowest_y = head.y
                target = c
                
        return target