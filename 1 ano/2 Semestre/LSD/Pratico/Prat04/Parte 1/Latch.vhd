library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Latch is
  port (
    clk : in  std_logic;  -- Clock signal
    D   : in  std_logic;  -- Data input
    Q   : out std_logic   -- Latch output
  );
end Latch;

architecture Behavioral of Latch is
begin

  process(clk)
  begin
    if rising_edge(clk) then
      Q <= D;
    end if;
  end process;

end Behavioral;
