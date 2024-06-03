library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity BinToBCD50 is
    port(
        binary_in : in  std_logic_vector(6 downto 0); 
        bcd2   : out std_logic_vector(3 downto 0); 
        bcd1   : out std_logic_vector(3 downto 0)
    );
end BinToBCD50;

architecture behavioral of BinToBCD50 is
    signal tens      : integer range 0 to 5; 
    signal ones      : integer range 0 to 9;
    signal bin_in_int : integer range 0 to 50; 
begin

    process(binary_in)
    begin
        bin_in_int <= to_integer(unsigned(binary_in));

        -- Extract the digits
        tens      <= (bin_in_int / 10) mod 10;
        ones      <= bin_in_int mod 10;

        -- Convert to BCD				 
        bcd2   <= std_logic_vector(to_unsigned(tens, 4));
        bcd1   <= std_logic_vector(to_unsigned(ones, 4));
    end process;
end behavioral;
