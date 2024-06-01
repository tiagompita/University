library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity DonAssignment is
    port(
        clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        randomTime : in std_logic_vector(13 downto 0);
        enableOut : out std_logic
    );
end DonAssignment;

architecture Behavioral of DonAssignment is
    type state_type is (idle, running, enable); -- Definir os estados
    signal state : state_type := idle; -- Estado inicial
    signal Don : integer range 1000 to 5000 := 5000;
    signal timer : integer range 1000 to 5000 := 1000;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            state <= idle; -- Reset para o estado inicial
            timer <= 1000; -- Reset the timer
        elsif rising_edge(clk) then
            case state is
                when idle =>
                    if start = '1' then
                        Don <= to_integer(unsigned(randomTime));
                        timer <= 1000; -- Reset the timer when start is clicked
                        state <= running; -- Mover para o estado running
                    end if;
                when running =>
                    if timer = Don then
                        state <= enable; -- Mover para o estado enable
                    else
                        timer <= timer + 1;
                    end if;
                when enable =>
                    if start = '1' then
                        state <= idle; -- Mover para o estado idle quando start é pressionado
                    end if;
            end case;
        end if;
    end process;

    enableOut <= '1' when state = enable else '0'; -- enableOut é '1' quando o estado é enable
end Behavioral;