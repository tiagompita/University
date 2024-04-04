library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftRegisterN is

	generic(size : positive := 4);
	port (clk : in std_logic;
			sin : in std_logic;
			dataOut : out std_logic_vector((size - 1) downto 0));
			
end ShiftRegisterN;

architecture Behavioral of ShiftRegisterN is

	signal s_shiftreg : std_logic_vector((size - 1) downto 0);
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			s_shiftreg <= s_shiftreg((size - 2) downto 0) & sin;
		end if;
	end process;
	
	dataOut <= s_shiftreg;
	
end Behavioral;