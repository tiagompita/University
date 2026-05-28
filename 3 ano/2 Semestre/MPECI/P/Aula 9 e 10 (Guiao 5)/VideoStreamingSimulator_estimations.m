function [PB, DB] = VideoStreamingSimulator_estimations(lambda, invmiu, B, M, N)
    % Inicializações base dos eventos
    ARRIVAL= 0; 
    DEPARTURE= 1; 
    Clock= 0; 
    STATE= 0; 
    TRANSMITTED= 0; 
    
    % Contadores estatísticos para o Exercício 2
    TOTAL_REQUESTS = 0;      
    BLOCKED_REQUESTS = 0;    
    AREA_STATE = 0;          
    prevClock = 0;           

    EventList= [ARRIVAL, Clock + exprnd(1/lambda)];
    
    while TRANSMITTED < N
        EventList= sortrows(EventList,2); 
        event= EventList(1,1);		      
        Clock= EventList(1,2);		      
        EventList(1,:)= []; 		      
        
        % [Lógica do DB]: Integração temporal. 
        % Somamos a área do estado que se manteve inalterado desde o último evento.
        AREA_STATE = AREA_STATE + STATE * (Clock - prevClock);
        
        % Guardamos a marca de tempo atual para o próximo ciclo
        prevClock = Clock; 

        switch event
            case ARRIVAL
                % [Lógica da PB]: Contabiliza todas as chegadas
                TOTAL_REQUESTS = TOTAL_REQUESTS + 1;
                
                EventList= [EventList; ARRIVAL, Clock + exprnd(1/lambda)]; 
                
                if STATE < M
                    STATE= STATE + 1;
                    EventList= [EventList; DEPARTURE, Clock + exprnd(invmiu)]; 
                else
                    % [Lógica da PB]: O servidor está cheio, o pedido é bloqueado
                    BLOCKED_REQUESTS = BLOCKED_REQUESTS + 1; 
                end
                
            case DEPARTURE
                STATE= STATE - 1;
                TRANSMITTED= TRANSMITTED + 1;
        end
    end
    
    % Cálculos Finais (Conversão de contadores para estimativas)
    PB = (BLOCKED_REQUESTS / TOTAL_REQUESTS) * 100; 
    
    media_filmes = AREA_STATE / Clock;
    DB = media_filmes * B; 
end