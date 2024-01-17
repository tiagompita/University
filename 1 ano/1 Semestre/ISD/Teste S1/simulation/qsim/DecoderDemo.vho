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

-- DATE "11/30/2023 12:57:57"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	DecoderDemo2 IS
    PORT (
	Y0 : OUT std_logic;
	X3 : IN std_logic;
	X2 : IN std_logic;
	X1 : IN std_logic;
	X0 : IN std_logic;
	EN1 : IN std_logic;
	EN0_L : IN std_logic;
	Y1 : OUT std_logic;
	Y2 : OUT std_logic;
	Y3 : OUT std_logic;
	Y4 : OUT std_logic;
	Y5 : OUT std_logic;
	Y6 : OUT std_logic;
	Y7 : OUT std_logic;
	Y8 : OUT std_logic;
	Y9 : OUT std_logic;
	Y10 : OUT std_logic;
	Y11 : OUT std_logic;
	Y12 : OUT std_logic;
	Y13 : OUT std_logic;
	Y14 : OUT std_logic;
	Y15 : OUT std_logic
	);
END DecoderDemo2;

ARCHITECTURE structure OF DecoderDemo2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Y0 : std_logic;
SIGNAL ww_X3 : std_logic;
SIGNAL ww_X2 : std_logic;
SIGNAL ww_X1 : std_logic;
SIGNAL ww_X0 : std_logic;
SIGNAL ww_EN1 : std_logic;
SIGNAL ww_EN0_L : std_logic;
SIGNAL ww_Y1 : std_logic;
SIGNAL ww_Y2 : std_logic;
SIGNAL ww_Y3 : std_logic;
SIGNAL ww_Y4 : std_logic;
SIGNAL ww_Y5 : std_logic;
SIGNAL ww_Y6 : std_logic;
SIGNAL ww_Y7 : std_logic;
SIGNAL ww_Y8 : std_logic;
SIGNAL ww_Y9 : std_logic;
SIGNAL ww_Y10 : std_logic;
SIGNAL ww_Y11 : std_logic;
SIGNAL ww_Y12 : std_logic;
SIGNAL ww_Y13 : std_logic;
SIGNAL ww_Y14 : std_logic;
SIGNAL ww_Y15 : std_logic;
SIGNAL \Y0~output_o\ : std_logic;
SIGNAL \Y1~output_o\ : std_logic;
SIGNAL \Y2~output_o\ : std_logic;
SIGNAL \Y3~output_o\ : std_logic;
SIGNAL \Y4~output_o\ : std_logic;
SIGNAL \Y5~output_o\ : std_logic;
SIGNAL \Y6~output_o\ : std_logic;
SIGNAL \Y7~output_o\ : std_logic;
SIGNAL \Y8~output_o\ : std_logic;
SIGNAL \Y9~output_o\ : std_logic;
SIGNAL \Y10~output_o\ : std_logic;
SIGNAL \Y11~output_o\ : std_logic;
SIGNAL \Y12~output_o\ : std_logic;
SIGNAL \Y13~output_o\ : std_logic;
SIGNAL \Y14~output_o\ : std_logic;
SIGNAL \Y15~output_o\ : std_logic;
SIGNAL \EN1~input_o\ : std_logic;
SIGNAL \X3~input_o\ : std_logic;
SIGNAL \EN0_L~input_o\ : std_logic;
SIGNAL \inst|inst2|inst~0_combout\ : std_logic;
SIGNAL \X0~input_o\ : std_logic;
SIGNAL \X2~input_o\ : std_logic;
SIGNAL \X1~input_o\ : std_logic;
SIGNAL \inst|inst2|inst~1_combout\ : std_logic;
SIGNAL \inst|inst2|inst1~0_combout\ : std_logic;
SIGNAL \inst|inst2|inst2~0_combout\ : std_logic;
SIGNAL \inst|inst2|inst2~1_combout\ : std_logic;
SIGNAL \inst|inst2|inst3~0_combout\ : std_logic;
SIGNAL \inst|inst3|inst~0_combout\ : std_logic;
SIGNAL \inst|inst3|inst1~0_combout\ : std_logic;
SIGNAL \inst|inst3|inst2~0_combout\ : std_logic;
SIGNAL \inst|inst3|inst3~0_combout\ : std_logic;
SIGNAL \inst|inst4|inst~0_combout\ : std_logic;
SIGNAL \inst|inst4|inst1~0_combout\ : std_logic;
SIGNAL \inst|inst4|inst2~0_combout\ : std_logic;
SIGNAL \inst|inst4|inst3~0_combout\ : std_logic;
SIGNAL \inst|inst5|inst~0_combout\ : std_logic;
SIGNAL \inst|inst5|inst1~0_combout\ : std_logic;
SIGNAL \inst|inst5|inst2~0_combout\ : std_logic;
SIGNAL \inst|inst5|inst3~0_combout\ : std_logic;

