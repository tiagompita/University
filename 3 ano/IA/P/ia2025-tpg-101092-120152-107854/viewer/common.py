from enum import Enum
from dataclasses import dataclass
import pygame

EVENT_FOOD_EATEN = "event_food_eaten"

GAME_EVENT = pygame.event.custom_type()


class Directions(Enum):
    UP = (0, -1)
    DOWN = (0, 1)
    LEFT = (-1, 0)
    RIGHT = (1, 0)

@dataclass
class Food:
    pos: tuple
    health: int = 4

@dataclass
class Stone:
    pos: tuple

@dataclass
class BugBlaster:
    pos: tuple

@dataclass
class Blast:
    pos: tuple

@dataclass
class Centipede:
    body: list
    direction: Directions
    name: str


@dataclass
class ScoreBoard:
    highscores: list[tuple[str, int]]

def int2dir(i):
    if i == 0:
        return Directions.UP
    elif i == 1:
        return Directions.RIGHT
    elif i == 2:
        return Directions.DOWN
    elif i == 3:
        return Directions.LEFT
    else:
        raise ValueError(f"Invalid direction integer: {i}")

def get_direction(x, y, prev_x, prev_y, HEIGHT, WIDTH):
    """given 2 coordinates returns direction taken.
    HEIGHT and WIDTH are the dimensions of the board and enable proper handling of the edges when the snake wraps around.
    """
    dir = Directions.RIGHT #default

    if x - prev_x == WIDTH - 1:
        dir = Directions.LEFT
    elif x - prev_x == -(WIDTH - 1):
        dir = Directions.RIGHT
    elif y - prev_y == HEIGHT - 1:
        dir = Directions.UP
    elif y - prev_y == -(HEIGHT - 1):
        dir = Directions.DOWN
    elif x - prev_x > 0:
        dir = Directions.RIGHT
    elif x - prev_x < 0:
        dir = Directions.LEFT
    elif y - prev_y > 0:
        dir = Directions.DOWN
    elif y - prev_y < 0:
        dir = Directions.UP
    return dir
