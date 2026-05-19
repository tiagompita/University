% ----------------------------------------------------------------------------------------------------
% Sensors and Signals Course Unit, UA/DETI
% Paulo Pedreiras, Pedro Fonseca, Luis Silva
% {pbrp,pf,lems}@ua.pt
%
% Processes an EEG signal to separate Alpha and Beta waves
% Base filter: Low-pass, 101-tap FIR with Hamming window, 
%              Sampling frequency: 100 Hz, Cutoff frequency: 14 Hz
% ----------------------------------------------------------------------------------------------------

clear all;
close all;
clc;

% LP kernel filter coefficients (101-tap FIR with Hamming window, fc = 14 Hz, fs = 100 Hz)
h_lp = ____; 
     
% Sampling frequency
fs = 100;   % Sampling freq. Hz
T = 1/fs;   % Sampling period
fc = 14;    % Cutoff frequency, Hz

% Convert impulse response to high-pass, using spectral inversion
kernelLen=length(h_lp);
midp_h = (kernelLen-1)/2;         % Get the middle point of the filter kernel
h_hp = ___;                     % Reverse signal
h_hp(midp_h+1) = ____;  % And add one to the central sample

% Plot Frequency response of LP and HP filters 
[H, f] = freqz(h_lp, 1, 2048, fs);
% Magnitude response
subplot(2,1,1);
plot(f, 20*log10(abs(H)), 'b', 'LineWidth', 1.5);
grid on;
hold on;
plot([fc fc], [-80 5], 'g--', 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title(sprintf("LPFilter Frequency Response (Mag), Fs=%d, Fc=%d, Type=Sinc-Hamming, order=100", fs, fc));
axis([0 fs/2 -80 20])

[H, f] = freqz(h_hp, 1, 2048, fs);
% Magnitude response
subplot(2,1,2);
plot(f, 20*log10(abs(H)), 'b', 'LineWidth', 1.5);
grid on;
hold on;
plot([fc fc], [-80 5], 'g--', 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title(sprintf("HP Filter Frequency Response (Mag), using spectral inversion", fs, fc));
axis([0 fs/2 -80 20])

% Generate input sinusoid
simTime = 50;
amplitude = 1;
falpha=9;
fbeta=19;

t = 0:T:simTime;
xalpha = amplitude * sin(2*pi*falpha*t);
xbeta = amplitude * sin(2*pi*fbeta*t);

% Filter both signals via both filters to see the attenuation
y_alpha_lp = filter(h_lp, 1, xalpha);  % Low pass filter, alpha signal
y_alpha_hp = filter(h_hp, 1, xalpha);  % High pass filter, alpha signal
y_beta_lp = filter(h_lp, 1, xbeta);  % Low pass filter, beta signal
y_beta_hp = filter(h_hp, 1, xbeta);  % High pass filter, beta signal

% Plot the signals
figure()
subplot(3,1,1);
plot(t,xalpha,'-b', t, xbeta,'-r');
xlim([100*T 300*T])
grid on;
xlabel('Time)');
ylabel('Amplitude');
title(sprintf('Synthetic alpha and beta waves - init signals'));
legend('Alpha','Beta');

subplot(3,1,2);
plot(t,y_alpha_lp,'-b', t, y_beta_lp,'-r');
xlim([100*T 300*T])
grid on;
xlabel('Time');
ylabel('Amplitude');
title(sprintf('Filtered signal - Low Pass Filter output'));
legend('Alpha','Beta');

subplot(3,1,3);
plot(t,y_alpha_hp,'-b', t, y_beta_hp,'-r');
xlim([100*T 300*T])
grid on;
xlabel('Time');
ylabel('Amplitude');
title(sprintf('Filtered signal - High Pass Filter output'));
legend('Alpha','Beta');
