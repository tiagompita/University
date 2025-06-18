--Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;

--Interface(portas)
entity AND2Gate is
	port( input0 : in std_logic;
			input1 : in std_logic;
			output : out std_logic);
end AND2Gate;

--Implementação (descrição da funcionalidade)
architecture Behavioral of AND2Gate is
begin
	output <= input0 and input1;
	
end Behavioral;