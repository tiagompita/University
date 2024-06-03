library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BinToBCD is
    port(
        binary_in : in  std_logic_vector(13 downto 0);
        bcd  : out std_logic_vector(15 downto 0)
    );
end BinToBCD;

architecture behavioral of BinToBCD is
    signal thousands : integer range 0 to 9;
    signal hundreds  : integer range 0 to 9;
    signal tens      : integer range 0 to 9;
    signal ones      : integer range 0 to 9;
    signal bin_in_int : integer range 0 to 9999;
begin

    bin_in_int <= to_integer(unsigned(binary_in));

    process(bin_in_int)
    begin
        -- Extract the digits
        thousands <= (bin_in_int / 1000) mod 10;
        hundreds  <= (bin_in_int / 100) mod 10;
        tens      <= (bin_in_int / 10) mod 10;
        ones      <= bin_in_int mod 10;

        -- Convert to BCD				 
		  bcd   <= std_logic_vector(to_unsigned(thousands, 4)) &
						std_logic_vector(to_unsigned(hundreds, 4)) &
						std_logic_vector(to_unsigned(tens, 4)) &
						std_logic_vector(to_unsigned(ones, 4));
    end process;
end behavioral;