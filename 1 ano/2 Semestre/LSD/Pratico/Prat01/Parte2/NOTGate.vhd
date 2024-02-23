--Bibliotecas
library IEEE;
use IEEE.STD_LOGIC_1164.all;

--Interface(portas)
entity NOTGate is
	port( input : in std_logic;
			output : out std_logic);
end NOTGate;

--Implementação (descrição da funcionalidade)
architecture Behavioral of NOTGate is
begin
	output <= not input;
	
end Behavioral;