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

-- DATE "05/27/2024 19:07:14"

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

ENTITY 	TimerN IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	start : IN std_logic;
	timerOut : OUT std_logic
	);
END TimerN;

ARCHITECTURE structure OF TimerN IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_enable : std_logic;
SIGNAL ww_start : std_logic;
SIGNAL ww_timerOut : std_logic;
SIGNAL \timerOut~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \s_count~1_combout\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \s_count[1]~2_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \start~input_o\ : std_logic;
SIGNAL \s_timerOut~2_combout\ : std_logic;
SIGNAL \s_count[0]~3_combout\ : std_logic;
SIGNAL \s_count[2]~0_combout\ : std_logic;
SIGNAL \s_timerOut~0_combout\ : std_logic;
SIGNAL \s_timerOut~1_combout\ : std_logic;
SIGNAL \s_timerOut~q\ : std_logic;
SIGNAL s_count : std_logic_vector(2 DOWNTO 0);
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_enable <= enable;
ww_start <= start;
timerOut <= ww_timerOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

\timerOut~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \s_timerOut~q\,
	devoe => ww_devoe,
	o => \timerOut~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\s_count~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count~1_combout\ = (s_count(0)) # ((s_count(2) & s_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(0),
	datab => s_count(2),
	datac => s_count(1),
	combout => \s_count~1_combout\);

\enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

\s_count[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[1]~2_combout\ = (\enable~input_o\ & (!\s_timerOut~2_combout\ & (s_count(1) $ (\s_count~1_combout\)))) # (!\enable~input_o\ & (s_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(1),
	datab => \s_count~1_combout\,
	datac => \s_timerOut~2_combout\,
	datad => \enable~input_o\,
	combout => \s_count[1]~2_combout\);

\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\s_count[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[1]~2_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(1));

\start~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_start,
	o => \start~input_o\);

\s_timerOut~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_timerOut~2_combout\ = (!s_count(2) & (!s_count(1) & (!s_count(0) & !\start~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(2),
	datab => s_count(1),
	datac => s_count(0),
	datad => \start~input_o\,
	combout => \s_timerOut~2_combout\);

\s_count[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[0]~3_combout\ = (\enable~input_o\ & (((!\s_timerOut~2_combout\ & !\s_count~1_combout\)))) # (!\enable~input_o\ & (s_count(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(0),
	datab => \s_timerOut~2_combout\,
	datac => \s_count~1_combout\,
	datad => \enable~input_o\,
	combout => \s_count[0]~3_combout\);

\s_count[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[0]~3_combout\,
	clrn => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(0));

\s_count[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_count[2]~0_combout\ = (s_count(2) & ((!s_count(1)))) # (!s_count(2) & (s_count(0) & s_count(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(0),
	datac => s_count(2),
	datad => s_count(1),
	combout => \s_count[2]~0_combout\);

\s_count[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_count[2]~0_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => s_count(2));

\s_timerOut~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_timerOut~0_combout\ = (\s_timerOut~q\) # (\start~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \s_timerOut~q\,
	datab => \start~input_o\,
	combout => \s_timerOut~0_combout\);

\s_timerOut~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \s_timerOut~1_combout\ = (s_count(0)) # ((s_count(2) & (!s_count(1))) # (!s_count(2) & ((s_count(1)) # (\s_timerOut~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => s_count(2),
	datab => s_count(1),
	datac => s_count(0),
	datad => \s_timerOut~0_combout\,
	combout => \s_timerOut~1_combout\);

s_timerOut : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \s_timerOut~1_combout\,
	clrn => \ALT_INV_reset~input_o\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \s_timerOut~q\);

ww_timerOut <= \timerOut~output_o\;
END structure;


