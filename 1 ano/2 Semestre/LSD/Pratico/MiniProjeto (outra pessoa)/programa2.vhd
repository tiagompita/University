library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity programa2 is
    Port ( CLK : in STD_LOGIC;
           LEDR : out STD_LOGIC_VECTOR(3 downto 0);
           LEDG : out STD_LOGIC_VECTOR(3 downto 0)
         );
end programa2;

architecture Behavioral of programa2 is
    signal counter : integer range 0 to 50000000; 
    signal green_led_state : std_logic; 
begin
    process(CLK)
    begin
        if rising_edge(CLK) then

            counter <= counter + 1;
            

            if counter = 50000000 then
                green_led_state <= not green_led_state;
                counter <= 0; 
            end if;
            

            if green_led_state = '1' then
                LEDR <= "0000"; 
                LEDG <= "1111"; 
            else
                LEDR <= "0000"; 
                LEDG <= "0000"; 
            end if;
        end if;
    end process;
end Behavioral;
