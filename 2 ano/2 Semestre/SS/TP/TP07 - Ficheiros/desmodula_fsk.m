function bits_dec = desmodula_fsk(s_mod, t, fp)
% DESMODULA_FSK  Desmodula um sinal FSK binário previamente multiplicado
%                por uma portadora cosseno a frequência fp.
%
%   bits_dec = desmodula_fsk(s_mod, t, fp)
%
%   Entradas:
%     s_mod    - sinal recebido: FSK × cos(2π·fp·t)  (vetor)
%     t        - vetor de instantes de tempo (s)
%     fp       - frequência da portadora (Hz)
%
%   Saída:
%     bits_dec - vetor linha com os 5 bits detectados (valores 0 ou 1)
%
%   Parâmetros FSK assumidos (consistentes com gera_fsk):
%     f0 = 25 Hz  →  símbolo '0'
%     f1 = 50 Hz  →  símbolo '1'
%     Duração de cada símbolo: Ts = 0.2 s
%
%   Método: correlação coerente símbolo a símbolo.
%     1. Remove a portadora multiplicando por cos(2π·fp·t) →
%        obtém-se  s_fsk(t)/2  +  componente em 2·fp (rejeitada na correlação).
%     2. Para cada símbolo, correlaciona o sinal em banda-base com
%        as duas referências cos(2π·f0·t) e cos(2π·f1·t).
%     3. Decide pelo bit cuja referência produz maior energia de correlação.

  f0     = 25;    % Hz — símbolo '0'
  f1     = 50;    % Hz — símbolo '1'
  Ts     = 0.2;   % s  — duração de cada símbolo
  Nbits  = 5;     % número de símbolos

  % --- pré-processamento ---
  s_mod = s_mod(:)';
  t     = t(:)';

  if numel(s_mod) ~= numel(t)
    error('desmodula_fsk: ''s_mod'' e ''t'' devem ter o mesmo comprimento.');
  end
  if ~isscalar(fp) || fp <= 0
    error('desmodula_fsk: ''fp'' deve ser um escalar positivo.');
  end

  fs = 1 / (t(2) - t(1));       % frequência de amostragem estimada a partir de t
  Ns = round(Ts * fs);           % amostras por símbolo

  if numel(s_mod) < Nbits * Ns
    error('desmodula_fsk: sinal demasiado curto para %d símbolos de %.1f s.', Nbits, Ts);
  end

  % --- passo 1: remoção da portadora ---
  % s_mod(t) · cos(2π·fp·t)  =  s_fsk(t)/2  +  s_fsk(t)·cos(4π·fp·t)/2
  % O segundo termo é rejeitado pela integração no passo seguinte.
  s_bb = s_mod .* cos(2*pi * fp .* t);

  % --- passo 2: correlação símbolo a símbolo ---
  bits_dec = zeros(1, Nbits);

  for k = 1 : Nbits
    idx = (k-1)*Ns + 1 : k*Ns;   % índices deste símbolo no sinal global
    seg = s_bb(idx);              % segmento em banda-base
    t_k = (0 : Ns-1) / fs;       % tempo local do símbolo (começa em 0)

    ref0 = cos(2*pi * f0 .* t_k);
    ref1 = cos(2*pi * f1 .* t_k);

    E0 = abs(dot(seg, ref0));     % energia de correlação com hipótese '0'
    E1 = abs(dot(seg, ref1));     % energia de correlação com hipótese '1'

    bits_dec(k) = double(E1 > E0);
  end

end
