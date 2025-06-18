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
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "03/21/2024 11:06:39"

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

ENTITY 	AccN IS
    PORT (
	dataIn : IN std_logic_vector(7 DOWNTO 0);
	dataOut : OUT std_logic_vector(7 DOWNTO 0);
	enable : IN std_logic;
	clk : IN std_logic;
	reset : IN std_logic;
	overflow : OUT std_logic
	);
END AccN;

ARCHITECTURE structure OF AccN IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_dataIn : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_dataOut : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_enable : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_overflow : std_logic;
SIGNAL \dataOut[0]~output_o\ : std_logic;
SIGNAL \dataOut[1]~output_o\ : std_logic;
SIGNAL \dataOut[2]~output_o\ : std_logic;
SIGNAL \dataOut[3]~output_o\ : std_logic;
SIGNAL \dataOut[4]~output_o\ : std_logic;
SIGNAL \dataOut[5]~output_o\ : std_logic;
SIGNAL \dataOut[6]~output_o\ : std_logic;
SIGNAL \dataOut[7]~output_o\ : std_logic;
SIGNAL \overflow~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \dataIn[0]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[0]~0_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \RegN_0|dataOut~0_combout\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \RegN_0|dataOut[0]~1_combout\ : std_logic;
SIGNAL \dataIn[1]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[0]~1\ : std_logic;
SIGNAL \Adder_0|Soma[1]~2_combout\ : std_logic;
SIGNAL \RegN_0|dataOut~2_combout\ : std_logic;
SIGNAL \dataIn[2]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[1]~3\ : std_logic;
SIGNAL \Adder_0|Soma[2]~4_combout\ : std_logic;
SIGNAL \RegN_0|dataOut~3_combout\ : std_logic;
SIGNAL \dataIn[3]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[2]~5\ : std_logic;
SIGNAL \Adder_0|Soma[3]~6_combout\ : std_logic;
SIGNAL \RegN_0|dataOut~4_combout\ : std_logic;
SIGNAL \dataIn[4]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[3]~7\ : std_logic;
SIGNAL \Adder_0|Soma[4]~8_combout\ : std_logic;
SIGNAL \RegN_0|dataOut~5_combout\ : std_logic;
SIGNAL \dataIn[5]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[4]~9\ : std_logic;
SIGNAL \Adder_0|Soma[5]~10_combout\ : std_logic;
SIGNAL \RegN_0|dataOut~6_combout\ : std_logic;
SIGNAL \dataIn[6]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[5]~11\ : std_logic;
SIGNAL \Adder_0|Soma[6]~12_combout\ : std_logic;
SIGNAL \RegN_0|dataOut~7_combout\ : std_logic;
SIGNAL \dataIn[7]~input_o\ : std_logic;
SIGNAL \Adder_0|Soma[6]~13\ : std_logic;
SIGNAL \Adder_0|Soma[7]~14_combout\ : std_logic;
SIGNAL \RegN_0|dataOut~8_combout\ : std_logic;
SIGNAL \overflow~0_combout\ : std_logic;
SIGNAL \RegN_0|dataOut\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_dataIn <= dataIn;
dataOut <= ww_dataOut;
ww_enable <= enable;
ww_clk <= clk;
ww_reset <= reset;
overflow <= ww_overflow;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\dataOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(0),
	devoe => ww_devoe,
	o => \dataOut[0]~output_o\);

\dataOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(1),
	devoe => ww_devoe,
	o => \dataOut[1]~output_o\);

\dataOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(2),
	devoe => ww_devoe,
	o => \dataOut[2]~output_o\);

\dataOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(3),
	devoe => ww_devoe,
	o => \dataOut[3]~output_o\);

\dataOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(4),
	devoe => ww_devoe,
	o => \dataOut[4]~output_o\);

\dataOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(5),
	devoe => ww_devoe,
	o => \dataOut[5]~output_o\);

\dataOut[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(6),
	devoe => ww_devoe,
	o => \dataOut[6]~output_o\);

\dataOut[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \RegN_0|dataOut\(7),
	devoe => ww_devoe,
	o => \dataOut[7]~output_o\);

\overflow~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \overflow~0_combout\,
	devoe => ww_devoe,
	o => \overflow~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\dataIn[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(0),
	o => \dataIn[0]~input_o\);

