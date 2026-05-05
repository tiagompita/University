% ----------------------------------------------------------------------------------------------------
% Sensors and Signals Course Unit, UA/DETI
% Paulo Pedreiras, Pedro Fonseca, Luis Silva
% {pbrp,pf,lems}@ua.pt
%
% Processes an EEG signal to detect rest state
% Signal O2 (right occipital) is good for detecting alpha waves (8-13Hz), that dominates at rest.
%      Beta waves (13-30 Hz) are dominat when the subject is active
% ----------------------------------------------------------------------------------------------------

clear; clc; close all;
pkg load signal;

%% 1. Get EEG data
% Source: https://zenodo.org/records/2348892
% Eletrodes are: FP1, FP2, FC5, FC6, FZ, T7, CZ, T8, P7, P3, PZ, P4, P8, O1, Oz, and O2
% Columns 2 to 17 contain the recordings on each of the 16 EEG electrodes. 
% The first column of the matrix represents the timestamp of each observation and column 18 and 19 contain the triggers
%  for the simple resting-state eyes open/closed 
% A sampling frequency of 512 samples per second
load("subject_00.mat");           % Load file
eeg_O2 = SIGNAL(:,17);            % Get O2 signal (right occipital)
eeg_TriggerRest = SIGNAL(:,18);   % Get Rest trigger signal (annotation)
eeg_time = SIGNAL(:,1);           % Get sample timestamp
sampleSize=length(eeg_O2);        % Get number of samples of the file
fprintf("Loaded O2 data, %d samples\n",sampleSize);

%% 2. Set system parameters
Fs = 512;               % Samp frequency (Hz)
Ts = 1 / Fs;            % Sampling interval
window_size = 2;        % Analysis window, in seconds (sliding window analysis)
overlap = 0.5;          % Overlap between successive windows, in %
alpha_threshold = 0.25;  % Power threshold to consider rest situation. 

%% 3. Design filters
% BP, Alpha (8-13 Hz)
order = 100;
f_alpha = [8 13];
h_alpha = fir1(order, f_alpha/(Fs/2), 'bandpass');

% BP, Beta (13-30 Hz)
f_beta = [13 30];
h_beta = fir1(order, f_beta/(Fs/2), 'bandpass');

%% 4. Apply filters
eeg_alpha = filter(h_alpha, 1, eeg_O2);
eeg_beta = filter(h_beta, 1, eeg_O2);

% Remove leading samples, needed to fill in the filter
t = eeg_time(order:end,1);
eeg_O2_stab = eeg_O2(order:end,1);
eeg_alpha_stab = eeg_alpha(order:end,1);
eeg_beta_stab = eeg_beta(order:end,1);
N = length(eeg_alpha_stab);             % Get the number of samples to process

%% 5. Sliding window analysis
window_samples = window_size * Fs;
step_samples = window_samples * (1 - overlap);
n_windows = floor((N - window_samples) / step_samples) + 1;

% Pre-alocate vectors (just to speedup execution)
power_alpha = zeros(1, n_windows);
power_beta = zeros(1, n_windows);
power_total = zeros(1, n_windows);
alpha_ratio = zeros(1, n_windows);
is_resting = zeros(1, n_windows);
time_windows = zeros(1, n_windows);

% Compute power in each window
for i = 1:n_windows
    start_idx = round((i-1) * step_samples + 1);
    end_idx = start_idx + window_samples - 1;
    
    if end_idx > N
        break;
    end
    
    % Extract windows
    win_alpha = eeg_alpha_stab(start_idx:end_idx);
    win_beta = eeg_beta_stab(start_idx:end_idx);
    win_total = eeg_O2_stab(start_idx:end_idx);
    
    % Remove DC
    win_alpha = win_alpha - mean(win_alpha);
    win_beta = win_beta - mean(win_beta);    
    win_total = win_total - mean(win_total);
    
    % Compute power (RMS or variance)
    power_alpha(i) = rms(win_alpha)^2;
    power_beta(i) = rms(win_beta)^2;
    power_total(i) = rms(win_total)^2;
    
    % Ratio alpha/total
    alpha_ratio(i) = power_alpha(i) / power_total(i);
    
    % Rest detection
    is_resting(i) = alpha_ratio(i) > alpha_threshold;
    
    % Window central time
    time_windows(i) = t(round((start_idx + end_idx) / 2));
end

%% 6. Visualization

% Subplot 1: Raw EEG signal
subplot(5,1,1);
plot(eeg_time, eeg_O2, 'k', 'LineWidth', 0.5);
xlabel('Time (s)');
ylabel('Amplitude (μV)');
title('Sinal EEG - Canal O2 (Occipital Direito)');
grid on;
%xlim([0 duration]);

pause

% Subplot 2: filtered signals, per band
subplot(5,1,2);
hold on;
plot(t, eeg_alpha_stab, 'b', 'LineWidth', 1.2);
plot(t, eeg_beta_stab, 'r', 'LineWidth', 0.8);
xlabel('Time (s)');
ylabel('Amplitude (μV)');
title('Bandwidths');
legend('Alpha (8-13 Hz)', 'Beta (13-30 Hz)');
grid on;
%xlim([0 duration]);

% Subplot 3: Alpha vs Beta power
subplot(5,1,3);
plot(time_windows, power_alpha, 'b-o', 'LineWidth', 2, 'MarkerSize', 6); hold on;
plot(time_windows, power_beta, 'r-s', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Time (s)');
ylabel('Power');
title('Alpha and Beta power over time');
legend('Alpha power', 'Beta power');
grid on;
%xlim([0 duration]);

% Subplot 4: Rest state detection
subplot(5,1,4);
area(time_windows, is_resting, 'FaceColor', [0.3 0.7 0.3], 'FaceAlpha', 0.5);
ylim([-0.1 1.1]);
xlabel('Time (s)');
ylabel('State');
title(['Rest detection (Alpha threshold = ' num2str(alpha_threshold*100) '%)']);
yticks([0 1]);
yticklabels({'Active', 'Rest'});
grid on;
%xlim([0 duration]);

% Subplot 5: Rest state trigger (from anotation)
subplot(5,1,5);
plot(eeg_time, eeg_TriggerRest, 'g-o', 'LineWidth', 2, 'MarkerSize', 6);
xlabel('Time (s)');
ylabel('Trigger');
title('Rest trigger, from annotations');
grid on;