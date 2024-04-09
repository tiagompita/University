library IEEE;
use IEEE.std_logic_1164.all;

entity AccN is
	
	generic(N : positive := 8);
	
	port( dataIn : in std_logic_vector(N-1 downto 0);
			dataOut : out std_logic_vector(N-1 downto 0);
			enable : in std_logic;
			clk : in std_logic;
			reset : in std_logic;
			overflow : out std_logic
			);
			
end AccN;

architecture Structural of AccN is

	signal s_regOut : std_logic_vector(N-1 downto 0);
	signal s_adderOut : std_logic_vector(N-1 downto 0);

begin

	Adder_0 : entity work.AdderN(Behavioral)
	generic map(N => N)
		port map(A => dataIn,
					B => s_regOut,
					Soma => s_adderOut);
					
	RegN_0 : entity work.RegN(Behavioral)
	generic map(N => N)
		port map(dataIn => s_adderOut,
					reset => reset,
					enable => enable,
					clk => clk,
					dataOut => s_regOut);
					
	-- Overflow detection logic
	overflow <= s_adderOut(N-1) xor s_regOut(N-1) xor dataIn(N-1);
	
	dataOut <= s_regOut;

end Structural;