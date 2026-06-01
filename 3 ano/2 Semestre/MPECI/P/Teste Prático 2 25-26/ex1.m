% b)
Q = zeros(7,7);

% Preencher as taxas de transicao (falhas e reparações)
Q(1,1) = -6/120; Q(1,2) = 6/120;
Q(2,1) = 2; Q(2,2) = -(2 + 5/120); Q(2,3) = 5/120;
Q(3,2) = 4; Q(3,3) = -(4 + 4/120); Q(3,4) = 4/120;
Q(4,3) = 6; Q(4,4) = -(6 + 3/120); Q(4,5) = 3/120;
Q(5,4) = 6; Q(5,5) = -(6 + 2/120); Q(5,6) = 2/120;
Q(6,5) = 6; Q(6,6) = -(6 + 1/120); Q(6,7) = 1/120;
Q(7,6) = 6; Q(7,7) = -6;

% Para resolver pi * Q = 0 fazemos a transposta e substituimos a 
% ultima linha pela condicao de normalizacao (soma das prob = 1)
A = Q';
A(7,:) = ones(1,7);
b = zeros(7,1);
b(7) = 1;

pi = A \ b;
pi_perc = pi * 100;

fprintf('Prob do Estado 1: %.6f%%\n', pi_perc(2));
fprintf('Prob do Estado 2: %.6f%%\n', pi_perc(3));

% c)
% Quantidade de tecnicos ocupados em cada estado (de 0 a 6)
tecnicos_ativos = [0, 1, 2, 3, 3, 3, 3]; 

% Valor esperado (media)
media_tecnicos = sum(tecnicos_ativos .* pi');

probabilidade_zero_tecnicos = pi_perc(1);

fprintf('Media de tecnicos ocupados: %.6f\n', media_tecnicos);
fprintf('Probabilidade de 0 tecnicos ocupados: %.6f%%\n', probabilidade_zero_tecnicos);