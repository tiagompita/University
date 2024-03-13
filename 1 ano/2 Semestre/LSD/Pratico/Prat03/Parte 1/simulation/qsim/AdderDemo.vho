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

-- DATE "03/12/2024 19:05:45"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	AdderDemo IS
    PORT (
	LEDR : OUT std_logic_vector(14 DOWNTO 0);
	SW : IN std_logic_vector(17 DOWNTO 0);
	KEY : IN std_logic_vector(0 DOWNTO 0)
	);
END AdderDemo;

ARCHITECTURE structure OF AdderDemo IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_LEDR : std_logic_vector(14 DOWNTO 0);
SIGNAL ww_SW : std_logic_vector(17 DOWNTO 0);
SIGNAL ww_KEY : std_logic_vector(0 DOWNTO 0);
SIGNAL \SW[9]~input_o\ : std_logic;
SIGNAL \SW[8]~input_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \SW[13]~input_o\ : std_logic;
SIGNAL \SW[12]~input_o\ : std_logic;
SIGNAL \SW[11]~input_o\ : std_logic;
SIGNAL \SW[14]~input_o\ : std_logic;
SIGNAL \SW[10]~input_o\ : std_logic;
SIGNAL \inst1|addsub|bit0|cout~0_combout\ : std_logic;
SIGNAL \SW[15]~input_o\ : std_logic;
SIGNAL \inst1|addsub|bit1|cout~0_combout\ : std_logic;
SIGNAL \SW[16]~input_o\ : std_logic;
SIGNAL \inst1|addsub|bit2|cout~0_combout\ : std_logic;
SIGNAL \SW[17]~input_o\ : std_logic;
SIGNAL \inst1|addsub|bit3|cout~0_combout\ : std_logic;
SIGNAL \inst1|addsub|bit3|s~0_combout\ : std_logic;
SIGNAL \inst1|addsub|bit2|s~0_combout\ : std_logic;
SIGNAL \inst1|addsub|bit1|s~combout\ : std_logic;
SIGNAL \inst1|addsub|bit0|s~0_combout\ : std_logic;
SIGNAL \SW[7]~input_o\ : std_logic;
SIGNAL \SW[3]~input_o\ : std_logic;
SIGNAL \SW[6]~input_o\ : std_logic;
SIGNAL \SW[2]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \SW[4]~input_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[5]~input_o\ : std_logic;
SIGNAL \inst|bit1|cout~0_combout\ : std_logic;
SIGNAL \inst|bit2|cout~0_combout\ : std_logic;
SIGNAL \inst|bit3|cout~0_combout\ : std_logic;
SIGNAL \inst|bit3|s~combout\ : std_logic;
SIGNAL \inst|bit2|s~0_combout\ : std_logic;
SIGNAL \inst|bit1|s~0_combout\ : std_logic;
SIGNAL \inst|bit0|s~combout\ : std_logic;

BEGIN

LEDR <= ww_LEDR;
ww_SW <= SW;
ww_KEY <= KEY;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|addsub|bit3|cout~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|addsub|bit3|s~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|addsub|bit2|s~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|addsub|bit1|s~combout\,
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|addsub|bit0|s~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|bit3|cout~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|bit3|s~combout\,
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|bit2|s~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|bit1|s~0_combout\,
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|bit0|s~combout\,
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

\SW[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(13),
	o => \SW[13]~input_o\);

\SW[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(12),
	o => \SW[12]~input_o\);

\SW[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(11),
	o => \SW[11]~input_o\);

\SW[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(14),
	o => \SW[14]~input_o\);

\SW[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(10),
	o => \SW[10]~input_o\);

\inst1|addsub|bit0|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit0|cout~0_combout\ = (\SW[10]~input_o\ & (\SW[14]~input_o\)) # (!\SW[10]~input_o\ & ((\KEY[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[14]~input_o\,
	datab => \KEY[0]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \inst1|addsub|bit0|cout~0_combout\);

\SW[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(15),
	o => \SW[15]~input_o\);

