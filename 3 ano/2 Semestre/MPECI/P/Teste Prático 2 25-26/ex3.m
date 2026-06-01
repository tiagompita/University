% c) Script para estimar o atraso medio com 20 runs
lambda = 3500;
C = 10;
N = 10^4;
runs = 20;
% d)
% runs = 200; 

PAR_resultados = zeros(1, runs);

% Correr as simulações
for i = 1:runs
    PAR_resultados(i) = SimulatorB(lambda, C, N);
end

% Estatísticas
media = mean(PAR_resultados);
desvio_padrao = std(PAR_resultados);

% Usar a distribuicao Normal para 90% de confianca
z = norminv(0.95);

margem_erro = z * (desvio_padrao / sqrt(runs));

% Resultados
fprintf('Atraso Medio na Fila Estimado (PAR): %.6f seg\n', media);
fprintf('Intervalo de Confianca a 90%%: [%.6f , %.6f]\n', media - margem_erro, media + margem_erro);