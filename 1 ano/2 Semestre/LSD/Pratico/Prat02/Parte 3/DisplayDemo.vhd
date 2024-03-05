library IEEE;
use IEEE.std_logic_1164.all;

entity DisplayDemo1 is
	port (SW : in std_logic_vector(3 downto 0);
			KEY : in std_logic_vector(0 downto 0);
			HEX0 : out std_logic_vector(6 downto 0));
end DisplayDemo1;

architecture Shell of DisplayDemo1 is
begin
	display : entity work.Bin7SegDecoder(Behavioral)
						port map (  binInput => SW,
										enable => KEY(0),
										decOut_n => HEX0);
end Shell;