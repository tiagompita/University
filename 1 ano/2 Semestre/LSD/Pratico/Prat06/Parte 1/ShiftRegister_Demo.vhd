library IEEE;
use IEEE.std_logic_1164.all;

entity ShiftRegister_Demo is
	
	generic(size : positive := 8);
	port (clk : in std_logic;
			sin : in std_logic;
			dataOut : out std_logic_vector((size - 1) downto 0));
	
end ShiftRegister_Demo;

architecture Structural of ShiftRegister_Demo is

	signal s_shiftreg : std_logic_vector((size - 1) downto 0);
	
begin
						
	ShiftRegister_0 : entity work.ShiftRegisterN(Behavioral)
							generic map (size => size)
							port map(sin => sin,
										clk => clk,
										dataOut => dataOut);
										

end Structural;