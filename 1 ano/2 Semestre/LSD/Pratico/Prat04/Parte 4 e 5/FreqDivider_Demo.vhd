library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FreqDivider_Demo is
    port (
        CLOCK_50 : in std_logic;
        RESET    : in std_logic;
        UPDOWN   : in std_logic;
        SEG7     : out std_logic_vector(6 downto 0);
        ENABLE   : in std_logic -- Enable signal for the 7-segment display
    );
end FreqDivider_Demo;

architecture Behavioral of FreqDivider_Demo is
    -- Constante para o valor de k para obter 1 Hz a partir de 50 MHz
    constant k_value : std_logic_vector(31 downto 0) := x"17D7840";

    -- Sinais intermediários
    signal clk_1Hz : std_logic;
    signal counter_value : std_logic_vector(3 downto 0);

begin
    -- Instanciar o divisor de frequência
    divisor: entity work.FreqDivider(Behavioral)
        port map (
            clkIn => CLOCK_50,
            k => k_value,
            clkOut => clk_1Hz
        );

    -- Instanciar o contador up/down de 4 bits
    counter_inst: entity work.CounterUpDown4(Behavioral)
        port map (
            clk => clk_1Hz,
            reset => RESET,
            upDown => UPDOWN,
            count => counter_value
        );

    -- Instanciar o decodificador de display de 7 segmentos
    seg7_inst: entity work.Bin7SegDecoder(Behavioral)
        port map (
            binInput => counter_value,
            decOut_n => SEG7,
            enable => ENABLE
        );

end Behavioral;
