"""
Optional debug helpers.

Some versions of this Centipede project include a `debug_map_drawer.py` module used only for
visualizing internal state during development. The runtime server imports it from `game.py`.

In this repository the module isn't needed for gameplay, but `game.py` still imports it.
To keep the server runnable, we provide no-op implementations here.
"""

from __future__ import annotations

from typing import Any


def draw_game_state(*args: Any, **kwargs: Any) -> None:
    """No-op debug draw hook."""
    return None


def draw_game_state_compact(*args: Any, **kwargs: Any) -> None:
    """No-op debug draw hook (compact variant)."""
    return None


