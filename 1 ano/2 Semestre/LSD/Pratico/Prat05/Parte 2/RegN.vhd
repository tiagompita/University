library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegN is
	
	generic(N : positive := 8);
	
	port( dataIn : in std_logic_vector(N-1 downto 0);
			reset : in std_logic;
			enable : in std_logic;
			clk : in std_logic;
			dataOut : out std_logic_vector(N-1 downto 0));

end RegN;

architecture Behavioral of RegN is

begin
	process(clk)
		begin
			if rising_edge(clk) then  -- Trigger on positive clock edge
				if reset = '1' then
					dataOut <= (others => '0');  -- Reset to zero
				elsif enable = '1' then
					dataOut <= dataIn;        -- Update with dataIn if enabled
				end if;
			end if;
	end process;
end Behavioral;