library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity AdderN is
	generic(N : positive := 8);
	
	port( A : in std_logic_vector(N-1 downto 0);
			B : in std_logic_vector(N-1 downto 0);
			Soma : out std_logic_vector(N-1 downto 0)
			);

end AdderN;

architecture Behavioral of AdderN is
	
begin

	Soma <= std_logic_vector(unsigned(A) + unsigned(B));

end Behavioral;
