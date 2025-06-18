library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity tEStDisplay is
	port(
		enable : in std_logic;
		binInput : in  std_logic_vector(1 downto 0);
		decOut_n : out std_logic_vector(6 downto 0)
	);
end tEStDisplay;

architecture Behavioral of tEStDisplay is    
begin
	process(binInput, enable)
	begin
		if enable = '1' then
			case binInput is
				when "00" => decOut_n <= "0000111";  --t
				when "01" => decOut_n <= "0000110";  --E
				when "10" => decOut_n <= "0010010";  --S
				when "11" => decOut_n <= "0000111";  --t
				when others => decOut_n <= "1111111";  --blank
			end case;
		else
			decOut_n <= "1111111";  --blank
		end if;
	end process;
end Behavioral;