library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity programa1 is
    Port ( CLK : in STD_LOGIC;
           LEDR : out STD_LOGIC_VECTOR(3 downto 0);
           LEDG : out STD_LOGIC_VECTOR(3 downto 0)
         );
end programa1;

architecture Behavioral of programa1 is
begin
    process(CLK)
    begin
        if rising_edge(CLK) then
            LEDR <= "1111"; 
            LEDG <= "1111";
        end if;
    end process;
end Behavioral;
