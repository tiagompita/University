x = [1 2 3 2 1];
h = [1 -1];

y = conv(x,h);


nx = 0 : length(x) - 1;
nh = 0 : length(h) - 1;
ny = 0 : length(y) - 1;

% Subgráficos
figure(1);

% Gráfico de x[n]
subplot(3, 1, 1); stem(nx, x, 'filled'); title('x[n]');
grid on;

% Gráfico de h[n]
subplot(3, 1, 2); stem(nh, h, 'filled'); title('h[n]');
grid on;

% Gráfico de y[n]
subplot(3, 1, 3); stem(ny, y, 'filled'); title('y[n] = x * h'); xlabel('n');
grid on;

% Mostrar os valores numéricos na consola
disp('y[n] =');
disp(y);
