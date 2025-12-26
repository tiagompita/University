"""Network Game Server."""
from __future__ import annotations
import argparse
import asyncio
from datetime import datetime
import json
import logging
import os.path
import random
from collections import namedtuple
from typing import Set

import requests
import websockets
from requests import RequestException
from websockets.legacy.protocol import WebSocketCommonProtocol

from game import Game
from consts import TIMEOUT

# --- NOVA CONFIGURAÇÃO DE LOGS ---

# Formatter customizado para mostrar frame em vez de timestamp
class FrameFormatter(logging.Formatter):
    """Formatter que mostra o frame atual em vez de timestamp."""
    game_instance = None  # Referência ao jogo para aceder ao step
    
    def format(self, record):
        # Se temos acesso ao jogo e ao step, usar o frame
        if FrameFormatter.game_instance and hasattr(FrameFormatter.game_instance, '_step'):
            frame = FrameFormatter.game_instance._step
            record.frame = f"Frame {frame:4d}"
        else:
            record.frame = "Frame    ?"
        
        # Formato: Frame XXXX - Logger - Level - Message
        # IMPORTANTE: usar getMessage() para formatar a mensagem com os argumentos
        return f"{record.frame} - {record.name} - {record.levelname} - {record.getMessage()}"

# 1. Definir o formato (mantido para compatibilidade, mas não usado)
LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
log_formatter = FrameFormatter()

# 2. Configurar o logger do Jogo (game.py)
game_logger = logging.getLogger("Game")
game_logger.setLevel(logging.INFO) # Captura INFO e acima
game_file_handler = logging.FileHandler('game_log.txt', mode='w')
game_file_handler.setFormatter(log_formatter)
game_logger.addHandler(game_file_handler)
game_logger.propagate = False # Não envia logs do jogo para a consola

# 3. Configurar o logger do Servidor (server.py)
server_logger = logging.getLogger("Server")
server_logger.setLevel(logging.INFO) # Captura INFO e acima
server_file_handler = logging.FileHandler('server_log.txt', mode='w')
server_file_handler.setFormatter(log_formatter)
server_logger.addHandler(server_file_handler)
server_logger.propagate = False # Não envia logs do servidor para a consola

# 4. Configurar outros loggers (websockets e erros gerais)
# Fazer com que os erros apareçam na consola
console_handler = logging.StreamHandler()
console_handler.setFormatter(log_formatter)
console_handler.setLevel(logging.WARN) # Apenas WARN e ERROR
logging.getLogger().addHandler(console_handler) # Handler de fallback

# Silenciar o logger do websockets
wslogger = logging.getLogger("websockets")
wslogger.setLevel(logging.WARN)

# --- FIM DA CONFIGURAÇÃO DE LOGS ---


Player = namedtuple("Player", ["name", "ws"])

HIGHSCORE_FILE = "highscores.json"
MAX_HIGHSCORES = 10


