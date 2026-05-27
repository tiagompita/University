%% Exercicio 1

% sick and positive P(P | S) = 97%       // sick and negative P(N | S) 3%
% healthy and negative P(N | H) = 92%    // healthy and positive P(P | H) 8%
% P(S) = 2%     // P(H) 98%

% a)

% P(S | P) = (P(P | S) * P(S) ) / P(P)
%          = (0.97 * 0.02) / 0.0978 
%          = 0.1984 = 19.84%


% P(P) = P(P | S) * P(S) + P(P | H) * P(H)
%      = 0.97 * 0.02 + 0.08 * 0.98
%      = 0.0978


% b)

N = 1e5;
P_S = 0.02;
P_H = 0.98;
P_PS = 0.97;
P_NS = 0.03;
P_PH = 0.08;
P_NH = 0.92;

populacao = rand(1, N) < P_S;

rand_testes = rand(1,N);

positivos = ((populacao == 1) & (rand_testes < P_PS)) | ((populacao == 0) & (rand_testes < P_PH));

casos_fav = sum(populacao == 1 & positivos == 1);
casos_possiveis = sum(positivos == 1);

prob_sim = casos_fav / casos_possiveis

%c 
% Obtemos por simulação uma prob = 0.1976, por teoria prob = 0.1984. 
% A pequena diferença observada deve-se apenas à variância estatística da simulação.
% 
