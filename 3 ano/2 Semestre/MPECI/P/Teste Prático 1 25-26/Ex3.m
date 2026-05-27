

% a)
T = [0.25 0.5  0;
     0.25 0.25 0;
     0.5  0.25 1];

% b) Sequencia 1101

% Começa em 1, logo prob = 1
p_1to1 = T(2,2);
p_1to0 = T(1,2);
p_0to1 = T(2,1);
p_1toF = T(3,2);

prob_seq1101 = (p_1to1 * p_1to0 * p_0to1 * p_1toF) * 100


% c)

% Estado inicial 0 1 F
vi = [0.5; 0.5; 0];

v3 = (T^3) * vi;

v4 = (T^4) * vi;

prob_c = (v4(3) - v3(3)) * 100



% d)

H = [0   0 0 0   1/2;
     1/3 0 0 0   0;
     0   1 0 1/2 0;
     1/3 0 1 0   1/2;
     1/3 0 0 1/2 0];
% Como nao há dead-ends, nao é necessário alterar a matriz H

beta = 0.85;
N = 5;

% Google matrix
A = beta * H + (1 - beta) * (1/N) * ones(N, N);

Z = A - eye(N); % (A - I)
Z(N, :) = 1;    % Forçar a soma das prob a 1
b = [0; 0; 0; 0; 1]; % (A - I) x = b

pagerank = Z \ b