\inst1|addsub|bit1|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit1|cout~0_combout\ = (\inst1|addsub|bit0|cout~0_combout\ & ((\SW[15]~input_o\) # (\KEY[0]~input_o\ $ (\SW[11]~input_o\)))) # (!\inst1|addsub|bit0|cout~0_combout\ & (\SW[15]~input_o\ & (\KEY[0]~input_o\ $ (\SW[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[11]~input_o\,
	datac => \inst1|addsub|bit0|cout~0_combout\,
	datad => \SW[15]~input_o\,
	combout => \inst1|addsub|bit1|cout~0_combout\);

\SW[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(16),
	o => \SW[16]~input_o\);

\inst1|addsub|bit2|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit2|cout~0_combout\ = (\inst1|addsub|bit1|cout~0_combout\ & ((\SW[16]~input_o\) # (\KEY[0]~input_o\ $ (\SW[12]~input_o\)))) # (!\inst1|addsub|bit1|cout~0_combout\ & (\SW[16]~input_o\ & (\KEY[0]~input_o\ $ (\SW[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[12]~input_o\,
	datac => \inst1|addsub|bit1|cout~0_combout\,
	datad => \SW[16]~input_o\,
	combout => \inst1|addsub|bit2|cout~0_combout\);

\SW[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(17),
	o => \SW[17]~input_o\);

\inst1|addsub|bit3|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit3|cout~0_combout\ = (\inst1|addsub|bit2|cout~0_combout\ & ((\SW[17]~input_o\) # (\KEY[0]~input_o\ $ (\SW[13]~input_o\)))) # (!\inst1|addsub|bit2|cout~0_combout\ & (\SW[17]~input_o\ & (\KEY[0]~input_o\ $ (\SW[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \inst1|addsub|bit2|cout~0_combout\,
	datad => \SW[17]~input_o\,
	combout => \inst1|addsub|bit3|cout~0_combout\);

\inst1|addsub|bit3|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit3|s~0_combout\ = \KEY[0]~input_o\ $ (\SW[13]~input_o\ $ (\inst1|addsub|bit2|cout~0_combout\ $ (\SW[17]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[13]~input_o\,
	datac => \inst1|addsub|bit2|cout~0_combout\,
	datad => \SW[17]~input_o\,
	combout => \inst1|addsub|bit3|s~0_combout\);

\inst1|addsub|bit2|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit2|s~0_combout\ = \KEY[0]~input_o\ $ (\SW[12]~input_o\ $ (\inst1|addsub|bit1|cout~0_combout\ $ (\SW[16]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[12]~input_o\,
	datac => \inst1|addsub|bit1|cout~0_combout\,
	datad => \SW[16]~input_o\,
	combout => \inst1|addsub|bit2|s~0_combout\);

\inst1|addsub|bit1|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit1|s~combout\ = \KEY[0]~input_o\ $ (\SW[11]~input_o\ $ (\inst1|addsub|bit0|cout~0_combout\ $ (\SW[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \KEY[0]~input_o\,
	datab => \SW[11]~input_o\,
	datac => \inst1|addsub|bit0|cout~0_combout\,
	datad => \SW[15]~input_o\,
	combout => \inst1|addsub|bit1|s~combout\);

\inst1|addsub|bit0|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|addsub|bit0|s~0_combout\ = \SW[14]~input_o\ $ (\SW[10]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[14]~input_o\,
	datad => \SW[10]~input_o\,
	combout => \inst1|addsub|bit0|s~0_combout\);

\SW[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(7),
	o => \SW[7]~input_o\);

\SW[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(3),
	o => \SW[3]~input_o\);

\SW[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(6),
	o => \SW[6]~input_o\);

\SW[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(2),
	o => \SW[2]~input_o\);

\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

\SW[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(4),
	o => \SW[4]~input_o\);

\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

\SW[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(5),
	o => \SW[5]~input_o\);

\inst|bit1|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|bit1|cout~0_combout\ = (\SW[1]~input_o\ & ((\SW[5]~input_o\) # ((\SW[0]~input_o\ & \SW[4]~input_o\)))) # (!\SW[1]~input_o\ & (\SW[0]~input_o\ & (\SW[4]~input_o\ & \SW[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[5]~input_o\,
	combout => \inst|bit1|cout~0_combout\);

\inst|bit2|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|bit2|cout~0_combout\ = (\SW[6]~input_o\ & ((\SW[2]~input_o\) # (\inst|bit1|cout~0_combout\))) # (!\SW[6]~input_o\ & (\SW[2]~input_o\ & \inst|bit1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[6]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \inst|bit1|cout~0_combout\,
	combout => \inst|bit2|cout~0_combout\);

\inst|bit3|cout~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|bit3|cout~0_combout\ = (\SW[7]~input_o\ & ((\SW[3]~input_o\) # (\inst|bit2|cout~0_combout\))) # (!\SW[7]~input_o\ & (\SW[3]~input_o\ & \inst|bit2|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100011101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \inst|bit2|cout~0_combout\,
	combout => \inst|bit3|cout~0_combout\);

\inst|bit3|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|bit3|s~combout\ = \SW[7]~input_o\ $ (\SW[3]~input_o\ $ (\inst|bit2|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[7]~input_o\,
	datab => \SW[3]~input_o\,
	datac => \inst|bit2|cout~0_combout\,
	combout => \inst|bit3|s~combout\);

\inst|bit2|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|bit2|s~0_combout\ = \SW[6]~input_o\ $ (\SW[2]~input_o\ $ (\inst|bit1|cout~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[6]~input_o\,
	datab => \SW[2]~input_o\,
	datac => \inst|bit1|cout~0_combout\,
	combout => \inst|bit2|s~0_combout\);

\inst|bit1|s~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|bit1|s~0_combout\ = \SW[1]~input_o\ $ (\SW[5]~input_o\ $ (((\SW[0]~input_o\ & \SW[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000011101111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \SW[0]~input_o\,
	datab => \SW[4]~input_o\,
	datac => \SW[1]~input_o\,
	datad => \SW[5]~input_o\,
	combout => \inst|bit1|s~0_combout\);

\inst|bit0|s\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|bit0|s~combout\ = \SW[0]~input_o\ $ (\SW[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[0]~input_o\,
	datad => \SW[4]~input_o\,
	combout => \inst|bit0|s~combout\);

\SW[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(9),
	o => \SW[9]~input_o\);

\SW[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(8),
	o => \SW[8]~input_o\);

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


