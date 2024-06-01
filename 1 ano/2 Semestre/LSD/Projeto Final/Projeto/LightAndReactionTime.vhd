library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity LightAndReactionTime is
    port(
        clk : in std_logic;
        reset : in std_logic;
        start : in std_logic;
        enable : in std_logic;
        reactTime : out std_logic_vector(13 downto 0);
        light : out std_logic_vector(7 downto 0)
    );
end LightAndReactionTime;

architecture Behavioral of LightAndReactionTime is
    signal light_active : std_logic_vector(7 downto 0) := (others => '0');
    signal react_time : integer range 0 to 8191 := 0;
    signal state : integer range 0 to 3 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            light_active <= (others => '0');
            react_time <= 0;
            state <= 0;
        elsif rising_edge(clk) then
            case state is
                when 0 => -- Aguardar o enable
                    if enable = '1' and start = '0' then -- Verificar se start é '0'
                        light_active <= (others => '1');
                        react_time <= 0;
                        state <= 1;
                    end if;

                when 1 => -- Ativar o estímulo e verificar se start foi desligado
                    if start = '0' then
                        state <= 2;
                    end if;

                when 2 => -- Iniciar a contagem do tempo de reação
                    if start = '1' then
                        light_active <= (others => '0');
                        state <= 0;
                    else
                        react_time <= react_time + 1;
                    end if;

                when others =>
                    state <= 0;
            end case;
        end if;
    end process;

    light <= light_active;
    reactTime <= std_logic_vector(to_unsigned(react_time, reactTime'length));
end Behavioral;