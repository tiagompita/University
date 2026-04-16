function [s_filt, b, a] = filtra_pb(s, t)
% FILTRA_PB  Aplica um filtro passa-baixo Butterworth de 4.ª ordem
%            com frequência de corte a 100 Hz.
%
%   [s_filt, b, a] = filtra_pb(s, t)
%
%   Entradas:
%     s      - sinal a filtrar (vetor)
%     t      - vetor de instantes de tempo (s)
%
%   Saídas:
%     s_filt - sinal filtrado (vetor linha)
%     b, a   - coeficientes do filtro (úteis para inspecção ou reutilização)
%
%   Parâmetros do filtro:
%     Tipo         : Butterworth IIR
%     Ordem        : 4
%     fc           : 100 Hz
%     fs (inferida): 1 / (t(2) - t(1))
%
%   Nota: usa filtfilt para filtragem sem distorção de fase (fase zero).
%         Requer o pacote Octave "signal" (pkg load signal).

  pkg load signal

  % --- validação ---
  s = s(:)';
  t = t(:)';

  if numel(s) ~= numel(t)
    error('filtra_pb: ''s'' e ''t'' devem ter o mesmo número de elementos.');
  end

  fc = 100;                      % frequência de corte (Hz)
  fs = 1 / (t(2) - t(1));       % frequência de amostragem estimada a partir de t

  if fc >= fs / 2
    error('filtra_pb: fc=%.1f Hz viola Nyquist para fs=%.1f Hz.', fc, fs);
  end

  % --- projecto do filtro ---
  Wn = fc / (fs / 2);           % frequência de corte normalizada (0 < Wn < 1)
  ordem = 4;
  [b, a] = butter(ordem, Wn, 'low');

  % --- filtragem com fase zero ---
  s_filt = filtfilt(b, a, s);

end
