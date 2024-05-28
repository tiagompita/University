library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TesteElementar is

	port (
		clk : in std_logic;
		reset : in std_logic;
		start_btn : in std_logic;
		stimulus : out std_logic; -- estímulo visual
		treac : out std_logic_vector(31 downto 0) -- tempo de reação
		);
		
end TesteElementar;

architecture Behav of TesteElementar is

	signal free_run_counter : unsigned(31 downto 0) := (others => '0');
	signal don : unsigned(31 downto 0) := (others => '0');
	signal reaction_start : unsigned(31 downto 0) := (others => '0');
	signal reaction_time : unsigned(31 downto 0) := (others => '0');
	signal stimulus_active : std_logic := '0';
	
begin

	process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then
				
				free_run_counter <= (others => '0');
				don <= (others => '0');
				reaction_start <= (others => '0');
				reaction_time <= (others => '0');
				stimulus_active <= '0';
				stimulus <= '0';
				
			else
				free_run_counter <= free_run_counter + 1;
			
				if (start_btn = '1' and stimulus_active = '0') then
					don <= free_run_counter;
					stimulus_active <= '1';
					
				elsif (free_run_counter >= don and stimulus_active = '1') then
					stimulus <= '1';
					reaction_start <= free_run_counter;
					
				elsif (start_btn = '1' and stimulus_active = '1') then
					reaction_time <= free_run_counter - reaction_start;
					stimulus <= '0';
					stimulus_active <= '0';
					don <= free_run_counter; -- inicia um novo ciclo de teste
					
				end if;
			end if;
		end if;
	end process;
	
	treac <= std_logic_vector(reaction_time);
	
end Behav;
