library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RandomTimeGen is
	port (
		clk : in std_logic;
		enable : in std_logic;
		reset : in std_logic;
		randomTime : out std_logic_vector(13 downto 0) 
	);
end RandomTimeGen;

architecture Behav of RandomTimeGen is
	constant min : integer := 1000;
	constant max : integer := 5000;
	signal temp : integer := min;
begin
	process(clk, reset)
	begin
		if (reset = '1') then 
			temp <= min;
		elsif (rising_edge(clk)) and enable = '1' then 
			if temp = max then
				temp <= min;
			else
				temp <= temp + 1;
			end if;
		end if;
	end process;

	randomTime <= std_logic_vector(to_unsigned(temp, randomTime'length));
end Behav;