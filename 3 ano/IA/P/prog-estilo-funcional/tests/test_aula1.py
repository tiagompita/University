import mock
import aula1 

#Exercicio 1.1
@mock.patch('aula1.comprimento', side_effect = aula1.comprimento)
def test_comprimento(mock_comprimento):
    assert mock_comprimento([1,2,3,4]) == 4
    assert mock_comprimento.call_count == 5 

#Exercicio 1.2
@mock.patch('aula1.soma', side_effect = aula1.soma)
def test_soma(mock_soma):
    assert mock_soma([1,2,3,4]) == 10
    assert mock_soma.call_count == 5

#Exercicio 1.3
@mock.patch('aula1.existe', side_effect = aula1.existe)
def test_existe(mock_existe):
    assert mock_existe([1,2,3,4], 5) == False
    assert mock_existe.call_count == 5
    mock_existe.call_count = 0
    assert mock_existe([1,2,3,4], 2) == True
    assert mock_existe.call_count == 2

#Exercicio 1.4
@mock.patch('aula1.concat', side_effect = aula1.concat)
def test_concat(mock_concat):
    assert mock_concat([1,2,3,4], [5,6]) == [1,2,3,4,5,6]
    assert mock_concat.call_count in [3,4,5]

#Exercicio 1.5
@mock.patch('aula1.inverte', side_effect = aula1.inverte)
def test_inverte(mock_inverte):
    assert mock_inverte([1,2,3,4]) == [4,3,2,1]
    assert mock_inverte.call_count == 5

#Exercicio 1.6
@mock.patch('aula1.capicua', side_effect = aula1.capicua)
def test_capicua(mock_capicua):
    assert mock_capicua([3,2,3])
    assert mock_capicua([3,2,2,3])
    assert not mock_capicua([1,2,3])
    assert mock_capicua.call_count in [6,7]

#Exercicio 1.7
@mock.patch('aula1.concat_listas', side_effect = aula1.concat_listas)
def test_concat_listas(mock_concat_listas):
    assert mock_concat_listas([[1,2], [3,4]]) == [1,2,3,4]
    assert mock_concat_listas([[1,2], [3,4], [5]]) == [1,2,3,4,5]

#Exercicio 1.8
@mock.patch('aula1.substitui', side_effect = aula1.substitui)
def test_substitui(mock_substitui):
    assert mock_substitui([1,2,3,4], 3, 5) == [1,2,5,4]
    assert mock_substitui([1,2,3,4], 5, 6) == [1,2,3,4]

#Exercicio 1.9
@mock.patch('aula1.fusao_ordenada', side_effect = aula1.fusao_ordenada)
def test_fusao_ordenada(mock_fusao_ordenada):
    assert mock_fusao_ordenada([1,2,3,4], [2,3,4,5]) == [1,2,2,3,3,4,4,5] 

#Exercicio 1.10
@mock.patch('aula1.lista_subconjuntos', side_effect = aula1.lista_subconjuntos)
def test_lista_subconjuntos(mock_lista_subconjuntos):
    assert sorted(mock_lista_subconjuntos([1,2,3])) == sorted([[],[1],[2],[3],[1,2],[1,3],[2,3],[1,2,3]])

#Exercicio 2.1
@mock.patch('aula1.separar', side_effect = aula1.separar)
def test_separar(mock_separar):
    assert mock_separar([(1, 'a'), (2, 'b'), (3, 'c')]) == ([1,2,3], ['a','b','c'])
    assert mock_separar.call_count == 4

#Exercicio 2.2
@mock.patch('aula1.remove_e_conta', side_effect = aula1.remove_e_conta)
def test_remove_e_conta(mock_remove_e_conta):
    assert mock_remove_e_conta([1,6,2,5,5,2,5,2],2) == ([1,6,5,5,5],3)
    assert mock_remove_e_conta.call_count == 9

#Exercicio 2.3
@mock.patch('aula1.conta_elem', side_effect = aula1.conta_elem)
def test_conta_elem(mock_conta_elem):
    assert mock_conta_elem([1,6,2,5,5,2,5,2]) == [(1, 1), (6,1), (2, 3), (5, 3)]

# Exercicio 3.1
@mock.patch("aula1.cabeca", side_effect=aula1.cabeca)
def test_cabeca(mock_cabeca):
    assert mock_cabeca([1, 2, 3, 4]) == 1
    assert mock_cabeca.call_count == 1

# Exercicio 3.2
@mock.patch("aula1.cauda", side_effect=aula1.cauda)
def test_cauda(mock_cauda):
    assert mock_cauda([1, 2, 3, 4]) == [2, 3, 4]
    assert mock_cauda.call_count == 1
    assert mock_cauda([1]) == []
    assert mock_cauda.call_count == 2

#Exercicio 3.3
@mock.patch('aula1.juntar', side_effect = aula1.juntar)
def test_juntar(mock_juntar):
    assert mock_juntar([1,2,3], ['a','b','c']) == [(1, 'a'), (2, 'b'), (3, 'c')]
    assert mock_juntar.call_count == 4
    assert mock_juntar([1,2,3], ['a','b','c','d']) == None
    assert mock_juntar.call_count >= 5

#Exercicio 3.4
@mock.patch('aula1.menor', side_effect = aula1.menor)
def test_menor(mock_menor):
    assert mock_menor([1,2,3,0,5]) == 0
    assert mock_menor.call_count in [5,6]
    assert mock_menor([]) == None

#Exercicio 3.5
@mock.patch('aula1.menor_e_resto', side_effect = aula1.menor_e_resto)
def test_menor_e_resto(mock_menor_e_resto):
    assert mock_menor_e_resto([]) is None
    assert mock_menor_e_resto([7]) == (7, [])
    assert mock_menor_e_resto([5,4,3,1,6]) == (1, [5,4,3,6])
    assert mock_menor_e_resto([2,2,3]) == (2, [2,3])          # preserva ordem do resto
    assert mock_menor_e_resto([4,1,1,5]) == (1, [4,1,5])      # só remove primeira ocorrência

#Exercicio 3.6
@mock.patch('aula1.max_min', side_effect = aula1.max_min)
def test_max_min(mock_max_min):
    assert mock_max_min([5,4,3,1,6]) == (6,1)
    assert mock_max_min.call_count >= 5 
    assert mock_max_min([]) == None

#Exercicio 3.7
@mock.patch('aula1.dois_menores_e_resto', side_effect = aula1.dois_menores_e_resto)
def test_dois_menores_e_resto(mock_dois_menores):
    assert mock_dois_menores([5,4,3,1,6]) == ([1,3,[5,4,6]]) or mock_dois_menores([5,4,3,1,6]) == ((1,3), [4,5,6])
    assert mock_dois_menores([2,1]) == (1,2,[]) or (2,1,[])
    assert mock_dois_menores([]) == None

#Exercicio 3.8
@mock.patch('aula1.media_mediana', side_effect = aula1.media_mediana)
def test_media_mediana(mock_media_mediana):
    assert mock_media_mediana([1,2,3,4]) == (2.5, 2.5)
    assert mock_media_mediana([1,2,3]) == (2.0, 2)
    assert mock_media_mediana([]) == None

