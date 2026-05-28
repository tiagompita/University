function [AM, PD] = LinkSimulator_PD(lambda, C, F, N, sizes, probs)
    % Inicialização de Eventos
    ARRIVAL = 0;       
    DEPARTURE = 1;     
    
    Clock = 0;            
    STATE = 0;           
    QUEUE_N = 0;          
    DELAYS = 0;           
    TRANSMITTED = 0;      
    QUEUE = [];           
    
    % Novos contadores para o cálculo do Packet Drop
    TOTAL_ARRIVALS = 0;
    DROPPED = 0;
    
    CDF_Prob = cumsum(probs(:));
    
    tmp = Clock + exprnd(1/lambda);
    EventList = [ARRIVAL, tmp, tmp];
    
    while TRANSMITTED < N
        EventList = sortrows(EventList, 2);  
        Event = EventList(1,1);             
        Clock = EventList(1,2);             
        ArrInstant = EventList(1,3);        
        EventList(1,:) = [];                
    
        switch Event
            case ARRIVAL
                % Contabiliza-se que um pacote tentou entrar no sistema
                TOTAL_ARRIVALS = TOTAL_ARRIVALS + 1;
    
                tmp = Clock + exprnd(1/lambda);
                EventList = [EventList; ARRIVAL, tmp, tmp];
    
                if STATE == 0
                    STATE = 1;
                    idx = find(rand < CDF_Prob, 1);
                    p_size = sizes(idx);
                    tTime = 8 * p_size / (C * 1e6);   % em segundos
                    EventList = [EventList; DEPARTURE, Clock + tTime, ArrInstant];
                else
                    if QUEUE_N < F
                        QUEUE_N = QUEUE_N + 1;
                        QUEUE = [QUEUE; ArrInstant];
                    else
                        % O servidor está ocupado e a fila está cheia. Ocorre DROP.
                        DROPPED = DROPPED + 1;
                    end
                end
    
            case DEPARTURE
                DELAYS = DELAYS + (Clock - ArrInstant);
                TRANSMITTED = TRANSMITTED + 1;
    
                if QUEUE_N > 0
                    QInstant = QUEUE(1);
                    idx = find(rand < CDF_Prob, 1);
                    p_size = sizes(idx);
                    tTime = 8 * p_size / (C * 1e6);   
                    EventList = [EventList; DEPARTURE, Clock + tTime, QInstant];
    
                    QUEUE_N = QUEUE_N - 1;
                    QUEUE(1) = [];
                else
                    STATE = 0;
                end
        end
    end
    
    AM = DELAYS / TRANSMITTED;
    PD = (DROPPED / TOTAL_ARRIVALS) * 100;
end