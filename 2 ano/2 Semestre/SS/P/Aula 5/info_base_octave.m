# Comandos/operações básicos octave

pwd                     # mostra qual o directório de trabalho actual
ls                      # mostra conteúdo do directório actual
# cd /CAMINHO/DIRECTORIO/ # muda o directório de trabalho actual para o definido

clc                     # limpa a janela de comandos (command window)
clear                   # limpa todas as variáveis guardadas no workspace
history -c              # limpa o histórico de comandos (command history)

# doc NOME_DO_COMANDO     # mostra documentação (interface gráfica) do comando referido (ou procura documentação relacionada)
# help NOME_DO_COMANDO    # mostra documentação (no terminal de comandos) do comando referido

A = [1 2 3]             # cria matriz A com 1 linha e três colunas
A = [1 2 3];            # cria matriz A com 1 linha e três colunas, não mostra resultado no terminal
B = [4; 5; 6];          # cria matriz B com 3 linhas e 1 colunas

A * B                   # operação algébrica multiplicação de matrizes (produto interno)
A .* B                  # operação de multiplicação elemento-a-elemento

valores_x = linspace(0, 2*pi, 100); # gera 100 pontos equidistantes entre 0 (inclusivé) e 2*pi (inclusivé)
valores_y = sin(valores_x);     # calcula para cada valor de x o valor da função sin

plot(valores_x, valores_y) # criar gráfico em que cada ponto tem como coordenadas X valores de valores_x e coordenadas
                           # Y valores de valores_y
hold on                 # mantém o plot anterior, e sobrepõe novos plots a este
plot(valores_x, 2*valores_y, 'r+') # plot de outro sin com o dobro da amplitude, desenhado com símbolos + a vermelho

xlabel('Eixo do X')     # legenda para o eixo dos X
ylabel('Eixo do Y')     # legenda para o eixo dos Y
title('Título do plot') # titulo para o plot geral
legend('sin(x)', '2*sin(x)') #adiciona legenda para cada subplot

