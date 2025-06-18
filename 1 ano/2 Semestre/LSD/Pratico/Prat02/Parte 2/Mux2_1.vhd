library IEEE;
use IEEE.std_logic_1164.all;

entity Mux2_1 is
	port( dataIn : in std_logic_vector(1 downto 0);
			sel : in std_logic;
			dataOut : out std_logic);
end Mux2_1;

architecture BehavAssign of Mux2_1 is
begin
	dataOut <=  dataIn(0) when (sel = '0') else dataIn(1);
end BehavAssign;