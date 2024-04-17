library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.NUMERIC_STD.all;

entity programa1 is
	
	port (clk : in std_logic;
			enable : in std_logic_vector(1 downto 0);
			LEDR : out std_logic_vector(3 downto 0);
			LEDG : out std_logic_vector(3 downto 0);
			blinkR : out std_logic_vector(3 downto 0);
			blinkG : out std_logic_vector(3 downto 0)
			);
end programa1;

architecture Behav of Programa1 is

	signal counter : integer range 0 to 50000000 := 0; -- Contador para controlar a frequência de piscar
	signal counter2 : integer range 0 to 8 := 0;
	
	signal count_blinkR : integer range 0 to 16 := 0;
	signal count_blinkG : integer range 0 to 16 := 0;
	
	signal stateR : std_logic := '1'; -- Estado do LEDR
	
	signal stateG : std_logic := '1'; -- Estado do LEDG
	
	
begin

	process(clk)
	begin
	
		if (rising_edge(clk)) then
		
			counter <= counter + 1;
			
			if counter = 50000000 then
				counter <= 0;
				if enable = "11" then
					counter2 <= counter2 + 1;
				else
					counter2 <= 0;
				end if;
			end if;
			
			if counter2 = 8 then
				counter2 <= 0;
			end if;
			
			case enable is
				when "00" =>
					LEDR <= (others => '1');
					LEDG <= (others => '1');
				when "01" =>
				
					if (counter = 12500000 or counter = 37500000 or counter = 50000000 or counter = 25000000) then
						stateR <= not stateR; -- Inverte o estado do LEDR 2x por segundo
						
						if stateR = '1' then
							count_blinkR <= count_blinkR + 1;
							
							if count_blinkR = 16 then
								count_blinkR <= 0;
							end if;
						end if;
						
					end if;
				
					LEDR <= (others => stateR);
					LEDG <= (others => '0');
				when "10" =>
				
					if (counter = 50000000 or counter = 25000000) then
						stateG <= not stateG; -- Inverte o estado do LEDG 1x por segundo
						
						if stateG = '1' then
							count_blinkG <= count_blinkG + 1;
							
							if count_blinkG = 16 then
								count_blinkG <= 0;
							end if;
						end if;
						
					end if;
				
					LEDR <= (others => '0');
					LEDG <= (others => stateG);
				when "11" =>
					if (counter2 < 4) then
						if (counter = 50000000 or counter = 25000000) then
							stateG <= not stateG; -- Inverte o estado do LEDG 1x por segundo
							
							if stateG = '1' then
								count_blinkG <= count_blinkG + 1;
							
								if count_blinkG = 16 then
									count_blinkG <= 0;
								end if;
							end if;
							
						end if;
					
						LEDR <= (others => '0');
						LEDG <= (others => stateG);
					elsif (counter2 >= 4) then
					
						if (counter = 12500000 or counter = 37500000 or counter = 50000000 or counter = 25000000) then
							stateR <= not stateR; -- Inverte o estado do LEDR 2x por segundo
							
							if stateR = '1' then
								count_blinkR <= count_blinkR + 1;
							
								if count_blinkR = 16 then
									count_blinkR <= 0;
								end if;
							end if;
							
						end if;
				
						LEDR <= (others => stateR);
						LEDG <= (others => '0');
					end if;
			end case;
		end if;
	end process;
	
	process(count_blinkR)
	begin
		blinkR <= std_logic_vector(to_unsigned(count_blinkR, 4));
	end process;
	
	process(count_blinkG)
	begin
		blinkG <= std_logic_vector(to_unsigned(count_blinkG, 4));
	end process;
	
end Behav;