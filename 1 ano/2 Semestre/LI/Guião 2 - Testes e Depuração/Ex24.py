import pytest
from fibonacci import fibonacci

def test_fibonacci_with_string():
    with pytest.raises(TypeError, match="Expected int but got str"):
        fibonacci("string")

def test_fibonacci_with_no_arguments():
    with pytest.raises(TypeError, match="Missing 1 required positional argument"):
        fibonacci()