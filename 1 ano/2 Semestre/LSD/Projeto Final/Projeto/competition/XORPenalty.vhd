library ieee;
use ieee.std_logic_1164.all;

entity XORPenalty is
    Port (
        input4 : in std_logic_vector(3 downto 0);
        input1 : in std_logic;
        output4 : out std_logic_vector(3 downto 0)
    );
end XORPenalty;

architecture Behavioral of XORPenalty is
    signal temp : std_logic_vector(3 downto 0);
begin
    temp <= input1 & input1 & input1 & input1;

    output4 <= input4 xor temp;
end Behavioral;