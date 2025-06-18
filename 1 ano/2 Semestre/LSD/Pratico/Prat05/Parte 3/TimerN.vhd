library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TimerN is
    generic (
        N : integer := 6
    );
    port (
        clk : in std_logic;
        reset : in std_logic;
        enable : in std_logic;
        start : in std_logic;
        timerOut : out std_logic
    );
end TimerN;

architecture Behavioral of TimerN is
    signal s_count : integer range 0 to (N-1) := 0;
    signal s_timerOut : std_logic;
begin
    process(clk, reset)
    begin
        if (reset = '1') then
            s_count <= 0;
            s_timerOut <= '0';
        elsif rising_edge(clk) then
            if (enable = '1') then
                if (start = '1' or s_count > 0) then
                    s_count <= s_count + 1;
						  s_timerOut <= '1';
                end if;
					 
					 if (s_count = N) then
						s_timerOut <= '0';
						s_count <= 0;
					 end if;
            end if;
        end if;
        timerOut <= s_timerOut; 
    end process;
end Behavioral;