\Adder_0|Soma[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[0]~0_combout\ = (\RegN_0|dataOut\(0) & (\dataIn[0]~input_o\ $ (VCC))) # (!\RegN_0|dataOut\(0) & (\dataIn[0]~input_o\ & VCC))
-- \Adder_0|Soma[0]~1\ = CARRY((\RegN_0|dataOut\(0) & \dataIn[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(0),
	datab => \dataIn[0]~input_o\,
	datad => VCC,
	combout => \Adder_0|Soma[0]~0_combout\,
	cout => \Adder_0|Soma[0]~1\);

\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\RegN_0|dataOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~0_combout\ = (\Adder_0|Soma[0]~0_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[0]~0_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~0_combout\);

\enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

\RegN_0|dataOut[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut[0]~1_combout\ = (\reset~input_o\) # (\enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reset~input_o\,
	datab => \enable~input_o\,
	combout => \RegN_0|dataOut[0]~1_combout\);

\RegN_0|dataOut[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~0_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(0));

\dataIn[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(1),
	o => \dataIn[1]~input_o\);

\Adder_0|Soma[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[1]~2_combout\ = (\RegN_0|dataOut\(1) & ((\dataIn[1]~input_o\ & (\Adder_0|Soma[0]~1\ & VCC)) # (!\dataIn[1]~input_o\ & (!\Adder_0|Soma[0]~1\)))) # (!\RegN_0|dataOut\(1) & ((\dataIn[1]~input_o\ & (!\Adder_0|Soma[0]~1\)) # (!\dataIn[1]~input_o\ 
-- & ((\Adder_0|Soma[0]~1\) # (GND)))))
-- \Adder_0|Soma[1]~3\ = CARRY((\RegN_0|dataOut\(1) & (!\dataIn[1]~input_o\ & !\Adder_0|Soma[0]~1\)) # (!\RegN_0|dataOut\(1) & ((!\Adder_0|Soma[0]~1\) # (!\dataIn[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(1),
	datab => \dataIn[1]~input_o\,
	datad => VCC,
	cin => \Adder_0|Soma[0]~1\,
	combout => \Adder_0|Soma[1]~2_combout\,
	cout => \Adder_0|Soma[1]~3\);

\RegN_0|dataOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~2_combout\ = (\Adder_0|Soma[1]~2_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[1]~2_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~2_combout\);

\RegN_0|dataOut[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~2_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(1));

\dataIn[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(2),
	o => \dataIn[2]~input_o\);

\Adder_0|Soma[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[2]~4_combout\ = ((\RegN_0|dataOut\(2) $ (\dataIn[2]~input_o\ $ (!\Adder_0|Soma[1]~3\)))) # (GND)
-- \Adder_0|Soma[2]~5\ = CARRY((\RegN_0|dataOut\(2) & ((\dataIn[2]~input_o\) # (!\Adder_0|Soma[1]~3\))) # (!\RegN_0|dataOut\(2) & (\dataIn[2]~input_o\ & !\Adder_0|Soma[1]~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(2),
	datab => \dataIn[2]~input_o\,
	datad => VCC,
	cin => \Adder_0|Soma[1]~3\,
	combout => \Adder_0|Soma[2]~4_combout\,
	cout => \Adder_0|Soma[2]~5\);

\RegN_0|dataOut~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~3_combout\ = (\Adder_0|Soma[2]~4_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[2]~4_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~3_combout\);

\RegN_0|dataOut[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~3_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(2));

\dataIn[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(3),
	o => \dataIn[3]~input_o\);

\Adder_0|Soma[3]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[3]~6_combout\ = (\RegN_0|dataOut\(3) & ((\dataIn[3]~input_o\ & (\Adder_0|Soma[2]~5\ & VCC)) # (!\dataIn[3]~input_o\ & (!\Adder_0|Soma[2]~5\)))) # (!\RegN_0|dataOut\(3) & ((\dataIn[3]~input_o\ & (!\Adder_0|Soma[2]~5\)) # (!\dataIn[3]~input_o\ 
-- & ((\Adder_0|Soma[2]~5\) # (GND)))))
-- \Adder_0|Soma[3]~7\ = CARRY((\RegN_0|dataOut\(3) & (!\dataIn[3]~input_o\ & !\Adder_0|Soma[2]~5\)) # (!\RegN_0|dataOut\(3) & ((!\Adder_0|Soma[2]~5\) # (!\dataIn[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(3),
	datab => \dataIn[3]~input_o\,
	datad => VCC,
	cin => \Adder_0|Soma[2]~5\,
	combout => \Adder_0|Soma[3]~6_combout\,
	cout => \Adder_0|Soma[3]~7\);

\RegN_0|dataOut~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~4_combout\ = (\Adder_0|Soma[3]~6_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[3]~6_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~4_combout\);

\RegN_0|dataOut[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~4_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(3));

\dataIn[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(4),
	o => \dataIn[4]~input_o\);

\Adder_0|Soma[4]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[4]~8_combout\ = ((\RegN_0|dataOut\(4) $ (\dataIn[4]~input_o\ $ (!\Adder_0|Soma[3]~7\)))) # (GND)
-- \Adder_0|Soma[4]~9\ = CARRY((\RegN_0|dataOut\(4) & ((\dataIn[4]~input_o\) # (!\Adder_0|Soma[3]~7\))) # (!\RegN_0|dataOut\(4) & (\dataIn[4]~input_o\ & !\Adder_0|Soma[3]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(4),
	datab => \dataIn[4]~input_o\,
	datad => VCC,
	cin => \Adder_0|Soma[3]~7\,
	combout => \Adder_0|Soma[4]~8_combout\,
	cout => \Adder_0|Soma[4]~9\);

\RegN_0|dataOut~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~5_combout\ = (\Adder_0|Soma[4]~8_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[4]~8_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~5_combout\);

\RegN_0|dataOut[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~5_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(4));

\dataIn[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(5),
	o => \dataIn[5]~input_o\);

\Adder_0|Soma[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[5]~10_combout\ = (\RegN_0|dataOut\(5) & ((\dataIn[5]~input_o\ & (\Adder_0|Soma[4]~9\ & VCC)) # (!\dataIn[5]~input_o\ & (!\Adder_0|Soma[4]~9\)))) # (!\RegN_0|dataOut\(5) & ((\dataIn[5]~input_o\ & (!\Adder_0|Soma[4]~9\)) # 
-- (!\dataIn[5]~input_o\ & ((\Adder_0|Soma[4]~9\) # (GND)))))
-- \Adder_0|Soma[5]~11\ = CARRY((\RegN_0|dataOut\(5) & (!\dataIn[5]~input_o\ & !\Adder_0|Soma[4]~9\)) # (!\RegN_0|dataOut\(5) & ((!\Adder_0|Soma[4]~9\) # (!\dataIn[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(5),
	datab => \dataIn[5]~input_o\,
	datad => VCC,
	cin => \Adder_0|Soma[4]~9\,
	combout => \Adder_0|Soma[5]~10_combout\,
	cout => \Adder_0|Soma[5]~11\);

\RegN_0|dataOut~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~6_combout\ = (\Adder_0|Soma[5]~10_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[5]~10_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~6_combout\);

\RegN_0|dataOut[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~6_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(5));

\dataIn[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(6),
	o => \dataIn[6]~input_o\);

\Adder_0|Soma[6]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[6]~12_combout\ = ((\RegN_0|dataOut\(6) $ (\dataIn[6]~input_o\ $ (!\Adder_0|Soma[5]~11\)))) # (GND)
-- \Adder_0|Soma[6]~13\ = CARRY((\RegN_0|dataOut\(6) & ((\dataIn[6]~input_o\) # (!\Adder_0|Soma[5]~11\))) # (!\RegN_0|dataOut\(6) & (\dataIn[6]~input_o\ & !\Adder_0|Soma[5]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(6),
	datab => \dataIn[6]~input_o\,
	datad => VCC,
	cin => \Adder_0|Soma[5]~11\,
	combout => \Adder_0|Soma[6]~12_combout\,
	cout => \Adder_0|Soma[6]~13\);

\RegN_0|dataOut~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~7_combout\ = (\Adder_0|Soma[6]~12_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[6]~12_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~7_combout\);

\RegN_0|dataOut[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~7_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(6));

\dataIn[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dataIn(7),
	o => \dataIn[7]~input_o\);

\Adder_0|Soma[7]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Adder_0|Soma[7]~14_combout\ = \RegN_0|dataOut\(7) $ (\dataIn[7]~input_o\ $ (\Adder_0|Soma[6]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(7),
	datab => \dataIn[7]~input_o\,
	cin => \Adder_0|Soma[6]~13\,
	combout => \Adder_0|Soma[7]~14_combout\);

\RegN_0|dataOut~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \RegN_0|dataOut~8_combout\ = (\Adder_0|Soma[7]~14_combout\ & !\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Adder_0|Soma[7]~14_combout\,
	datad => \reset~input_o\,
	combout => \RegN_0|dataOut~8_combout\);

\RegN_0|dataOut[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \RegN_0|dataOut~8_combout\,
	ena => \RegN_0|dataOut[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \RegN_0|dataOut\(7));

\overflow~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \overflow~0_combout\ = \RegN_0|dataOut\(7) $ (\dataIn[7]~input_o\ $ (\Adder_0|Soma[7]~14_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegN_0|dataOut\(7),
	datab => \dataIn[7]~input_o\,
	datac => \Adder_0|Soma[7]~14_combout\,
	combout => \overflow~0_combout\);

ww_dataOut(0) <= \dataOut[0]~output_o\;

ww_dataOut(1) <= \dataOut[1]~output_o\;

ww_dataOut(2) <= \dataOut[2]~output_o\;

ww_dataOut(3) <= \dataOut[3]~output_o\;

ww_dataOut(4) <= \dataOut[4]~output_o\;

ww_dataOut(5) <= \dataOut[5]~output_o\;

ww_dataOut(6) <= \dataOut[6]~output_o\;

ww_dataOut(7) <= \dataOut[7]~output_o\;

ww_overflow <= \overflow~output_o\;
END structure;


