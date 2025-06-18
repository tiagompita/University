library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity PlayerAWin is
	port(
		enable : in std_logic;
		binInput : in  std_logic;
		decOut_n : out std_logic_vector(6 downto 0)
	);
end PlayerAWin;

architecture Behavioral of PlayerAWin is    
begin
	process(binInput, enable)
	begin
		if enable = '1' then
			case binInput is
				when '0' => decOut_n <= "1110011";  --P
				when '1' => decOut_n <= "1110111";  --A
				when others => decOut_n <= "1111111";  --blank
			end case;
		else
			decOut_n <= "1111111";  --blank
		end if;
	end process;
end Behavioral;