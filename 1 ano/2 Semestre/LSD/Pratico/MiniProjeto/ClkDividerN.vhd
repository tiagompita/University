library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity ClkDividerN is
    generic(divFactor : positive := 10  -- Sets the division factor (default 10)
    );
    port( clkIn : in std_logic;  -- Input clock signal
            clkOut : out std_logic  -- Divided output clock signal
            );
end entity ClkDividerN;

architecture Behavioral of ClkDividerN is

    -- Define a subtype for the counter to limit its range
    subtype TCounter is natural range 0 to divFactor - 1;

    -- Signal to store the current counter value
    signal s_divCounter : TCounter := 0;

begin

  -- Assertion to ensure valid division factor (divFactor >= 2)
  assert(divFactor >= 2);

  -- Process to handle clock division
  process(clkIn)
  begin
    if rising_edge(clkIn) then  -- Check for rising edge of clock
      if (s_divCounter >= (divFactor - 1)) then  -- Check if counter reached limit
        clkOut <= '0';  -- Set output clock low
        s_divCounter <= 0;  -- Reset counter
      else
        if (s_divCounter = (divFactor / 2 - 1)) then  -- Check for half cycle
          clkOut <= '1';  -- Set output clock high for 50% duty cycle
        end if;
        s_divCounter <= s_divCounter + 1;  -- Increment counter
      end if;
    end if;
  end process;

end Behavioral;