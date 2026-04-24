% ----------------------------------------------------------------------------------------------------
% Sensors and Signals Course Unit, UA/DETI
% Paulo Pedreiras, Pedro Fonseca, Luis Silva
% {pbrp,pf,lems}@ua.pt
%
% TIME DOMAIN FIR AND IIR MOVING AVERAGE FILTER IMPLEMENTATION WITH NOISY SIGNAL
% This script shows and evaluates FIR + IIR MAvg filtering of a noisy signal
% ----------------------------------------------------------------------------------------------------

clear all;
close all;
clc;

fprintf('===== FILTER PERFORMANCE =====\n');

%% 1. SIGNAL GENERATION
fs = 1000;              % Sampling frequency (Hz)
T = 1/fs;               % Sampling period
L = 5000;               % Length of signal (samples)
t = (0:L-1)*T;          % Time vector

% Create a composite signal with multiple frequency components
f1 = 5;                 % Low frequency component (Hz)
f2 = 50;                % Medium frequency component (Hz)
f3 = 120;               % High frequency component (Hz)
a1 = 0.7;               % Low frequency component amplitude
a2 = 0.5;               % Medium frequency component amplitude
a3 = 0.3;               % High frequency component amplitude

% Set noise parameters
noise_power = 0.5;

% Set Mov Avg parameters
M = 51;          % Make it odd to allow symmetric calculation (lower delay)                

% Clean signal
x_clean = a1*sin(2*pi*f1*t) + a2*sin(2*pi*f2*t) + a3*sin(2*pi*f3*t);

% Add noise
noise = noise_power * randn(size(t));
x_noisy = x_clean + noise;

%---------------------------------
% Signal filtering 
%---------------------------------
% FIR FILTER DESIGN - MOVING AVERAGE
h_ma = [_____________];  % Moving average impulse response coefficients

y_ma_fir = zeros(size(x_noisy));
y_ma_iir = zeros(size(x_noisy));
 
 % Direct from time-domain equation y[n]=1/M*(x[n-(M-1)/2]+x[n-1]+....
% Simetric calculation - complicates a little bit the indexes, but reduces delay
display('Time consumed by FIR')
id=tic
p=(M-1)/2;
for n = p+1:L-p-1
    for k = -p:1:p
        y_ma_fir(n) = y_ma_fir(n) + x_noisy(n-k+1);
    end
    y_ma_fir(n) = y_ma_fir(n)/M;
end
toc(id)

% IIR FILTER DESIGN - MOVING AVERAGE
display('Time consumed by IIR')
id=tic
p = (M-1)/2;
y_ma(p+1) = sum(x_noisy(1:M)) / M;  % Optional: compute initial y[n] 
for n = p+2:L-p    
    y_ma_iir(n) = y_ma_iir(n-1) + (x_noisy(n+p) - x_noisy(n-p-1)) / M;    
end
toc(id)


%---------------------------------
% Performance analysis
%---------------------------------

% Calculate SNR improvement
SNR_input = 10*log10(var(x_clean)/var(noise));
SNR_ma_fir = 10*log10(var(x_clean(M:end)) / var(x_clean(M:end) - y_ma_fir(M:end)));
SNR_ma_iir = 10*log10(var(x_clean(M:end)) / var(x_clean(M:end) - y_ma_iir(M:end)));

fprintf('Input SNR: %.2f dB\n', SNR_input);
fprintf('Moving Average Output SNR (FIR): %.2f dB\n', SNR_ma_fir);
fprintf('Moving Average Output SNR (IIR): %.2f dB\n', SNR_ma_iir);


%---------------------------------
% Plot results
%---------------------------------

% Time domain plots
figure('Position', [100, 100, 1200, 800]);

% Plot 1,2: Original signals
subplot(2,2,1);
plot(t(1:500), x_clean(1:500), 'b', 'LineWidth', 1.5);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Clean Signal');
xlim([0 0.5]);

subplot(2,2,2);
plot(t(1:500), x_noisy(1:500), 'r', 'LineWidth', 0.8);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Noisy Signal');
xlim([0 0.5]);

% Plot 3: Moving Average Filter Results - FIR
subplot(2,2,3);
plot(t(1:500), x_noisy(1:500), 'r:', 'LineWidth', 0.5);
hold on;
plot(t(1:500), y_ma_fir(1:500), 'b', 'LineWidth', 1.5);
plot(t(1:500), x_clean(1:500), 'g--', 'LineWidth', 1);
hold off;
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title(sprintf('Moving Average Filter (M=%d) - FIR', M));
legend('Noisy', 'Filtered', 'Clean');
xlim([0 0.5]);

% Plot 4: Moving Average Filter Results - IIR
subplot(2,2,4);
plot(t(1:500), x_noisy(1:500), 'r:', 'LineWidth', 0.5);
hold on;
plot(t(1:500), y_ma_iir(1:500), 'b', 'LineWidth', 1.5);
plot(t(1:500), x_clean(1:500), 'g--', 'LineWidth', 1);
hold off;
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title(sprintf('Moving Average Filter (M=%d) - IIR', M));
legend('Noisy', 'Filtered', 'Clean');
xlim([0 0.5]);


