-- Copyright (C) 2023  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 23.1std.0 Build 991 11/28/2023 SC Lite Edition"

-- DATE "05/26/2024 21:55:09"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	FreqDivider IS
    PORT (
	clkIn : IN std_logic;
	k : IN std_logic_vector(31 DOWNTO 0);
	clkOut : OUT std_logic
	);
END FreqDivider;

ARCHITECTURE structure OF FreqDivider IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clkIn : std_logic;
SIGNAL ww_k : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_clkOut : std_logic;
SIGNAL \clkOut~output_o\ : std_logic;
SIGNAL \clkIn~input_o\ : std_logic;
SIGNAL \k[1]~input_o\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \k[2]~input_o\ : std_logic;
SIGNAL \Add1~1\ : std_logic;
SIGNAL \Add1~2_combout\ : std_logic;
SIGNAL \s_counter[0]~32_combout\ : std_logic;
SIGNAL \s_counter[1]~35\ : std_logic;
SIGNAL \s_counter[2]~36_combout\ : std_logic;
SIGNAL \s_counter[2]~37\ : std_logic;
SIGNAL \s_counter[3]~38_combout\ : std_logic;
SIGNAL \s_counter[3]~39\ : std_logic;
SIGNAL \s_counter[4]~40_combout\ : std_logic;
SIGNAL \s_counter[4]~41\ : std_logic;
SIGNAL \s_counter[5]~42_combout\ : std_logic;
SIGNAL \s_counter[5]~43\ : std_logic;
SIGNAL \s_counter[6]~44_combout\ : std_logic;
SIGNAL \s_counter[6]~45\ : std_logic;
SIGNAL \s_counter[7]~46_combout\ : std_logic;
SIGNAL \s_counter[7]~47\ : std_logic;
SIGNAL \s_counter[8]~48_combout\ : std_logic;
SIGNAL \s_counter[8]~49\ : std_logic;
SIGNAL \s_counter[9]~50_combout\ : std_logic;
SIGNAL \s_counter[9]~51\ : std_logic;
SIGNAL \s_counter[10]~52_combout\ : std_logic;
SIGNAL \s_counter[10]~53\ : std_logic;
SIGNAL \s_counter[11]~54_combout\ : std_logic;
SIGNAL \s_counter[11]~55\ : std_logic;
SIGNAL \s_counter[12]~56_combout\ : std_logic;
SIGNAL \s_counter[12]~57\ : std_logic;
SIGNAL \s_counter[13]~58_combout\ : std_logic;
SIGNAL \s_counter[13]~59\ : std_logic;
SIGNAL \s_counter[14]~60_combout\ : std_logic;
SIGNAL \s_counter[14]~61\ : std_logic;
SIGNAL \s_counter[15]~62_combout\ : std_logic;
SIGNAL \s_counter[15]~63\ : std_logic;
SIGNAL \s_counter[16]~64_combout\ : std_logic;
SIGNAL \s_counter[16]~65\ : std_logic;
SIGNAL \s_counter[17]~66_combout\ : std_logic;
SIGNAL \s_counter[17]~67\ : std_logic;
SIGNAL \s_counter[18]~68_combout\ : std_logic;
SIGNAL \s_counter[18]~69\ : std_logic;
SIGNAL \s_counter[19]~70_combout\ : std_logic;
SIGNAL \s_counter[19]~71\ : std_logic;
SIGNAL \s_counter[20]~72_combout\ : std_logic;
SIGNAL \s_counter[20]~73\ : std_logic;
SIGNAL \s_counter[21]~74_combout\ : std_logic;
SIGNAL \s_counter[21]~75\ : std_logic;
SIGNAL \s_counter[22]~76_combout\ : std_logic;
SIGNAL \s_counter[22]~77\ : std_logic;
SIGNAL \s_counter[23]~78_combout\ : std_logic;
SIGNAL \s_counter[23]~79\ : std_logic;
SIGNAL \s_counter[24]~80_combout\ : std_logic;
SIGNAL \s_counter[24]~81\ : std_logic;
SIGNAL \s_counter[25]~82_combout\ : std_logic;
SIGNAL \s_counter[25]~83\ : std_logic;
SIGNAL \s_counter[26]~84_combout\ : std_logic;
SIGNAL \s_counter[26]~85\ : std_logic;
SIGNAL \s_counter[27]~86_combout\ : std_logic;
SIGNAL \s_counter[27]~87\ : std_logic;
SIGNAL \s_counter[28]~88_combout\ : std_logic;
SIGNAL \s_counter[28]~89\ : std_logic;
SIGNAL \s_counter[29]~90_combout\ : std_logic;
SIGNAL \s_counter[29]~91\ : std_logic;
SIGNAL \s_counter[30]~92_combout\ : std_logic;
SIGNAL \s_counter[30]~93\ : std_logic;
SIGNAL \s_counter[31]~94_combout\ : std_logic;
SIGNAL \k[31]~input_o\ : std_logic;
SIGNAL \k[30]~input_o\ : std_logic;
SIGNAL \k[29]~input_o\ : std_logic;
SIGNAL \k[28]~input_o\ : std_logic;
SIGNAL \k[27]~input_o\ : std_logic;
SIGNAL \k[26]~input_o\ : std_logic;
SIGNAL \k[25]~input_o\ : std_logic;
SIGNAL \k[24]~input_o\ : std_logic;
SIGNAL \k[23]~input_o\ : std_logic;
SIGNAL \k[22]~input_o\ : std_logic;
SIGNAL \k[21]~input_o\ : std_logic;
SIGNAL \k[20]~input_o\ : std_logic;
SIGNAL \k[19]~input_o\ : std_logic;
SIGNAL \k[18]~input_o\ : std_logic;
SIGNAL \k[17]~input_o\ : std_logic;
SIGNAL \k[16]~input_o\ : std_logic;
SIGNAL \k[15]~input_o\ : std_logic;
SIGNAL \k[14]~input_o\ : std_logic;
SIGNAL \k[13]~input_o\ : std_logic;
SIGNAL \k[12]~input_o\ : std_logic;
SIGNAL \k[11]~input_o\ : std_logic;
SIGNAL \k[10]~input_o\ : std_logic;
SIGNAL \k[9]~input_o\ : std_logic;
SIGNAL \k[8]~input_o\ : std_logic;
SIGNAL \k[7]~input_o\ : std_logic;
SIGNAL \k[6]~input_o\ : std_logic;
SIGNAL \k[5]~input_o\ : std_logic;
SIGNAL \k[4]~input_o\ : std_logic;
SIGNAL \k[3]~input_o\ : std_logic;
SIGNAL \k[0]~input_o\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_cout\ : std_logic;
SIGNAL \LessThan0~3_cout\ : std_logic;
SIGNAL \LessThan0~5_cout\ : std_logic;
SIGNAL \LessThan0~7_cout\ : std_logic;
SIGNAL \LessThan0~9_cout\ : std_logic;
SIGNAL \LessThan0~11_cout\ : std_logic;
SIGNAL \LessThan0~13_cout\ : std_logic;
SIGNAL \LessThan0~15_cout\ : std_logic;
SIGNAL \LessThan0~17_cout\ : std_logic;
SIGNAL \LessThan0~19_cout\ : std_logic;
SIGNAL \LessThan0~21_cout\ : std_logic;
SIGNAL \LessThan0~23_cout\ : std_logic;
SIGNAL \LessThan0~25_cout\ : std_logic;
SIGNAL \LessThan0~27_cout\ : std_logic;
SIGNAL \LessThan0~29_cout\ : std_logic;
SIGNAL \LessThan0~31_cout\ : std_logic;
SIGNAL \LessThan0~33_cout\ : std_logic;
SIGNAL \LessThan0~35_cout\ : std_logic;
SIGNAL \LessThan0~37_cout\ : std_logic;
SIGNAL \LessThan0~39_cout\ : std_logic;
SIGNAL \LessThan0~41_cout\ : std_logic;
SIGNAL \LessThan0~43_cout\ : std_logic;
SIGNAL \LessThan0~45_cout\ : std_logic;
SIGNAL \LessThan0~47_cout\ : std_logic;
SIGNAL \LessThan0~49_cout\ : std_logic;
SIGNAL \LessThan0~51_cout\ : std_logic;
SIGNAL \LessThan0~53_cout\ : std_logic;
SIGNAL \LessThan0~55_cout\ : std_logic;
SIGNAL \LessThan0~57_cout\ : std_logic;
SIGNAL \LessThan0~59_cout\ : std_logic;
SIGNAL \LessThan0~61_cout\ : std_logic;
SIGNAL \LessThan0~62_combout\ : std_logic;
SIGNAL \s_counter[0]~33\ : std_logic;
SIGNAL \s_counter[1]~34_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Add1~3\ : std_logic;
SIGNAL \Add1~4_combout\ : std_logic;
SIGNAL \Add1~5\ : std_logic;
SIGNAL \Add1~6_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Add1~7\ : std_logic;
SIGNAL \Add1~8_combout\ : std_logic;
SIGNAL \Add1~9\ : std_logic;
SIGNAL \Add1~10_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Add1~11\ : std_logic;
SIGNAL \Add1~12_combout\ : std_logic;
SIGNAL \Add1~13\ : std_logic;
SIGNAL \Add1~14_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Add1~15\ : std_logic;
SIGNAL \Add1~16_combout\ : std_logic;
SIGNAL \Add1~17\ : std_logic;
SIGNAL \Add1~18_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Add1~19\ : std_logic;
SIGNAL \Add1~21\ : std_logic;
SIGNAL \Add1~22_combout\ : std_logic;
SIGNAL \Add1~20_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Add1~23\ : std_logic;
SIGNAL \Add1~24_combout\ : std_logic;
SIGNAL \Add1~25\ : std_logic;
SIGNAL \Add1~26_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Add1~27\ : std_logic;
SIGNAL \Add1~28_combout\ : std_logic;
SIGNAL \Add1~29\ : std_logic;
SIGNAL \Add1~30_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \Add1~31\ : std_logic;
SIGNAL \Add1~32_combout\ : std_logic;
SIGNAL \Add1~33\ : std_logic;
SIGNAL \Add1~34_combout\ : std_logic;
SIGNAL \Equal0~11_combout\ : std_logic;
SIGNAL \Add1~35\ : std_logic;
SIGNAL \Add1~36_combout\ : std_logic;
SIGNAL \Add1~37\ : std_logic;
SIGNAL \Add1~38_combout\ : std_logic;
SIGNAL \Equal0~12_combout\ : std_logic;
SIGNAL \Add1~39\ : std_logic;
SIGNAL \Add1~40_combout\ : std_logic;
SIGNAL \Add1~41\ : std_logic;
SIGNAL \Add1~42_combout\ : std_logic;
SIGNAL \Equal0~13_combout\ : std_logic;
SIGNAL \Add1~43\ : std_logic;
SIGNAL \Add1~44_combout\ : std_logic;
SIGNAL \Add1~45\ : std_logic;
SIGNAL \Add1~46_combout\ : std_logic;
SIGNAL \Equal0~14_combout\ : std_logic;
SIGNAL \Equal0~15_combout\ : std_logic;
SIGNAL \Add1~47\ : std_logic;
SIGNAL \Add1~48_combout\ : std_logic;
SIGNAL \Add1~49\ : std_logic;
SIGNAL \Add1~50_combout\ : std_logic;
SIGNAL \Equal0~16_combout\ : std_logic;
SIGNAL \Add1~51\ : std_logic;
SIGNAL \Add1~52_combout\ : std_logic;
SIGNAL \Add1~53\ : std_logic;
SIGNAL \Add1~54_combout\ : std_logic;
SIGNAL \Equal0~17_combout\ : std_logic;
SIGNAL \Add1~55\ : std_logic;
SIGNAL \Add1~56_combout\ : std_logic;
SIGNAL \Add1~57\ : std_logic;
SIGNAL \Add1~58_combout\ : std_logic;
SIGNAL \Equal0~18_combout\ : std_logic;
SIGNAL \Add1~59\ : std_logic;
SIGNAL \Add1~60_combout\ : std_logic;
SIGNAL \Add1~61\ : std_logic;
SIGNAL \Add1~62_combout\ : std_logic;
SIGNAL \Equal0~19_combout\ : std_logic;
SIGNAL \Equal0~20_combout\ : std_logic;
SIGNAL \clkOut_int~0_combout\ : std_logic;
SIGNAL \clkOut_int~q\ : std_logic;
SIGNAL s_counter : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_LessThan0~62_combout\ : std_logic;

