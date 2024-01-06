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

-- DATE "12/21/2023 13:37:00"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
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

ENTITY 	MEF IS
    PORT (
	Q1 : OUT std_logic;
	X : IN std_logic;
	CLK : IN std_logic;
	RESET_L : IN std_logic;
	Q0 : OUT std_logic
	);
END MEF;

ARCHITECTURE structure OF MEF IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Q1 : std_logic;
SIGNAL ww_X : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_RESET_L : std_logic;
SIGNAL ww_Q0 : std_logic;
SIGNAL \Q1~output_o\ : std_logic;
SIGNAL \Q0~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \RESET_L~input_o\ : std_logic;
SIGNAL \X~input_o\ : std_logic;
SIGNAL \inst|inst5~combout\ : std_logic;
SIGNAL \inst|D1~q\ : std_logic;
SIGNAL \inst|inst4~combout\ : std_logic;
SIGNAL \inst|D0~q\ : std_logic;

BEGIN

Q1 <= ww_Q1;
ww_X <= X;
ww_CLK <= CLK;
ww_RESET_L <= RESET_L;
Q0 <= ww_Q0;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Q1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|D1~q\,
	devoe => ww_devoe,
	o => \Q1~output_o\);

\Q0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|D0~q\,
	devoe => ww_devoe,
	o => \Q0~output_o\);

\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

\RESET_L~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET_L,
	o => \RESET_L~input_o\);

\X~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X,
	o => \X~input_o\);

\inst|inst5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5~combout\ = (!\RESET_L~input_o\ & (\inst|D1~q\ $ (!\X~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RESET_L~input_o\,
	datac => \inst|D1~q\,
	datad => \X~input_o\,
	combout => \inst|inst5~combout\);

\inst|D1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \inst|inst5~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|D1~q\);

\inst|inst4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4~combout\ = (!\RESET_L~input_o\ & (\inst|D0~q\ $ (\X~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|D0~q\,
	datac => \X~input_o\,
	datad => \RESET_L~input_o\,
	combout => \inst|inst4~combout\);

\inst|D0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \inst|inst4~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|D0~q\);

ww_Q1 <= \Q1~output_o\;

ww_Q0 <= \Q0~output_o\;
END structure;


