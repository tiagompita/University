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

-- DATE "11/30/2023 15:43:22"

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

ENTITY 	Block2 IS
    PORT (
	Y : OUT std_logic;
	X0 : IN std_logic;
	X1 : IN std_logic;
	X2 : IN std_logic;
	X3 : IN std_logic;
	X4 : IN std_logic;
	X5 : IN std_logic;
	X6 : IN std_logic;
	X7 : IN std_logic;
	S : IN std_logic_vector(1 DOWNTO 0)
	);
END Block2;

ARCHITECTURE structure OF Block2 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Y : std_logic;
SIGNAL ww_X0 : std_logic;
SIGNAL ww_X1 : std_logic;
SIGNAL ww_X2 : std_logic;
SIGNAL ww_X3 : std_logic;
SIGNAL ww_X4 : std_logic;
SIGNAL ww_X5 : std_logic;
SIGNAL ww_X6 : std_logic;
SIGNAL ww_X7 : std_logic;
SIGNAL ww_S : std_logic_vector(1 DOWNTO 0);
SIGNAL \Y~output_o\ : std_logic;
SIGNAL \S[0]~input_o\ : std_logic;
SIGNAL \X2~input_o\ : std_logic;
SIGNAL \X6~input_o\ : std_logic;
SIGNAL \X1~input_o\ : std_logic;
SIGNAL \inst|or~0_combout\ : std_logic;
SIGNAL \S[1]~input_o\ : std_logic;
SIGNAL \X0~input_o\ : std_logic;
SIGNAL \X4~input_o\ : std_logic;
SIGNAL \X5~input_o\ : std_logic;
SIGNAL \X3~input_o\ : std_logic;
SIGNAL \X7~input_o\ : std_logic;
SIGNAL \inst|or~1_combout\ : std_logic;
SIGNAL \inst|or~2_combout\ : std_logic;
SIGNAL \inst|or~3_combout\ : std_logic;

BEGIN

Y <= ww_Y;
ww_X0 <= X0;
ww_X1 <= X1;
ww_X2 <= X2;
ww_X3 <= X3;
ww_X4 <= X4;
ww_X5 <= X5;
ww_X6 <= X6;
ww_X7 <= X7;
ww_S <= S;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Y~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|or~3_combout\,
	devoe => ww_devoe,
	o => \Y~output_o\);

\S[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(0),
	o => \S[0]~input_o\);

\X2~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X2,
	o => \X2~input_o\);

\X6~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X6,
	o => \X6~input_o\);

\X1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X1,
	o => \X1~input_o\);

\inst|or~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|or~0_combout\ = (\S[0]~input_o\ & ((\X2~input_o\) # ((\X6~input_o\)))) # (!\S[0]~input_o\ & (((\X1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \S[0]~input_o\,
	datab => \X2~input_o\,
	datac => \X6~input_o\,
	datad => \X1~input_o\,
	combout => \inst|or~0_combout\);

\S[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_S(1),
	o => \S[1]~input_o\);

\X0~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X0,
	o => \X0~input_o\);

\X4~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X4,
	o => \X4~input_o\);

\X5~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X5,
	o => \X5~input_o\);

\X3~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X3,
	o => \X3~input_o\);

\X7~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_X7,
	o => \X7~input_o\);

\inst|or~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|or~1_combout\ = (\S[0]~input_o\ & (((\X3~input_o\) # (\X7~input_o\)))) # (!\S[0]~input_o\ & (\X5~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X5~input_o\,
	datab => \X3~input_o\,
	datac => \X7~input_o\,
	datad => \S[0]~input_o\,
	combout => \inst|or~1_combout\);

\inst|or~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|or~2_combout\ = (\S[1]~input_o\ & (((\inst|or~1_combout\)))) # (!\S[1]~input_o\ & ((\X0~input_o\) # ((\X4~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \X0~input_o\,
	datab => \X4~input_o\,
	datac => \S[1]~input_o\,
	datad => \inst|or~1_combout\,
	combout => \inst|or~2_combout\);

\inst|or~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|or~3_combout\ = (\inst|or~0_combout\ & ((\inst|or~2_combout\) # (\S[0]~input_o\ $ (\S[1]~input_o\)))) # (!\inst|or~0_combout\ & (\inst|or~2_combout\ & ((\S[1]~input_o\) # (!\S[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|or~0_combout\,
	datab => \S[0]~input_o\,
	datac => \S[1]~input_o\,
	datad => \inst|or~2_combout\,
	combout => \inst|or~3_combout\);

ww_Y <= \Y~output_o\;
END structure;