BEGIN

ww_clkIn <= clkIn;
ww_k <= k;
clkOut <= ww_clkOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_LessThan0~62_combout\ <= NOT \LessThan0~62_combout\;

\clkOut~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \clkOut_int~q\,
	devoe => ww_devoe,
	o => \clkOut~output_o\);

\clkIn~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clkIn,
	o => \clkIn~input_o\);

\k[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(1),
	o => \k[1]~input_o\);

\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = \k[1]~input_o\ $ (VCC)
-- \Add1~1\ = CARRY(\k[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k[1]~input_o\,
	datad => VCC,
	combout => \Add1~0_combout\,
	cout => \Add1~1\);

\k[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(2),
	o => \k[2]~input_o\);

\Add1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~2_combout\ = (\k[2]~input_o\ & (\Add1~1\ & VCC)) # (!\k[2]~input_o\ & (!\Add1~1\))
-- \Add1~3\ = CARRY((!\k[2]~input_o\ & !\Add1~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[2]~input_o\,
	datad => VCC,
	cin => \Add1~1\,
	combout => \Add1~2_combout\,
	cout => \Add1~3\);

\s_counter[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[0]~32_combout\ = s_counter(0) $ (VCC)
-- \s_counter[0]~33\ = CARRY(s_counter(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(0),
	datad => VCC,
	combout => \s_counter[0]~32_combout\,
	cout => \s_counter[0]~33\);

\s_counter[1]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[1]~34_combout\ = (s_counter(1) & (!\s_counter[0]~33\)) # (!s_counter(1) & ((\s_counter[0]~33\) # (GND)))
-- \s_counter[1]~35\ = CARRY((!\s_counter[0]~33\) # (!s_counter(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(1),
	datad => VCC,
	cin => \s_counter[0]~33\,
	combout => \s_counter[1]~34_combout\,
	cout => \s_counter[1]~35\);

\s_counter[2]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[2]~36_combout\ = (s_counter(2) & (\s_counter[1]~35\ $ (GND))) # (!s_counter(2) & (!\s_counter[1]~35\ & VCC))
-- \s_counter[2]~37\ = CARRY((s_counter(2) & !\s_counter[1]~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(2),
	datad => VCC,
	cin => \s_counter[1]~35\,
	combout => \s_counter[2]~36_combout\,
	cout => \s_counter[2]~37\);

\s_counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[2]~36_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(2));

\s_counter[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[3]~38_combout\ = (s_counter(3) & (!\s_counter[2]~37\)) # (!s_counter(3) & ((\s_counter[2]~37\) # (GND)))
-- \s_counter[3]~39\ = CARRY((!\s_counter[2]~37\) # (!s_counter(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(3),
	datad => VCC,
	cin => \s_counter[2]~37\,
	combout => \s_counter[3]~38_combout\,
	cout => \s_counter[3]~39\);

\s_counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[3]~38_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(3));

\s_counter[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[4]~40_combout\ = (s_counter(4) & (\s_counter[3]~39\ $ (GND))) # (!s_counter(4) & (!\s_counter[3]~39\ & VCC))
-- \s_counter[4]~41\ = CARRY((s_counter(4) & !\s_counter[3]~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(4),
	datad => VCC,
	cin => \s_counter[3]~39\,
	combout => \s_counter[4]~40_combout\,
	cout => \s_counter[4]~41\);

\s_counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[4]~40_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(4));

\s_counter[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[5]~42_combout\ = (s_counter(5) & (!\s_counter[4]~41\)) # (!s_counter(5) & ((\s_counter[4]~41\) # (GND)))
-- \s_counter[5]~43\ = CARRY((!\s_counter[4]~41\) # (!s_counter(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(5),
	datad => VCC,
	cin => \s_counter[4]~41\,
	combout => \s_counter[5]~42_combout\,
	cout => \s_counter[5]~43\);

\s_counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[5]~42_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(5));

\s_counter[6]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[6]~44_combout\ = (s_counter(6) & (\s_counter[5]~43\ $ (GND))) # (!s_counter(6) & (!\s_counter[5]~43\ & VCC))
-- \s_counter[6]~45\ = CARRY((s_counter(6) & !\s_counter[5]~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(6),
	datad => VCC,
	cin => \s_counter[5]~43\,
	combout => \s_counter[6]~44_combout\,
	cout => \s_counter[6]~45\);

\s_counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[6]~44_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(6));

\s_counter[7]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[7]~46_combout\ = (s_counter(7) & (!\s_counter[6]~45\)) # (!s_counter(7) & ((\s_counter[6]~45\) # (GND)))
-- \s_counter[7]~47\ = CARRY((!\s_counter[6]~45\) # (!s_counter(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(7),
	datad => VCC,
	cin => \s_counter[6]~45\,
	combout => \s_counter[7]~46_combout\,
	cout => \s_counter[7]~47\);

\s_counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[7]~46_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(7));

\s_counter[8]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[8]~48_combout\ = (s_counter(8) & (\s_counter[7]~47\ $ (GND))) # (!s_counter(8) & (!\s_counter[7]~47\ & VCC))
-- \s_counter[8]~49\ = CARRY((s_counter(8) & !\s_counter[7]~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(8),
	datad => VCC,
	cin => \s_counter[7]~47\,
	combout => \s_counter[8]~48_combout\,
	cout => \s_counter[8]~49\);

\s_counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[8]~48_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(8));

\s_counter[9]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[9]~50_combout\ = (s_counter(9) & (!\s_counter[8]~49\)) # (!s_counter(9) & ((\s_counter[8]~49\) # (GND)))
-- \s_counter[9]~51\ = CARRY((!\s_counter[8]~49\) # (!s_counter(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(9),
	datad => VCC,
	cin => \s_counter[8]~49\,
	combout => \s_counter[9]~50_combout\,
	cout => \s_counter[9]~51\);

\s_counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[9]~50_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(9));

\s_counter[10]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[10]~52_combout\ = (s_counter(10) & (\s_counter[9]~51\ $ (GND))) # (!s_counter(10) & (!\s_counter[9]~51\ & VCC))
-- \s_counter[10]~53\ = CARRY((s_counter(10) & !\s_counter[9]~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(10),
	datad => VCC,
	cin => \s_counter[9]~51\,
	combout => \s_counter[10]~52_combout\,
	cout => \s_counter[10]~53\);

\s_counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[10]~52_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(10));

\s_counter[11]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[11]~54_combout\ = (s_counter(11) & (!\s_counter[10]~53\)) # (!s_counter(11) & ((\s_counter[10]~53\) # (GND)))
-- \s_counter[11]~55\ = CARRY((!\s_counter[10]~53\) # (!s_counter(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(11),
	datad => VCC,
	cin => \s_counter[10]~53\,
	combout => \s_counter[11]~54_combout\,
	cout => \s_counter[11]~55\);

\s_counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[11]~54_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(11));

\s_counter[12]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[12]~56_combout\ = (s_counter(12) & (\s_counter[11]~55\ $ (GND))) # (!s_counter(12) & (!\s_counter[11]~55\ & VCC))
-- \s_counter[12]~57\ = CARRY((s_counter(12) & !\s_counter[11]~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(12),
	datad => VCC,
	cin => \s_counter[11]~55\,
	combout => \s_counter[12]~56_combout\,
	cout => \s_counter[12]~57\);

\s_counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[12]~56_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(12));

\s_counter[13]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[13]~58_combout\ = (s_counter(13) & (!\s_counter[12]~57\)) # (!s_counter(13) & ((\s_counter[12]~57\) # (GND)))
-- \s_counter[13]~59\ = CARRY((!\s_counter[12]~57\) # (!s_counter(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(13),
	datad => VCC,
	cin => \s_counter[12]~57\,
	combout => \s_counter[13]~58_combout\,
	cout => \s_counter[13]~59\);

\s_counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[13]~58_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(13));

\s_counter[14]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[14]~60_combout\ = (s_counter(14) & (\s_counter[13]~59\ $ (GND))) # (!s_counter(14) & (!\s_counter[13]~59\ & VCC))
-- \s_counter[14]~61\ = CARRY((s_counter(14) & !\s_counter[13]~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(14),
	datad => VCC,
	cin => \s_counter[13]~59\,
	combout => \s_counter[14]~60_combout\,
	cout => \s_counter[14]~61\);

\s_counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[14]~60_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(14));

\s_counter[15]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[15]~62_combout\ = (s_counter(15) & (!\s_counter[14]~61\)) # (!s_counter(15) & ((\s_counter[14]~61\) # (GND)))
-- \s_counter[15]~63\ = CARRY((!\s_counter[14]~61\) # (!s_counter(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(15),
	datad => VCC,
	cin => \s_counter[14]~61\,
	combout => \s_counter[15]~62_combout\,
	cout => \s_counter[15]~63\);

\s_counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[15]~62_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(15));

