library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity MEF_competition is
    port(
        clk : in std_logic;
        reset : in std_logic; 
        confirm : in std_logic;
        confirm_prev : in std_logic; 
        cycle : in std_logic; 
        enable : in std_logic; 

        PlayerATime, PlayerBTime : in std_logic_vector(13 downto 0); 

        ConfirmedNumberOut : in std_logic_vector(6 downto 0);
        Points_A, Points_B, TotalCycles : out std_logic_vector(6 downto 0);
        MaxPoints : out std_logic_vector(6 downto 0);
        
        PlayerAPenalty, PlayerBPenalty : in std_logic;

        HEX3, HEX2, HEX1, HEX0 : out std_logic_vector(1 downto 0);
        winnerA : out std_logic := '0';
        winnerB : out std_logic := '0'
    );
end MEF_competition;

architecture Behavioral of MEF_competition is
    signal internal_reset : std_logic := '0';
    signal confirmed_number_int : integer;

    signal points_A_int, points_B_int : integer range -10 to 50 := 0;

    signal total_cycles_int : integer := 0;
    signal cycle_last : std_logic := '0'; -- Sinal para guardar o estado anterior de cycle

    signal tie : std_logic := '0';

    signal playerA_time_last, playerB_time_last : std_logic_vector(13 downto 0) := (others => '0');
    signal playerA_valid, playerB_valid : std_logic := '0'; -- Sinais para rastrear tempos válidos
    signal playerA_penalty_applied, playerB_penalty_applied : std_logic := '0'; -- Sinais para rastrear penalidades aplicadas

    signal winnerA_int, winnerB_int : std_logic := '0';

begin

    state_machine: process(clk, reset)
    begin
        if reset = '1' or internal_reset = '1' then 
            internal_reset <= '0'; 
            
            total_cycles_int <= 0;
            cycle_last <= '0';

            points_A_int <= 0;
            points_B_int <= 0;
            playerA_time_last <= (others => '0');
            playerB_time_last <= (others => '0');

            playerA_valid <= '0';
            playerB_valid <= '0';

            playerA_penalty_applied <= '0';
            playerB_penalty_applied <= '0';

            tie <= '0';
            winnerA_int <= '0';
            winnerB_int <= '0';
        elsif rising_edge(clk) then
            if enable = '1' then   
                winnerA_int <= '0';
                winnerB_int <= '0';

                -- Detecção de borda de subida para o sinal cycle
                if cycle = '1' and cycle_last = '0' then
                    total_cycles_int <= total_cycles_int + 1;
                elsif tie = '1' then
                    total_cycles_int <= total_cycles_int - 1;
                    tie <= '0';
                end if;
                
                -- Atualiza o estado anterior de cycle
                cycle_last <= cycle;


                confirmed_number_int <= to_integer(unsigned(ConfirmedNumberOut));
                MaxPoints <= ConfirmedNumberOut;
                HEX3 <= "00";  -- 't'
                HEX2 <= "01";  -- 'E'
                HEX1 <= "10";  -- 'S'
                HEX0 <= "11";  -- 't'


                -- Aplicar penalidade uma vez por ciclo de penalidade
                if PlayerAPenalty = '1' and playerA_penalty_applied = '0' then
                    if points_A_int > 1 then
                        points_A_int <= points_A_int - 2;
                    else
                        points_A_int <= 0;
                    end if;
                end if;

                playerA_penalty_applied <= PlayerAPenalty; --Estado anterior de penalidade

                if PlayerBPenalty = '1' and playerB_penalty_applied = '0' then
                    if points_B_int > 1 then
                        points_B_int <= points_B_int - 2;
                    else
                        points_B_int <= 0;
                    end if;
                end if;

                playerB_penalty_applied <= PlayerBPenalty; --Estado anterior de penalidade



                -- Atualiza os tempos dos jogadores e define os sinais de validade
                if PlayerATime /= playerA_time_last then
                    playerA_valid <= '1';
                end if;
                playerA_time_last <= PlayerATime;

                if PlayerBTime /= playerB_time_last then
                    playerB_valid <= '1';
                end if;
                playerB_time_last <= PlayerBTime;

                -- Avalia os tempos apenas se ambos forem válidos
                if playerA_valid = '1' and playerB_valid = '1' then
                    if to_integer(unsigned(PlayerATime)) < to_integer(unsigned(PlayerBTime)) then
                        points_A_int <= points_A_int + 1;
                    elsif to_integer(unsigned(PlayerATime)) > to_integer(unsigned(PlayerBTime)) then
                        points_B_int <= points_B_int + 1;
                    else
                        tie <= '1';
                    end if;
                    playerA_valid <= '0'; -- Reseta o sinal de validade
                    playerB_valid <= '0'; -- Reseta o sinal de validade
                end if;


                -- Modifique a lógica no processo output_logic
                if points_A_int < 0 and points_B_int < 0 then
                    -- Ambos jogadores desqualificados, reiniciar competição
                    internal_reset <= '1';
                elsif points_A_int < 0 then
                    -- Jogador A desqualificado, jogador B é o vencedor
                    winnerB_int <= '1';
                elsif points_B_int < 0 then
                    -- Jogador B desqualificado, jogador A é o vencedor
                    winnerA_int <= '1';
                elsif points_A_int = confirmed_number_int then 
                    -- Jogador A é o vencedor
                    winnerA_int <= '1';
                elsif points_B_int = confirmed_number_int then 
                    -- Jogador B é o vencedor
                    winnerB_int <= '1';
                end if;

                if winnerA_int = '1' or winnerB_int = '1' then
                    internal_reset <= '1';
                end if;

            end if;
        end if;
    end process;

    winnerA <= winnerA_int;
    winnerB <= winnerB_int;

    Points_A <= std_logic_vector(to_unsigned(points_A_int, Points_A'length));
    Points_B <= std_logic_vector(to_unsigned(points_B_int, Points_B'length));
    TotalCycles <= std_logic_vector(to_unsigned(total_cycles_int, TotalCycles'length));
end Behavioral;