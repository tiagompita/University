library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Counter is 
	
	port( reset : in std_logic;
			clk : in std_logic;
			enable : in std_logic;
			count : out std_logic_vector(3 downto 0));
			sw : in std_logic;
			display : out std_logic_vector(6 downto 0);
end Counter;

architecture Behavioral of Counter is

	signal s_count : unsigned(3 downto 0);
	
begin

	process(clk)
	begin
		
		if(rising_edge(clk)) then
			if (reset = '1') then
				s_count <= (others => '0');
				
			elsif (enable = '1') then
				if (s_count = "1100") then
					s_count <= (others => '0');
				else 
					s_count <= s_count + 1;
				end if;
					
			end if;
		end if;
		
	end process;
	
	count <= std_logic_vector(s_count);
	
	process(count, sw)
    begin
        if sw = '1' then
            case count is
                when "0001" =>
                    display <= "1111001"; --1
                when "0010" =>
                    display <= "0100100"; --2
                when "0011" =>
                    display <= "0110000"; --3
                when "0100" =>
                    display <= "0011001"; --4
                when "0101" =>
                    display <= "0010010"; --5
                when "0110" =>
                    display <= "0000010"; --6
                when "0111" =>
                    display <= "1111000"; --7
                when "1000" =>
                    display <= "0000000"; --8
                when "1001" =>
                    display <= "0010000"; --9
                when "1010" =>
                    display <= "0001000"; --A
                when "1011" =>
                    display <= "0000011"; --B
                when "1100" =>
                    display <= "1000110"; --C
                when "1101" =>
                    display <= "0100001"; --D
                when "1110" =>
                    display <= "0000110"; --E
                when "1111" =>
                    display <= "0001110"; --F
                when others =>
                    display <= "1000000"; --0
            end case;
        else
            display <= "1111111"; -- Todas as saídas desativadas
        end if;
    end process;
	
end Behavioral;	