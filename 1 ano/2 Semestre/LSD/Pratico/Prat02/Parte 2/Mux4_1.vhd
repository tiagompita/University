library IEEE;
use IEEE.std_logic_1164.all;

entity Mux4_1 is
    port(
        dataIn : in std_logic_vector(3 downto 0);
        sel : in std_logic_vector(1 downto 0);
        dataOut : out std_logic
    );
end Mux4_1;

architecture BehavAssign of Mux4_1 is
begin
    process (dataIn, sel)
    begin
        case sel is
            when "00" =>
                dataOut <= dataIn(0);
            when "01" =>
                dataOut <= dataIn(1);
            when "10" =>
                dataOut <= dataIn(2);
            when others =>
                dataOut <= dataIn(3);
        end case;
    end process;
end BehavAssign;
