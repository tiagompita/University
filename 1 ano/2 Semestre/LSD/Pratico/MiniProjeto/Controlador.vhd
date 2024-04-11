library IEEE;
use IEEE.std_logic_1164.all;

entity Controlador is

	port (sw : in std_logic_vector(1 downto 0);
			clk : in std_logic;
			HEX0 : out std_logic_vector(6 downto 0);
			LEDR : out std_logic_vector(3 downto 0);
			LEDG : out std_logic_vector(3 downto 0));

end Controlador;

architecture Behav of Controlador is

begin

	blink01 : entity work.blink_gen(Behavioral)
					generic map (NUMBER_STEPS => 25000000)
					port map

	process(sw)
    begin
			case sw is
				 when "00" =>
					  HEX0 <= "1111001"; --1
					  LEDR <= "1111";
					  LEDG <= "1111";
				 when "01" =>
					  HEX0 <= "0100100"; --2
				 when "10" =>
					  HEX0 <= "0110000"; --3
				 when "11" =>
					  HEX0 <= "0011001"; --4
				 when others =>
					  HEX0 <= "1000000"; --0
			end case;
    end process;
	
	process(clk)
	begin
		if(rising_edge(clk)) then
			
				
			
		end if;
	end process;
	
end Behav;