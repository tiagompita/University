library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Bin7SegDecoder is
    port (
        binInput : in std_logic_vector(1 downto 0);
        decOut_n : out std_logic_vector(6 downto 0);
        enable   : in std_logic
    );
end Bin7SegDecoder;

architecture Behavioral of Bin7SegDecoder is
begin
    process(binInput, enable)
    begin
        if enable = '1' then
            case binInput is
                when "00" =>
                    decOut_n <= "1111001"; --1
                when "01" =>
                    decOut_n <= "0100100"; --2
                when "10" =>
                    decOut_n <= "0110000"; --3
                when "11" =>
                    decOut_n <= "0011001"; --4
                when others =>
                    decOut_n <= "1000000"; --0
            end case;
        else
            decOut_n <= "1111111"; -- Todas as saídas desativadas
        end if;
    end process;
end Behavioral;