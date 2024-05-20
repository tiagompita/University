library IEEE;
use IEEE.std_logic_1164.all;

entity ReactionTimer is

	port (rst, clk : in std_logic;
			KEY : std_logic_vector()
			HEXp1, HEXp2 : out std_logic_vector(1 downto 0));

end ReactionTimer;

architecture Behav of ReactionTimer is

begin
	process(clk)

end Behav;