import math
import copy
from consts import Direction, MUSHROOM_SPAWN_RATE, MAP_SIZE
from mapa import BOTTOM_ROWS

def predict_centipede_path(centipede, mapa, mushrooms, frames=50):
    """
    Prevê o caminho da centopeia para os próximos 'frames'.
    Retorna uma lista de tuplos (x, y) representando a trajetória da cabeça.
    """
    path = []
    
    # Se a centopeia não existe, retorna lista vazia
    if not centipede or not getattr(centipede, 'alive', True): # Modified to handle missing alive attr
        return path

    # 1. Criar uma cópia superficial do estado necessário para simulação
    # Não podemos usar deepcopy no objeto todo se ele tiver referências complexas,
    # mas aqui precisamos das variáveis de controle de movimento.
    
    # Estado inicial simulado
    curr_head = tuple(centipede.head)
    curr_dir = getattr(centipede, 'head_direction', centipede.direction)
    
    # Fix for type mismatch: Viewer uses Directions(Enum) with tuples, Map uses Direction(IntEnum)
    if not isinstance(curr_dir, int):
        # Try to get value if it's an enum
        val = getattr(curr_dir, 'value', curr_dir)
        if isinstance(val, tuple):
             if val == (0, -1): curr_dir = Direction.NORTH
             elif val == (1, 0): curr_dir = Direction.EAST
             elif val == (0, 1): curr_dir = Direction.SOUTH
             elif val == (-1, 0): curr_dir = Direction.WEST

    move_dir = getattr(centipede, 'move_dir', 1) # Default to 1 if missing
    waiting_vert = getattr(centipede, 'waiting_to_move_vertically', False) # Default to False
    
    # Criamos um conjunto de posições de cogumelos para pesquisa rápida (O(1))
    # Nota: Assumimos que os cogumelos não mudam durante a previsão (simplificação)
    # Ensure pos is a tuple to be hashable
    mushroom_set = {tuple(m.pos) for m in mushrooms if m.exists()}

    # Simulação frame a frame
    for _ in range(frames):
        # Lógica copiada/adaptada de Centipede.move() em game.py
        
        # Calcular nova posição teórica
        new_pos = mapa.calc_pos(curr_head, curr_dir, traverse=False)
        
        # Ensure new_pos is a tuple for set lookup
        if isinstance(new_pos, list):
            new_pos = tuple(new_pos)

        # Colisão com cogumelos
        if new_pos in mushroom_set:
            new_pos = curr_head

        # Colisão com paredes ou obstáculo (não moveu)
        if new_pos == curr_head:
            # Lógica de mudança de linha
            if curr_head[1] == 0:
                move_dir = 1
            elif curr_head[1] >= (mapa.size[1] - 1):
                move_dir = -1
            
            new_pos_vert = (curr_head[0], curr_head[1] + move_dir)
            
            # Verificar se consegue mover verticalmente
            if (0 <= new_pos_vert[1] < mapa.size[1]) and (new_pos_vert not in mushroom_set):
                new_pos = new_pos_vert
                waiting_vert = False
            else:
                new_pos = curr_head
                waiting_vert = True
            
            # Inverter direção horizontal
            curr_dir = Direction.EAST if curr_dir == Direction.WEST else Direction.WEST
        
        # Resolução de espera vertical (debt resolution)
        if waiting_vert:
             new_pos_vert = (curr_head[0], curr_head[1] + move_dir)
             if (0 <= new_pos_vert[1] < mapa.size[1]) and (new_pos_vert not in mushroom_set):
                 new_pos = new_pos_vert
                 waiting_vert = False

        # Atualizar cabeça e guardar no caminho
        curr_head = new_pos
        path.append(curr_head)

    return path

