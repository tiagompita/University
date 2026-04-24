% ----------------------------------------------------------------------------------------------------
% Sensors and Signals Course Unit, UA/DETI
% Paulo Pedreiras, Pedro Fonseca, Luis Silva
% {pbrp,pf,lems}@ua.pt
%
% Computation of Impulse Response Coefficients
% for a LP FIR filter, Sync- Windowed
% ----------------------------------------------------------------------------------------------------

% Filter Specifications
pkg load signal
Fs = 2000;           % Sampling frequency (Hz)
Fc = 200;            % Cutoff frequency (Hz)
order = 50;          % Filter order (number of taps - 1)

% Calculate the Nyquist frequency
Nyquist = Fs / 2;

% Normalized cutoff frequency for fir1
%   Ranges from 0 to 1, 1 being the Nyquist frequency, i.e. half of the sampling rate
Wn = Fc / Nyquist;   

% Generate the coefficients
% fir1 automatically designs a low-pass filter with DC gain = 1
h_generated = fir1(order, Wn);

% Display the coefficients
fprintf("Impulse Response Coefficients for fc=%d Hz, fs=%d Hz and order %d:\n",Fc, Fs, order);
disp(h_generated(:)); % Prints as a column vector
fprintf("[");
for n=1:length(h_generated)-1
  fprintf("%16.15f, ",h_generated(n));
end
fprintf("%16.15f];\n", h_generated(end));
