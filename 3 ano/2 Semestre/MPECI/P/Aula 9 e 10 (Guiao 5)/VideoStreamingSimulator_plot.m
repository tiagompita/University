% Assinatura alterada para devolver os vetores 't' (tempo) e 'state' (estado)
function [t, state] = VideoStreamingSimulator_plot(lambda, invmiu, B, M, N)

    % Eventos e Inicializações base (igual ao original)
    ARRIVAL= 0; 
    DEPARTURE= 1; 
    Clock= 0; 
    STATE= 0; 
    TRANSMITTED= 0; 
    
    % BOAS PRÁTICAS: Pré-alocação de memória para os vetores. 
    % Como cada filme tem 1 chegada e 1 partida, teremos no máximo ~2N eventos.
    t = zeros(1, 2*N); 
    state = zeros(1, 2*N);
    
    % Guardar o estado inicial
    t(1) = Clock;
    state(1) = STATE;
    index = 2; % Apontador para a próxima posição livre no vetor
    
    EventList= [ARRIVAL, Clock + exprnd(1/lambda)];
    
    while TRANSMITTED < N
        EventList= sortrows(EventList,2); 
        event= EventList(1,1);		      
        Clock= EventList(1,2);		      
        EventList(1,:)= []; 		      
    
        switch event
            case ARRIVAL
                EventList= [EventList; ARRIVAL, Clock + exprnd(1/lambda)]; 
                if STATE < M
                    STATE= STATE + 1;
                    EventList= [EventList; DEPARTURE, Clock + exprnd(invmiu)]; 
                end
            case DEPARTURE
                STATE= STATE - 1;
                TRANSMITTED= TRANSMITTED + 1;
        end
    
        % O QUE FALTA: Registar o histórico após processar o evento!
        % Usa a variável 'index' para guardar o Clock e o STATE atuais 
        % nos respetivos vetores, e depois incrementa o index.
        t(index) = Clock;
        state(index) = STATE;
        index = index + 1;
    end
    
    % Cortar os zeros excedentes da pré-alocação no final
    t = t(1:index-1);
    state = state(1:index-1);
end