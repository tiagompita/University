function [PB, DB] = VideoStreamingSimulator_discrete(lambda, D_unique, Prob, B, M, N)
    ARRIVAL = 0; 
    DEPARTURE = 1; 
    Clock = 0; 
    STATE = 0; 
    TRANSMITTED = 0; 
    
    TOTAL_REQUESTS = 0;      
    BLOCKED_REQUESTS = 0;    
    AREA_STATE = 0;          
    prevClock = 0;           
    
    EventList = [ARRIVAL, Clock + exprnd(1/lambda)];
    
    % Pré-calcular a CDF para acelerar a escolha aleatória do filme
    CDF_Prob = cumsum(Prob(:)); 
    
    while TRANSMITTED < N
        EventList = sortrows(EventList, 2); 
        event = EventList(1,1);		      
        Clock = EventList(1,2);		      
        EventList(1,:) = []; 		      
    
        AREA_STATE = AREA_STATE + STATE * (Clock - prevClock);
        prevClock = Clock; 
    
        switch event
            case ARRIVAL
                TOTAL_REQUESTS = TOTAL_REQUESTS + 1;
                EventList = [EventList; ARRIVAL, Clock + exprnd(1/lambda)]; 
    
                if STATE < M
                    STATE = STATE + 1;
                    % GERAÇÃO DISCRETA DA DURAÇÃO DO FILME
                    idx = find(rand < CDF_Prob, 1);
                    duracao = D_unique(idx);
    
                    EventList = [EventList; DEPARTURE, Clock + duracao]; 
                else
                    BLOCKED_REQUESTS = BLOCKED_REQUESTS + 1; 
                end
    
            case DEPARTURE
                STATE = STATE - 1;
                TRANSMITTED = TRANSMITTED + 1;
        end
    end
    
    PB = (BLOCKED_REQUESTS / TOTAL_REQUESTS) * 100; 
    media_filmes = AREA_STATE / Clock;
    DB = media_filmes * B; 
end
