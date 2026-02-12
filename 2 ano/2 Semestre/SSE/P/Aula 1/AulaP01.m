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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Polinómios

% Exercicio 1
p = pi/2

sin(p)
cos(p)
tan(p)
sqrt(p)
nthroot(p, 3)

% Exercicio 2

k = -1
log(k)
sqrt(k)

% Exercicio 3

x = linspace(-1, 1, 100);
y = exp(x)

% Exercicio 4

x = linspace(-pi, pi, 100);
sin(x + pi/10) .* cos(x)

% Exercicio 5

p1 = [1 0 0 0 0 0 10];
p2 = [1 -2 3];
conv(p1,p2)

% Exercicio 6

r = [1 2 3];
poly(r)

% Exercicio 7

p3 = [1 4 -3 1];
roots(p3)

w = linspace(0, 2*pi, 100);
x = exp(1j * w);

polyval(p3, x)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Exercicio 1
x1 = linspace(0, 4*pi, 100);
plot(x, sin(x))

% Exercicio 2
x2 = linspace(0, 2*pi, 100);

y_sin = sin(x);
y_cos = cos(x);

% 3. Criar o gráfico
figure;
plot(x, y_sin, 'bo'); % 'b' = blue (azul), 'o' = círculos
hold on;              % Mantém o gráfico anterior para sobrepor o próximo
plot(x, y_cos, 'g-'); % 'g' = green (verde), '-' = linha a cheio

% 4. Personalização (Legendas e títulos)
legend('Seno', 'Coseno');
title('Comparação: Seno vs Coseno');
xlabel('Ângulo (radianos)');
ylabel('Amplitude');
grid on;


