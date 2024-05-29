library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RandomTimeGen is
	port (
		clk : in std_logic;
		reset : in std_logic;
		randomTime : out std_logic_vector(13 downto 0) -- 8192ms
	);
end RandomTimeGen;

architecture Behav of RandomTimeGen is
	constant min : integer := 1000;
	constant max : integer := 5000;
	signal temp : integer := min;
begin
	process(clk, reset) -- Include both clk and reset in the sensitivity list
	begin
		if reset = '1' then -- Check for reset first
			temp <= min;
		elsif rising_edge(clk) then -- Then proceed with the rest of the logic at the rising edge of clk
			if temp = max then
				temp <= min;
			else
				temp <= temp + 1;
			end if;
		end if;
	end process;

	randomTime <= std_logic_vector(to_unsigned(temp, randomTime'length));
end Behav;