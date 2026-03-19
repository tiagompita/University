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


% Exercicio 3

teta = -2*pi:pi/10:2*pi;

% ./ para divisão elemento a elemento
y = sin(teta)./teta;
% Para evitar o "buraco" no gráfico onde teta == 0 (pois limite de sin(x)/x é 1)
y(teta == 0) = 1;

plot(teta, y)
title('Gráfico de sin(\theta) / \theta');
xlabel('\theta');
ylabel('y');


% Exercicio 4

x = linspace(0, 5, 100);
y = exp(x);
plot(x, y)
title('Gráfico de exp(x)');
xlabel('x');
ylabel('exp(x)');


% Exercicio 5

x = linspace(0, 5, 100);
y = exp(-x);
plot(x, y)
title('Gráfico de exp(-x)');
xlabel('x');
ylabel('exp(-x)');


% Exercicio 6

x = 1:5;
y = log(x);
plot(x, y)

% Exercicio 7

% transpor em vetor coluna para a matriz X ficar certa
x = linspace(1, 2, 100)';

X = [exp(x), log(x)];

plot(X)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Gráficos de variáveis complexas

w = 0 : pi/10 : 2*pi;
y = exp(1i * w);

% Extrair as partes real e imaginária
parte_real = real(y);
parte_imag = imag(y);

plot(w, parte_real, '-o', 'DisplayName', 'Parte Real (cos)');
hold on;
plot(w, parte_imag, '-s', 'DisplayName', 'Parte Imaginária (sin)');
hold off;

% Ajustes estéticos
grid on;
xlabel('\omega (radianos)');
ylabel('Amplitude');
title('Partes Real e Imaginária de e^{j\omega}');
legend('show');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Programação em Octave

% Exercicio 1

vetor = rand(1, 1000);
y = [];

for i = 1:1000
    if vetor(i) < 0.3
        y = [y, vetor(i)];
    endif
endfor

disp(y);


% Exercicio 2

x = linspace(0, 2, 100)';

A = zeros(100, 10);

for n = 1:10
    alpha = 1 + 0.1 * n;
    A(:, n) = exp(alpha * x);  % Guarda o resultado na coluna 'n' da matriz A
endfor

plot(A)     % Desenha as 10 colunas simultaneamente
figure;     % Abre uma nova janela para o próximo gráfico
mesh(A)     % Visualização 3D da matriz

% Exercicio 3

x = linspace(0, 2*pi, 100);

y_real = sin(x);

% aproximação com os primeiros 5 termos da série
% elemento a elemento
termo1 = x;
termo2 = -(x.^3) / factorial(3);
termo3 = (x.^5) / factorial(5);
termo4 = -(x.^7) / factorial(7);
termo5 = (x.^9) / factorial(9);

y_approx = termo1 + termo2 + termo3 + termo4 + termo5;

plot(x, y_real, 'b-', 'LineWidth', 2);
hold on;
plot(x, y_approx, 'r--', 'LineWidth', 2);

grid on;
title('Comparação: sin(x) vs Série de Taylor (5 termos)');
xlabel('x [0, 2\pi]');
ylabel('y');
legend('sin(x) Real', 'Série de Taylor (5 termos)');

ylim([-2, 2]);


% Exercicio 4

A = zeros(10, 10);

v = (1:10)'; % transpor para coluna

for i = 1:10
  A(:,i) = v;
endfor

A


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Scripts e funções

function fahrenheit = celsius_to_fahrenheit(celsius)
  % This function converts Celsius to Fahrenheit
  fahrenheit = celsius * (9/5) + 32;
end

celsius_to_fahrenheit(20)
