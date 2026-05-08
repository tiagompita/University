% prob2.m
% Tiago Pita 120152
%

% 1) Gerar o sinal original com alta resolução temporal

fs = 20000;
duracao = 0.05;
N = fs * duracao;
t = (0:N-1) * (1/fs);

xa = cos ( 2*pi * 800 * t );        %1600Hz como a freq de amostragem é 20kHz o teorema de Nyquist é respeitado

% 2) Amostrar o sinal às frequencias 400Hz, 1200Hz, 3200Hz

% 400Hz
fs4 = 400;
N4 = fs4 * duracao;
t4 = (0:N4-1) * (1/fs4);

x4 = cos ( 2*pi * 800 * t4 );

% 1200Hz
fs12 = 1200;
N12 = fs12 * duracao;
t12 = (0:N12-1) * (1/fs12);

x12 = cos ( 2*pi * 800 * t12 );

% 3200Hz
fs32 = 3200;
N32 = fs32 * duracao;
t32 = (0:N32-1) * (1/fs32);

x32 = cos ( 2*pi * 800 * t32 );

% 3) Gerar 4 subgraficos

figure(1);
f_sinal = 800;
janela_x = 4 * (1/f_sinal);

subplot(2,2,1); plot(t,xa); axis tight; title('Original 20kHz'); xlabel('Tempo (s)'); ylabel('Amplitude'); grid on; xlim([0, janela_x]);
subplot(2,2,2); stem(t4,x4, 'filled'); title('400Hz'); xlabel('Tempo (s)'); ylabel('Amplitude'); grid on; xlim([0, janela_x]);
subplot(2,2,3); stem(t12,x12, 'filled'); title('1200Hz'); xlabel('Tempo (s)'); ylabel('Amplitude'); grid on; xlim([0, janela_x]);
subplot(2,2,4); stem(t32,x32, 'filled'); title('3200Hz'); xlabel('Tempo (s)'); ylabel('Amplitude'); grid on; xlim([0, janela_x]);

% 4) FFT

figure(2);

N_ffta = fs;
Xa = fft(xa, N_ffta);
mag_a = abs(Xa / N_ffta);
mag_a_S = mag_a(1:N_ffta / 2+1);
mag_a_S(2:end-1) = 2* mag_a_S(2:end-1);

f_a = (0:N_ffta/2) * (fs/N_ffta);

subplot(4,1,1);
stem(f_a, mag_a_S, 'filled');
title('Espectro Original (fs = 20kHz)'); xlabel('Frequencia (Hz)'); ylabel('Amplitude'); grid on; xlim([0, 1500]);

N_fft4 = 400;
X4 = fft(x4, N_fft4);
mag_4 = abs(X4 / N_fft4);
mag_4_S = mag_4(1:N_fft4 / 2+1);
mag_4_S(2:end-1) = 2* mag_4_S(2:end-1);

f_4 = (0:N_fft4/2) * (fs4/N_fft4);

subplot(4,1,2);
stem(f_4, mag_4_S, 'filled');
title('Espectro a 400Hz'); xlabel('Frequencia (Hz)'); ylabel('Amplitude'); grid on;

N_fft12 = 1200;
X12 = fft(x12, N_fft12);
mag_12 = abs(X12 / N_fft12);
mag_12_S = mag_12(1:N_fft12 / 2+1);
mag_12_S(2:end-1) = 2* mag_12_S(2:end-1);

f_12 = (0:N_fft12/2) * (fs12/N_fft12);

subplot(4,1,3);
stem(f_12, mag_12_S, 'filled');
title('Espectro a 1200Hz'); xlabel('Frequencia (Hz)'); ylabel('Amplitude'); grid on;

N_fft32 = 3200;
X32 = fft(x32, N_fft32);
mag_32 = abs(X32 / N_fft32);
mag_32_S = mag_32(1:N_fft32 / 2+1);
mag_32_S(2:end-1) = 2* mag_32_S(2:end-1);

f_32 = (0:N_fft32/2) * (fs32/N_fft32);

subplot(4,1,4);
stem(f_32, mag_32_S, 'filled');
title('Espectro a 3200Hz'); xlabel('Frequencia (Hz)'); ylabel('Amplitude'); grid on; xlim([0, 1500]);

% 5)

limiar = 0.50 * max(mag_a_S);

is_peak_a = (mag_a_S > limiar) & ([0, mag_a_S(1:end-1)] < mag_a_S) & ([mag_a_S(2:end), 0] < mag_a_S);

indices_a = find(is_peak_a);

num_sin_a = length(indices_a);

printf('O sinal xa contém %d sinusoide(s) no(s) índice(s) %d\n', num_sin_a, indices_a(1));

% 6)

freqs_a = f_a(indices_a);

printf('As frequencias presentes no sinal xa são %dHz\n', freqs_a(1));

% === Sinal x4 (Amostrado a 400 Hz) ===
limiar_4 = 0.50 * max(mag_4_S);
is_peak_4 = (mag_4_S > limiar_4) & ([0, mag_4_S(1:end-1)] < mag_4_S) & ([mag_4_S(2:end), 0] < mag_4_S);
indices_4 = find(is_peak_4);
num_sin_4 = length(indices_4);

printf('O sinal x4 contem %d sinusoide(s) no indice %d\n', num_sin_4, indices_4(1));
freqs_4 = f_4(indices_4);
printf('A frequencia presente no sinal x4 e: %.0f Hz\n\n', freqs_4(1));


% === Sinal x12 (Amostrado a 1200 Hz) ===
limiar_12 = 0.50 * max(mag_12_S);
is_peak_12 = (mag_12_S > limiar_12) & ([0, mag_12_S(1:end-1)] < mag_12_S) & ([mag_12_S(2:end), 0] < mag_12_S);
indices_12 = find(is_peak_12);
num_sin_12 = length(indices_12);

printf('O sinal x12 contem %d sinusoide(s) no indice %d\n', num_sin_12, indices_12(1));
freqs_12 = f_12(indices_12);
printf('A frequencia presente no sinal x12 e: %.0f Hz\n\n', freqs_12(1));


% === Sinal x32 (Amostrado a 3200 Hz) ===
limiar_32 = 0.50 * max(mag_32_S);
is_peak_32 = (mag_32_S > limiar_32) & ([0, mag_32_S(1:end-1)] < mag_32_S) & ([mag_32_S(2:end), 0] < mag_32_S);
indices_32 = find(is_peak_32);
num_sin_32 = length(indices_32);

printf('O sinal x32 contem %d sinusoide(s) no indice %d\n', num_sin_32, indices_32(1));
freqs_32 = f_32(indices_32);
printf('A frequencia presente no sinal x32 e: %.0f Hz\n\n', freqs_32(1));