\s_counter[16]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[16]~64_combout\ = (s_counter(16) & (\s_counter[15]~63\ $ (GND))) # (!s_counter(16) & (!\s_counter[15]~63\ & VCC))
-- \s_counter[16]~65\ = CARRY((s_counter(16) & !\s_counter[15]~63\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(16),
	datad => VCC,
	cin => \s_counter[15]~63\,
	combout => \s_counter[16]~64_combout\,
	cout => \s_counter[16]~65\);

\s_counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[16]~64_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(16));

\s_counter[17]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[17]~66_combout\ = (s_counter(17) & (!\s_counter[16]~65\)) # (!s_counter(17) & ((\s_counter[16]~65\) # (GND)))
-- \s_counter[17]~67\ = CARRY((!\s_counter[16]~65\) # (!s_counter(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(17),
	datad => VCC,
	cin => \s_counter[16]~65\,
	combout => \s_counter[17]~66_combout\,
	cout => \s_counter[17]~67\);

\s_counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[17]~66_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(17));

\s_counter[18]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[18]~68_combout\ = (s_counter(18) & (\s_counter[17]~67\ $ (GND))) # (!s_counter(18) & (!\s_counter[17]~67\ & VCC))
-- \s_counter[18]~69\ = CARRY((s_counter(18) & !\s_counter[17]~67\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(18),
	datad => VCC,
	cin => \s_counter[17]~67\,
	combout => \s_counter[18]~68_combout\,
	cout => \s_counter[18]~69\);

\s_counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[18]~68_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(18));

\s_counter[19]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[19]~70_combout\ = (s_counter(19) & (!\s_counter[18]~69\)) # (!s_counter(19) & ((\s_counter[18]~69\) # (GND)))
-- \s_counter[19]~71\ = CARRY((!\s_counter[18]~69\) # (!s_counter(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(19),
	datad => VCC,
	cin => \s_counter[18]~69\,
	combout => \s_counter[19]~70_combout\,
	cout => \s_counter[19]~71\);

\s_counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[19]~70_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(19));

\s_counter[20]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[20]~72_combout\ = (s_counter(20) & (\s_counter[19]~71\ $ (GND))) # (!s_counter(20) & (!\s_counter[19]~71\ & VCC))
-- \s_counter[20]~73\ = CARRY((s_counter(20) & !\s_counter[19]~71\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(20),
	datad => VCC,
	cin => \s_counter[19]~71\,
	combout => \s_counter[20]~72_combout\,
	cout => \s_counter[20]~73\);

\s_counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[20]~72_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(20));

\s_counter[21]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[21]~74_combout\ = (s_counter(21) & (!\s_counter[20]~73\)) # (!s_counter(21) & ((\s_counter[20]~73\) # (GND)))
-- \s_counter[21]~75\ = CARRY((!\s_counter[20]~73\) # (!s_counter(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(21),
	datad => VCC,
	cin => \s_counter[20]~73\,
	combout => \s_counter[21]~74_combout\,
	cout => \s_counter[21]~75\);

\s_counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[21]~74_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(21));

\s_counter[22]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[22]~76_combout\ = (s_counter(22) & (\s_counter[21]~75\ $ (GND))) # (!s_counter(22) & (!\s_counter[21]~75\ & VCC))
-- \s_counter[22]~77\ = CARRY((s_counter(22) & !\s_counter[21]~75\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(22),
	datad => VCC,
	cin => \s_counter[21]~75\,
	combout => \s_counter[22]~76_combout\,
	cout => \s_counter[22]~77\);

\s_counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[22]~76_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(22));

\s_counter[23]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[23]~78_combout\ = (s_counter(23) & (!\s_counter[22]~77\)) # (!s_counter(23) & ((\s_counter[22]~77\) # (GND)))
-- \s_counter[23]~79\ = CARRY((!\s_counter[22]~77\) # (!s_counter(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(23),
	datad => VCC,
	cin => \s_counter[22]~77\,
	combout => \s_counter[23]~78_combout\,
	cout => \s_counter[23]~79\);

\s_counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[23]~78_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(23));

\s_counter[24]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[24]~80_combout\ = (s_counter(24) & (\s_counter[23]~79\ $ (GND))) # (!s_counter(24) & (!\s_counter[23]~79\ & VCC))
-- \s_counter[24]~81\ = CARRY((s_counter(24) & !\s_counter[23]~79\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(24),
	datad => VCC,
	cin => \s_counter[23]~79\,
	combout => \s_counter[24]~80_combout\,
	cout => \s_counter[24]~81\);

\s_counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[24]~80_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(24));

\s_counter[25]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[25]~82_combout\ = (s_counter(25) & (!\s_counter[24]~81\)) # (!s_counter(25) & ((\s_counter[24]~81\) # (GND)))
-- \s_counter[25]~83\ = CARRY((!\s_counter[24]~81\) # (!s_counter(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(25),
	datad => VCC,
	cin => \s_counter[24]~81\,
	combout => \s_counter[25]~82_combout\,
	cout => \s_counter[25]~83\);

\s_counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[25]~82_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(25));

