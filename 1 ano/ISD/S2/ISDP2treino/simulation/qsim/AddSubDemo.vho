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

-- DATE "12/20/2023 20:43:12"

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

ENTITY 	AddSubDemo IS
    PORT (
	Overflow : OUT std_logic;
	ADDorSUB : IN std_logic;
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	S : OUT std_logic_vector(3 DOWNTO 0)
	);
END AddSubDemo;

ARCHITECTURE structure OF AddSubDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_Overflow : std_logic;
SIGNAL ww_ADDorSUB : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_S : std_logic_vector(3 DOWNTO 0);
SIGNAL \Overflow~output_o\ : std_logic;
SIGNAL \S[3]~output_o\ : std_logic;
SIGNAL \S[2]~output_o\ : std_logic;
SIGNAL \S[1]~output_o\ : std_logic;
SIGNAL \S[0]~output_o\ : std_logic;
SIGNAL \B[3]~input_o\ : std_logic;
SIGNAL \ADDorSUB~input_o\ : std_logic;
SIGNAL \A[3]~input_o\ : std_logic;
SIGNAL \B[2]~input_o\ : std_logic;
SIGNAL \A[2]~input_o\ : std_logic;
SIGNAL \B[1]~input_o\ : std_logic;
SIGNAL \A[1]~input_o\ : std_logic;
SIGNAL \A[0]~input_o\ : std_logic;
SIGNAL \B[0]~input_o\ : std_logic;
SIGNAL \inst|inst|inst5~0_combout\ : std_logic;
SIGNAL \inst|inst1|inst5~0_combout\ : std_logic;
SIGNAL \inst|inst2|inst5~0_combout\ : std_logic;
SIGNAL \inst|abc~0_combout\ : std_logic;
SIGNAL \inst|inst3|inst1~0_combout\ : std_logic;
SIGNAL \inst|inst2|inst1~0_combout\ : std_logic;
SIGNAL \inst|inst1|inst1~combout\ : std_logic;
SIGNAL \inst|inst|inst1~0_combout\ : std_logic;

BEGIN

Overflow <= ww_Overflow;
ww_ADDorSUB <= ADDorSUB;
ww_A <= A;
ww_B <= B;
S <= ww_S;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\Overflow~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|abc~0_combout\,
	devoe => ww_devoe,
	o => \Overflow~output_o\);

\S[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst3|inst1~0_combout\,
	devoe => ww_devoe,
	o => \S[3]~output_o\);

\S[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst1~0_combout\,
	devoe => ww_devoe,
	o => \S[2]~output_o\);

\S[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst1|inst1~combout\,
	devoe => ww_devoe,
	o => \S[1]~output_o\);

\S[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst|inst1~0_combout\,
	devoe => ww_devoe,
	o => \S[0]~output_o\);

\B[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(3),
	o => \B[3]~input_o\);

\ADDorSUB~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADDorSUB,
	o => \ADDorSUB~input_o\);

\A[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(3),
	o => \A[3]~input_o\);

\B[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(2),
	o => \B[2]~input_o\);

\A[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(2),
	o => \A[2]~input_o\);

\B[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(1),
	o => \B[1]~input_o\);

\A[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(1),
	o => \A[1]~input_o\);

\A[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A(0),
	o => \A[0]~input_o\);

\B[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B(0),
	o => \B[0]~input_o\);

\inst|inst|inst5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst|inst5~0_combout\ = (\B[0]~input_o\ & (\A[0]~input_o\)) # (!\B[0]~input_o\ & ((\ADDorSUB~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A[0]~input_o\,
	datab => \ADDorSUB~input_o\,
	datad => \B[0]~input_o\,
	combout => \inst|inst|inst5~0_combout\);

\inst|inst1|inst5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst5~0_combout\ = (\A[1]~input_o\ & ((\inst|inst|inst5~0_combout\) # (\B[1]~input_o\ $ (\ADDorSUB~input_o\)))) # (!\A[1]~input_o\ & (\inst|inst|inst5~0_combout\ & (\B[1]~input_o\ $ (\ADDorSUB~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[1]~input_o\,
	datab => \ADDorSUB~input_o\,
	datac => \A[1]~input_o\,
	datad => \inst|inst|inst5~0_combout\,
	combout => \inst|inst1|inst5~0_combout\);

\inst|inst2|inst5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst5~0_combout\ = (\A[2]~input_o\ & ((\inst|inst1|inst5~0_combout\) # (\B[2]~input_o\ $ (\ADDorSUB~input_o\)))) # (!\A[2]~input_o\ & (\inst|inst1|inst5~0_combout\ & (\B[2]~input_o\ $ (\ADDorSUB~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[2]~input_o\,
	datab => \ADDorSUB~input_o\,
	datac => \A[2]~input_o\,
	datad => \inst|inst1|inst5~0_combout\,
	combout => \inst|inst2|inst5~0_combout\);

\inst|abc~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|abc~0_combout\ = (\A[3]~input_o\ & (!\inst|inst2|inst5~0_combout\ & (\B[3]~input_o\ $ (\ADDorSUB~input_o\)))) # (!\A[3]~input_o\ & (\inst|inst2|inst5~0_combout\ & (\B[3]~input_o\ $ (!\ADDorSUB~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[3]~input_o\,
	datab => \ADDorSUB~input_o\,
	datac => \A[3]~input_o\,
	datad => \inst|inst2|inst5~0_combout\,
	combout => \inst|abc~0_combout\);

\inst|inst3|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst3|inst1~0_combout\ = \ADDorSUB~input_o\ $ (\inst|inst2|inst5~0_combout\ $ (\B[3]~input_o\ $ (\A[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADDorSUB~input_o\,
	datab => \inst|inst2|inst5~0_combout\,
	datac => \B[3]~input_o\,
	datad => \A[3]~input_o\,
	combout => \inst|inst3|inst1~0_combout\);

\inst|inst2|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst2|inst1~0_combout\ = \B[2]~input_o\ $ (\ADDorSUB~input_o\ $ (\A[2]~input_o\ $ (\inst|inst1|inst5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B[2]~input_o\,
	datab => \ADDorSUB~input_o\,
	datac => \A[2]~input_o\,
	datad => \inst|inst1|inst5~0_combout\,
	combout => \inst|inst2|inst1~0_combout\);

\inst|inst1|inst1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst1|inst1~combout\ = \ADDorSUB~input_o\ $ (\B[1]~input_o\ $ (\A[1]~input_o\ $ (\inst|inst|inst5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ADDorSUB~input_o\,
	datab => \B[1]~input_o\,
	datac => \A[1]~input_o\,
	datad => \inst|inst|inst5~0_combout\,
	combout => \inst|inst1|inst1~combout\);

\inst|inst|inst1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|inst|inst1~0_combout\ = \A[0]~input_o\ $ (\B[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A[0]~input_o\,
	datad => \B[0]~input_o\,
	combout => \inst|inst|inst1~0_combout\);

ww_Overflow <= \Overflow~output_o\;

ww_S(3) <= \S[3]~output_o\;

ww_S(2) <= \S[2]~output_o\;

ww_S(1) <= \S[1]~output_o\;

ww_S(0) <= \S[0]~output_o\;
END structure;


