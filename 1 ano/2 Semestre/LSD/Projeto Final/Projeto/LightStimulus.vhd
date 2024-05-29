library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LightStimulus is
    port(
        clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        randomTime : in std_logic_vector(13 downto 0);
        reactTime : out std_logic_vector(13 downto 0);
        light : out std_logic
    );
end LightStimulus;

architecture Behavioral of LightStimulus is
    signal Don : integer range 0 to 8191 := 0;
    signal light_active : std_logic := '0';
    signal react_start : integer range 0 to 8191 := 0;
    signal react_time : integer range 0 to 8191 := 0;
    signal state : integer range 0 to 3 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            Don <= 0;
            light_active <= '0';
            react_start <= 0;
            react_time <= 0;
            state <= 0;
        elsif rising_edge(clk) then
            case state is
                when 0 => -- Estado de espera inicial
                    if start = '1' then
                        Don <= to_integer(unsigned(randomTime));
                        state <= 1;
                    end if;

                when 1 => -- Aguardar o tempo de atraso Don
                    if Don = 0 then
                        light_active <= '1';
                        react_start <= 0;
                        state <= 2;
                    else
                        Don <= Don - 1;
                    end if;

                when 2 => -- Ativar o estímulo e iniciar a contagem do tempo de reação
                    if start = '1' then
                        react_time <= react_start;
                        light_active <= '0';
                        state <= 3;
                    else
                        react_start <= react_start + 1;
                    end if;

                when 3 => -- Registrar o tempo de reação e aguardar próximo ciclo
                    if start = '0' then
                        state <= 0;
                    end if;

                when others =>
                    state <= 0;
            end case;
        end if;
    end process;

    light <= light_active;
    reactTime <= std_logic_vector(to_unsigned(react_time, reactTime'length));
end Behavioral;
