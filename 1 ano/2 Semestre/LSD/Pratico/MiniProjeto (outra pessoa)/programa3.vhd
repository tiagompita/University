library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity LED_Controller is
    Port ( CLK : in STD_LOGIC;
           LEDR : out STD_LOGIC_VECTOR(3 downto 0);
           LEDG : out STD_LOGIC_VECTOR(3 downto 0)
         );
end LED_Controller;

architecture Behavioral of LED_Controller is
    signal counter : integer range 0 to 50000000;
    signal green_led_state : std_logic;
    signal red_led_state : std_logic;
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            counter <= counter + 1;
            
            if counter < 25000000 then
                red_led_state <= '0';
                green_led_state <= '1';
            elsif counter >= 25000000 and counter < 50000000 then
                red_led_state <= '1';
                green_led_state <= '0';
            else
                counter <= 0;
            end if;
        end if;
    end process;

    LEDR <= (others => red_led_state);
    LEDG <= (others => green_led_state);
end Behavioral;

