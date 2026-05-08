% prob1.m
% Tiago Pita 120152
%

% 1) Criar um vector com o sinal x(t)
fs = 10000;           % Taxa de amostragem de 10kHz
Ts = 1/fs;
t  = 0:Ts:(0.1-Ts);   % Vetor de tempo para 0.1 segundos (1000 amostras)

x = 2 * cos(150*pi*t) + sin(300*pi*t) + 0.5 * cos(450*pi*t);

% 2) Gerar o Gráfico

figure(1);
plot(t, x);
title('Sinal no Tempo');
xlabel('Tempo (s)');
ylabel('Amplitude');
grid on;

% 3) Magnitude Espectral do sinal usando FFT

N = length(x);    % Numero total de amostras
X = fft(x);       % Calculo de Transformada de Fourier

% Normalizacao e calculo do espetro unilaterel (apenas frequencias positivas)
mag_X = abs(X/N);                 % Divide-se por N para obter as amplitudes reais
mag_X_single = mag_X(1:N/2+1);    % Corta o vetor a meio
mag_X_single(2:end-1) = 2*mag_X_single(2:end-1);  % Multiplica por 2 para repor energia

% Criacao do eixo das frequencias (em Hz)
f = (0:(N/2)) * (fs/N);

% Geracao do grafico
figure(2);
stem(f, mag_X_single, 'filled');
title('Magnitude Espectral de x(t)');
xlabel('Frequencia (Hz)');
ylabel('Amplitude');
xlim([0 300]); % Foca o grafico na zona de interesse (temos componentes ate 225 Hz)
grid on;

% 4) Imprimir componentes sinusoidais

% 1. Definir um limiar (threshold) para ignorar lixo numérico
limiar = 0.1 * max(mag_X_single);

% 2. Encontrar os índices onde a magnitude é maior que o limiar
is_peak = (mag_X_single > limiar) & ([0, mag_X_single(1:end-1)] < mag_X_single) & ([mag_X_single(2:end), 0] < mag_X_single);

indices = find(is_peak);

% 3. Contar quantas sinusoides existem (tamanho do vetor de índices)
num_sin = length(indices);

% 4. Imprimir no formato exato pedido pelo enunciado
printf('O sinal contem %d sinusoide(s) no(s) indice(s) %d, %d e %d\n', num_sin, indices(1), indices(2), indices(3));

freqs = f(indices);

printf('As frequencias presentes no sinal sao: %.0f, %.0f e %.0f Hz\n', freqs(1), freqs(2), freqs(3));
