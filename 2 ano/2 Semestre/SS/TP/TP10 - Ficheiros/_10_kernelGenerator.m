% ----------------------------------------------------------------------------------------------------
% Sensors and Signals Course Unit, UA/DETI
% Paulo Pedreiras, Pedro Fonseca, Luis Silva
% {pbrp,pf,lems}@ua.pt
%
% Computation of Impulse Response Coefficients
% for a LP Sync-Windowed filter, Hamming Window 
% ----------------------------------------------------------------------------------------------------
% Filter Specifications
Fs = 100;            % Sampling frequency (Hz)
Fc = 20;             % Cutoff frequency (Hz)
M = 100;               % Filter order (number of taps - 1)
T='H';                % Choose B for Blackman, H for Hamming

nFc = Fc / Fs;        % Compute normalized cutoff frequency
h = zeros(1,M+1);     % Init vector that holds kernel coefficientes (speedup)
p=M/2;                % aux variable - index offset limit

% Compute the kernel coefficients
if T=='B'   % Blackman windowing
  display('Blackman')
  for n=0:M    
    h(n+1)=(sin(2*pi*nFc*(n-p))/(n-p))*(0.42-0.5*cos(2*pi*n/M)+0.07*cos(4*pi*n/M));    
  endfor
  h(p+1)=2*pi*nFc;
endif

if T=='H'   % Hamming windowing
  display('Hamming')
  for n=0:M    
    h(n+1)= (sin(2*pi*nFc*(n-p))/(n-p))*(0.54 - 0.46*cos(2*pi*n/M));    
  endfor  
  h(p+1)=2*pi*nFc;
endif

% Normalize (Make DC gain 1)
K=sum(h);
h=h./K;

% Display the coefficients
fprintf("Impulse Response Coefficients for fc=%d Hz, fs=%d Hz and order %d:\n",Fc, Fs, M);
fprintf("[");
for n=1:length(h)-1
  fprintf("%16.15f, ",h(n));
end
fprintf("%16.15f];\n", h(end));

% Plot the frequency response of the filter 
[H, f] = freqz(h, 1, 2048, Fs);
% Magnitude response
subplot(2,1,1);
plot(f, 20*log10(abs(H)), 'b', 'LineWidth', 1.5);
grid on;
hold on;
plot([Fc Fc], [-80 5], 'g--', 'LineWidth', 2);
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
title(sprintf("Filter Frequency Response - Magnitude, Fs=%d, Fc=%d, Type=%c", Fs, Fc, T));

% Phase response
subplot(2,1,2);
plot(f, unwrap(angle(H))*180/pi, 'b', 'LineWidth', 1.5);
hold on;
grid on;
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');
title('Filter Frequency Response - Phase');

