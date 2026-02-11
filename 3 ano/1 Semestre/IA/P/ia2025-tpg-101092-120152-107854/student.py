import asyncio
import getpass
import json
import os
import websockets
import datetime
from mapa import Map


from tree_search.centipede_domain import CentipedeDomain
from tree_search.centipede import Centipede



async def agent_loop(server_address="localhost:8000", agent_name="student"):
    """agent loop."""

    async with websockets.connect(f"ws://{server_address}/player") as websocket:
        # Receive information about static game properties
        await websocket.send(json.dumps({"cmd": "join", "name": agent_name}))

        map_info =json.loads(await websocket.recv())
        
        centipedes: Centipede = Centipede()

        domain: CentipedeDomain = CentipedeDomain(map=map_info)
        
        while True:
            try:
                state = json.loads(
                    await websocket.recv()
                )  # receive game update, this must be called timely or your game will get out of sync with the server

                # Game over / scoreboard messages do not include per-frame timestamps.
                if "highscores" in state:
                    print("Game over. Highscores received.")
                    break

                ts_iso = state.get("ts")
                ts = None
                if isinstance(ts_iso, str):
                    try:
                        ts = datetime.datetime.fromisoformat(ts_iso).timestamp()
                    except Exception:
                        ts = None

                # If we're already behind, do not run expensive logic this frame.
                # Still send a key to avoid websocket/game desync.
                if ts is not None and (datetime.datetime.now().timestamp() - ts) > domain.time_per_frame:
                    print("Warning: Frame processing is taking too long!")
                    domain.multi_objectives.clear_goals()
                    domain.plan = []
                    # Still update the parsed state and take a very fast safe move.
                    centipedes.update(state)
                    key = domain.get_emergency_move(centipede=centipedes)
                    await websocket.send(json.dumps({"cmd": "key", "key": key}))
                    continue
                
                
                centipedes.update(state)
            

                key = domain.get_next_move(centipede=centipedes)
                focus = getattr(domain, "attack_focus", None)
                print(f"Turn {centipedes.turn} - Action: {key} Strategy: {domain.current_strategy} Focus: {focus}")

                await websocket.send(
                    json.dumps({"cmd": "key", "key": key})
                )  # send the key command to the server
                
            except Exception as e:
                print(f"Exception in agent loop: {e}")
                break

# DO NOT CHANGE THE LINES BELLOW
# You can change the default values using the command line, example:
# $ NAME='arrumador' python3 client.py
loop = asyncio.get_event_loop()
SERVER = os.environ.get("SERVER", "localhost")
PORT = os.environ.get("PORT", "8000")
NAME = os.environ.get("NAME", getpass.getuser())
loop.run_until_complete(agent_loop(f"{SERVER}:{PORT}", NAME))
