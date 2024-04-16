# test_fibonacci.py
import pytest
from fibonacci import fibonacci

def test():
    print("Testa comportamento com n < 1")
    assert fibonacci(-1) == []
    assert fibonacci(0) == [0]
    assert fibonacci(1) == [0, 1]
    assert fibonacci(2) == [0, 1, 1]
    assert fibonacci(5) == [0, 1, 1, 2, 3, 5]