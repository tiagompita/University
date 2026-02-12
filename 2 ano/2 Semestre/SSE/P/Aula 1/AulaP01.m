% Sensores e Sinais
% Aula P01

close all

% Exercicio 1
a = [1 2 3 4 5]

% a' ou transpose(a)
a'

b = [0 1 2 3 4]
b'


% Exercicio 2
r1 = 1:10
r2 = 1:0.5:10
r3 = linspace (0, 2*pi, 100);

% Exercicio 3
% Não é possivel multiplicar matrizes do tipo 5x1 por elas mesmas

% Exercicio 4
% Aqui é possível pois a multiplicaçao é feita elemento a elemento. O 1 multiplica por 1, 2 por 2, etc…
% O comando a.^3 coloca cada elemento ao cubo.

% Exercicio 5
a.*b

% Exercicio 6
whos

% Exercicio 7
M = rand(3,4)

M(2,1:4) % ou M(2,:) ou M(2,1:end)

M(1:2,1:3)

% Exercicio 8
% Apenas é possivel multiplicar a matriz M elemento a elemento.
 M * M'

% Exercicio 9
eye(1,5)
eye(5,5)

zeros(1,5)
zeros(5,5)

ones(1,5)
ones(5,5)

% Exercicio 10
M
N = M(:,2:4)
M(:,2:4) = []