class GameServer:
    """Network Game Server."""

    def __init__(
        self,
        level: int,
        timeout: int,
        seed: int = 0,
        players=1,
        grading: str = None,
        dbg: bool = False,
    ):
        """Initialize Gameserver."""
        self.dbg = dbg
        self.seed = seed
        self.game = Game(timeout=timeout)
        
        # Definir a referência ao jogo para o formatter poder aceder ao frame
        FrameFormatter.game_instance = self.game
        
        self.players: asyncio.Queue[Player] = asyncio.Queue()
        self.viewers: Set[WebSocketCommonProtocol] = set()
        self.grading = grading
        self._level = level  # game level
        self._timeout = timeout  # timeout for game
        self.game_player = {}  # websocket to player mapping
        self.number_of_players = players

        self._highscores = []
        if os.path.isfile(HIGHSCORE_FILE):
            with open(HIGHSCORE_FILE, "r") as infile:
                self._highscores = json.load(infile)

    def save_highscores(self):
        """Update highscores, storing to file."""

        server_logger.debug("Save highscores")
        for player in self.game_player.values():
            server_logger.info(
                "Saving: %s <%s>",
                player,
                self.game.score,
            )

            self._highscores.append((player, self.game.score))
            self._highscores = sorted(
                self._highscores, key=lambda s: s[1], reverse=True
            )[:MAX_HIGHSCORES]

        with open(HIGHSCORE_FILE, "w") as outfile:
            json.dump(self._highscores, outfile)

        return self._highscores

    async def send_clients(self, group, info):
        to_remove = []

        original_group = group
        if isinstance(group, dict):
            group = group.keys()

        for client in group:
            try:
                await client.send(json.dumps(info))
            except Exception:
                server_logger.error("Could not send %s to client %s, removing", info, client)
                to_remove.append(client)
                await client.close()
        for client in to_remove:
            if isinstance(original_group, dict):
                del original_group[client]
            else:
                original_group.remove(client)

    async def incomming_handler(self, websocket: WebSocketCommonProtocol, path: str):
        """Process new clients arriving at the server."""
        try:
            async for message in websocket:
                data = json.loads(message)
                if "cmd" not in data:
                    continue
                if data["cmd"] == "join":
                    if path == "/player":
                        if data["name"] in self.game_player.values():
                            server_logger.error("Player <%s> already exists", data["name"])
                            await websocket.close()
                            continue
                        server_logger.info("<%s> has joined", data["name"])
                        await self.players.put(Player(data["name"], websocket))
                        self.game_player[websocket] = data["name"]

                    if path == "/viewer":
                        server_logger.info("Viewer connected")
                        self.viewers.add(websocket)

                    if self.game.running:
                        game_info = self.game.info()
                        await websocket.send(json.dumps(game_info))

                if data["cmd"] == "key":
                    key_pressed = data.get("key", "")
                    server_logger.info(
                        f"Key from {self.game_player[websocket]}: '{key_pressed}'"
                    )
                    
                    if len(key_pressed) > 0:
                        self.game.keypress(self.game_player[websocket], key_pressed[0])
                    else:
                        self.game.keypress(self.game_player[websocket], "")

        except websockets.exceptions.ConnectionClosed as closed_reason:
            server_logger.info("Client disconnected: %s", closed_reason)
            if websocket in self.viewers:
                self.viewers.remove(websocket)

    async def mainloop(self):
        """Run the game."""
        while True:
            game_players = []
            server_logger.info("Waiting for players")
            while len(game_players) < self.number_of_players:
                game_players.append(await self.players.get())

                if game_players[-1].ws.closed:
                    server_logger.error("<%s> disconnect while waiting", game_players[-1].name)
                    continue

            try:
                server_logger.info("Starting game")
                if self.seed > 0:
                    random.seed(self.seed)

                self.game = Game(timeout=self._timeout)
                # Atualizar a referência ao jogo para o formatter
                FrameFormatter.game_instance = self.game
                
                self.game.start([p.name for p in game_players])

                while self.game.running:
                    if self.game._step == 0:  # Starting a level ? Let's send the info
                        game_info = self.game.info()

                        server_logger.info("Sending initial info to viewers and players")
                        await self.send_clients(self.viewers, game_info)
                        await self.send_clients(self.game_player, game_info)

                    if state := await self.game.next_frame():
                        await self.send_clients(self.viewers, state)

                        for player in game_players:
                            state["ts"] = datetime.now().isoformat()
                            try:
                                await player.ws.send(json.dumps(state))
                            except Exception:
                                server_logger.error(
                                    "Player <%s> disconnected, could not send state",
                                    player.name,
                                )
                                game_players.remove(player)

                game_over = {"highscores": self.save_highscores()}
                await self.send_clients(self.viewers, game_over)
                await self.send_clients(self.game_player, game_over)

                for ws, player in self.game_player.items():
                    await ws.close()
                self.game_player = {}

            except websockets.exceptions.ConnectionClosed as ws_closed:
                if ws_closed in self.game_player:
                    self.game_player.pop(ws_closed)
                server_logger.error("Player disconnected: %s", ws_closed)
            finally:
                try:
                    if self.grading:
                        for player in game_players:
                            game_record = {
                                "player": player.name,
                                "score": self.game.score,
                            }
                            requests.post(self.grading, json=game_record, timeout=2)
                except RequestException as err:
                    server_logger.error(err)
                    server_logger.warning("Could not save score to server")

                for ws, player in self.game_player.items():
                    server_logger.info("Disconnecting <%s>", player)
                    await ws.close()
                self.game_player = {}


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--bind", help="IP address to bind to", default="")
    parser.add_argument("--port", help="TCP port", type=int, default=8000)
    parser.add_argument("--seed", help="Seed number", type=int, default=0)
    parser.add_argument(
        "--debug", help="Open Bitmap with map on gameover", action="store_true"
    )
    parser.add_argument("--players", help="Number of players", type=int, default=1)
    parser.add_argument(
        "--grading-server",
        help="url of grading server",
        default="http://tetriscores.av.it.pt/game",
    )
    args = parser.parse_args()

    async def main():
        """Start server tasks."""
        g = GameServer(
            0, TIMEOUT, args.seed, args.players, args.grading_server, args.debug
        )

        game_loop_task = asyncio.ensure_future(g.mainloop())

        server_logger.info("Listenning @ %s:%s", args.bind, args.port)
        websocket_server = websockets.serve(g.incomming_handler, args.bind, args.port)

        await asyncio.gather(websocket_server, game_loop_task)

    asyncio.run(main())
