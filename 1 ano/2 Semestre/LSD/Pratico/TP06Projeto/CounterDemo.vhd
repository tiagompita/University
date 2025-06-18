library IEEE;
use IEEE.std_logic_1164.all;

entity CounterDemo is
	port (SW : in std_logic(0 downto 0);
			reset : in std_logic;
			clk : in std_logic;
			enable : in std_logic;
			LEDR : out std_logic_vector(3 downto 0);
			HEX0 : out std_logic_vector(6 downto 0));
end CounterDemo;

architecture Shell of CounterDemo is

begin
	clock : entity work.ClkDividerN(Behavioral)
					port map(clkIn => CLOCK_50,
								clkOut => clk)
	counter : entity work.Counter(sw => SW(0),
											count => LEDR,
											display => HEX0)
end Shell;