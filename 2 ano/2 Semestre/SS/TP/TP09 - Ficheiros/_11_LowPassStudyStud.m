% ----------------------------------------------------------------------------------------------------
% Sensors and Signals Course Unit, UA/DETI
% Paulo Pedreiras, Pedro Fonseca, Luis Silva
% {pbrp,pf,lems}@ua.pt
%
% FIR Low-Pass Filter Analysis Script
% Sampling frequency: 1 kHz, Cutoff frequency: 50 Hz
% ----------------------------------------------------------------------------------------------------

clear all;
close all;
clc;

% Filter coefficients (49-tap FIR with Hamming window, fc = 50 Hz)
h = [_______________];

% Sampling frequency
fs = 1000; % Hz
T = 1/fs;  % Sampling period

% User input
fprintf('\n--- FIR Low-Pass Filter, fs = 1 kHz, fc = 50 Hz---\n');
amplitude = input('Enter sinusoid amplitude: ');
frequency = input('Enter sinusoid frequency (0-480 Hz): ');

% Validate frequency
if frequency < 0 || frequency > 480
    error('Frequency must be between 0 and 480 Hz');
end

% Generate time vector (simulate for 0.5 seconds)
duration = 0.5;
t = 0:T:duration-T;
N = length(t);

% Generate input sinusoid
x = amplitude * sin(2*pi*frequency*t);

% Filter the signal
y = filter(h, 1, x);

% Allow filter to settle (skip transient response)
settling_samples = length(h);
steady_start = settling_samples + 1;

% Compute output amplitude (from steady-state portion)
if N > steady_start
    y_steady = y(steady_start:end);
    output_amplitude = max(abs(y_steady));
else
    output_amplitude = max(abs(y));
end

% Calculate attenuation
attenuation_dB = 20*log10(output_amplitude/amplitude);
gain = output_amplitude/amplitude;

% Display results
fprintf('\n--- Filter Analysis Results ---\n');
fprintf('Cutoff frequency: 50 Hz\n');
fprintf('Input amplitude:  %.4f\n', amplitude);
fprintf('Input frequency:  %.2f Hz\n', frequency);
fprintf('Output amplitude: %.4f\n', output_amplitude);
fprintf('Gain:             %.4f (%.2f dB)\n', gain, attenuation_dB);

% Plot results
figure('Position', [100, 100, 1200, 800]);

% Plot input signal
subplot(3,1,1);
plot(t*1000, x, 'b', 'LineWidth', 1.5);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
title(sprintf('Input Signal: %.2f Hz, Amplitude = %.2f', frequency, amplitude));

% Plot output signal
subplot(3,1,2);
plot(t*1000, y, 'r', 'LineWidth', 1.5);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
title(sprintf('Output Signal: Amplitude = %.4f', output_amplitude));

% Plot both signals overlaid (zoomed to steady state)
subplot(3,1,3);
plot(t*1000, x, 'b', 'LineWidth', 1.5);
hold on;
plot(t*1000, y, 'r', 'LineWidth', 1.5);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
title('Input (blue) vs Output (red)');
legend('Input', 'Output');
hold off;

% Plot frequency response
figure('Position', [150, 150, 1000, 600]);

% Compute frequency response
[H, f] = freqz(h, 1, 2048, fs);

% Magnitude response
subplot(2,1,1);
plot(f, 20*log10(abs(H)), 'b', 'LineWidth', 1.5);
hold on;
plot([50 50], [-80 5], 'g--', 'LineWidth', 2);
plot([frequency frequency], [-80 5], 'r--', 'LineWidth', 2);
plot(frequency, 20*log10(abs(H(find(f>=frequency, 1)))), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('Filter Frequency Response - Magnitude (Cutoff = 50 Hz)');
xlim([0 500]);
ylim([-80 5]);
legend('Filter Response', 'Cutoff (50 Hz)', sprintf('Input Freq = %.2f Hz', frequency));

% Phase response
subplot(2,1,2);
plot(f, unwrap(angle(H))*180/pi, 'b', 'LineWidth', 1.5);
hold on;
plot([frequency frequency], [min(unwrap(angle(H))*180/pi) max(unwrap(angle(H))*180/pi)], 'r--', 'LineWidth', 2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
title('Filter Frequency Response - Phase');
xlim([0 500]);
