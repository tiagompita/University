library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftRegisterLoadN is

	generic(N : positive := 8);
	port (clk : in std_logic;
			en : in std_logic;
			load : in std_logic;
			reset : in std_logic;
			sin : in std_logic;
			dataIn : in std_logic_vector((N - 1) downto 0);
			dataOut : out std_logic_vector((N - 1) downto 0));
			
end ShiftRegisterLoadN;

architecture Behavioral of ShiftRegisterLoadN is

	signal s_shiftreg : std_logic_vector((N - 1) downto 0);
	
begin
	process(clk)
	begin
		if(rising_edge(clk)) then
			if (en = '1') then
				if (reset = '1') then
					s_shiftreg <= (others => '0');
				elsif (load = '1') then
					s_shiftreg <= dataIn;
				end if;
				
				s_shiftreg <= s_shiftreg((N-2) downto 0) & sin;
				
			end if;
		end if;
	end process;
	
	dataOut <= s_shiftreg;
	
end Behavioral;