% ----------------------------------------------------------------------------------------------------
% Sensors and Signals Course Unit, UA/DETI
% Paulo Pedreiras, Pedro Fonseca, Luis Silva
% {pbrp,pf,lems}@ua.pt
%
% Low-pass to high-pass conversion using spectral inversion
% Base filter: Low-pass, 49-tap FIR with Hamming window, 
%              Sampling frequency: 1 kHz, Cutoff frequency: 50 Hz
% ----------------------------------------------------------------------------------------------------

clear all;
close all;
clc;

% 1 - Generate the low-pass filter
% Filter coefficients (49-tap FIR with Hamming window, fc = 50 Hz)
h_lp = [______________];
     
% NORMALIZE the low-pass filter to unity gain at DC
% VERY IMPORTANT - if not done spectral inversion does not work
h_lp = h_lp / sum(h_lp);

% Sampling frequency
fs = 1000; % Hz
T = 1/fs;  % Sampling period

% 2- Convert impulse response to high-pass, using spectral inversion
kernelLen=length(h_lp);
midp_h = (kernelLen-1)/2;         % Get the middle point of the filter kernel
h_hp = -h_lp;                     % Reverse signal
h_hp(midp_h+1) = h_hp(midp_h+1) + 1;  % And add one to the central sample

% User input
fprintf('\n--- LP to HP conversion by spectral inversion, fs = 1 kHz, fc = 50 Hz---\n');
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
y_lp = filter(h_lp, 1, x);  % Low pass filter
y_hp = filter(h_hp, 1, x);  % High pass filter

% Allow filter to settle (skip transient response)
settling_samples = length(h_lp);
steady_start = settling_samples + 1;

% Compute output amplitude (from steady-state portion)
if N > steady_start
    y_steady_lp = y_lp(steady_start:end);
    output_amplitude_lp = max(abs(y_steady_lp));
    
    y_steady_hp = y_hp(steady_start:end);
    output_amplitude_hp = max(abs(y_steady_hp));
    
else
    output_amplitude_lp = max(abs(y_lp));
    output_amplitude_hp = max(abs(y_hp));
end

% Calculate attenuation
attenuation_dB_lp = 20*log10(output_amplitude_lp/amplitude);
gain_lp = output_amplitude_lp/amplitude;

attenuation_dB_hp = 20*log10(output_amplitude_hp/amplitude);
gain_hp = output_amplitude_hp/amplitude;

% Display results
fprintf('\n--- Filter Analysis Results ---\n');
fprintf('Cutoff frequency: 50 Hz\n');
fprintf('Input amplitude:  %.4f\n', amplitude);
fprintf('Input frequency:  %.2f Hz\n', frequency);
fprintf('Output amplitude - low pass : %.4f\n', output_amplitude_lp);
fprintf('Gain - low pass.............: %.4f (%.2f dB)\n', gain_lp, attenuation_dB_lp);
fprintf('Output amplitude - high pass: %.4f\n', output_amplitude_lp);
fprintf('Gain - high pass............: %.4f (%.2f dB)\n', gain_lp, attenuation_dB_lp);

% Plot results
figure('Position', [100, 100, 1200, 800]);

% Plot input signal
subplot(3,1,1);
plot(t*1000, x, 'b', 'LineWidth', 1.5);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
title(sprintf('Input Signal: %.2f Hz, Amplitude = %.2f', frequency, amplitude));

% Plot output signals
subplot(3,1,2);
plot(t*1000, y_lp, 'r', 'LineWidth', 1.5, t*1000, y_hp, 'k', 'LineWidth', 1.5);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
legend('Output: low pass (red)','Output: high pass (black)');
title(sprintf('Output Signals: low and high pass filters'));

% Plot both signals overlaid (zoomed to steady state)
subplot(3,1,3);
plot(t*1000, x, 'b', 'LineWidth', 1.5);
hold on;
plot(t*1000, y_lp, 'r', 'LineWidth', 1.5);
plot(t*1000, y_hp, 'k', 'LineWidth', 1.5);
grid on;
xlabel('Time (ms)');
ylabel('Amplitude');
title('Input vs Output');
legend('Input', 'Output: low pass','Output: high pass' );
hold off;

% Plot frequency response
figure('Position', [150, 150, 1000, 600]);

% Compute frequency response
[H_lp, f_lp] = freqz(h_lp, 1, 2048, fs);
[H_hp, f_hp] = freqz(h_hp, 1, 2048, fs);

% Magnitude response
subplot(2,1,1);
plot(f_lp, 20*log10(abs(H_lp)), 'b', 'LineWidth', 1.5);
hold on;
plot([50 50], [-80 5], 'g--', 'LineWidth', 2);    % Draw line with cutoff freq.
plot([frequency frequency], [-80 5], 'r--', 'LineWidth', 2); % Draw line with input sin. freq.
plot(frequency, 20*log10(abs(H_lp(find(f_lp>=frequency, 1)))), 'ro', 'MarkerSize', 10, 'LineWidth', 2); % Draw circle on the input frequency graph
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('LP Filter Frequency Response - Magnitude (Cutoff = 50 Hz)');
xlim([0 500]);
ylim([-80 5]);
legend('Filter Response', 'Cutoff (50 Hz)', sprintf('Input Freq = %.2f Hz', frequency));


subplot(2,1,2);
plot(f_hp, 20*log10(abs(H_hp)), 'b', 'LineWidth', 1.5);
hold on;
plot([50 50], [-80 5], 'g--', 'LineWidth', 2);    % Draw line with cutoff freq.
plot([frequency frequency], [-80 5], 'r--', 'LineWidth', 2); % Draw line with input sin. freq.
plot(frequency, 20*log10(abs(H_hp(find(f_hp>=frequency, 1)))), 'ro', 'MarkerSize', 10, 'LineWidth', 2);
grid on;
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title('HP Filter Frequency Response - Magnitude (Cutoff = 50 Hz)');
xlim([0 500]);
ylim([-80 5]);
legend('Filter Response', 'Cutoff (50 Hz)', sprintf('Input Freq = %.2f Hz', frequency));
