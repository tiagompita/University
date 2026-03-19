
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CAPÍTULO 1: SIMULAÇÃO E PROBABILIDADE (Guião 1 / TP 1 e 2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SE PERGUNTAREM POR: "Estimar por simulação a probabilidade..."
% (Ex: Lançar 3 moedas 10000 vezes e obter 2 caras, lançar dados, etc.)
% -> APLICAS ISTO: Estrutura vetorizada de Monte Carlo (muito mais rápida que ciclos for)

N_experiencias = 10000;
n_lancamentos = 3; 

% 1. Gerar valores aleatórios (linhas = tamanho da amostra, colunas = repetições)
experiencias = rand(n_lancamentos, N_experiencias); 

% 2. Aplicar condição de sucesso (ex: moeda equilibrada p=0.5)
sucessos_individuais = experiencias < 0.5; 

% 3. Somar os sucessos em cada experiência (soma as colunas)
resultados = sum(sucessos_individuais); 

% 4. Filtrar pelo evento desejado (ex: "exatamente 2" ou "pelo menos 6")
eventos_desejados = (resultados == 2); % usar >= para "pelo menos"

% 5. Calcular probabilidade final
prob_simulada = sum(eventos_desejados) / N_experiencias;


%% SE PERGUNTAREM POR: "Calcular o valor teórico/analítico" num cenário de sucessos/falhas
% -> APLICAS ISTO: Fórmula da Distribuição Binomial (nchoosek)
n = 3;      % total de ensaios
k = 2;      % sucessos desejados
p = 0.5;    % probabilidade de sucesso num ensaio
prob_teorica = nchoosek(n, k) * (p^k) * ((1-p)^(n-k));


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CAPÍTULO 2: VARIÁVEIS ALEATÓRIAS E DISTRIBUIÇÕES (Guião 2 / TP 3 e 4)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SE PEDIREM PARA: Desenhar a "Função Massa de Probabilidade" (PMF)
% -> APLICAS ISTO: Função stem()
xi = 1:6; 
prob_x = (1/6) * ones(1, 6); % Ex: dado equilibrado
stem(xi, prob_x, 'filled');
title('Função Massa de Probabilidade (PMF)');
xlabel('x'); ylabel('P(X = x)');


%% SE PEDIREM PARA: Desenhar a "Função de Distribuição Acumulada" (CDF)
% -> APLICAS ISTO: Função cumsum() combinada com stairs()
fx = cumsum(prob_x);
% O truque do [0 xi 7] é para o gráfico não ficar cortado nas bordas
stairs([0 xi 7], [0 fx 1]); 
title('Função de Distribuição Acumulada (CDF)');
xlabel('x'); ylabel('F_X(x) = P(X <= x)');


%% SE PERGUNTAREM POR: "Calcular o Valor Esperado (Média) e Variância" de uma V.A. Discreta
% -> APLICAS ISTO: Fórmulas teóricas dos Momentos
X = 0:4; 
prob_x = [0.1 0.2 0.3 0.2 0.2]; % Probabilidades dadas no enunciado

media = sum(X .* prob_x); % E[X]
% Variância = E[X^2] - (E[X])^2
variancia = sum((X.^2) .* prob_x) - (media^2);
desvio_padrao = sqrt(variancia);


%% SE PERGUNTAREM POR: Uma "Distribuição Exponencial com taxa lambda"
% -> APLICAS ISTO: Atenção à rasteira! O Matlab pede sempre a Média (mu = 1/lambda) e não o rate.
lambda = 0.2;
media_exp = 1/lambda;

% Gerar valores aleatórios:
valores_exp = exprnd(media_exp, 1, 100000); 

% Probabilidade teórica num ponto (PDF):
pdf_teorica = exppdf(2, media_exp);

% Probabilidade Acumulada (CDF) ex: P(X <= 2):
cdf_teorica = expcdf(2, media_exp); 


%% SE PERGUNTAREM POR: "Distribuição de Poisson" (Nº de erros, chegadas, chamadas)
% -> APLICAS ISTO: O parâmetro é o lambda (que é a média). Se a janela de tempo/espaço mudar, multiplica o lambda!
lambda = 0.02; % ex: erros por página

prob_exatamente_0 = poisspdf(0, lambda); % P(X = 0)
prob_no_maximo_1 = poisscdf(1, lambda);  % P(X <= 1)
prob_pelo_menos_2 = 1 - poisscdf(1, lambda); % P(X >= 2) é 1 - P(X <= 1)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CAPÍTULO 3: LIMITES E TEOREMA DO LIMITE CENTRAL (Guião 2 / TP 5)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SE PERGUNTAREM POR: "Probabilidade de a variável se desviar da média mais de X" (SEM saber a distribuição)
% -> APLICAS ISTO: Desigualdade de Chebyshev (Garante um limite máximo/mínimo)
% Fórmula: P(|X - mu| >= a) <= Variancia / a^2
a = 10; % Distância pedida à média
var_conhecida = 9;
prob_maxima = var_conhecida / (a^2);


%% SE PERGUNTAREM POR: "Probabilidade do total/soma de N coisas" (Ex: peso de 100 bolachas)
% -> APLICAS ISTO: Teorema do Limite Central (TLC). A soma transforma-se numa Distribuição Normal.
n = 100; % Tem de ser > 30 para o TLC ser válido
mu_soma = n * 20;       % N * média_individual
var_soma = n * 9;       % N * variância_individual
desvio_soma = sqrt(var_soma);

% Probabilidade do total estar entre A e B (normcdf)
valor_A = 1970; 
valor_B = 2030;
prob_TLC = normcdf(valor_B, mu_soma, desvio_soma) - normcdf(valor_A, mu_soma, desvio_soma);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CAPÍTULO 4: CADEIAS DE MARKOV (Guião 3 / TP 6.1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SE PEDIREM PARA: "Construir a Matriz de Transição T"
% -> APLICAS ISTO: REGRA DE OURO -> Colunas = Origem, Linhas = Destino.
% Se o enunciado der uma tabela onde as LINHAS somam 1 (Ex: Dia atual na linha), tens de fazer a TRANSPOSTA (')!
T = [0.7 0.2 0.1;  % Tabela lida na horizontal
     0.2 0.3 0.5; 
     0.3 0.3 0.4]'; % A plica a transposta para as colunas somarem 1
     
% Validação obrigatória: sum(T) tem de dar tudo 1.


%% SE PERGUNTAREM POR: "Qual a probabilidade / estado após N iterações (dias/aulas)?"
% -> APLICAS ISTO: T^N * vetor_inicial
v0 = [1; 0; 0]; % Estado inicial (Ex: Dia 1 foi 100% Sol)
N_saltos = 30;
estado_futuro = (T^N_saltos) * v0;


%% SE PERGUNTAREM POR: "Número médio esperado de dias num estado num certo mês/período"
% -> APLICAS ISTO: Acumulador dentro de um ciclo for
dias_totais = 31;
media_dias = zeros(size(T, 1), 1); % Usar size() para não dar hardcode

for i = 1:dias_totais
    media_dias = media_dias + (T^(i-1)) * v0;
end


%% SE PERGUNTAREM POR: "Probabilidades limite / Distribuição Estacionária" (Processo NÃO Iterativo)
% -> APLICAS ISTO: Resolver o sistema (T - I)x = 0 forçando a soma a dar 1. 
% Usa sempre a Divisão à Esquerda (\) em vez de inv() para não perderes precisão.
N_estados = size(T, 1);
Z = T - eye(N_estados);
Z(N_estados, :) = 1;        % Substituir última linha da matriz por 1s
b = zeros(N_estados, 1);
b(N_estados) = 1;           % Forçar a igualdade da soma a 1

prob_limite = Z \ b;


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %% CAPÍTULO 5: PAGERANK (Guião 3 / TP 6.2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% SE PERGUNTAREM POR: "Criar a matriz Google A resolvendo Spider Traps e Dead-Ends"
% -> APLICAS ISTO: 
% 1. Constróis a matriz H olhando para as setas (se uma página aponta para 3, mete 1/3 nas três linhas dessa coluna).
% Matriz de exemplo:
H = [0 0 0 0 1/3 0;
     1 0 0 0 1/3 0;
     0 1/2 0 1 0 0;
     0 0 1 0 0 0;
     0 1/2 0 0 0 0;
     0 0 0 0 1/3 0];

N_pages = size(H, 1);

% 2. Identificar e corrigir Dead-Ends (Colunas com soma zero, ex: página F)
% Solução: Preencher a coluna inteira com 1/N
H(:, 6) = 1/N_pages;

% 3. Resolver Spider Traps calculando a Matriz Google
beta = 0.85;
A = beta * H + (1 - beta) * (1/N_pages) * ones(N_pages, N_pages);


%% SE PERGUNTAREM POR: "Estimar o PageRank (método iterativo) com critério de paragem"
% -> APLICAS ISTO: Ciclo while avaliando a diferença máxima (max(abs(...))). 
% Nunca avalies o vetor diretamente na condição!
v_inicial = ones(N_pages, 1) / N_pages;
atual = v_inicial;
anterior = zeros(N_pages, 1);
iteracoes = 0;
tolerancia = 0.01; % ou 1e-4, depende do enunciado

% Corre enquanto a maior diferença entre elementos for > tolerância
while max(abs(atual - anterior)) > tolerancia
    iteracoes = iteracoes + 1;
    anterior = atual;
    atual = A * anterior; % É muito mais eficiente fazer A * vetor do que A^n
end

disp(['Número de iterações: ', num2str(iteracoes)]);
disp('Vetor PageRank Final:');
disp(atual);