def predict_spider_path(spider, mapa, frames=50):
    """
    Prevê o caminho da aranha.
    Retorna uma lista de tuplos (x, y).
    """
    path = []
    if not spider or not spider.exists():
        return path

    # Copiar estado interno
    sim_t = spider._t
    sim_pos = spider._pos
    sim_vx = spider._vx
    sim_freq = spider._frequency
    origin_y = spider._origin_y # Este valor é fixo na criação da aranha

    for _ in range(frames):
        # Lógica de Spider.move()
        sim_t += sim_freq
        
        # Movimento Horizontal
        new_x = sim_pos[0] + sim_vx
        
        # Ricochete
        if new_x < 0:
            new_x = 0
            sim_vx *= -1
        elif new_x > mapa.size[0] - 1:
            new_x = mapa.size[0] - 1
            sim_vx *= -1
            
        # Movimento Vertical (Sinusoidal)
        sin_offset = math.sin(sim_t) * (mapa.size[1] // 2)
        new_y = int(round(origin_y + sin_offset))
        new_y = max(0, min(mapa.size[1] - 1, new_y))
        
        sim_pos = (new_x, new_y)
        path.append(sim_pos)
        
    return path

def predict_flee_spawn_zone(mapa, current_step, flee_exists):
    """
    Identifica as zonas prováveis de spawn da Pulga.
    Retorna uma lista de Rects ou Tuplos (x, y) e um booleano indicando se o spawn é iminente.
    """
    spawn_zones = []
    
    # Regra de Tempo: Spawn acontece a cada MUSHROOM_SPAWN_RATE frames
    # e apenas se não existir já uma pulga.
    # Prevemos se vai acontecer no próximo frame ou se já devia ter acontecido
    steps_until_spawn = MUSHROOM_SPAWN_RATE - (current_step % MUSHROOM_SPAWN_RATE)
    spawn_imminent = (steps_until_spawn == 1 or steps_until_spawn == MUSHROOM_SPAWN_RATE) and not flee_exists

    if not spawn_imminent:
        return [], False

    # Regras de Espaço (baseadas em mapa.py):
    # 1. Não nas 5 linhas de baixo (BOTTOM_ROWS)
    # 2. Apenas em Espaço Vazio (Tiles.PASSAGE) - embora o código de spawn force a criação,
    #    ele procura posições.
    
    limit_y = mapa.size[1] - BOTTOM_ROWS
    
    for x in range(mapa.size[0]):
        for y in range(limit_y):
            # A pulga nasce em qualquer coluna, mas limitada em Y.
            # O código original usa random.randint, logo é uma distribuição uniforme.
            # Adicionamos toda a área válida acima da zona segura.
            spawn_zones.append((x, y))
            
    return spawn_zones, True

def predict_best_shot(bug_blaster, centipede_path, mushrooms, mapa, max_frames=50, current_cooldown=0):
    """
    Encontra a melhor ação (mover + disparar) para acertar na cabeça da centopeia o mais rápido possível.
    Retorna um dicionário com os detalhes da ação ou None se não houver solução.
    """
    if not bug_blaster or not bug_blaster.exists() or not centipede_path:
        return None

    start_pos = tuple(bug_blaster.pos)
    mushroom_set = {tuple(m.pos) for m in mushrooms if m.exists()}
    width, height = mapa.size

    # 1. BFS para encontrar posições alcançáveis e tempo mínimo
    # visited[pos] = (min_frames, path)
    visited = {}
    queue = [(start_pos, 0, [start_pos])] # (pos, time, path)
    visited[start_pos] = (0, [start_pos])
    
    # Para otimizar, podemos parar o BFS se o tempo exceder max_frames
    # Mas como precisamos de verificar interseções com o caminho da centopeia que vai até max_frames,
    # e o tiro também leva tempo, o movimento deve ser menor que max_frames.
    
    # Limit BFS depth to avoid exploring too far when we need to shoot soon
    bfs_limit = max_frames 

    while queue:
        curr_pos, curr_time, curr_path = queue.pop(0)
        
        if curr_time >= bfs_limit:
            continue

        x, y = curr_pos
        # Movimentos possíveis: Cima, Baixo, Esquerda, Direita
        neighbors = [
            (x, y - 1), (x, y + 1), (x - 1, y), (x + 1, y)
        ]

        for nx, ny in neighbors:
            if 0 <= nx < width and (height - BOTTOM_ROWS) <= ny < height:
                if (nx, ny) not in mushroom_set:
                    if (nx, ny) not in visited: # BFS garante caminho mais curto em frames
                        new_path = curr_path + [(nx, ny)]
                        visited[(nx, ny)] = (curr_time + 1, new_path)
                        queue.append(((nx, ny), curr_time + 1, new_path))

    # 2. Verificar interseções com o caminho da centopeia
    best_solution = None
    min_total_frames = float('inf')

    # Iterar sobre o caminho da centopeia (target_t é o tempo absoluto desde agora)
    for i, cent_pos in enumerate(centipede_path):
        target_t = i + 1
        cx, cy = cent_pos
        
        if target_t >= min_total_frames:
            break

        # Iterar sobre possíveis posições de disparo na coluna cx
        for by in range(cy + 1, height):
            shoot_pos = (cx, by)
            
            if shoot_pos in visited:
                move_time, path = visited[shoot_pos]
                bullet_time = by - cy # 1 tile/frame
                
                required_shoot_time = target_t - bullet_time
                
                # Check cooldown constraint
                if required_shoot_time < current_cooldown:
                    continue

                # Se conseguimos chegar à posição de disparo antes ou no momento necessário
                if move_time <= required_shoot_time:
                    wait_frames = required_shoot_time - move_time
                    
                    # Constraint: Se for necessário mover, deve haver pelo menos 1 frame de espera
                    # para garantir estabilidade (chegar, esperar, disparar).
                    if move_time > 0 and wait_frames < 1:
                        continue

                    # Verificar se o caminho do tiro está livre de cogumelos
                    blocked = False
                    # Check from just below centipede to just above blaster
                    # Range is exclusive at end, so range(cy, by) checks cy, cy+1, ..., by-1
                    # If centipede is at cy, bullet hits it at cy.
                    # If blaster is at by, bullet starts at by-1.
                    for ty in range(cy + 1, by): 
                         if (cx, ty) in mushroom_set:
                             blocked = True
                             break
                    
                    if not blocked:
                        # Recalculate wait_frames to be sure
                        wait_frames = required_shoot_time - move_time
                        
                        solution = {
                            'target_pos': (cx, cy),
                            'shoot_pos': shoot_pos,
                            'total_frames': target_t,
                            'move_frames': move_time,
                            'wait_frames': wait_frames,
                            'path': path
                        }
                        
                        if target_t < min_total_frames:
                            min_total_frames = target_t
                            best_solution = solution
                            
    return best_solution
