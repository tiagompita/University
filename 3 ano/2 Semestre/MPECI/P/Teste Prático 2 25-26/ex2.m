% a)
lambda = 500 / 60; % conversao de req/hora para req/minuto
mu = 1 / 10;       % 1 / 10 minutos
m = 100;

% Carga do sistema (tem de ser < 1)
rho = lambda / (m * mu);

% Somatorio para o calculo da probabilidade de 0 clientes (pi0)
soma = 0;
for i = 0:(m-1)
    soma = soma + ((m*rho)^i) / factorial(i);
end

% Equação da Probabilidade de 0 clientes (pi0):
termo_m = ((m*rho)^m) / (factorial(m) * (1 - rho));
% Equação da Probabilidade de 0 clientes (pi0):
pi0 = 1 / (soma + termo_m);

% Probabilidade de ter de esperar (formula de Erlang C)
Pq = termo_m * pi0;

% Probabilidade de ser atendido imediatamente
prob_imediato = (1 - Pq) * 100;
fprintf('Pedidos atendidos imediatamente: %.4f%%\n', prob_imediato);


% b)
%Equação da TP12: WQ
Wq = (rho / (lambda * (1 - rho))) * Pq; % Resultado em minutos
Wq_segundos = Wq * 60;

fprintf('Atraso medio na fila: %.4f segundos\n', Wq_segundos);


% c) Grafico Wq em funcao de m
lambda = 500 / 60; 
mu = 1 / 10;
operadores = [90, 95, 100, 105, 110];
tempos_fila = zeros(1, length(operadores));

for k = 1:length(operadores)
    m = operadores(k);
    rho = lambda / (m * mu);
    
    soma = 0;
    for i = 0:(m-1)
        soma = soma + ((m*rho)^i) / factorial(i);
    end
    
    termo_m = ((m*rho)^m) / (factorial(m) * (1 - rho));
    pi0 = 1 / (soma + termo_m);
    Pq = termo_m * pi0;
    
    Wq = (rho / (lambda * (1 - rho))) * Pq;
    tempos_fila(k) = Wq * 60; % Guardar em segundos para o plot
end

% Construcao do grafico
bar(operadores, tempos_fila);
grid on;
xlabel('Numero de Operadores (m)');
ylabel('Tempo Medio de Espera (segundos)');