n_bits = 15;
p_erro = 0.1;
N = 1e5;

% a)
experiencias = rand(n_bits, N);

bits_erro = experiencias < p_erro;

X_sim = sum(bits_erro);


% b)

media_sim = mean(X_sim)
var_sim = var(X_sim)

% c)

P_X0 = binopdf(0, n_bits, p_erro)
P_X2 = binopdf(2, n_bits, p_erro)
P_X4 = binopdf(4, n_bits, p_erro)
P_X10 = binopdf(10, n_bits, p_erro)

media_teorica = n_bits * p_erro                % E[X] = n*p
var_teorica = n_bits * p_erro * (1 - p_erro)   % % Var(X) = n*p*(1-p)


% d) 
% Obtivemos para a média e variância através da simulação de valores 
% praticamente idênticos aos valores teóricos da distribuição Binomial. 
% As diferenças justificam-se pelo ruído estatístico. A semelhança 
% entre os valores comprova a Lei dos Grandes Números, demonstrando que, 
% para um número elevado de iterações, os valores simulados convergem com 
% grande precisão para os verdadeiros momentos teóricos.