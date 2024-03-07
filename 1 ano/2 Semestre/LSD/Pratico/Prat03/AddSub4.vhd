library IEEE;
use IEEE.std_logic_1164.all;

entity AddSub4
	port( a,b : in std_logic_vector(3 downto 0);
			sub : in std_logic;
			cout : out std_logic;
			s : out std_logic_vector(3 downto 0)
	);
end AddSub4;

architecture Behavioral of AddSub4 is

	signal s_b : std_logic_vector(3 downto 0);

begin
	
	addsub : entity work.Adder4(Behavioral)
					port map(a => a,
								b => b,
								
								)