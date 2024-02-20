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

-- DATE "12/21/2023 17:34:15"

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

ENTITY 	SpecialCount IS
    PORT (
	Q : OUT std_logic_vector(3 DOWNTO 0);
	CLK : IN std_logic
	);
END SpecialCount;

ARCHITECTURE structure OF SpecialCount IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Q : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_CLK : std_logic;
SIGNAL \Q[3]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \CLK~input_o\ : std_logic;
SIGNAL \inst|sub|68~combout\ : std_logic;
SIGNAL \inst|sub|34~q\ : std_logic;
SIGNAL \inst|sub|115~combout\ : std_logic;
SIGNAL \inst|sub|111~q\ : std_logic;
SIGNAL \inst|sub|126~combout\ : std_logic;
SIGNAL \inst|sub|122~q\ : std_logic;
SIGNAL \inst|sub|137~0_combout\ : std_logic;
SIGNAL \inst|sub|134~q\ : std_logic;

BEGIN

Q <= ww_Q;
ww_CLK <= CLK;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Q[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sub|134~q\,
	devoe => ww_devoe,
	o => \Q[3]~output_o\);

\Q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sub|122~q\,
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

\Q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sub|111~q\,
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

\Q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|sub|34~q\,
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

\CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLK,
	o => \CLK~input_o\);

\inst|sub|68\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sub|68~combout\ = (!\inst|sub|134~q\ & !\inst|sub|34~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|sub|134~q\,
	datab => \inst|sub|34~q\,
	combout => \inst|sub|68~combout\);

\inst|sub|34\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \inst|sub|68~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sub|34~q\);

\inst|sub|115\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sub|115~combout\ = (!\inst|sub|134~q\ & (\inst|sub|111~q\ $ (\inst|sub|34~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|sub|111~q\,
	datac => \inst|sub|34~q\,
	datad => \inst|sub|134~q\,
	combout => \inst|sub|115~combout\);

\inst|sub|111\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \inst|sub|115~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sub|111~q\);

\inst|sub|126\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sub|126~combout\ = (!\inst|sub|134~q\ & (\inst|sub|122~q\ $ (((\inst|sub|111~q\ & \inst|sub|34~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|sub|122~q\,
	datab => \inst|sub|111~q\,
	datac => \inst|sub|34~q\,
	datad => \inst|sub|134~q\,
	combout => \inst|sub|126~combout\);

\inst|sub|122\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \inst|sub|126~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sub|122~q\);

\inst|sub|137~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|sub|137~0_combout\ = (\inst|sub|122~q\ & (\inst|sub|111~q\ & (\inst|sub|34~q\ & !\inst|sub|134~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|sub|122~q\,
	datab => \inst|sub|111~q\,
	datac => \inst|sub|34~q\,
	datad => \inst|sub|134~q\,
	combout => \inst|sub|137~0_combout\);

\inst|sub|134\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLK~input_o\,
	d => \inst|sub|137~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|sub|134~q\);

ww_Q(3) <= \Q[3]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(0) <= \Q[0]~output_o\;
END structure;


