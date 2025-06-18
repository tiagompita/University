library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ConFDisplay is
	port(
		enable : in std_logic;
		binInput : in  std_logic_vector(1 downto 0);
		decOut_n : out std_logic_vector(6 downto 0)
	);
end ConFDisplay;

architecture Behavioral of ConFDisplay is    
begin
	process(binInput, enable)
	begin
		if enable = '1' then
			case binInput is
				when "00" => decOut_n <= "1000110";  --C
				when "01" => decOut_n <= "0100011";  --o
				when "10" => decOut_n <= "0101011";  --n
				when "11" => decOut_n <= "0001110";  --F
				when others => decOut_n <= "1111111";  --blank
			end case;
		else
			decOut_n <= "1111111";  --blank
		end if;
	end process;
end Behavioral;