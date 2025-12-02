
import pytest
import sof2026h
import bn_example

def test_exercice_II_2_1():
    assert all([k in ['wo', 'tp', 'wf', 'mf', 'nh', 'ae'] for k in sof2026h.bn.dependencies.keys()])

    assert len(sof2026h.bn.dependencies['wo']) == 1
    assert len(sof2026h.bn.dependencies['tp']) == 1
    assert len(sof2026h.bn.dependencies['wf']) == 4
    assert len(sof2026h.bn.dependencies['mf']) == 4
    assert len(sof2026h.bn.dependencies['nh']) == 2
    assert len(sof2026h.bn.dependencies['ae']) == 2

def test_exercice_II_2_2():
    assert set(sof2026h.bn.ancestors('mf'))=={'nh','tp'}
    assert set(sof2026h.bn.ancestors('wf'))=={'nh','wo','tp'}
    assert set(bn_example.bn.ancestors('j'))=={'a','r','t'}
    assert set(bn_example.bn.ancestors('t'))==set([])

def test_exercice_II_2_3and4():
    assert round(sof2026h.bn.individualProb('wo', True),5) == 0.6
    assert round(sof2026h.bn.individualProb('tp', False),5) == 0.95
    assert round(sof2026h.bn.individualProb('nh', True),5) == 0.0163

