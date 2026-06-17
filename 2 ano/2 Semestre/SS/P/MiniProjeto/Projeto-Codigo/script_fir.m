%
% script para gerar os fir
%
% pkg install -forge control
% pkg install -forge signal

fs = 20000; % Frequencia de amostragem definida no ESP32 (MICEX_ADC_SAMPLE_FREQ)
N = 100;    % Ordem do filtro

f0 = 500;   % Frequência do Símbolo 0 (Hz)
f1 = 1360;  % Frequência do Símbolo 1 (Hz)
f2 = 2220;  % Frequência do Símbolo 2 (Hz)

% Largura de banda
bw = 200;

% Frequência de Nyquist
nyq = fs / 2;

% Calculo do coeficientes
h0 = fir1(N, [(f0 - bw/2)/nyq, (f0 + bw/2)/nyq], 'bandpass');
h1 = fir1(N, [(f1 - bw/2)/nyq, (f1 + bw/2)/nyq], 'bandpass');
h2 = fir1(N, [(f2 - bw/2)/nyq, (f2 + bw/2)/nyq], 'bandpass');

% imprimir os coeficientes
function print_c_array(name, h)
    printf('__attribute__((aligned(16))) float %s[] = {', name);
    for i = 1:length(h)
        printf('%.20f', h(i));
        if i < length(h)
            printf(', ');
        end
    end
    printf('};\n\n');
end

print_c_array('fir_symb0', h0);
print_c_array('fir_symb1', h1);
print_c_array('fir_symb2', h2);
