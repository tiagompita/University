library IEEE;
use IEEE.std_logic_1164.all;

entity SeqDetFSM is

	port( x, clk, rst : in std_logic;
			y : out std_logic);
	
end SeqDetFSM;

architecture MealyArch of SeqDetFSM is

	type tState is (E0, E1, E10, E100);
	signal NS, PS : tState;
	
begin
	
	process_sync : process(clk)
						begin
							if (rising_edge(clk)) then
								if (rst = '1') then
									PS <= E0;
								else
									PS <= NS;
								end if;
							end if;
						end process;
						
	process_comb : process(PS, x)
						begin
							y <= '0';
							case PS is
								when E0 =>
									if (x = '1') then
										NS <= E1;
									else 
										NS <= E0;
									end if;
									
								when E1 =>
									if (x = '1') then
										NS <= E1;
									else 
										NS <= E10;
									end if;
									
								when E10 =>
									if (x = '1') then
										NS <= E1;
									else 
										NS <= E100;
									end if;
									
								when E100 =>
									if (x = '1') then
										NS <= E1;
										y <= '1';
									else 
										NS <= E0;
									end if;
							end case;
						end process;
end MealyArch;