BEGIN

Y0 <= ww_Y0;
ww_X3 <= X3;
ww_X2 <= X2;
ww_X1 <= X1;
ww_X0 <= X0;
ww_EN1 <= EN1;
ww_EN0_L <= EN0_L;
Y1 <= ww_Y1;
Y2 <= ww_Y2;
Y3 <= ww_Y3;
Y4 <= ww_Y4;
Y5 <= ww_Y5;
Y6 <= ww_Y6;
Y7 <= ww_Y7;
Y8 <= ww_Y8;
Y9 <= ww_Y9;
Y10 <= ww_Y10;
Y11 <= ww_Y11;
Y12 <= ww_Y12;
Y13 <= ww_Y13;
Y14 <= ww_Y14;
Y15 <= ww_Y15;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Y0~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst~1_combout\,
	devoe => ww_devoe,
	o => \Y0~output_o\);

\Y1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst1~0_combout\,
	devoe => ww_devoe,
	o => \Y1~output_o\);

\Y2~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst2~1_combout\,
	devoe => ww_devoe,
	o => \Y2~output_o\);

\Y3~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst3~0_combout\,
	devoe => ww_devoe,
	o => \Y3~output_o\);

\Y4~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3|inst~0_combout\,
	devoe => ww_devoe,
	o => \Y4~output_o\);

\Y5~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3|inst1~0_combout\,
	devoe => ww_devoe,
	o => \Y5~output_o\);

\Y6~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3|inst2~0_combout\,
	devoe => ww_devoe,
	o => \Y6~output_o\);

\Y7~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3|inst3~0_combout\,
	devoe => ww_devoe,
	o => \Y7~output_o\);

\Y8~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst4|inst~0_combout\,
	devoe => ww_devoe,
	o => \Y8~output_o\);

\Y9~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst4|inst1~0_combout\,
	devoe => ww_devoe,
	o => \Y9~output_o\);

\Y10~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst4|inst2~0_combout\,
	devoe => ww_devoe,
	o => \Y10~output_o\);

\Y11~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst4|inst3~0_combout\,
	devoe => ww_devoe,
	o => \Y11~output_o\);

\Y12~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst5|inst~0_combout\,
	devoe => ww_devoe,
	o => \Y12~output_o\);

\Y13~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst5|inst1~0_combout\,
	devoe => ww_devoe,
	o => \Y13~output_o\);

\Y14~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst5|inst2~0_combout\,
	devoe => ww_devoe,
	o => \Y14~output_o\);

\Y15~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst5|inst3~0_combout\,
	devoe => ww_devoe,
	o => \Y15~output_o\);

\EN1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_EN1,
	o => \EN1~input_o\);

\X3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X3,
	o => \X3~input_o\);

\EN0_L~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_EN0_L,
	o => \EN0_L~input_o\);

\inst|inst2|inst~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst~0_combout\ = (\EN1~input_o\ & (!\X3~input_o\ & !\EN0_L~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \EN1~input_o\,
	datac => \X3~input_o\,
	datad => \EN0_L~input_o\,
	combout => \inst|inst2|inst~0_combout\);

\X0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X0,
	o => \X0~input_o\);

\X2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X2,
	o => \X2~input_o\);

\X1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X1,
	o => \X1~input_o\);