\s_counter[26]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[26]~84_combout\ = (s_counter(26) & (\s_counter[25]~83\ $ (GND))) # (!s_counter(26) & (!\s_counter[25]~83\ & VCC))
-- \s_counter[26]~85\ = CARRY((s_counter(26) & !\s_counter[25]~83\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(26),
	datad => VCC,
	cin => \s_counter[25]~83\,
	combout => \s_counter[26]~84_combout\,
	cout => \s_counter[26]~85\);

\s_counter[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[26]~84_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(26));

\s_counter[27]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[27]~86_combout\ = (s_counter(27) & (!\s_counter[26]~85\)) # (!s_counter(27) & ((\s_counter[26]~85\) # (GND)))
-- \s_counter[27]~87\ = CARRY((!\s_counter[26]~85\) # (!s_counter(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(27),
	datad => VCC,
	cin => \s_counter[26]~85\,
	combout => \s_counter[27]~86_combout\,
	cout => \s_counter[27]~87\);

\s_counter[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[27]~86_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(27));

\s_counter[28]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[28]~88_combout\ = (s_counter(28) & (\s_counter[27]~87\ $ (GND))) # (!s_counter(28) & (!\s_counter[27]~87\ & VCC))
-- \s_counter[28]~89\ = CARRY((s_counter(28) & !\s_counter[27]~87\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(28),
	datad => VCC,
	cin => \s_counter[27]~87\,
	combout => \s_counter[28]~88_combout\,
	cout => \s_counter[28]~89\);

\s_counter[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[28]~88_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(28));

\s_counter[29]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[29]~90_combout\ = (s_counter(29) & (!\s_counter[28]~89\)) # (!s_counter(29) & ((\s_counter[28]~89\) # (GND)))
-- \s_counter[29]~91\ = CARRY((!\s_counter[28]~89\) # (!s_counter(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(29),
	datad => VCC,
	cin => \s_counter[28]~89\,
	combout => \s_counter[29]~90_combout\,
	cout => \s_counter[29]~91\);

\s_counter[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[29]~90_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(29));

\s_counter[30]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[30]~92_combout\ = (s_counter(30) & (\s_counter[29]~91\ $ (GND))) # (!s_counter(30) & (!\s_counter[29]~91\ & VCC))
-- \s_counter[30]~93\ = CARRY((s_counter(30) & !\s_counter[29]~91\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(30),
	datad => VCC,
	cin => \s_counter[29]~91\,
	combout => \s_counter[30]~92_combout\,
	cout => \s_counter[30]~93\);

\s_counter[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[30]~92_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(30));

\s_counter[31]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_counter[31]~94_combout\ = s_counter(31) $ (\s_counter[30]~93\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(31),
	cin => \s_counter[30]~93\,
	combout => \s_counter[31]~94_combout\);

\s_counter[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[31]~94_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(31));

\k[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(31),
	o => \k[31]~input_o\);

\k[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(30),
	o => \k[30]~input_o\);

\k[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(29),
	o => \k[29]~input_o\);

\k[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(28),
	o => \k[28]~input_o\);

\k[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(27),
	o => \k[27]~input_o\);

\k[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(26),
	o => \k[26]~input_o\);

\k[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(25),
	o => \k[25]~input_o\);

\k[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(24),
	o => \k[24]~input_o\);

\k[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(23),
	o => \k[23]~input_o\);

\k[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(22),
	o => \k[22]~input_o\);

\k[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(21),
	o => \k[21]~input_o\);

\k[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(20),
	o => \k[20]~input_o\);

\k[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(19),
	o => \k[19]~input_o\);

\k[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(18),
	o => \k[18]~input_o\);

\k[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(17),
	o => \k[17]~input_o\);

\k[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(16),
	o => \k[16]~input_o\);

\k[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(15),
	o => \k[15]~input_o\);

\k[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(14),
	o => \k[14]~input_o\);

\k[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(13),
	o => \k[13]~input_o\);

\k[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(12),
	o => \k[12]~input_o\);

\k[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(11),
	o => \k[11]~input_o\);

\k[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(10),
	o => \k[10]~input_o\);

\k[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(9),
	o => \k[9]~input_o\);

\k[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(8),
	o => \k[8]~input_o\);

\k[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(7),
	o => \k[7]~input_o\);

\k[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(6),
	o => \k[6]~input_o\);

\k[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(5),
	o => \k[5]~input_o\);

\k[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(4),
	o => \k[4]~input_o\);

\k[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(3),
	o => \k[3]~input_o\);

\k[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_k(0),
	o => \k[0]~input_o\);

\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = \k[0]~input_o\ $ (VCC)
-- \Add0~1\ = CARRY(\k[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \k[0]~input_o\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\k[1]~input_o\ & (\Add0~1\ & VCC)) # (!\k[1]~input_o\ & (!\Add0~1\))
-- \Add0~3\ = CARRY((!\k[1]~input_o\ & !\Add0~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[1]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (\k[2]~input_o\ & ((GND) # (!\Add0~3\))) # (!\k[2]~input_o\ & (\Add0~3\ $ (GND)))
-- \Add0~5\ = CARRY((\k[2]~input_o\) # (!\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[2]~input_o\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\k[3]~input_o\ & (\Add0~5\ & VCC)) # (!\k[3]~input_o\ & (!\Add0~5\))
-- \Add0~7\ = CARRY((!\k[3]~input_o\ & !\Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[3]~input_o\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (\k[4]~input_o\ & ((GND) # (!\Add0~7\))) # (!\k[4]~input_o\ & (\Add0~7\ $ (GND)))
-- \Add0~9\ = CARRY((\k[4]~input_o\) # (!\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[4]~input_o\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\k[5]~input_o\ & (\Add0~9\ & VCC)) # (!\k[5]~input_o\ & (!\Add0~9\))
-- \Add0~11\ = CARRY((!\k[5]~input_o\ & !\Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[5]~input_o\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (\k[6]~input_o\ & ((GND) # (!\Add0~11\))) # (!\k[6]~input_o\ & (\Add0~11\ $ (GND)))
-- \Add0~13\ = CARRY((\k[6]~input_o\) # (!\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[6]~input_o\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\k[7]~input_o\ & (\Add0~13\ & VCC)) # (!\k[7]~input_o\ & (!\Add0~13\))
-- \Add0~15\ = CARRY((!\k[7]~input_o\ & !\Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[7]~input_o\,
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (\k[8]~input_o\ & ((GND) # (!\Add0~15\))) # (!\k[8]~input_o\ & (\Add0~15\ $ (GND)))
-- \Add0~17\ = CARRY((\k[8]~input_o\) # (!\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[8]~input_o\,
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (\k[9]~input_o\ & (\Add0~17\ & VCC)) # (!\k[9]~input_o\ & (!\Add0~17\))
-- \Add0~19\ = CARRY((!\k[9]~input_o\ & !\Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[9]~input_o\,
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (\k[10]~input_o\ & ((GND) # (!\Add0~19\))) # (!\k[10]~input_o\ & (\Add0~19\ $ (GND)))
-- \Add0~21\ = CARRY((\k[10]~input_o\) # (!\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[10]~input_o\,
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\k[11]~input_o\ & (\Add0~21\ & VCC)) # (!\k[11]~input_o\ & (!\Add0~21\))
-- \Add0~23\ = CARRY((!\k[11]~input_o\ & !\Add0~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[11]~input_o\,
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (\k[12]~input_o\ & ((GND) # (!\Add0~23\))) # (!\k[12]~input_o\ & (\Add0~23\ $ (GND)))
-- \Add0~25\ = CARRY((\k[12]~input_o\) # (!\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[12]~input_o\,
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (\k[13]~input_o\ & (\Add0~25\ & VCC)) # (!\k[13]~input_o\ & (!\Add0~25\))
-- \Add0~27\ = CARRY((!\k[13]~input_o\ & !\Add0~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[13]~input_o\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (\k[14]~input_o\ & ((GND) # (!\Add0~27\))) # (!\k[14]~input_o\ & (\Add0~27\ $ (GND)))
-- \Add0~29\ = CARRY((\k[14]~input_o\) # (!\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[14]~input_o\,
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (\k[15]~input_o\ & (\Add0~29\ & VCC)) # (!\k[15]~input_o\ & (!\Add0~29\))
-- \Add0~31\ = CARRY((!\k[15]~input_o\ & !\Add0~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[15]~input_o\,
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (\k[16]~input_o\ & ((GND) # (!\Add0~31\))) # (!\k[16]~input_o\ & (\Add0~31\ $ (GND)))
-- \Add0~33\ = CARRY((\k[16]~input_o\) # (!\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[16]~input_o\,
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (\k[17]~input_o\ & (\Add0~33\ & VCC)) # (!\k[17]~input_o\ & (!\Add0~33\))
-- \Add0~35\ = CARRY((!\k[17]~input_o\ & !\Add0~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[17]~input_o\,
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = (\k[18]~input_o\ & ((GND) # (!\Add0~35\))) # (!\k[18]~input_o\ & (\Add0~35\ $ (GND)))
-- \Add0~37\ = CARRY((\k[18]~input_o\) # (!\Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[18]~input_o\,
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

\Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (\k[19]~input_o\ & (\Add0~37\ & VCC)) # (!\k[19]~input_o\ & (!\Add0~37\))
-- \Add0~39\ = CARRY((!\k[19]~input_o\ & !\Add0~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[19]~input_o\,
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

\Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = (\k[20]~input_o\ & ((GND) # (!\Add0~39\))) # (!\k[20]~input_o\ & (\Add0~39\ $ (GND)))
-- \Add0~41\ = CARRY((\k[20]~input_o\) # (!\Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[20]~input_o\,
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

\Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (\k[21]~input_o\ & (\Add0~41\ & VCC)) # (!\k[21]~input_o\ & (!\Add0~41\))
-- \Add0~43\ = CARRY((!\k[21]~input_o\ & !\Add0~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[21]~input_o\,
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

\Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = (\k[22]~input_o\ & ((GND) # (!\Add0~43\))) # (!\k[22]~input_o\ & (\Add0~43\ $ (GND)))
-- \Add0~45\ = CARRY((\k[22]~input_o\) # (!\Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[22]~input_o\,
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

\Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (\k[23]~input_o\ & (\Add0~45\ & VCC)) # (!\k[23]~input_o\ & (!\Add0~45\))
-- \Add0~47\ = CARRY((!\k[23]~input_o\ & !\Add0~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[23]~input_o\,
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

\Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = (\k[24]~input_o\ & ((GND) # (!\Add0~47\))) # (!\k[24]~input_o\ & (\Add0~47\ $ (GND)))
-- \Add0~49\ = CARRY((\k[24]~input_o\) # (!\Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[24]~input_o\,
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

\Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (\k[25]~input_o\ & (\Add0~49\ & VCC)) # (!\k[25]~input_o\ & (!\Add0~49\))
-- \Add0~51\ = CARRY((!\k[25]~input_o\ & !\Add0~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[25]~input_o\,
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

\Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = (\k[26]~input_o\ & ((GND) # (!\Add0~51\))) # (!\k[26]~input_o\ & (\Add0~51\ $ (GND)))
-- \Add0~53\ = CARRY((\k[26]~input_o\) # (!\Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[26]~input_o\,
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

\Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (\k[27]~input_o\ & (\Add0~53\ & VCC)) # (!\k[27]~input_o\ & (!\Add0~53\))
-- \Add0~55\ = CARRY((!\k[27]~input_o\ & !\Add0~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[27]~input_o\,
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

\Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = (\k[28]~input_o\ & ((GND) # (!\Add0~55\))) # (!\k[28]~input_o\ & (\Add0~55\ $ (GND)))
-- \Add0~57\ = CARRY((\k[28]~input_o\) # (!\Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[28]~input_o\,
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

\Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (\k[29]~input_o\ & (\Add0~57\ & VCC)) # (!\k[29]~input_o\ & (!\Add0~57\))
-- \Add0~59\ = CARRY((!\k[29]~input_o\ & !\Add0~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[29]~input_o\,
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

\Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = (\k[30]~input_o\ & ((GND) # (!\Add0~59\))) # (!\k[30]~input_o\ & (\Add0~59\ $ (GND)))
-- \Add0~61\ = CARRY((\k[30]~input_o\) # (!\Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[30]~input_o\,
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

\Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = \k[31]~input_o\ $ (!\Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[31]~input_o\,
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_cout\ = CARRY((!s_counter(0) & \Add0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(0),
	datab => \Add0~0_combout\,
	datad => VCC,
	cout => \LessThan0~1_cout\);

\LessThan0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~3_cout\ = CARRY((s_counter(1) & ((!\LessThan0~1_cout\) # (!\Add0~2_combout\))) # (!s_counter(1) & (!\Add0~2_combout\ & !\LessThan0~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(1),
	datab => \Add0~2_combout\,
	datad => VCC,
	cin => \LessThan0~1_cout\,
	cout => \LessThan0~3_cout\);

\LessThan0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~5_cout\ = CARRY((s_counter(2) & (\Add0~4_combout\ & !\LessThan0~3_cout\)) # (!s_counter(2) & ((\Add0~4_combout\) # (!\LessThan0~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(2),
	datab => \Add0~4_combout\,
	datad => VCC,
	cin => \LessThan0~3_cout\,
	cout => \LessThan0~5_cout\);

\LessThan0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~7_cout\ = CARRY((s_counter(3) & ((!\LessThan0~5_cout\) # (!\Add0~6_combout\))) # (!s_counter(3) & (!\Add0~6_combout\ & !\LessThan0~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(3),
	datab => \Add0~6_combout\,
	datad => VCC,
	cin => \LessThan0~5_cout\,
	cout => \LessThan0~7_cout\);

\LessThan0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~9_cout\ = CARRY((s_counter(4) & (\Add0~8_combout\ & !\LessThan0~7_cout\)) # (!s_counter(4) & ((\Add0~8_combout\) # (!\LessThan0~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(4),
	datab => \Add0~8_combout\,
	datad => VCC,
	cin => \LessThan0~7_cout\,
	cout => \LessThan0~9_cout\);

\LessThan0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~11_cout\ = CARRY((s_counter(5) & ((!\LessThan0~9_cout\) # (!\Add0~10_combout\))) # (!s_counter(5) & (!\Add0~10_combout\ & !\LessThan0~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(5),
	datab => \Add0~10_combout\,
	datad => VCC,
	cin => \LessThan0~9_cout\,
	cout => \LessThan0~11_cout\);

\LessThan0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~13_cout\ = CARRY((s_counter(6) & (\Add0~12_combout\ & !\LessThan0~11_cout\)) # (!s_counter(6) & ((\Add0~12_combout\) # (!\LessThan0~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(6),
	datab => \Add0~12_combout\,
	datad => VCC,
	cin => \LessThan0~11_cout\,
	cout => \LessThan0~13_cout\);

\LessThan0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~15_cout\ = CARRY((s_counter(7) & ((!\LessThan0~13_cout\) # (!\Add0~14_combout\))) # (!s_counter(7) & (!\Add0~14_combout\ & !\LessThan0~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(7),
	datab => \Add0~14_combout\,
	datad => VCC,
	cin => \LessThan0~13_cout\,
	cout => \LessThan0~15_cout\);

\LessThan0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~17_cout\ = CARRY((s_counter(8) & (\Add0~16_combout\ & !\LessThan0~15_cout\)) # (!s_counter(8) & ((\Add0~16_combout\) # (!\LessThan0~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(8),
	datab => \Add0~16_combout\,
	datad => VCC,
	cin => \LessThan0~15_cout\,
	cout => \LessThan0~17_cout\);

\LessThan0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~19_cout\ = CARRY((s_counter(9) & ((!\LessThan0~17_cout\) # (!\Add0~18_combout\))) # (!s_counter(9) & (!\Add0~18_combout\ & !\LessThan0~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(9),
	datab => \Add0~18_combout\,
	datad => VCC,
	cin => \LessThan0~17_cout\,
	cout => \LessThan0~19_cout\);

\LessThan0~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~21_cout\ = CARRY((s_counter(10) & (\Add0~20_combout\ & !\LessThan0~19_cout\)) # (!s_counter(10) & ((\Add0~20_combout\) # (!\LessThan0~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(10),
	datab => \Add0~20_combout\,
	datad => VCC,
	cin => \LessThan0~19_cout\,
	cout => \LessThan0~21_cout\);

\LessThan0~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~23_cout\ = CARRY((s_counter(11) & ((!\LessThan0~21_cout\) # (!\Add0~22_combout\))) # (!s_counter(11) & (!\Add0~22_combout\ & !\LessThan0~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(11),
	datab => \Add0~22_combout\,
	datad => VCC,
	cin => \LessThan0~21_cout\,
	cout => \LessThan0~23_cout\);

\LessThan0~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~25_cout\ = CARRY((s_counter(12) & (\Add0~24_combout\ & !\LessThan0~23_cout\)) # (!s_counter(12) & ((\Add0~24_combout\) # (!\LessThan0~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(12),
	datab => \Add0~24_combout\,
	datad => VCC,
	cin => \LessThan0~23_cout\,
	cout => \LessThan0~25_cout\);

\LessThan0~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~27_cout\ = CARRY((s_counter(13) & ((!\LessThan0~25_cout\) # (!\Add0~26_combout\))) # (!s_counter(13) & (!\Add0~26_combout\ & !\LessThan0~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(13),
	datab => \Add0~26_combout\,
	datad => VCC,
	cin => \LessThan0~25_cout\,
	cout => \LessThan0~27_cout\);

\LessThan0~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~29_cout\ = CARRY((s_counter(14) & (\Add0~28_combout\ & !\LessThan0~27_cout\)) # (!s_counter(14) & ((\Add0~28_combout\) # (!\LessThan0~27_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(14),
	datab => \Add0~28_combout\,
	datad => VCC,
	cin => \LessThan0~27_cout\,
	cout => \LessThan0~29_cout\);

\LessThan0~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~31_cout\ = CARRY((s_counter(15) & ((!\LessThan0~29_cout\) # (!\Add0~30_combout\))) # (!s_counter(15) & (!\Add0~30_combout\ & !\LessThan0~29_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(15),
	datab => \Add0~30_combout\,
	datad => VCC,
	cin => \LessThan0~29_cout\,
	cout => \LessThan0~31_cout\);

\LessThan0~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~33_cout\ = CARRY((s_counter(16) & (\Add0~32_combout\ & !\LessThan0~31_cout\)) # (!s_counter(16) & ((\Add0~32_combout\) # (!\LessThan0~31_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(16),
	datab => \Add0~32_combout\,
	datad => VCC,
	cin => \LessThan0~31_cout\,
	cout => \LessThan0~33_cout\);

\LessThan0~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~35_cout\ = CARRY((s_counter(17) & ((!\LessThan0~33_cout\) # (!\Add0~34_combout\))) # (!s_counter(17) & (!\Add0~34_combout\ & !\LessThan0~33_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(17),
	datab => \Add0~34_combout\,
	datad => VCC,
	cin => \LessThan0~33_cout\,
	cout => \LessThan0~35_cout\);

\LessThan0~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~37_cout\ = CARRY((s_counter(18) & (\Add0~36_combout\ & !\LessThan0~35_cout\)) # (!s_counter(18) & ((\Add0~36_combout\) # (!\LessThan0~35_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(18),
	datab => \Add0~36_combout\,
	datad => VCC,
	cin => \LessThan0~35_cout\,
	cout => \LessThan0~37_cout\);

\LessThan0~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~39_cout\ = CARRY((s_counter(19) & ((!\LessThan0~37_cout\) # (!\Add0~38_combout\))) # (!s_counter(19) & (!\Add0~38_combout\ & !\LessThan0~37_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(19),
	datab => \Add0~38_combout\,
	datad => VCC,
	cin => \LessThan0~37_cout\,
	cout => \LessThan0~39_cout\);

\LessThan0~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~41_cout\ = CARRY((s_counter(20) & (\Add0~40_combout\ & !\LessThan0~39_cout\)) # (!s_counter(20) & ((\Add0~40_combout\) # (!\LessThan0~39_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(20),
	datab => \Add0~40_combout\,
	datad => VCC,
	cin => \LessThan0~39_cout\,
	cout => \LessThan0~41_cout\);

\LessThan0~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~43_cout\ = CARRY((s_counter(21) & ((!\LessThan0~41_cout\) # (!\Add0~42_combout\))) # (!s_counter(21) & (!\Add0~42_combout\ & !\LessThan0~41_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(21),
	datab => \Add0~42_combout\,
	datad => VCC,
	cin => \LessThan0~41_cout\,
	cout => \LessThan0~43_cout\);

\LessThan0~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~45_cout\ = CARRY((s_counter(22) & (\Add0~44_combout\ & !\LessThan0~43_cout\)) # (!s_counter(22) & ((\Add0~44_combout\) # (!\LessThan0~43_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(22),
	datab => \Add0~44_combout\,
	datad => VCC,
	cin => \LessThan0~43_cout\,
	cout => \LessThan0~45_cout\);

\LessThan0~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~47_cout\ = CARRY((s_counter(23) & ((!\LessThan0~45_cout\) # (!\Add0~46_combout\))) # (!s_counter(23) & (!\Add0~46_combout\ & !\LessThan0~45_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(23),
	datab => \Add0~46_combout\,
	datad => VCC,
	cin => \LessThan0~45_cout\,
	cout => \LessThan0~47_cout\);

\LessThan0~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~49_cout\ = CARRY((s_counter(24) & (\Add0~48_combout\ & !\LessThan0~47_cout\)) # (!s_counter(24) & ((\Add0~48_combout\) # (!\LessThan0~47_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(24),
	datab => \Add0~48_combout\,
	datad => VCC,
	cin => \LessThan0~47_cout\,
	cout => \LessThan0~49_cout\);

\LessThan0~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~51_cout\ = CARRY((s_counter(25) & ((!\LessThan0~49_cout\) # (!\Add0~50_combout\))) # (!s_counter(25) & (!\Add0~50_combout\ & !\LessThan0~49_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(25),
	datab => \Add0~50_combout\,
	datad => VCC,
	cin => \LessThan0~49_cout\,
	cout => \LessThan0~51_cout\);

\LessThan0~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~53_cout\ = CARRY((s_counter(26) & (\Add0~52_combout\ & !\LessThan0~51_cout\)) # (!s_counter(26) & ((\Add0~52_combout\) # (!\LessThan0~51_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(26),
	datab => \Add0~52_combout\,
	datad => VCC,
	cin => \LessThan0~51_cout\,
	cout => \LessThan0~53_cout\);

\LessThan0~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~55_cout\ = CARRY((s_counter(27) & ((!\LessThan0~53_cout\) # (!\Add0~54_combout\))) # (!s_counter(27) & (!\Add0~54_combout\ & !\LessThan0~53_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(27),
	datab => \Add0~54_combout\,
	datad => VCC,
	cin => \LessThan0~53_cout\,
	cout => \LessThan0~55_cout\);

\LessThan0~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~57_cout\ = CARRY((s_counter(28) & (\Add0~56_combout\ & !\LessThan0~55_cout\)) # (!s_counter(28) & ((\Add0~56_combout\) # (!\LessThan0~55_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(28),
	datab => \Add0~56_combout\,
	datad => VCC,
	cin => \LessThan0~55_cout\,
	cout => \LessThan0~57_cout\);

\LessThan0~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~59_cout\ = CARRY((s_counter(29) & ((!\LessThan0~57_cout\) # (!\Add0~58_combout\))) # (!s_counter(29) & (!\Add0~58_combout\ & !\LessThan0~57_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(29),
	datab => \Add0~58_combout\,
	datad => VCC,
	cin => \LessThan0~57_cout\,
	cout => \LessThan0~59_cout\);

\LessThan0~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~61_cout\ = CARRY((s_counter(30) & (\Add0~60_combout\ & !\LessThan0~59_cout\)) # (!s_counter(30) & ((\Add0~60_combout\) # (!\LessThan0~59_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(30),
	datab => \Add0~60_combout\,
	datad => VCC,
	cin => \LessThan0~59_cout\,
	cout => \LessThan0~61_cout\);

\LessThan0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~62_combout\ = (s_counter(31) & (\Add0~62_combout\ & \LessThan0~61_cout\)) # (!s_counter(31) & ((\Add0~62_combout\) # (\LessThan0~61_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => s_counter(31),
	datab => \Add0~62_combout\,
	cin => \LessThan0~61_cout\,
	combout => \LessThan0~62_combout\);

\s_counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[0]~32_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(0));

\s_counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \s_counter[1]~34_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_counter(1));

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (\Add1~0_combout\ & (s_counter(0) & (\Add1~2_combout\ $ (!s_counter(1))))) # (!\Add1~0_combout\ & (!s_counter(0) & (\Add1~2_combout\ $ (!s_counter(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~0_combout\,
	datab => \Add1~2_combout\,
	datac => s_counter(1),
	datad => s_counter(0),
	combout => \Equal0~0_combout\);

\Add1~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~4_combout\ = (\k[3]~input_o\ & ((GND) # (!\Add1~3\))) # (!\k[3]~input_o\ & (\Add1~3\ $ (GND)))
-- \Add1~5\ = CARRY((\k[3]~input_o\) # (!\Add1~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[3]~input_o\,
	datad => VCC,
	cin => \Add1~3\,
	combout => \Add1~4_combout\,
	cout => \Add1~5\);

\Add1~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~6_combout\ = (\k[4]~input_o\ & (\Add1~5\ & VCC)) # (!\k[4]~input_o\ & (!\Add1~5\))
-- \Add1~7\ = CARRY((!\k[4]~input_o\ & !\Add1~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[4]~input_o\,
	datad => VCC,
	cin => \Add1~5\,
	combout => \Add1~6_combout\,
	cout => \Add1~7\);

\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (\Add1~4_combout\ & (s_counter(2) & (\Add1~6_combout\ $ (!s_counter(3))))) # (!\Add1~4_combout\ & (!s_counter(2) & (\Add1~6_combout\ $ (!s_counter(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~4_combout\,
	datab => \Add1~6_combout\,
	datac => s_counter(3),
	datad => s_counter(2),
	combout => \Equal0~1_combout\);

\Add1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~8_combout\ = (\k[5]~input_o\ & ((GND) # (!\Add1~7\))) # (!\k[5]~input_o\ & (\Add1~7\ $ (GND)))
-- \Add1~9\ = CARRY((\k[5]~input_o\) # (!\Add1~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[5]~input_o\,
	datad => VCC,
	cin => \Add1~7\,
	combout => \Add1~8_combout\,
	cout => \Add1~9\);

\Add1~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~10_combout\ = (\k[6]~input_o\ & (\Add1~9\ & VCC)) # (!\k[6]~input_o\ & (!\Add1~9\))
-- \Add1~11\ = CARRY((!\k[6]~input_o\ & !\Add1~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[6]~input_o\,
	datad => VCC,
	cin => \Add1~9\,
	combout => \Add1~10_combout\,
	cout => \Add1~11\);

\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Add1~8_combout\ & (s_counter(4) & (\Add1~10_combout\ $ (!s_counter(5))))) # (!\Add1~8_combout\ & (!s_counter(4) & (\Add1~10_combout\ $ (!s_counter(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~8_combout\,
	datab => \Add1~10_combout\,
	datac => s_counter(5),
	datad => s_counter(4),
	combout => \Equal0~2_combout\);

\Add1~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~12_combout\ = (\k[7]~input_o\ & ((GND) # (!\Add1~11\))) # (!\k[7]~input_o\ & (\Add1~11\ $ (GND)))
-- \Add1~13\ = CARRY((\k[7]~input_o\) # (!\Add1~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[7]~input_o\,
	datad => VCC,
	cin => \Add1~11\,
	combout => \Add1~12_combout\,
	cout => \Add1~13\);

\Add1~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~14_combout\ = (\k[8]~input_o\ & (\Add1~13\ & VCC)) # (!\k[8]~input_o\ & (!\Add1~13\))
-- \Add1~15\ = CARRY((!\k[8]~input_o\ & !\Add1~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[8]~input_o\,
	datad => VCC,
	cin => \Add1~13\,
	combout => \Add1~14_combout\,
	cout => \Add1~15\);

\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (\Add1~12_combout\ & (s_counter(6) & (\Add1~14_combout\ $ (!s_counter(7))))) # (!\Add1~12_combout\ & (!s_counter(6) & (\Add1~14_combout\ $ (!s_counter(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~12_combout\,
	datab => \Add1~14_combout\,
	datac => s_counter(7),
	datad => s_counter(6),
	combout => \Equal0~3_combout\);

\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~0_combout\ & (\Equal0~1_combout\ & (\Equal0~2_combout\ & \Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~3_combout\,
	combout => \Equal0~4_combout\);

\Add1~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~16_combout\ = (\k[9]~input_o\ & ((GND) # (!\Add1~15\))) # (!\k[9]~input_o\ & (\Add1~15\ $ (GND)))
-- \Add1~17\ = CARRY((\k[9]~input_o\) # (!\Add1~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[9]~input_o\,
	datad => VCC,
	cin => \Add1~15\,
	combout => \Add1~16_combout\,
	cout => \Add1~17\);

\Add1~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~18_combout\ = (\k[10]~input_o\ & (\Add1~17\ & VCC)) # (!\k[10]~input_o\ & (!\Add1~17\))
-- \Add1~19\ = CARRY((!\k[10]~input_o\ & !\Add1~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[10]~input_o\,
	datad => VCC,
	cin => \Add1~17\,
	combout => \Add1~18_combout\,
	cout => \Add1~19\);

\Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (\Add1~16_combout\ & (s_counter(8) & (\Add1~18_combout\ $ (!s_counter(9))))) # (!\Add1~16_combout\ & (!s_counter(8) & (\Add1~18_combout\ $ (!s_counter(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~16_combout\,
	datab => \Add1~18_combout\,
	datac => s_counter(9),
	datad => s_counter(8),
	combout => \Equal0~5_combout\);

\Add1~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~20_combout\ = (\k[11]~input_o\ & ((GND) # (!\Add1~19\))) # (!\k[11]~input_o\ & (\Add1~19\ $ (GND)))
-- \Add1~21\ = CARRY((\k[11]~input_o\) # (!\Add1~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[11]~input_o\,
	datad => VCC,
	cin => \Add1~19\,
	combout => \Add1~20_combout\,
	cout => \Add1~21\);

\Add1~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~22_combout\ = (\k[12]~input_o\ & (\Add1~21\ & VCC)) # (!\k[12]~input_o\ & (!\Add1~21\))
-- \Add1~23\ = CARRY((!\k[12]~input_o\ & !\Add1~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[12]~input_o\,
	datad => VCC,
	cin => \Add1~21\,
	combout => \Add1~22_combout\,
	cout => \Add1~23\);

\Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = \Add1~20_combout\ $ (s_counter(10))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add1~20_combout\,
	datad => s_counter(10),
	combout => \Equal0~6_combout\);

\Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (\Equal0~5_combout\ & (!\Equal0~6_combout\ & (\Add1~22_combout\ $ (!s_counter(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \Add1~22_combout\,
	datac => s_counter(11),
	datad => \Equal0~6_combout\,
	combout => \Equal0~7_combout\);

\Add1~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~24_combout\ = (\k[13]~input_o\ & ((GND) # (!\Add1~23\))) # (!\k[13]~input_o\ & (\Add1~23\ $ (GND)))
-- \Add1~25\ = CARRY((\k[13]~input_o\) # (!\Add1~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[13]~input_o\,
	datad => VCC,
	cin => \Add1~23\,
	combout => \Add1~24_combout\,
	cout => \Add1~25\);

\Add1~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~26_combout\ = (\k[14]~input_o\ & (\Add1~25\ & VCC)) # (!\k[14]~input_o\ & (!\Add1~25\))
-- \Add1~27\ = CARRY((!\k[14]~input_o\ & !\Add1~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[14]~input_o\,
	datad => VCC,
	cin => \Add1~25\,
	combout => \Add1~26_combout\,
	cout => \Add1~27\);

\Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (\Add1~24_combout\ & (s_counter(12) & (\Add1~26_combout\ $ (!s_counter(13))))) # (!\Add1~24_combout\ & (!s_counter(12) & (\Add1~26_combout\ $ (!s_counter(13)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~24_combout\,
	datab => \Add1~26_combout\,
	datac => s_counter(13),
	datad => s_counter(12),
	combout => \Equal0~8_combout\);

\Add1~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~28_combout\ = (\k[15]~input_o\ & ((GND) # (!\Add1~27\))) # (!\k[15]~input_o\ & (\Add1~27\ $ (GND)))
-- \Add1~29\ = CARRY((\k[15]~input_o\) # (!\Add1~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[15]~input_o\,
	datad => VCC,
	cin => \Add1~27\,
	combout => \Add1~28_combout\,
	cout => \Add1~29\);

\Add1~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~30_combout\ = (\k[16]~input_o\ & (\Add1~29\ & VCC)) # (!\k[16]~input_o\ & (!\Add1~29\))
-- \Add1~31\ = CARRY((!\k[16]~input_o\ & !\Add1~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[16]~input_o\,
	datad => VCC,
	cin => \Add1~29\,
	combout => \Add1~30_combout\,
	cout => \Add1~31\);

\Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Add1~28_combout\ & (s_counter(14) & (\Add1~30_combout\ $ (!s_counter(15))))) # (!\Add1~28_combout\ & (!s_counter(14) & (\Add1~30_combout\ $ (!s_counter(15)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~28_combout\,
	datab => \Add1~30_combout\,
	datac => s_counter(15),
	datad => s_counter(14),
	combout => \Equal0~9_combout\);

\Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (\Equal0~4_combout\ & (\Equal0~7_combout\ & (\Equal0~8_combout\ & \Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~4_combout\,
	datab => \Equal0~7_combout\,
	datac => \Equal0~8_combout\,
	datad => \Equal0~9_combout\,
	combout => \Equal0~10_combout\);

\Add1~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~32_combout\ = (\k[17]~input_o\ & ((GND) # (!\Add1~31\))) # (!\k[17]~input_o\ & (\Add1~31\ $ (GND)))
-- \Add1~33\ = CARRY((\k[17]~input_o\) # (!\Add1~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[17]~input_o\,
	datad => VCC,
	cin => \Add1~31\,
	combout => \Add1~32_combout\,
	cout => \Add1~33\);

\Add1~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~34_combout\ = (\k[18]~input_o\ & (\Add1~33\ & VCC)) # (!\k[18]~input_o\ & (!\Add1~33\))
-- \Add1~35\ = CARRY((!\k[18]~input_o\ & !\Add1~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[18]~input_o\,
	datad => VCC,
	cin => \Add1~33\,
	combout => \Add1~34_combout\,
	cout => \Add1~35\);

\Equal0~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~11_combout\ = (\Add1~32_combout\ & (s_counter(16) & (\Add1~34_combout\ $ (!s_counter(17))))) # (!\Add1~32_combout\ & (!s_counter(16) & (\Add1~34_combout\ $ (!s_counter(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~32_combout\,
	datab => \Add1~34_combout\,
	datac => s_counter(17),
	datad => s_counter(16),
	combout => \Equal0~11_combout\);

\Add1~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~36_combout\ = (\k[19]~input_o\ & ((GND) # (!\Add1~35\))) # (!\k[19]~input_o\ & (\Add1~35\ $ (GND)))
-- \Add1~37\ = CARRY((\k[19]~input_o\) # (!\Add1~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[19]~input_o\,
	datad => VCC,
	cin => \Add1~35\,
	combout => \Add1~36_combout\,
	cout => \Add1~37\);

\Add1~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~38_combout\ = (\k[20]~input_o\ & (\Add1~37\ & VCC)) # (!\k[20]~input_o\ & (!\Add1~37\))
-- \Add1~39\ = CARRY((!\k[20]~input_o\ & !\Add1~37\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[20]~input_o\,
	datad => VCC,
	cin => \Add1~37\,
	combout => \Add1~38_combout\,
	cout => \Add1~39\);

\Equal0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~12_combout\ = (\Add1~36_combout\ & (s_counter(18) & (\Add1~38_combout\ $ (!s_counter(19))))) # (!\Add1~36_combout\ & (!s_counter(18) & (\Add1~38_combout\ $ (!s_counter(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~36_combout\,
	datab => \Add1~38_combout\,
	datac => s_counter(19),
	datad => s_counter(18),
	combout => \Equal0~12_combout\);

\Add1~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~40_combout\ = (\k[21]~input_o\ & ((GND) # (!\Add1~39\))) # (!\k[21]~input_o\ & (\Add1~39\ $ (GND)))
-- \Add1~41\ = CARRY((\k[21]~input_o\) # (!\Add1~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[21]~input_o\,
	datad => VCC,
	cin => \Add1~39\,
	combout => \Add1~40_combout\,
	cout => \Add1~41\);

\Add1~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~42_combout\ = (\k[22]~input_o\ & (\Add1~41\ & VCC)) # (!\k[22]~input_o\ & (!\Add1~41\))
-- \Add1~43\ = CARRY((!\k[22]~input_o\ & !\Add1~41\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[22]~input_o\,
	datad => VCC,
	cin => \Add1~41\,
	combout => \Add1~42_combout\,
	cout => \Add1~43\);

\Equal0~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~13_combout\ = (\Add1~40_combout\ & (s_counter(20) & (\Add1~42_combout\ $ (!s_counter(21))))) # (!\Add1~40_combout\ & (!s_counter(20) & (\Add1~42_combout\ $ (!s_counter(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~40_combout\,
	datab => \Add1~42_combout\,
	datac => s_counter(21),
	datad => s_counter(20),
	combout => \Equal0~13_combout\);

\Add1~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~44_combout\ = (\k[23]~input_o\ & ((GND) # (!\Add1~43\))) # (!\k[23]~input_o\ & (\Add1~43\ $ (GND)))
-- \Add1~45\ = CARRY((\k[23]~input_o\) # (!\Add1~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[23]~input_o\,
	datad => VCC,
	cin => \Add1~43\,
	combout => \Add1~44_combout\,
	cout => \Add1~45\);

\Add1~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~46_combout\ = (\k[24]~input_o\ & (\Add1~45\ & VCC)) # (!\k[24]~input_o\ & (!\Add1~45\))
-- \Add1~47\ = CARRY((!\k[24]~input_o\ & !\Add1~45\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[24]~input_o\,
	datad => VCC,
	cin => \Add1~45\,
	combout => \Add1~46_combout\,
	cout => \Add1~47\);

\Equal0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~14_combout\ = (\Add1~44_combout\ & (s_counter(22) & (\Add1~46_combout\ $ (!s_counter(23))))) # (!\Add1~44_combout\ & (!s_counter(22) & (\Add1~46_combout\ $ (!s_counter(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~44_combout\,
	datab => \Add1~46_combout\,
	datac => s_counter(23),
	datad => s_counter(22),
	combout => \Equal0~14_combout\);

\Equal0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~15_combout\ = (\Equal0~11_combout\ & (\Equal0~12_combout\ & (\Equal0~13_combout\ & \Equal0~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~11_combout\,
	datab => \Equal0~12_combout\,
	datac => \Equal0~13_combout\,
	datad => \Equal0~14_combout\,
	combout => \Equal0~15_combout\);

\Add1~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~48_combout\ = (\k[25]~input_o\ & ((GND) # (!\Add1~47\))) # (!\k[25]~input_o\ & (\Add1~47\ $ (GND)))
-- \Add1~49\ = CARRY((\k[25]~input_o\) # (!\Add1~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[25]~input_o\,
	datad => VCC,
	cin => \Add1~47\,
	combout => \Add1~48_combout\,
	cout => \Add1~49\);

\Add1~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~50_combout\ = (\k[26]~input_o\ & (\Add1~49\ & VCC)) # (!\k[26]~input_o\ & (!\Add1~49\))
-- \Add1~51\ = CARRY((!\k[26]~input_o\ & !\Add1~49\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[26]~input_o\,
	datad => VCC,
	cin => \Add1~49\,
	combout => \Add1~50_combout\,
	cout => \Add1~51\);

\Equal0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~16_combout\ = (\Add1~48_combout\ & (s_counter(24) & (\Add1~50_combout\ $ (!s_counter(25))))) # (!\Add1~48_combout\ & (!s_counter(24) & (\Add1~50_combout\ $ (!s_counter(25)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~48_combout\,
	datab => \Add1~50_combout\,
	datac => s_counter(25),
	datad => s_counter(24),
	combout => \Equal0~16_combout\);

\Add1~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~52_combout\ = (\k[27]~input_o\ & ((GND) # (!\Add1~51\))) # (!\k[27]~input_o\ & (\Add1~51\ $ (GND)))
-- \Add1~53\ = CARRY((\k[27]~input_o\) # (!\Add1~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[27]~input_o\,
	datad => VCC,
	cin => \Add1~51\,
	combout => \Add1~52_combout\,
	cout => \Add1~53\);

\Add1~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~54_combout\ = (\k[28]~input_o\ & (\Add1~53\ & VCC)) # (!\k[28]~input_o\ & (!\Add1~53\))
-- \Add1~55\ = CARRY((!\k[28]~input_o\ & !\Add1~53\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[28]~input_o\,
	datad => VCC,
	cin => \Add1~53\,
	combout => \Add1~54_combout\,
	cout => \Add1~55\);

\Equal0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~17_combout\ = (\Add1~52_combout\ & (s_counter(26) & (\Add1~54_combout\ $ (!s_counter(27))))) # (!\Add1~52_combout\ & (!s_counter(26) & (\Add1~54_combout\ $ (!s_counter(27)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~52_combout\,
	datab => \Add1~54_combout\,
	datac => s_counter(27),
	datad => s_counter(26),
	combout => \Equal0~17_combout\);

\Add1~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~56_combout\ = (\k[29]~input_o\ & ((GND) # (!\Add1~55\))) # (!\k[29]~input_o\ & (\Add1~55\ $ (GND)))
-- \Add1~57\ = CARRY((\k[29]~input_o\) # (!\Add1~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[29]~input_o\,
	datad => VCC,
	cin => \Add1~55\,
	combout => \Add1~56_combout\,
	cout => \Add1~57\);

\Add1~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~58_combout\ = (\k[30]~input_o\ & (\Add1~57\ & VCC)) # (!\k[30]~input_o\ & (!\Add1~57\))
-- \Add1~59\ = CARRY((!\k[30]~input_o\ & !\Add1~57\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[30]~input_o\,
	datad => VCC,
	cin => \Add1~57\,
	combout => \Add1~58_combout\,
	cout => \Add1~59\);

\Equal0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~18_combout\ = (\Add1~56_combout\ & (s_counter(28) & (\Add1~58_combout\ $ (!s_counter(29))))) # (!\Add1~56_combout\ & (!s_counter(28) & (\Add1~58_combout\ $ (!s_counter(29)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~56_combout\,
	datab => \Add1~58_combout\,
	datac => s_counter(29),
	datad => s_counter(28),
	combout => \Equal0~18_combout\);

\Add1~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~60_combout\ = (\k[31]~input_o\ & ((GND) # (!\Add1~59\))) # (!\k[31]~input_o\ & (\Add1~59\ $ (GND)))
-- \Add1~61\ = CARRY((\k[31]~input_o\) # (!\Add1~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \k[31]~input_o\,
	datad => VCC,
	cin => \Add1~59\,
	combout => \Add1~60_combout\,
	cout => \Add1~61\);

\Add1~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~62_combout\ = !\Add1~61\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \Add1~61\,
	combout => \Add1~62_combout\);

\Equal0~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~19_combout\ = (\Add1~60_combout\ & (s_counter(30) & (\Add1~62_combout\ $ (!s_counter(31))))) # (!\Add1~60_combout\ & (!s_counter(30) & (\Add1~62_combout\ $ (!s_counter(31)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add1~60_combout\,
	datab => \Add1~62_combout\,
	datac => s_counter(31),
	datad => s_counter(30),
	combout => \Equal0~19_combout\);

\Equal0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~20_combout\ = (\Equal0~16_combout\ & (\Equal0~17_combout\ & (\Equal0~18_combout\ & \Equal0~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~16_combout\,
	datab => \Equal0~17_combout\,
	datac => \Equal0~18_combout\,
	datad => \Equal0~19_combout\,
	combout => \Equal0~20_combout\);

\clkOut_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \clkOut_int~0_combout\ = (\clkOut_int~q\) # ((\Equal0~10_combout\ & (\Equal0~15_combout\ & \Equal0~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clkOut_int~q\,
	datab => \Equal0~10_combout\,
	datac => \Equal0~15_combout\,
	datad => \Equal0~20_combout\,
	combout => \clkOut_int~0_combout\);

clkOut_int : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clkIn~input_o\,
	d => \clkOut_int~0_combout\,
	sclr => \ALT_INV_LessThan0~62_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \clkOut_int~q\);

ww_clkOut <= \clkOut~output_o\;
END structure;


