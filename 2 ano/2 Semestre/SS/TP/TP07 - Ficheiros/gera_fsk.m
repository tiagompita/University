function [s, t] = gera_fsk(bits, fs)
% GERA_FSK  Gera um sinal FSK binário a partir de um vetor de símbolos.
%
%   [s, t] = gera_fsk(bits)
%   [s, t] = gera_fsk(bits, fs)
%
%   Entradas:
%     bits  - vetor linha/coluna de 5 símbolos binários (0 ou 1)
%     fs    - frequência de amostragem em Hz (opcional; padrão: 1000 Hz)
%
%   Saídas:
%     s     - sinal FSK (vetor linha)
%     t     - vetor de instantes de tempo correspondentes (vetor linha)
%
%   Parâmetros FSK:
%     f0 = 25 Hz  →  símbolo '0'
%     f1 = 50 Hz  →  símbolo '1'
%     Duração de cada símbolo: Ts = 0.2 s

  if nargin < 2
    fs = 3000;          % frequência de amostragem por defeito (Hz)
  end

  f0 = 25;              % frequência para o símbolo 0 (Hz)
  f1 = 50;              % frequência para o símbolo 1 (Hz)
  Ts = 0.2;             % duração de cada símbolo (s)

  % --- validação ---
  bits = bits(:)';      % garante vetor linha
  if numel(bits) ~= 5
    error('gera_fsk: o vetor ''bits'' deve ter exactamente 5 elementos.');
  end
  if any(bits ~= 0 & bits ~= 1)
    error('gera_fsk: todos os elementos de ''bits'' devem ser 0 ou 1.');
  end

  % --- geração símbolo a símbolo ---
  Ns = round(Ts * fs);  % número de amostras por símbolo
  s  = zeros(1, 5 * Ns);
  t  = (0 : 5*Ns - 1) / fs;

  for k = 1 : 5
    idx = (k-1)*Ns + 1 : k*Ns;          % índices deste símbolo
    t_k = (0 : Ns-1) / fs;              % tempo local (começa em 0)
    f_k = f0 + bits(k) * (f1 - f0);     % 25 Hz se 0, 50 Hz se 1
    s(idx) = cos(2*pi * f_k .* t_k);
  end

end
