library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TesteElementar is
	port (
		CLOCK_50 : in std_logic;
		start : in std_logic;
		KEY : in std_logic_vector(1 downto 0);
		
		HEX0 : out std_logic_vector(6 downto 0);
		HEX1 : out std_logic_vector(6 downto 0);
		HEX2 : out std_logic_vector(6 downto 0);
		HEX3 : out std_logic_vector(6 downto 0);
		
		LEDG : out std_logic_vector(0 downto 0)

	);
end TesteElementar;

architecture Behav of TesteElementar is
	signal CleanStart : std_logic;
	signal CleanReset : std_logic;

	signal randomTime : std_logic_vector(13 downto 0);
	signal clk_1kHZ : std_logic;
	signal reactTime : std_logic_vector(13 downto 0);
	signal bcd_out : std_logic_vector(15 downto 0);
	
begin

	--pulse gen
	pulse : entity work.pulse_gen(Behavioral)
				port map(clk => CLOCK_50,
							reset => CleanReset,
							pulse => clk_1kHZ
							);

	-- Instantiate RandomTimeGen
	RTG: entity work.RandomTimeGen(Behav)
	port map (
		clk => clk_1kHZ,
		reset => CleanReset,
		randomTime => randomTime
	);

	-- Instantiate DebounceUnit
	DBstart : entity work.DebounceUnit(Behav)
	port map (
		clk => CLOCK_50,
		key_in => KEY(0),
		key_out => CleanStart
	);
	
	DBreset : entity work.DebounceUnit(Behav)
	port map (
		clk => CLOCK_50,
		key_in => KEY(1),
		key_out => CleanReset
	);

		
	--Light
	LightStimulus : entity work.LightStimulus(Behavioral)
			port map(
						clk => clk_1kHZ,
						reset => CleanReset,
						start => CleanStart,
						randomTime => randomTime,
						reactTime => reactTime,
						light => LEDG(0)
						);
			
	
	--Binary to BCD
	BinToBCD : entity work.BinToBCD(behavioral)
	port map (
		binary_in => reactTime,
		bcd_out => bcd_out);
		
		
	-- Hex Display
	DisplayMil : entity work.Bin7SegDecoder(Behavioral)
	port map (
		binInput => bcd_out(15 downto 12),
		decOut_n => HEX3
		);
	
	DisplayCent : entity work.Bin7SegDecoder(Behavioral)
	port map (
		binInput => bcd_out(11 downto 8),
		decOut_n => HEX2
		);
	
	DisplayDec : entity work.Bin7SegDecoder(Behavioral)
	port map (
		binInput => bcd_out(7 downto 4),
		decOut_n => HEX1
		);
		
	DisplayUn : entity work.Bin7SegDecoder(Behavioral)
	port map (
		binInput => bcd_out(3 downto 0),
		decOut_n => HEX0
		);
	

end Behav;