function PAR = SimulatorB(lambda,C,N)
%
%     lambda: packet arrival rate (in packets/second)
%     C:      link capacity (in Mbps)
%     N:      stopping criterion (the simulation finishes at the end
%             of the transmition of the Nth packet)

    %Events:
    ARRIVAL= 0;       % Arrival of a packet            
    DEPARTURE= 1;     % Departure of a packet

    % Initialization of variables:
    Clock= 0;            % Simulation clock
    STATE = 0;           % 0 - connection is free; 1 - connection is occupied
    QUEUE_N= 0;          % No. of packets in queue
    QUEUE= [];           % Arriving time instant of each packet in the queue
    TRANSMITTED= 0;      % No. of transmitted packets
    DELAYS= 0;
    
    % Initializing the List of Events:
    EventList = [ARRIVAL, Clock + exprnd(1/lambda)];
    
    while TRANSMITTED < N 
        Event= EventList(1,1);            
        Clock= EventList(1,2);
        EventList(1,:)= [];
        switch Event
            case ARRIVAL
                EventList = [EventList; ARRIVAL, Clock + exprnd(1/lambda)];
                if STATE == 0
                    STATE= 1;
                    tTime= 8*randi([100,1000])/(C*1e6);   % in seconds
                    EventList = [EventList; DEPARTURE, Clock + tTime];
                else
                    QUEUE_N= QUEUE_N + 1;
                    QUEUE= [QUEUE; Clock];
                end
            case DEPARTURE
                TRANSMITTED= TRANSMITTED + 1;
                if QUEUE_N > 0
                    QInstant= QUEUE(1);
                    DELAYS= DELAYS + (Clock - QInstant);
                    tTime= 8*randi([100,1000])/(C*1e6);   % in seconds
                    EventList = [EventList; DEPARTURE, Clock + tTime];
                    QUEUE_N= QUEUE_N - 1;
                    QUEUE(1)= [];
                else
                    STATE= 0;
                end
        end
        EventList= sortrows(EventList,2);
    end
    PAR= DELAYS/TRANSMITTED;
end
