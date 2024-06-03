library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DonAssignment is
    port(
        clk : in std_logic;
        reset : in std_logic;
		  enable : in std_logic;
		  
        start : in std_logic;          -- Jogador 1
        start2 : in std_logic;         -- Jogador 2
        randomTime : in std_logic_vector(13 downto 0);
		  
        penaltyOut : out std_logic;
        penaltyOut2 : out std_logic;
		  enableLight : out std_logic
    );
end DonAssignment;

architecture Behavioral of DonAssignment is
    type state_type is (idle, running, wait_response, penalty, penalty2);
    signal state : state_type := idle;

    signal Don : integer range 1000 to 5000 := 5000;
    signal timer : integer range 0 to 5000 := 0;
    signal start_prev : std_logic := '0';
    signal start2_prev : std_logic := '0';
    signal penalty_timer : integer range 0 to 1000 := 0;
    signal penalty_timer2 : integer range 0 to 1000 := 0;

    signal player1_responded : std_logic := '0';
    signal player2_responded : std_logic := '0';
    signal enable_signal : std_logic := '0';

begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= idle;
            timer <= 0;
            start_prev <= '0';
            start2_prev <= '0';
            penalty_timer <= 0;
            penalty_timer2 <= 0;
            player1_responded <= '0';
            player2_responded <= '0';
            enable_signal <= '0';
        elsif rising_edge(clk) and enable = '1' then
            case state is
                when idle =>
                    if (start = '1' and start_prev = '0') or (start2 = '1' and start2_prev = '0') then
                        Don <= to_integer(unsigned(randomTime));
                        timer <= 0;
                        player1_responded <= '0';
                        player2_responded <= '0';
                        enable_signal <= '0';
                        state <= running;
                    end if;

                when running =>
                    if timer = Don then
                        state <= wait_response;
                        enable_signal <= '1';
                    else
                        timer <= timer + 1;
                        if (start = '1' and start_prev = '0') then
                            state <= penalty;
                            enable_signal <= '0';
                        elsif (start2 = '1' and start2_prev = '0') then
                            state <= penalty2;
                            enable_signal <= '0';
                        end if;
                    end if;

                when wait_response =>
                    if (start = '1' and player1_responded = '0') then
                        player1_responded <= '1';
                        enable_signal <= '0';
                    end if;
                    if (start2 = '1' and player2_responded = '0') then
                        player2_responded <= '1';
                        enable_signal <= '0';
                    end if;
                    if player1_responded = '1' and player2_responded = '1' then
                        state <= running;  -- Reiniciar o ciclo automaticamente
                        timer <= 0;  -- Resetar o timer
                        Don <= to_integer(unsigned(randomTime));  -- Gerar novo Don
                        player1_responded <= '0';
                        player2_responded <= '0';
                    end if;

                when penalty =>
                    if penalty_timer >= 1000 then
                        state <= running;
                        timer <= 0;
                        Don <= to_integer(unsigned(randomTime));
                        penalty_timer <= 0;
                        player1_responded <= '0';
                        player2_responded <= '0';
                    else
                        penalty_timer <= penalty_timer + 1;
                    end if;

                when penalty2 =>
                    if penalty_timer2 >= 1000 then
                        state <= running;
                        timer <= 0;
                        Don <= to_integer(unsigned(randomTime));
                        penalty_timer2 <= 0;
                        player1_responded <= '0';
                        player2_responded <= '0';
                    else
                        penalty_timer2 <= penalty_timer2 + 1;
                    end if;
            end case;

            start_prev <= start;
            start2_prev <= start2;
        end if;
    end process;

    enableLight <= enable_signal;
    penaltyOut <= '1' when state = penalty else '0';
    penaltyOut2 <= '1' when state = penalty2 else '0';
end Behavioral;
