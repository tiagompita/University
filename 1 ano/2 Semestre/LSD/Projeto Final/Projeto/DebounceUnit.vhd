library ieee;
use ieee.std_logic_1164.all;

entity DebounceUnit is
    port (
        clk : in std_logic;
        KEYin : in std_logic;
        key_out : out std_logic
    );
end DebounceUnit;

architecture Behav of DebounceUnit is
    signal s_key_prev : std_logic := '1';  -- Assume the key is not pressed initially
begin
    process(clk)
    begin
        if rising_edge(clk) then
            s_key_prev <= not KEYin;
        end if;
    end process;

    key_out <= s_key_prev;  -- Debounced output
end Behav;