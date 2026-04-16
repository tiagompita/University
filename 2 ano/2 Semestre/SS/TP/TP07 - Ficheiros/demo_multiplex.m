% Sinal original: 

sinal1 = [1 1 1 1 0];
sinal2 = [0 0 1 0 1];

close all;

figure;
subplot(2,1,1);
stem(sinal1);
title('Sinal 1');
xlabel('Tempo');
ylabel('Amplitude');  

subplot(2,1,2);
stem(sinal2);
title('Sinal 2');
xlabel('Tempo');
ylabel('Amplitude');  

disp('Gráficos dos sinais de entrada')
pause

fs = 1500;  % frequência de amostragem em Hz

% Geração do sinal FSK a partir do vetor de símbolos
[s1, t] = gera_fsk(sinal1,fs);
[s2, t] = gera_fsk(sinal2,fs);

figure
subplot(2,1,1);
plot(t, s1);
title('Sinal FSK 1');
xlabel('Tempo (s)');
ylabel('Amplitude');  

subplot(2,1,2);
plot(t, s2);
title('Sinal FSK 2');    
xlabel('Tempo (s)');
ylabel('Amplitude');

disp('Gráficos dos sinais com modulação FSK')
pause

figure; 
subplot(2,1,1);
freqs = linspace(0, fs-fs/length(s1), length(s1));
plot(freqs, abs(fft(s1)));
axis([0 fs 0 max(abs(fft(s1)))]);
title('Espectro do sinal FSK 1');
xlabel('Frequência (Hz)');
ylabel('Magnitude');  

subplot(2,1,2);
plot(freqs, abs(fft(s2)));
axis([0 fs 0 max(abs(fft(s2)))]);
title('Espectro do sinal FSK 2');    
xlabel('Frequência (Hz)');
ylabel('Magnitude');

disp('Gráficos do espectro dos sinais com modulação FSK')
pause


% Multiplicação do sinal FSK por uma portadora de 100 Hz
fp1 = 100;  % frequência da portadora em Hz
s1_mod = s1.*cos(2*pi*fp1*t);

figure;
subplot(2,1,1);
plot(t, s1_mod);
title(sprintf('Sinal FSK 1 modulado com portadora de %.0f Hz', fp1));
xlabel('Tempo (s)');
ylabel('Amplitude');  


% Multiplicação do sinal FSK por uma portadora de 300 Hz
fp2  = 300;  % frequência da portadora em Hz
s2_mod = s2.*cos(2*pi*fp2*t);

subplot(2,1,2);
plot(t, s2_mod);
title(sprintf('Sinal FSK 2 modulado com portadora de %.0f Hz', fp2));    
xlabel('Tempo (s)');
ylabel('Amplitude');  

disp('Gráficos dos sinais FSK sobre portadora')
pause


figure;
subplot(2,1,1);
freqs = linspace(0, fs-fs/length(s1_mod), length(s1_mod));
plot(freqs, abs(fft(s1_mod)));
axis([0 fs 0 max(abs(fft(s1_mod)))]);
title('Espectro do sinal FSK 1 modulado');
xlabel('Frequência (Hz)');
ylabel('Magnitude');  

subplot(2,1,2);
plot(freqs, abs(fft(s2_mod)));
axis([0 fs 0 max(abs(fft(s2_mod)))]);
title('Espectro do sinal FSK 2 modulado');    
xlabel('Frequência (Hz)');
ylabel('Magnitude');

disp('Gráficos do espectro dos sinais FSK sobre portadora')
pause


% Mistura dos dois sinais modulados
sinal_combinado = s1_mod+s2_mod;

figure;
plot(t, sinal_combinado);
title('Sinal combinado');
xlabel('Tempo (s)');
ylabel('Amplitude');

disp('Gráfico do sinal combinado (ambos os sinais transmitidos)')
pause


figure;
plot(freqs, abs(fft(sinal_combinado)));
axis([0 fs 0 max(abs(fft(sinal_combinado)))]);
title('Espectro do sinal combinado');
xlabel('Frequência (Hz)');
ylabel('Magnitude');

disp('Espectro do sinal combinado')
pause



% Desmodulação do sinal combinado (recuperação dos sinais FSK originais)
s1_bbase = sinal_combinado .* cos(2*pi*fp1*t);
s2_bbase = sinal_combinado .* cos(2*pi*fp2*t);

figure;
subplot(2,1,1);
plot(t, s1_bbase);
title('Sinal após multiplicação pela portadora de 100 Hz');
xlabel('Tempo (s)');
ylabel('Amplitude');  
subplot(2,1,2);
plot(t, s2_bbase);
title('Sinal após multiplicação pela portadora de 300 Hz');    
xlabel('Tempo (s)');
ylabel('Amplitude');

disp('Sinais após recuperação (mult. pelas portadoras)')
pause


figure;
subplot(2,1,1);
freqs = linspace(0, fs-fs/length(s1_bbase), length(s1_bbase));
plot(freqs, abs(fft(s1_bbase)));
axis([0 fs 0 max(abs(fft(s1_bbase)))]);
title('Espectro do sinal FSK 1 após multiplicação pela portadora de 100 Hz');
xlabel('Frequência (Hz)');
ylabel('Magnitude');  
subplot(2,1,2);
plot(freqs, abs(fft(s2_bbase)));
axis([0 fs 0 max(abs(fft(s2_bbase)))]);
title('Espectro do sinal FSK 2 após multiplicação pela portadora de 300 Hz');    
xlabel('Frequência (Hz)');  
ylabel('Magnitude');  

disp('Espectro dos sinais após mult. pelas portadoras')
pause


s1_demod = filtra_pb(s1_bbase, t);
s2_demod = filtra_pb(s2_bbase, t);


figure;
subplot(2,1,1);
plot(t, s1_demod);
title('Sinal FSK 1 recuperado');
xlabel('Tempo (s)');
ylabel('Amplitude');
subplot(2,1,2);
plot(t, s2_demod);
title('Sinal FSK 2 recuperado');
xlabel('Tempo (s)');
ylabel('Amplitude');

disp('Sinais FSK recuperados (após PB)')
pause

figure;
subplot(2,1,1);
freqs = linspace(0, fs-fs/length(s1_demod), length(s1_demod));
plot(freqs, abs(fft(s1_demod)));
axis([0 fs 0 max(abs(fft(s1_demod)))]);
title('Espectro do sinal FSK 1 desmodulado');
xlabel('Frequência (Hz)');
ylabel('Magnitude');  
subplot(2,1,2);
plot(freqs, abs(fft(s2_demod)));
axis([0 fs 0 max(abs(fft(s2_demod)))]);
title('Espectro do sinal FSK 2 desmodulado');    
xlabel('Frequência (Hz)');
ylabel('Magnitude');

disp('Espectro dos sinais recuperados')
pause


disp("Sinal 1 demodulado e descodificado:");
disp(desmodula_fsk(s1_demod, t,fs))
disp("\nSinal 2 demodulado e descodificado:");
disp(desmodula_fsk(s2_demod, t,fs));