\inst|inst2|inst~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst~1_combout\ = (\inst|inst2|inst~0_combout\ & (!\X0~input_o\ & (!\X2~input_o\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst2|inst~1_combout\);

\inst|inst2|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst1~0_combout\ = (\inst|inst2|inst~0_combout\ & (\X2~input_o\ & (!\X0~input_o\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X2~input_o\,
	datac => \X0~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst2|inst1~0_combout\);

\inst|inst2|inst2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst2~0_combout\ = (\X3~input_o\ & (\EN1~input_o\ & !\EN0_L~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X3~input_o\,
	datab => \EN1~input_o\,
	datad => \EN0_L~input_o\,
	combout => \inst|inst2|inst2~0_combout\);

\inst|inst2|inst2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst2~1_combout\ = (\inst|inst2|inst2~0_combout\ & (!\X0~input_o\ & (!\X2~input_o\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~0_combout\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst2|inst2~1_combout\);

\inst|inst2|inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst3~0_combout\ = (\X2~input_o\ & (\inst|inst2|inst2~0_combout\ & (!\X0~input_o\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X2~input_o\,
	datab => \inst|inst2|inst2~0_combout\,
	datac => \X0~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst2|inst3~0_combout\);

\inst|inst3|inst~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3|inst~0_combout\ = (\inst|inst2|inst~0_combout\ & (\X0~input_o\ & (!\X2~input_o\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst3|inst~0_combout\);

\inst|inst3|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3|inst1~0_combout\ = (\inst|inst2|inst~0_combout\ & (\X0~input_o\ & (\X2~input_o\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst3|inst1~0_combout\);

\inst|inst3|inst2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3|inst2~0_combout\ = (\X0~input_o\ & (\inst|inst2|inst2~0_combout\ & (!\X2~input_o\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X0~input_o\,
	datab => \inst|inst2|inst2~0_combout\,
	datac => \X2~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst3|inst2~0_combout\);

\inst|inst3|inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3|inst3~0_combout\ = (\X0~input_o\ & (\X2~input_o\ & (\inst|inst2|inst2~0_combout\ & !\X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X0~input_o\,
	datab => \X2~input_o\,
	datac => \inst|inst2|inst2~0_combout\,
	datad => \X1~input_o\,
	combout => \inst|inst3|inst3~0_combout\);

\inst|inst4|inst~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4|inst~0_combout\ = (\inst|inst2|inst~0_combout\ & (\X1~input_o\ & (!\X0~input_o\ & !\X2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X1~input_o\,
	datac => \X0~input_o\,
	datad => \X2~input_o\,
	combout => \inst|inst4|inst~0_combout\);

\inst|inst4|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4|inst1~0_combout\ = (\inst|inst2|inst~0_combout\ & (\X2~input_o\ & (\X1~input_o\ & !\X0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X2~input_o\,
	datac => \X1~input_o\,
	datad => \X0~input_o\,
	combout => \inst|inst4|inst1~0_combout\);

\inst|inst4|inst2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4|inst2~0_combout\ = (\X1~input_o\ & (\inst|inst2|inst2~0_combout\ & (!\X0~input_o\ & !\X2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X1~input_o\,
	datab => \inst|inst2|inst2~0_combout\,
	datac => \X0~input_o\,
	datad => \X2~input_o\,
	combout => \inst|inst4|inst2~0_combout\);

\inst|inst4|inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst4|inst3~0_combout\ = (\X2~input_o\ & (\X1~input_o\ & (\inst|inst2|inst2~0_combout\ & !\X0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X2~input_o\,
	datab => \X1~input_o\,
	datac => \inst|inst2|inst2~0_combout\,
	datad => \X0~input_o\,
	combout => \inst|inst4|inst3~0_combout\);

\inst|inst5|inst~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5|inst~0_combout\ = (\inst|inst2|inst~0_combout\ & (\X0~input_o\ & (\X1~input_o\ & !\X2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X0~input_o\,
	datac => \X1~input_o\,
	datad => \X2~input_o\,
	combout => \inst|inst5|inst~0_combout\);

\inst|inst5|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5|inst1~0_combout\ = (\inst|inst2|inst~0_combout\ & (\X0~input_o\ & (\X2~input_o\ & \X1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst~0_combout\,
	datab => \X0~input_o\,
	datac => \X2~input_o\,
	datad => \X1~input_o\,
	combout => \inst|inst5|inst1~0_combout\);

\inst|inst5|inst2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5|inst2~0_combout\ = (\X0~input_o\ & (\X1~input_o\ & (\inst|inst2|inst2~0_combout\ & !\X2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X0~input_o\,
	datab => \X1~input_o\,
	datac => \inst|inst2|inst2~0_combout\,
	datad => \X2~input_o\,
	combout => \inst|inst5|inst2~0_combout\);

\inst|inst5|inst3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst5|inst3~0_combout\ = (\X0~input_o\ & (\X2~input_o\ & (\X1~input_o\ & \inst|inst2|inst2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X0~input_o\,
	datab => \X2~input_o\,
	datac => \X1~input_o\,
	datad => \inst|inst2|inst2~0_combout\,
	combout => \inst|inst5|inst3~0_combout\);

ww_Y0 <= \Y0~output_o\;

ww_Y1 <= \Y1~output_o\;

ww_Y2 <= \Y2~output_o\;

ww_Y3 <= \Y3~output_o\;

ww_Y4 <= \Y4~output_o\;

ww_Y5 <= \Y5~output_o\;

ww_Y6 <= \Y6~output_o\;

ww_Y7 <= \Y7~output_o\;

ww_Y8 <= \Y8~output_o\;

ww_Y9 <= \Y9~output_o\;

ww_Y10 <= \Y10~output_o\;

ww_Y11 <= \Y11~output_o\;

ww_Y12 <= \Y12~output_o\;

ww_Y13 <= \Y13~output_o\;

ww_Y14 <= \Y14~output_o\;

ww_Y15 <= \Y15~output_o\;
END structure;


