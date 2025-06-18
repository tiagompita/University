library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity FlipFlopD is

		port (clk : in std_logic;
				D : in std_logic;
				Q : out std_logic;
				set : in std_logic;
				reset : in std_logic);
		
end FlipFlopD;

architecture Behavioral of FlipFlopD is

begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				Q <= '0';
			else
				if (set = '1') then
					Q <= '1';
				else
					Q <= D;
				end if;
				
			end if;
		end if;
	end process;
	
end Behavioral;