library ieee;
use ieee.std_logic_1164.all;

entity DebounceUnit is
    port (
        clk : in std_logic;
        key_in : in std_logic;
        key_out : out std_logic
    );
end DebounceUnit;

architecture Behav of DebounceUnit is
    signal s_key : std_logic;
    signal s_key_delay : std_logic;
begin
    process(clk)
    begin
        if rising_edge(clk) then
            s_key <= not key_in;
            s_key_delay <= s_key;
        end if;
    end process;

    key_out <= s_key and not s_key_delay;  -- Debounced output
end Behav;