import mock
import types
import aula2
from aula2 import *

#Exercicio 4.1
def test_par_impar():
    assert isinstance(impar, types.FunctionType)
    assert impar(3) 
    assert not impar(4)

#Exercicio 4.2
def test_positivo():
    assert isinstance(positivo, types.FunctionType)
    assert positivo(3) 
    assert not positivo(-4)

#Exercicio 4.3
def test_comparar_modulo():
    assert isinstance(comparar_modulo, types.FunctionType)
    assert not comparar_modulo(-4, 2)
    assert comparar_modulo(3, -4) 
    
#Exercicio 4.4
def test_cart2pol():
    assert isinstance(cart2pol, types.FunctionType)
    assert cart2pol(0, 1) == (1.0, 1.5707963267948966)

#Exercicio 4.5
def test_ex5():
    assert isinstance(ex5, types.FunctionType)
    t = ex5(lambda x,y: x+y, lambda x,y: x*y, lambda x,y: x < y)
    assert isinstance(t, types.FunctionType)
    assert t(1,2,3) == True 

#Exercicio 4.6
@mock.patch('aula2.quantificador_universal', side_effect = aula2.quantificador_universal)
def test_quantificador_universal(mock_qt_uni):
    assert mock_qt_uni([11,12,13,14], lambda n: n > 10)

#Exercicio 4.8
@mock.patch('aula2.subconjunto', side_effect = aula2.subconjunto)
def test_subconjunto(mock_subconjunto):
    assert mock_subconjunto([11,12,13,14], [11,12,13,14,15,16])
    assert mock_subconjunto([11,12,13,14], [10,11,12,13,14])
    assert mock_subconjunto([11,12,13,14], [10,11,12,13,14,15])
    assert not mock_subconjunto([11,12,33,14], [10,11,12,13,14,15])


#Exercicio 4.9
@mock.patch('aula2.menor_ordem', side_effect = aula2.menor_ordem)
def test_menor_ordem(mock_menor_ordem):
    assert mock_menor_ordem([1,-1,4,0], lambda x,y: x < y) == -1
    assert mock_menor_ordem([1,-1,4,0], lambda x,y: x > y) == 4

#Exercicio 4.10
@mock.patch('aula2.menor_e_resto_ordem', side_effect = aula2.menor_e_resto_ordem)
def test_menor_e_resto_ordem(mock_menor_e_resto_ordem):
    m, r =  mock_menor_e_resto_ordem([1,-1,4,0], lambda x, y: x < y) 
    assert m == -1
    assert sorted(r) == sorted([1,4,0])
    m2, r2 = mock_menor_e_resto_ordem([1,-1,4,0], lambda x, y: x > y) 
    assert m2 == 4
    assert sorted(r2) == sorted([1,-1,0])

#Exercicio 5.2a
@mock.patch('aula2.ordenar_seleccao', side_effect = aula2.ordenar_seleccao)
def test_ordenar_seleccao(mock_ordenar):
    assert mock_ordenar([1,-1,4,0], lambda x, y: x < y) == [-1, 0, 1, 4]
    assert mock_ordenar([1,-1,4,0], lambda x, y: x > y) == [4, 1, 0, -1]

#Exercicio 4.7
@mock.patch('aula2.quantificador_existencial', side_effect = aula2.quantificador_existencial)
def test_quantificador_existencial(mock_qt_exi):
    assert mock_qt_exi([11,12,13,14], lambda n: n < 11) == False
    assert mock_qt_exi([11,12,13,14], lambda n: n > 12) == True

#Exercicio 4.11
@mock.patch('aula2.menores_e_resto_ordem', side_effect = aula2.menores_e_resto_ordem)
def test_menores_e_resto_ordem(mock_menores_e_resto_ordem):
    m1, m2, r =  mock_menores_e_resto_ordem([1,-1,4,0, 5, 8], lambda x, y: x < y) 
    assert m1 == -1
    assert m2 == 0
    assert sorted(r) == sorted([1,4,5,8])
    m1_2, m2_2, r2 = mock_menores_e_resto_ordem([1,-1,4,0, 5, 8], lambda x, y: x > y) 
    assert m1_2 == 8
    assert m2_2 == 5
    assert sorted(r2) == sorted([1,-1,4,0])

#Exercicio 4.12
@mock.patch('aula2.map_pol', side_effect = aula2.map_pol)
def test_map_pol(mock_map_pol):
    assert mock_map_pol([(0,1), (1,0)]) == [(1.0, 1.5707963267948966), (1.0, 0.0)]

#Exercicio 4.13
@mock.patch('aula2.juntar_ordenado', side_effect = aula2.juntar_ordenado)
def test_juntar_ordenado(mock_juntar_ordenado):
    assert mock_juntar_ordenado([1,2,3], [4,5,6], lambda x,y: x < y) == [1,2,3,4,5,6]
    assert mock_juntar_ordenado([4,5,6], [1,2,3], lambda x,y: x < y) == [1,2,3,4,5,6]
    assert mock_juntar_ordenado([1,3,5], [2,4,6], lambda x,y: x < y) == [1,2,3,4,5,6]
    assert mock_juntar_ordenado([6,4,2], [5,3,1], lambda x,y: x > y) == [6,5,4,3,2,1]

#Exercicio 4.14
@mock.patch('aula2.conc_aplic', side_effect = aula2.conc_aplic)
def test_conc_aplic(mock_conc_aplic):
    assert mock_conc_aplic([[1,2],[3,4]], lambda x: x*2) == [2,4,6,8]

#Exercicio 4.15
@mock.patch('aula2.aplic_combin', side_effect = aula2.aplic_combin)
def test_aplic_combin(mock_aplic_combin):
    assert mock_aplic_combin(([1,2,3], [4,5,6]), lambda x,y: x+y) == [5,7,9]
    assert mock_aplic_combin(([1,2], [4,5,6]), lambda x,y: x+y) == None

#Exercicio 4.16
@mock.patch('aula2.reduce_listas', side_effect = aula2.reduce_listas)
def test_reduce_listas(mock_reduce_listas):
    assert mock_reduce_listas([[1,2,3],[4,5,6]], lambda x,y: x+y, 0) == [6,15]

#Exercicio 5.1b
@mock.patch('aula2.ordenar_bolha', side_effect = aula2.ordenar_bolha)
def test_ordenar_bolha(mock_ordenar_bolha):
    assert mock_ordenar_bolha([1,-1,4,0], lambda x, y: x < y) == [-1, 0, 1, 4]
    assert mock_ordenar_bolha([1,-1,4,0], lambda x, y: x > y) == [4, 1, 0, -1]

#Exercicio 5.1c
@mock.patch('aula2.ordenar_rapida', side_effect = aula2.ordenar_rapida)
def test_ordenar_rapida(mock_ordenar_rapida):
    assert mock_ordenar_rapida([1,-1,4,0], lambda x, y: x < y) == [-1, 0, 1, 4]
    assert mock_ordenar_rapida([1,-1,4,0], lambda x, y: x > y) == [4, 1, 0, -1]
