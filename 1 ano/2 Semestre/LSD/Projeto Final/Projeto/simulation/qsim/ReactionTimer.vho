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

-- DATE "06/02/2024 20:27:04"

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

ENTITY 	MEF_competition IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	enable : IN std_logic;
	confirm : IN std_logic;
	cycle : IN std_logic;
	PlayerATime : IN std_logic_vector(13 DOWNTO 0);
	PlayerBTime : IN std_logic_vector(13 DOWNTO 0);
	ConfirmedNumberOut : IN std_logic_vector(6 DOWNTO 0);
	confirm_prev_in : IN std_logic;
	Points_A : BUFFER std_logic_vector(6 DOWNTO 0);
	Points_B : BUFFER std_logic_vector(6 DOWNTO 0);
	TotalCycles : BUFFER std_logic_vector(6 DOWNTO 0);
	MaxPoints : BUFFER std_logic_vector(6 DOWNTO 0);
	PlayerAPenalty : IN std_logic;
	PlayerBPenalty : IN std_logic;
	HEX3 : BUFFER std_logic_vector(1 DOWNTO 0);
	HEX2 : BUFFER std_logic_vector(1 DOWNTO 0);
	HEX1 : BUFFER std_logic_vector(1 DOWNTO 0);
	HEX0 : BUFFER std_logic_vector(1 DOWNTO 0);
	winner : BUFFER std_logic
	);
END MEF_competition;

ARCHITECTURE structure OF MEF_competition IS
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
SIGNAL ww_confirm : std_logic;
SIGNAL ww_cycle : std_logic;
SIGNAL ww_PlayerATime : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_PlayerBTime : std_logic_vector(13 DOWNTO 0);
SIGNAL ww_ConfirmedNumberOut : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_confirm_prev_in : std_logic;
SIGNAL ww_Points_A : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_Points_B : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_TotalCycles : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_MaxPoints : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_PlayerAPenalty : std_logic;
SIGNAL ww_PlayerBPenalty : std_logic;
SIGNAL ww_HEX3 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX0 : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_winner : std_logic;
SIGNAL \Points_A[0]~output_o\ : std_logic;
SIGNAL \Points_A[1]~output_o\ : std_logic;
SIGNAL \Points_A[2]~output_o\ : std_logic;
SIGNAL \Points_A[3]~output_o\ : std_logic;
SIGNAL \Points_A[4]~output_o\ : std_logic;
SIGNAL \Points_A[5]~output_o\ : std_logic;
SIGNAL \Points_A[6]~output_o\ : std_logic;
SIGNAL \Points_B[0]~output_o\ : std_logic;
SIGNAL \Points_B[1]~output_o\ : std_logic;
SIGNAL \Points_B[2]~output_o\ : std_logic;
SIGNAL \Points_B[3]~output_o\ : std_logic;
SIGNAL \Points_B[4]~output_o\ : std_logic;
SIGNAL \Points_B[5]~output_o\ : std_logic;
SIGNAL \Points_B[6]~output_o\ : std_logic;
SIGNAL \TotalCycles[0]~output_o\ : std_logic;
SIGNAL \TotalCycles[1]~output_o\ : std_logic;
SIGNAL \TotalCycles[2]~output_o\ : std_logic;
SIGNAL \TotalCycles[3]~output_o\ : std_logic;
SIGNAL \TotalCycles[4]~output_o\ : std_logic;
SIGNAL \TotalCycles[5]~output_o\ : std_logic;
SIGNAL \TotalCycles[6]~output_o\ : std_logic;
SIGNAL \MaxPoints[0]~output_o\ : std_logic;
SIGNAL \MaxPoints[1]~output_o\ : std_logic;
SIGNAL \MaxPoints[2]~output_o\ : std_logic;
SIGNAL \MaxPoints[3]~output_o\ : std_logic;
SIGNAL \MaxPoints[4]~output_o\ : std_logic;
SIGNAL \MaxPoints[5]~output_o\ : std_logic;
SIGNAL \MaxPoints[6]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \winner~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \PlayerAPenalty~input_o\ : std_logic;
SIGNAL \enable~input_o\ : std_logic;
SIGNAL \ConfirmedNumberOut[0]~input_o\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \state.init_competition~q\ : std_logic;
SIGNAL \MaxPoints[0]~0_combout\ : std_logic;
SIGNAL \Add4~1\ : std_logic;
SIGNAL \Add4~4_combout\ : std_logic;
SIGNAL \PlayerATime[13]~input_o\ : std_logic;
SIGNAL \PlayerBTime[13]~input_o\ : std_logic;
SIGNAL \PlayerATime[12]~input_o\ : std_logic;
SIGNAL \PlayerBTime[12]~input_o\ : std_logic;
SIGNAL \PlayerATime[11]~input_o\ : std_logic;
SIGNAL \PlayerBTime[11]~input_o\ : std_logic;
SIGNAL \PlayerATime[10]~input_o\ : std_logic;
SIGNAL \PlayerBTime[10]~input_o\ : std_logic;
SIGNAL \PlayerATime[9]~input_o\ : std_logic;
SIGNAL \PlayerBTime[9]~input_o\ : std_logic;
SIGNAL \PlayerATime[8]~input_o\ : std_logic;
SIGNAL \PlayerBTime[8]~input_o\ : std_logic;
SIGNAL \PlayerATime[7]~input_o\ : std_logic;
SIGNAL \PlayerBTime[7]~input_o\ : std_logic;
SIGNAL \PlayerATime[6]~input_o\ : std_logic;
SIGNAL \PlayerBTime[6]~input_o\ : std_logic;
SIGNAL \PlayerATime[5]~input_o\ : std_logic;
SIGNAL \PlayerBTime[5]~input_o\ : std_logic;
SIGNAL \PlayerATime[4]~input_o\ : std_logic;
SIGNAL \PlayerBTime[4]~input_o\ : std_logic;
SIGNAL \PlayerATime[3]~input_o\ : std_logic;
SIGNAL \PlayerBTime[3]~input_o\ : std_logic;
SIGNAL \PlayerATime[2]~input_o\ : std_logic;
SIGNAL \PlayerBTime[2]~input_o\ : std_logic;
SIGNAL \PlayerATime[1]~input_o\ : std_logic;
SIGNAL \PlayerBTime[1]~input_o\ : std_logic;
SIGNAL \PlayerATime[0]~input_o\ : std_logic;
SIGNAL \PlayerBTime[0]~input_o\ : std_logic;
SIGNAL \LessThan2~1_cout\ : std_logic;
SIGNAL \LessThan2~3_cout\ : std_logic;
SIGNAL \LessThan2~5_cout\ : std_logic;
SIGNAL \LessThan2~7_cout\ : std_logic;
SIGNAL \LessThan2~9_cout\ : std_logic;
SIGNAL \LessThan2~11_cout\ : std_logic;
SIGNAL \LessThan2~13_cout\ : std_logic;
SIGNAL \LessThan2~15_cout\ : std_logic;
SIGNAL \LessThan2~17_cout\ : std_logic;
SIGNAL \LessThan2~19_cout\ : std_logic;
SIGNAL \LessThan2~21_cout\ : std_logic;
SIGNAL \LessThan2~23_cout\ : std_logic;
SIGNAL \LessThan2~25_cout\ : std_logic;
SIGNAL \LessThan2~26_combout\ : std_logic;
SIGNAL \Add2~0_combout\ : std_logic;
SIGNAL \Add4~5\ : std_logic;
SIGNAL \Add4~6_combout\ : std_logic;
SIGNAL \Add2~1\ : std_logic;
SIGNAL \Add2~2_combout\ : std_logic;
SIGNAL \points_A_int~3_combout\ : std_logic;
SIGNAL \points_A_int[0]~0_combout\ : std_logic;
SIGNAL \points_A_int[1]~2_combout\ : std_logic;
SIGNAL \Add4~7\ : std_logic;
SIGNAL \Add4~8_combout\ : std_logic;
SIGNAL \Add2~3\ : std_logic;
SIGNAL \Add2~4_combout\ : std_logic;
SIGNAL \points_A_int~4_combout\ : std_logic;
SIGNAL \Add4~9\ : std_logic;
SIGNAL \Add4~10_combout\ : std_logic;
SIGNAL \Add2~5\ : std_logic;
SIGNAL \Add2~6_combout\ : std_logic;
SIGNAL \points_A_int~5_combout\ : std_logic;
SIGNAL \Add4~11\ : std_logic;
SIGNAL \Add4~12_combout\ : std_logic;
SIGNAL \Add2~7\ : std_logic;
SIGNAL \Add2~8_combout\ : std_logic;
SIGNAL \points_A_int~6_combout\ : std_logic;
SIGNAL \Add4~13\ : std_logic;
SIGNAL \Add4~14_combout\ : std_logic;
SIGNAL \Add2~9\ : std_logic;
SIGNAL \Add2~10_combout\ : std_logic;
SIGNAL \points_A_int~7_combout\ : std_logic;
SIGNAL \Add4~15\ : std_logic;
SIGNAL \Add4~16_combout\ : std_logic;
SIGNAL \Add2~11\ : std_logic;
SIGNAL \Add2~12_combout\ : std_logic;
SIGNAL \points_A_int~8_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \LessThan0~1_combout\ : std_logic;
SIGNAL \points_A_int~1_combout\ : std_logic;
SIGNAL \ConfirmedNumberOut[1]~input_o\ : std_logic;
SIGNAL \confirmed_number_int[1]~0_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \confirm_prev_in~input_o\ : std_logic;
SIGNAL \confirm~input_o\ : std_logic;
SIGNAL \state~10_combout\ : std_logic;
SIGNAL \LessThan3~1_cout\ : std_logic;
SIGNAL \LessThan3~3_cout\ : std_logic;
SIGNAL \LessThan3~5_cout\ : std_logic;
SIGNAL \LessThan3~7_cout\ : std_logic;
SIGNAL \LessThan3~9_cout\ : std_logic;
SIGNAL \LessThan3~11_cout\ : std_logic;
SIGNAL \LessThan3~13_cout\ : std_logic;
SIGNAL \LessThan3~15_cout\ : std_logic;
SIGNAL \LessThan3~17_cout\ : std_logic;
SIGNAL \LessThan3~19_cout\ : std_logic;
SIGNAL \LessThan3~21_cout\ : std_logic;
SIGNAL \LessThan3~23_cout\ : std_logic;
SIGNAL \LessThan3~25_cout\ : std_logic;
SIGNAL \LessThan3~26_combout\ : std_logic;
SIGNAL \points_B_int~0_combout\ : std_logic;
SIGNAL \Add3~0_combout\ : std_logic;
SIGNAL \Add5~0_combout\ : std_logic;
SIGNAL \PlayerBPenalty~input_o\ : std_logic;
SIGNAL \playerB_penalty_applied~q\ : std_logic;
SIGNAL \Add5~2_combout\ : std_logic;
SIGNAL \Add5~3_combout\ : std_logic;
SIGNAL \Add5~1\ : std_logic;
SIGNAL \Add5~4_combout\ : std_logic;
SIGNAL \points_B_int~1_combout\ : std_logic;
SIGNAL \points_B_int[1]~2_combout\ : std_logic;
SIGNAL \Add3~1\ : std_logic;
SIGNAL \Add3~3_combout\ : std_logic;
SIGNAL \Add5~5\ : std_logic;
SIGNAL \Add5~6_combout\ : std_logic;
SIGNAL \points_B_int~3_combout\ : std_logic;
SIGNAL \Add3~4\ : std_logic;
SIGNAL \Add3~5_combout\ : std_logic;
SIGNAL \Add5~7\ : std_logic;
SIGNAL \Add5~8_combout\ : std_logic;
SIGNAL \points_B_int~4_combout\ : std_logic;
SIGNAL \Add3~6\ : std_logic;
SIGNAL \Add3~7_combout\ : std_logic;
SIGNAL \Add5~9\ : std_logic;
SIGNAL \Add5~10_combout\ : std_logic;
SIGNAL \points_B_int~5_combout\ : std_logic;
SIGNAL \Add3~8\ : std_logic;
SIGNAL \Add3~9_combout\ : std_logic;
SIGNAL \Add5~11\ : std_logic;
SIGNAL \Add5~12_combout\ : std_logic;
SIGNAL \points_B_int~6_combout\ : std_logic;
SIGNAL \Add3~10\ : std_logic;
SIGNAL \Add3~11_combout\ : std_logic;
SIGNAL \Add5~13\ : std_logic;
SIGNAL \Add5~14_combout\ : std_logic;
SIGNAL \points_B_int~7_combout\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \LessThan1~1_combout\ : std_logic;
SIGNAL \Add3~2_combout\ : std_logic;
SIGNAL \Add3~12\ : std_logic;
SIGNAL \Add3~13_combout\ : std_logic;
SIGNAL \Add5~15\ : std_logic;
SIGNAL \Add5~16_combout\ : std_logic;
SIGNAL \points_B_int~8_combout\ : std_logic;
SIGNAL \internal_reset~4_combout\ : std_logic;
SIGNAL \state~11_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \state~12_combout\ : std_logic;
SIGNAL \ConfirmedNumberOut[6]~input_o\ : std_logic;
SIGNAL \ConfirmedNumberOut[2]~input_o\ : std_logic;
SIGNAL \ConfirmedNumberOut[3]~input_o\ : std_logic;
SIGNAL \confirmed_number_int[3]~1_combout\ : std_logic;
SIGNAL \Equal1~1_combout\ : std_logic;
SIGNAL \ConfirmedNumberOut[5]~input_o\ : std_logic;
SIGNAL \ConfirmedNumberOut[4]~input_o\ : std_logic;
SIGNAL \Equal1~2_combout\ : std_logic;
SIGNAL \state~13_combout\ : std_logic;
SIGNAL \state~14_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \state~15_combout\ : std_logic;
SIGNAL \state~16_combout\ : std_logic;
SIGNAL \state~17_combout\ : std_logic;
SIGNAL \state.game~q\ : std_logic;
SIGNAL \internal_reset~5_combout\ : std_logic;
SIGNAL \internal_reset~q\ : std_logic;
SIGNAL \state_machine~0_combout\ : std_logic;
SIGNAL \playerA_penalty_applied~q\ : std_logic;
SIGNAL \Add4~2_combout\ : std_logic;
SIGNAL \Add4~3_combout\ : std_logic;
SIGNAL \total_cycles_int[0]~7_combout\ : std_logic;
SIGNAL \cycle~input_o\ : std_logic;
SIGNAL \cycle_last~q\ : std_logic;
SIGNAL \tie~0_combout\ : std_logic;
SIGNAL \tie~1_combout\ : std_logic;
SIGNAL \tie~q\ : std_logic;
SIGNAL \total_cycles_int[0]~9_combout\ : std_logic;
SIGNAL \state_machine~1_combout\ : std_logic;
SIGNAL \total_cycles_int[0]~8\ : std_logic;
SIGNAL \total_cycles_int[1]~10_combout\ : std_logic;
SIGNAL \total_cycles_int[1]~11\ : std_logic;
SIGNAL \total_cycles_int[2]~12_combout\ : std_logic;
SIGNAL \total_cycles_int[2]~13\ : std_logic;
SIGNAL \total_cycles_int[3]~14_combout\ : std_logic;
SIGNAL \total_cycles_int[3]~15\ : std_logic;
SIGNAL \total_cycles_int[4]~16_combout\ : std_logic;
SIGNAL \total_cycles_int[4]~17\ : std_logic;
SIGNAL \total_cycles_int[5]~18_combout\ : std_logic;
SIGNAL \total_cycles_int[5]~19\ : std_logic;
SIGNAL \total_cycles_int[6]~20_combout\ : std_logic;
SIGNAL \MaxPoints[0]~reg0_q\ : std_logic;
SIGNAL \MaxPoints[1]~reg0_q\ : std_logic;
SIGNAL \MaxPoints[2]~reg0_q\ : std_logic;
SIGNAL \MaxPoints[3]~reg0_q\ : std_logic;
SIGNAL \MaxPoints[4]~reg0_q\ : std_logic;
SIGNAL \MaxPoints[5]~reg0_q\ : std_logic;
SIGNAL \MaxPoints[6]~reg0_q\ : std_logic;
SIGNAL \state.win~q\ : std_logic;
SIGNAL \winner~0_combout\ : std_logic;
SIGNAL \winner~reg0_q\ : std_logic;
SIGNAL total_cycles_int : std_logic_vector(31 DOWNTO 0);
SIGNAL points_A_int : std_logic_vector(7 DOWNTO 0);
SIGNAL points_B_int : std_logic_vector(7 DOWNTO 0);
SIGNAL confirmed_number_int : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_state_machine~0_combout\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_enable <= enable;
ww_confirm <= confirm;
ww_cycle <= cycle;
ww_PlayerATime <= PlayerATime;
ww_PlayerBTime <= PlayerBTime;
ww_ConfirmedNumberOut <= ConfirmedNumberOut;
ww_confirm_prev_in <= confirm_prev_in;
Points_A <= ww_Points_A;
Points_B <= ww_Points_B;
TotalCycles <= ww_TotalCycles;
MaxPoints <= ww_MaxPoints;
ww_PlayerAPenalty <= PlayerAPenalty;
ww_PlayerBPenalty <= PlayerBPenalty;
HEX3 <= ww_HEX3;
HEX2 <= ww_HEX2;
HEX1 <= ww_HEX1;
HEX0 <= ww_HEX0;
winner <= ww_winner;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_state_machine~0_combout\ <= NOT \state_machine~0_combout\;

\Points_A[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_A_int(0),
	devoe => ww_devoe,
	o => \Points_A[0]~output_o\);

\Points_A[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_A_int(1),
	devoe => ww_devoe,
	o => \Points_A[1]~output_o\);

\Points_A[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_A_int(2),
	devoe => ww_devoe,
	o => \Points_A[2]~output_o\);

\Points_A[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_A_int(3),
	devoe => ww_devoe,
	o => \Points_A[3]~output_o\);

\Points_A[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_A_int(4),
	devoe => ww_devoe,
	o => \Points_A[4]~output_o\);

\Points_A[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_A_int(5),
	devoe => ww_devoe,
	o => \Points_A[5]~output_o\);

\Points_A[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_A_int(6),
	devoe => ww_devoe,
	o => \Points_A[6]~output_o\);

\Points_B[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_B_int(0),
	devoe => ww_devoe,
	o => \Points_B[0]~output_o\);

\Points_B[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_B_int(1),
	devoe => ww_devoe,
	o => \Points_B[1]~output_o\);

\Points_B[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_B_int(2),
	devoe => ww_devoe,
	o => \Points_B[2]~output_o\);

\Points_B[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_B_int(3),
	devoe => ww_devoe,
	o => \Points_B[3]~output_o\);

\Points_B[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_B_int(4),
	devoe => ww_devoe,
	o => \Points_B[4]~output_o\);

\Points_B[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_B_int(5),
	devoe => ww_devoe,
	o => \Points_B[5]~output_o\);

\Points_B[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => points_B_int(6),
	devoe => ww_devoe,
	o => \Points_B[6]~output_o\);

\TotalCycles[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_cycles_int(0),
	devoe => ww_devoe,
	o => \TotalCycles[0]~output_o\);

\TotalCycles[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_cycles_int(1),
	devoe => ww_devoe,
	o => \TotalCycles[1]~output_o\);

\TotalCycles[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_cycles_int(2),
	devoe => ww_devoe,
	o => \TotalCycles[2]~output_o\);

\TotalCycles[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_cycles_int(3),
	devoe => ww_devoe,
	o => \TotalCycles[3]~output_o\);

\TotalCycles[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_cycles_int(4),
	devoe => ww_devoe,
	o => \TotalCycles[4]~output_o\);

\TotalCycles[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_cycles_int(5),
	devoe => ww_devoe,
	o => \TotalCycles[5]~output_o\);

\TotalCycles[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => total_cycles_int(6),
	devoe => ww_devoe,
	o => \TotalCycles[6]~output_o\);

\MaxPoints[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MaxPoints[0]~reg0_q\,
	devoe => ww_devoe,
	o => \MaxPoints[0]~output_o\);

\MaxPoints[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MaxPoints[1]~reg0_q\,
	devoe => ww_devoe,
	o => \MaxPoints[1]~output_o\);

\MaxPoints[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MaxPoints[2]~reg0_q\,
	devoe => ww_devoe,
	o => \MaxPoints[2]~output_o\);

\MaxPoints[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MaxPoints[3]~reg0_q\,
	devoe => ww_devoe,
	o => \MaxPoints[3]~output_o\);

\MaxPoints[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MaxPoints[4]~reg0_q\,
	devoe => ww_devoe,
	o => \MaxPoints[4]~output_o\);

\MaxPoints[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MaxPoints[5]~reg0_q\,
	devoe => ww_devoe,
	o => \MaxPoints[5]~output_o\);

\MaxPoints[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \MaxPoints[6]~reg0_q\,
	devoe => ww_devoe,
	o => \MaxPoints[6]~output_o\);

\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

\winner~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \winner~reg0_q\,
	devoe => ww_devoe,
	o => \winner~output_o\);

\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = points_A_int(0) $ (VCC)
-- \Add4~1\ = CARRY(points_A_int(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(0),
	datad => VCC,
	combout => \Add4~0_combout\,
	cout => \Add4~1\);

\PlayerAPenalty~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerAPenalty,
	o => \PlayerAPenalty~input_o\);

\enable~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_enable,
	o => \enable~input_o\);

\ConfirmedNumberOut[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ConfirmedNumberOut(0),
	o => \ConfirmedNumberOut[0]~input_o\);

\reset~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

\state.init_competition\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => VCC,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \state~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.init_competition~q\);

\MaxPoints[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MaxPoints[0]~0_combout\ = (\enable~input_o\ & (!\internal_reset~q\ & (!\reset~input_o\ & !\state.init_competition~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datab => \internal_reset~q\,
	datac => \reset~input_o\,
	datad => \state.init_competition~q\,
	combout => \MaxPoints[0]~0_combout\);

\confirmed_number_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[0]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => confirmed_number_int(0));

\Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~4_combout\ = (points_A_int(1) & (!\Add4~1\)) # (!points_A_int(1) & ((\Add4~1\) # (GND)))
-- \Add4~5\ = CARRY((!\Add4~1\) # (!points_A_int(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(1),
	datad => VCC,
	cin => \Add4~1\,
	combout => \Add4~4_combout\,
	cout => \Add4~5\);

\PlayerATime[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(13),
	o => \PlayerATime[13]~input_o\);

\PlayerBTime[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(13),
	o => \PlayerBTime[13]~input_o\);

\PlayerATime[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(12),
	o => \PlayerATime[12]~input_o\);

\PlayerBTime[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(12),
	o => \PlayerBTime[12]~input_o\);

\PlayerATime[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(11),
	o => \PlayerATime[11]~input_o\);

\PlayerBTime[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(11),
	o => \PlayerBTime[11]~input_o\);

\PlayerATime[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(10),
	o => \PlayerATime[10]~input_o\);

\PlayerBTime[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(10),
	o => \PlayerBTime[10]~input_o\);

\PlayerATime[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(9),
	o => \PlayerATime[9]~input_o\);

\PlayerBTime[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(9),
	o => \PlayerBTime[9]~input_o\);

\PlayerATime[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(8),
	o => \PlayerATime[8]~input_o\);

\PlayerBTime[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(8),
	o => \PlayerBTime[8]~input_o\);

\PlayerATime[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(7),
	o => \PlayerATime[7]~input_o\);

\PlayerBTime[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(7),
	o => \PlayerBTime[7]~input_o\);

\PlayerATime[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(6),
	o => \PlayerATime[6]~input_o\);

\PlayerBTime[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(6),
	o => \PlayerBTime[6]~input_o\);

\PlayerATime[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(5),
	o => \PlayerATime[5]~input_o\);

\PlayerBTime[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(5),
	o => \PlayerBTime[5]~input_o\);

\PlayerATime[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(4),
	o => \PlayerATime[4]~input_o\);

\PlayerBTime[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(4),
	o => \PlayerBTime[4]~input_o\);

\PlayerATime[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(3),
	o => \PlayerATime[3]~input_o\);

\PlayerBTime[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(3),
	o => \PlayerBTime[3]~input_o\);

\PlayerATime[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(2),
	o => \PlayerATime[2]~input_o\);

\PlayerBTime[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(2),
	o => \PlayerBTime[2]~input_o\);

\PlayerATime[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(1),
	o => \PlayerATime[1]~input_o\);

\PlayerBTime[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(1),
	o => \PlayerBTime[1]~input_o\);

\PlayerATime[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerATime(0),
	o => \PlayerATime[0]~input_o\);

\PlayerBTime[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBTime(0),
	o => \PlayerBTime[0]~input_o\);

\LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~1_cout\ = CARRY((!\PlayerATime[0]~input_o\ & \PlayerBTime[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[0]~input_o\,
	datab => \PlayerBTime[0]~input_o\,
	datad => VCC,
	cout => \LessThan2~1_cout\);

\LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~3_cout\ = CARRY((\PlayerATime[1]~input_o\ & ((!\LessThan2~1_cout\) # (!\PlayerBTime[1]~input_o\))) # (!\PlayerATime[1]~input_o\ & (!\PlayerBTime[1]~input_o\ & !\LessThan2~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[1]~input_o\,
	datab => \PlayerBTime[1]~input_o\,
	datad => VCC,
	cin => \LessThan2~1_cout\,
	cout => \LessThan2~3_cout\);

\LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~5_cout\ = CARRY((\PlayerATime[2]~input_o\ & (\PlayerBTime[2]~input_o\ & !\LessThan2~3_cout\)) # (!\PlayerATime[2]~input_o\ & ((\PlayerBTime[2]~input_o\) # (!\LessThan2~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[2]~input_o\,
	datab => \PlayerBTime[2]~input_o\,
	datad => VCC,
	cin => \LessThan2~3_cout\,
	cout => \LessThan2~5_cout\);

\LessThan2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~7_cout\ = CARRY((\PlayerATime[3]~input_o\ & ((!\LessThan2~5_cout\) # (!\PlayerBTime[3]~input_o\))) # (!\PlayerATime[3]~input_o\ & (!\PlayerBTime[3]~input_o\ & !\LessThan2~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[3]~input_o\,
	datab => \PlayerBTime[3]~input_o\,
	datad => VCC,
	cin => \LessThan2~5_cout\,
	cout => \LessThan2~7_cout\);

\LessThan2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~9_cout\ = CARRY((\PlayerATime[4]~input_o\ & (\PlayerBTime[4]~input_o\ & !\LessThan2~7_cout\)) # (!\PlayerATime[4]~input_o\ & ((\PlayerBTime[4]~input_o\) # (!\LessThan2~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[4]~input_o\,
	datab => \PlayerBTime[4]~input_o\,
	datad => VCC,
	cin => \LessThan2~7_cout\,
	cout => \LessThan2~9_cout\);

\LessThan2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~11_cout\ = CARRY((\PlayerATime[5]~input_o\ & ((!\LessThan2~9_cout\) # (!\PlayerBTime[5]~input_o\))) # (!\PlayerATime[5]~input_o\ & (!\PlayerBTime[5]~input_o\ & !\LessThan2~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[5]~input_o\,
	datab => \PlayerBTime[5]~input_o\,
	datad => VCC,
	cin => \LessThan2~9_cout\,
	cout => \LessThan2~11_cout\);

\LessThan2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~13_cout\ = CARRY((\PlayerATime[6]~input_o\ & (\PlayerBTime[6]~input_o\ & !\LessThan2~11_cout\)) # (!\PlayerATime[6]~input_o\ & ((\PlayerBTime[6]~input_o\) # (!\LessThan2~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[6]~input_o\,
	datab => \PlayerBTime[6]~input_o\,
	datad => VCC,
	cin => \LessThan2~11_cout\,
	cout => \LessThan2~13_cout\);

\LessThan2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~15_cout\ = CARRY((\PlayerATime[7]~input_o\ & ((!\LessThan2~13_cout\) # (!\PlayerBTime[7]~input_o\))) # (!\PlayerATime[7]~input_o\ & (!\PlayerBTime[7]~input_o\ & !\LessThan2~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[7]~input_o\,
	datab => \PlayerBTime[7]~input_o\,
	datad => VCC,
	cin => \LessThan2~13_cout\,
	cout => \LessThan2~15_cout\);

\LessThan2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~17_cout\ = CARRY((\PlayerATime[8]~input_o\ & (\PlayerBTime[8]~input_o\ & !\LessThan2~15_cout\)) # (!\PlayerATime[8]~input_o\ & ((\PlayerBTime[8]~input_o\) # (!\LessThan2~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[8]~input_o\,
	datab => \PlayerBTime[8]~input_o\,
	datad => VCC,
	cin => \LessThan2~15_cout\,
	cout => \LessThan2~17_cout\);

\LessThan2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~19_cout\ = CARRY((\PlayerATime[9]~input_o\ & ((!\LessThan2~17_cout\) # (!\PlayerBTime[9]~input_o\))) # (!\PlayerATime[9]~input_o\ & (!\PlayerBTime[9]~input_o\ & !\LessThan2~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[9]~input_o\,
	datab => \PlayerBTime[9]~input_o\,
	datad => VCC,
	cin => \LessThan2~17_cout\,
	cout => \LessThan2~19_cout\);

\LessThan2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~21_cout\ = CARRY((\PlayerATime[10]~input_o\ & (\PlayerBTime[10]~input_o\ & !\LessThan2~19_cout\)) # (!\PlayerATime[10]~input_o\ & ((\PlayerBTime[10]~input_o\) # (!\LessThan2~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[10]~input_o\,
	datab => \PlayerBTime[10]~input_o\,
	datad => VCC,
	cin => \LessThan2~19_cout\,
	cout => \LessThan2~21_cout\);

\LessThan2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~23_cout\ = CARRY((\PlayerATime[11]~input_o\ & ((!\LessThan2~21_cout\) # (!\PlayerBTime[11]~input_o\))) # (!\PlayerATime[11]~input_o\ & (!\PlayerBTime[11]~input_o\ & !\LessThan2~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[11]~input_o\,
	datab => \PlayerBTime[11]~input_o\,
	datad => VCC,
	cin => \LessThan2~21_cout\,
	cout => \LessThan2~23_cout\);

\LessThan2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~25_cout\ = CARRY((\PlayerATime[12]~input_o\ & (\PlayerBTime[12]~input_o\ & !\LessThan2~23_cout\)) # (!\PlayerATime[12]~input_o\ & ((\PlayerBTime[12]~input_o\) # (!\LessThan2~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[12]~input_o\,
	datab => \PlayerBTime[12]~input_o\,
	datad => VCC,
	cin => \LessThan2~23_cout\,
	cout => \LessThan2~25_cout\);

\LessThan2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan2~26_combout\ = (\PlayerATime[13]~input_o\ & (\PlayerBTime[13]~input_o\ & \LessThan2~25_cout\)) # (!\PlayerATime[13]~input_o\ & ((\PlayerBTime[13]~input_o\) # (\LessThan2~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerATime[13]~input_o\,
	datab => \PlayerBTime[13]~input_o\,
	cin => \LessThan2~25_cout\,
	combout => \LessThan2~26_combout\);

\Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~0_combout\ = points_A_int(1) $ (VCC)
-- \Add2~1\ = CARRY(points_A_int(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(1),
	datad => VCC,
	combout => \Add2~0_combout\,
	cout => \Add2~1\);

\Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~6_combout\ = (points_A_int(2) & (\Add4~5\ $ (GND))) # (!points_A_int(2) & (!\Add4~5\ & VCC))
-- \Add4~7\ = CARRY((points_A_int(2) & !\Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(2),
	datad => VCC,
	cin => \Add4~5\,
	combout => \Add4~6_combout\,
	cout => \Add4~7\);

\Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~2_combout\ = (points_A_int(2) & (\Add2~1\ & VCC)) # (!points_A_int(2) & (!\Add2~1\))
-- \Add2~3\ = CARRY((!points_A_int(2) & !\Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(2),
	datad => VCC,
	cin => \Add2~1\,
	combout => \Add2~2_combout\,
	cout => \Add2~3\);

\points_A_int~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int~3_combout\ = (\LessThan2~26_combout\ & (\Add4~6_combout\)) # (!\LessThan2~26_combout\ & (((\Add2~2_combout\ & !\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~6_combout\,
	datab => \LessThan2~26_combout\,
	datac => \Add2~2_combout\,
	datad => \LessThan0~1_combout\,
	combout => \points_A_int~3_combout\);

\points_A_int[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int[0]~0_combout\ = (\enable~input_o\ & \state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datab => \state.game~q\,
	combout => \points_A_int[0]~0_combout\);

\points_A_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int[1]~2_combout\ = (\points_A_int[0]~0_combout\ & ((\LessThan2~26_combout\) # ((\PlayerAPenalty~input_o\ & !\playerA_penalty_applied~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_A_int[0]~0_combout\,
	datab => \LessThan2~26_combout\,
	datac => \PlayerAPenalty~input_o\,
	datad => \playerA_penalty_applied~q\,
	combout => \points_A_int[1]~2_combout\);

\points_A_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_A_int~3_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(2));

\Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~8_combout\ = (points_A_int(3) & (!\Add4~7\)) # (!points_A_int(3) & ((\Add4~7\) # (GND)))
-- \Add4~9\ = CARRY((!\Add4~7\) # (!points_A_int(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(3),
	datad => VCC,
	cin => \Add4~7\,
	combout => \Add4~8_combout\,
	cout => \Add4~9\);

\Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~4_combout\ = (points_A_int(3) & ((GND) # (!\Add2~3\))) # (!points_A_int(3) & (\Add2~3\ $ (GND)))
-- \Add2~5\ = CARRY((points_A_int(3)) # (!\Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(3),
	datad => VCC,
	cin => \Add2~3\,
	combout => \Add2~4_combout\,
	cout => \Add2~5\);

\points_A_int~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int~4_combout\ = (\LessThan2~26_combout\ & (\Add4~8_combout\)) # (!\LessThan2~26_combout\ & (((\Add2~4_combout\ & !\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~8_combout\,
	datab => \LessThan2~26_combout\,
	datac => \Add2~4_combout\,
	datad => \LessThan0~1_combout\,
	combout => \points_A_int~4_combout\);

\points_A_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_A_int~4_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(3));

\Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~10_combout\ = (points_A_int(4) & (\Add4~9\ $ (GND))) # (!points_A_int(4) & (!\Add4~9\ & VCC))
-- \Add4~11\ = CARRY((points_A_int(4) & !\Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(4),
	datad => VCC,
	cin => \Add4~9\,
	combout => \Add4~10_combout\,
	cout => \Add4~11\);

\Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~6_combout\ = (points_A_int(4) & (\Add2~5\ & VCC)) # (!points_A_int(4) & (!\Add2~5\))
-- \Add2~7\ = CARRY((!points_A_int(4) & !\Add2~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(4),
	datad => VCC,
	cin => \Add2~5\,
	combout => \Add2~6_combout\,
	cout => \Add2~7\);

\points_A_int~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int~5_combout\ = (\LessThan2~26_combout\ & (\Add4~10_combout\)) # (!\LessThan2~26_combout\ & (((\Add2~6_combout\ & !\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~10_combout\,
	datab => \LessThan2~26_combout\,
	datac => \Add2~6_combout\,
	datad => \LessThan0~1_combout\,
	combout => \points_A_int~5_combout\);

\points_A_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_A_int~5_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(4));

\Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~12_combout\ = (points_A_int(5) & (!\Add4~11\)) # (!points_A_int(5) & ((\Add4~11\) # (GND)))
-- \Add4~13\ = CARRY((!\Add4~11\) # (!points_A_int(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(5),
	datad => VCC,
	cin => \Add4~11\,
	combout => \Add4~12_combout\,
	cout => \Add4~13\);

\Add2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~8_combout\ = (points_A_int(5) & ((GND) # (!\Add2~7\))) # (!points_A_int(5) & (\Add2~7\ $ (GND)))
-- \Add2~9\ = CARRY((points_A_int(5)) # (!\Add2~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(5),
	datad => VCC,
	cin => \Add2~7\,
	combout => \Add2~8_combout\,
	cout => \Add2~9\);

\points_A_int~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int~6_combout\ = (\LessThan2~26_combout\ & (\Add4~12_combout\)) # (!\LessThan2~26_combout\ & (((\Add2~8_combout\ & !\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~12_combout\,
	datab => \LessThan2~26_combout\,
	datac => \Add2~8_combout\,
	datad => \LessThan0~1_combout\,
	combout => \points_A_int~6_combout\);

\points_A_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_A_int~6_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(5));

\Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~14_combout\ = (points_A_int(6) & (\Add4~13\ $ (GND))) # (!points_A_int(6) & (!\Add4~13\ & VCC))
-- \Add4~15\ = CARRY((points_A_int(6) & !\Add4~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(6),
	datad => VCC,
	cin => \Add4~13\,
	combout => \Add4~14_combout\,
	cout => \Add4~15\);

\Add2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~10_combout\ = (points_A_int(6) & (\Add2~9\ & VCC)) # (!points_A_int(6) & (!\Add2~9\))
-- \Add2~11\ = CARRY((!points_A_int(6) & !\Add2~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(6),
	datad => VCC,
	cin => \Add2~9\,
	combout => \Add2~10_combout\,
	cout => \Add2~11\);

\points_A_int~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int~7_combout\ = (\LessThan2~26_combout\ & (\Add4~14_combout\)) # (!\LessThan2~26_combout\ & (((\Add2~10_combout\ & !\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~14_combout\,
	datab => \LessThan2~26_combout\,
	datac => \Add2~10_combout\,
	datad => \LessThan0~1_combout\,
	combout => \points_A_int~7_combout\);

\points_A_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_A_int~7_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(6));

\Add4~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~16_combout\ = points_A_int(7) $ (\Add4~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(7),
	cin => \Add4~15\,
	combout => \Add4~16_combout\);

\Add2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add2~12_combout\ = points_A_int(7) $ (\Add2~11\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(7),
	cin => \Add2~11\,
	combout => \Add2~12_combout\);

\points_A_int~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int~8_combout\ = (\LessThan2~26_combout\ & (\Add4~16_combout\)) # (!\LessThan2~26_combout\ & (((\Add2~12_combout\ & !\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~16_combout\,
	datab => \LessThan2~26_combout\,
	datac => \Add2~12_combout\,
	datad => \LessThan0~1_combout\,
	combout => \points_A_int~8_combout\);

\points_A_int[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_A_int~8_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(7));

\LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (!points_A_int(3) & (!points_A_int(4) & (!points_A_int(5) & !points_A_int(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(3),
	datab => points_A_int(4),
	datac => points_A_int(5),
	datad => points_A_int(6),
	combout => \LessThan0~0_combout\);

\LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan0~1_combout\ = (points_A_int(7)) # ((\LessThan0~0_combout\ & (!points_A_int(1) & !points_A_int(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(7),
	datab => \LessThan0~0_combout\,
	datac => points_A_int(1),
	datad => points_A_int(2),
	combout => \LessThan0~1_combout\);

\points_A_int~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_A_int~1_combout\ = (\LessThan2~26_combout\ & (\Add4~4_combout\)) # (!\LessThan2~26_combout\ & (((\Add2~0_combout\ & !\LessThan0~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~4_combout\,
	datab => \LessThan2~26_combout\,
	datac => \Add2~0_combout\,
	datad => \LessThan0~1_combout\,
	combout => \points_A_int~1_combout\);

\points_A_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_A_int~1_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(1));

\ConfirmedNumberOut[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ConfirmedNumberOut(1),
	o => \ConfirmedNumberOut[1]~input_o\);

\confirmed_number_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \confirmed_number_int[1]~0_combout\ = !\ConfirmedNumberOut[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ConfirmedNumberOut[1]~input_o\,
	combout => \confirmed_number_int[1]~0_combout\);

\confirmed_number_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \confirmed_number_int[1]~0_combout\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => confirmed_number_int(1));

\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (points_A_int(0) & (confirmed_number_int(0) & (points_A_int(1) $ (confirmed_number_int(1))))) # (!points_A_int(0) & (!confirmed_number_int(0) & (points_A_int(1) $ (confirmed_number_int(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(0),
	datab => confirmed_number_int(0),
	datac => points_A_int(1),
	datad => confirmed_number_int(1),
	combout => \Equal0~0_combout\);

\confirm_prev_in~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_confirm_prev_in,
	o => \confirm_prev_in~input_o\);

\confirm~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_confirm,
	o => \confirm~input_o\);

\state~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~10_combout\ = (\state.init_competition~q\) # ((\confirm_prev_in~input_o\) # (!\confirm~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.init_competition~q\,
	datab => \confirm_prev_in~input_o\,
	datad => \confirm~input_o\,
	combout => \state~10_combout\);

\LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~1_cout\ = CARRY((!\PlayerBTime[0]~input_o\ & \PlayerATime[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[0]~input_o\,
	datab => \PlayerATime[0]~input_o\,
	datad => VCC,
	cout => \LessThan3~1_cout\);

\LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~3_cout\ = CARRY((\PlayerBTime[1]~input_o\ & ((!\LessThan3~1_cout\) # (!\PlayerATime[1]~input_o\))) # (!\PlayerBTime[1]~input_o\ & (!\PlayerATime[1]~input_o\ & !\LessThan3~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[1]~input_o\,
	datab => \PlayerATime[1]~input_o\,
	datad => VCC,
	cin => \LessThan3~1_cout\,
	cout => \LessThan3~3_cout\);

\LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~5_cout\ = CARRY((\PlayerBTime[2]~input_o\ & (\PlayerATime[2]~input_o\ & !\LessThan3~3_cout\)) # (!\PlayerBTime[2]~input_o\ & ((\PlayerATime[2]~input_o\) # (!\LessThan3~3_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[2]~input_o\,
	datab => \PlayerATime[2]~input_o\,
	datad => VCC,
	cin => \LessThan3~3_cout\,
	cout => \LessThan3~5_cout\);

\LessThan3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~7_cout\ = CARRY((\PlayerBTime[3]~input_o\ & ((!\LessThan3~5_cout\) # (!\PlayerATime[3]~input_o\))) # (!\PlayerBTime[3]~input_o\ & (!\PlayerATime[3]~input_o\ & !\LessThan3~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[3]~input_o\,
	datab => \PlayerATime[3]~input_o\,
	datad => VCC,
	cin => \LessThan3~5_cout\,
	cout => \LessThan3~7_cout\);

\LessThan3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~9_cout\ = CARRY((\PlayerBTime[4]~input_o\ & (\PlayerATime[4]~input_o\ & !\LessThan3~7_cout\)) # (!\PlayerBTime[4]~input_o\ & ((\PlayerATime[4]~input_o\) # (!\LessThan3~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[4]~input_o\,
	datab => \PlayerATime[4]~input_o\,
	datad => VCC,
	cin => \LessThan3~7_cout\,
	cout => \LessThan3~9_cout\);

\LessThan3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~11_cout\ = CARRY((\PlayerBTime[5]~input_o\ & ((!\LessThan3~9_cout\) # (!\PlayerATime[5]~input_o\))) # (!\PlayerBTime[5]~input_o\ & (!\PlayerATime[5]~input_o\ & !\LessThan3~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[5]~input_o\,
	datab => \PlayerATime[5]~input_o\,
	datad => VCC,
	cin => \LessThan3~9_cout\,
	cout => \LessThan3~11_cout\);

\LessThan3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~13_cout\ = CARRY((\PlayerBTime[6]~input_o\ & (\PlayerATime[6]~input_o\ & !\LessThan3~11_cout\)) # (!\PlayerBTime[6]~input_o\ & ((\PlayerATime[6]~input_o\) # (!\LessThan3~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[6]~input_o\,
	datab => \PlayerATime[6]~input_o\,
	datad => VCC,
	cin => \LessThan3~11_cout\,
	cout => \LessThan3~13_cout\);

\LessThan3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~15_cout\ = CARRY((\PlayerBTime[7]~input_o\ & ((!\LessThan3~13_cout\) # (!\PlayerATime[7]~input_o\))) # (!\PlayerBTime[7]~input_o\ & (!\PlayerATime[7]~input_o\ & !\LessThan3~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[7]~input_o\,
	datab => \PlayerATime[7]~input_o\,
	datad => VCC,
	cin => \LessThan3~13_cout\,
	cout => \LessThan3~15_cout\);

\LessThan3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~17_cout\ = CARRY((\PlayerBTime[8]~input_o\ & (\PlayerATime[8]~input_o\ & !\LessThan3~15_cout\)) # (!\PlayerBTime[8]~input_o\ & ((\PlayerATime[8]~input_o\) # (!\LessThan3~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[8]~input_o\,
	datab => \PlayerATime[8]~input_o\,
	datad => VCC,
	cin => \LessThan3~15_cout\,
	cout => \LessThan3~17_cout\);

\LessThan3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~19_cout\ = CARRY((\PlayerBTime[9]~input_o\ & ((!\LessThan3~17_cout\) # (!\PlayerATime[9]~input_o\))) # (!\PlayerBTime[9]~input_o\ & (!\PlayerATime[9]~input_o\ & !\LessThan3~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[9]~input_o\,
	datab => \PlayerATime[9]~input_o\,
	datad => VCC,
	cin => \LessThan3~17_cout\,
	cout => \LessThan3~19_cout\);

\LessThan3~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~21_cout\ = CARRY((\PlayerBTime[10]~input_o\ & (\PlayerATime[10]~input_o\ & !\LessThan3~19_cout\)) # (!\PlayerBTime[10]~input_o\ & ((\PlayerATime[10]~input_o\) # (!\LessThan3~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[10]~input_o\,
	datab => \PlayerATime[10]~input_o\,
	datad => VCC,
	cin => \LessThan3~19_cout\,
	cout => \LessThan3~21_cout\);

\LessThan3~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~23_cout\ = CARRY((\PlayerBTime[11]~input_o\ & ((!\LessThan3~21_cout\) # (!\PlayerATime[11]~input_o\))) # (!\PlayerBTime[11]~input_o\ & (!\PlayerATime[11]~input_o\ & !\LessThan3~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[11]~input_o\,
	datab => \PlayerATime[11]~input_o\,
	datad => VCC,
	cin => \LessThan3~21_cout\,
	cout => \LessThan3~23_cout\);

\LessThan3~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~25_cout\ = CARRY((\PlayerBTime[12]~input_o\ & (\PlayerATime[12]~input_o\ & !\LessThan3~23_cout\)) # (!\PlayerBTime[12]~input_o\ & ((\PlayerATime[12]~input_o\) # (!\LessThan3~23_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[12]~input_o\,
	datab => \PlayerATime[12]~input_o\,
	datad => VCC,
	cin => \LessThan3~23_cout\,
	cout => \LessThan3~25_cout\);

\LessThan3~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan3~26_combout\ = (\PlayerBTime[13]~input_o\ & (\PlayerATime[13]~input_o\ & \LessThan3~25_cout\)) # (!\PlayerBTime[13]~input_o\ & ((\PlayerATime[13]~input_o\) # (\LessThan3~25_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010011010100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PlayerBTime[13]~input_o\,
	datab => \PlayerATime[13]~input_o\,
	cin => \LessThan3~25_cout\,
	combout => \LessThan3~26_combout\);

\points_B_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~0_combout\ = (\LessThan3~26_combout\ & !\LessThan2~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan3~26_combout\,
	datad => \LessThan2~26_combout\,
	combout => \points_B_int~0_combout\);

\Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~0_combout\ = points_B_int(1) $ (VCC)
-- \Add3~1\ = CARRY(points_B_int(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(1),
	datad => VCC,
	combout => \Add3~0_combout\,
	cout => \Add3~1\);

\Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~0_combout\ = points_B_int(0) $ (VCC)
-- \Add5~1\ = CARRY(points_B_int(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(0),
	datad => VCC,
	combout => \Add5~0_combout\,
	cout => \Add5~1\);

\PlayerBPenalty~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_PlayerBPenalty,
	o => \PlayerBPenalty~input_o\);

playerB_penalty_applied : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PlayerBPenalty~input_o\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \playerB_penalty_applied~q\);

\Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~2_combout\ = (\playerB_penalty_applied~q\) # ((!\LessThan1~1_combout\) # (!\PlayerBPenalty~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \playerB_penalty_applied~q\,
	datac => \PlayerBPenalty~input_o\,
	datad => \LessThan1~1_combout\,
	combout => \Add5~2_combout\);

\Add5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~3_combout\ = (\points_B_int~0_combout\ & (\Add5~0_combout\)) # (!\points_B_int~0_combout\ & (((points_B_int(0) & \Add5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add5~0_combout\,
	datab => points_B_int(0),
	datac => \Add5~2_combout\,
	datad => \points_B_int~0_combout\,
	combout => \Add5~3_combout\);

\points_B_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add5~3_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(0));

\Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~4_combout\ = (points_B_int(1) & (!\Add5~1\)) # (!points_B_int(1) & ((\Add5~1\) # (GND)))
-- \Add5~5\ = CARRY((!\Add5~1\) # (!points_B_int(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(1),
	datad => VCC,
	cin => \Add5~1\,
	combout => \Add5~4_combout\,
	cout => \Add5~5\);

\points_B_int~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~1_combout\ = (\points_B_int~0_combout\ & ((\Add5~4_combout\) # ((\Add3~0_combout\ & \Add3~2_combout\)))) # (!\points_B_int~0_combout\ & (\Add3~0_combout\ & (\Add3~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_B_int~0_combout\,
	datab => \Add3~0_combout\,
	datac => \Add3~2_combout\,
	datad => \Add5~4_combout\,
	combout => \points_B_int~1_combout\);

\points_B_int[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int[1]~2_combout\ = (\points_A_int[0]~0_combout\ & ((\points_B_int~0_combout\) # ((\PlayerBPenalty~input_o\ & !\playerB_penalty_applied~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_A_int[0]~0_combout\,
	datab => \points_B_int~0_combout\,
	datac => \PlayerBPenalty~input_o\,
	datad => \playerB_penalty_applied~q\,
	combout => \points_B_int[1]~2_combout\);

\points_B_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_B_int~1_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_B_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(1));

\Add3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~3_combout\ = (points_B_int(2) & (\Add3~1\ & VCC)) # (!points_B_int(2) & (!\Add3~1\))
-- \Add3~4\ = CARRY((!points_B_int(2) & !\Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(2),
	datad => VCC,
	cin => \Add3~1\,
	combout => \Add3~3_combout\,
	cout => \Add3~4\);

\Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~6_combout\ = (points_B_int(2) & (\Add5~5\ $ (GND))) # (!points_B_int(2) & (!\Add5~5\ & VCC))
-- \Add5~7\ = CARRY((points_B_int(2) & !\Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(2),
	datad => VCC,
	cin => \Add5~5\,
	combout => \Add5~6_combout\,
	cout => \Add5~7\);

\points_B_int~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~3_combout\ = (\points_B_int~0_combout\ & ((\Add5~6_combout\) # ((\Add3~2_combout\ & \Add3~3_combout\)))) # (!\points_B_int~0_combout\ & (\Add3~2_combout\ & (\Add3~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_B_int~0_combout\,
	datab => \Add3~2_combout\,
	datac => \Add3~3_combout\,
	datad => \Add5~6_combout\,
	combout => \points_B_int~3_combout\);

\points_B_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_B_int~3_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_B_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(2));

\Add3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~5_combout\ = (points_B_int(3) & ((GND) # (!\Add3~4\))) # (!points_B_int(3) & (\Add3~4\ $ (GND)))
-- \Add3~6\ = CARRY((points_B_int(3)) # (!\Add3~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(3),
	datad => VCC,
	cin => \Add3~4\,
	combout => \Add3~5_combout\,
	cout => \Add3~6\);

\Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~8_combout\ = (points_B_int(3) & (!\Add5~7\)) # (!points_B_int(3) & ((\Add5~7\) # (GND)))
-- \Add5~9\ = CARRY((!\Add5~7\) # (!points_B_int(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(3),
	datad => VCC,
	cin => \Add5~7\,
	combout => \Add5~8_combout\,
	cout => \Add5~9\);

\points_B_int~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~4_combout\ = (\points_B_int~0_combout\ & ((\Add5~8_combout\) # ((\Add3~2_combout\ & \Add3~5_combout\)))) # (!\points_B_int~0_combout\ & (\Add3~2_combout\ & (\Add3~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_B_int~0_combout\,
	datab => \Add3~2_combout\,
	datac => \Add3~5_combout\,
	datad => \Add5~8_combout\,
	combout => \points_B_int~4_combout\);

\points_B_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_B_int~4_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_B_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(3));

\Add3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~7_combout\ = (points_B_int(4) & (\Add3~6\ & VCC)) # (!points_B_int(4) & (!\Add3~6\))
-- \Add3~8\ = CARRY((!points_B_int(4) & !\Add3~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(4),
	datad => VCC,
	cin => \Add3~6\,
	combout => \Add3~7_combout\,
	cout => \Add3~8\);

\Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~10_combout\ = (points_B_int(4) & (\Add5~9\ $ (GND))) # (!points_B_int(4) & (!\Add5~9\ & VCC))
-- \Add5~11\ = CARRY((points_B_int(4) & !\Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(4),
	datad => VCC,
	cin => \Add5~9\,
	combout => \Add5~10_combout\,
	cout => \Add5~11\);

\points_B_int~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~5_combout\ = (\points_B_int~0_combout\ & ((\Add5~10_combout\) # ((\Add3~2_combout\ & \Add3~7_combout\)))) # (!\points_B_int~0_combout\ & (\Add3~2_combout\ & (\Add3~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_B_int~0_combout\,
	datab => \Add3~2_combout\,
	datac => \Add3~7_combout\,
	datad => \Add5~10_combout\,
	combout => \points_B_int~5_combout\);

\points_B_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_B_int~5_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_B_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(4));

\Add3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~9_combout\ = (points_B_int(5) & ((GND) # (!\Add3~8\))) # (!points_B_int(5) & (\Add3~8\ $ (GND)))
-- \Add3~10\ = CARRY((points_B_int(5)) # (!\Add3~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(5),
	datad => VCC,
	cin => \Add3~8\,
	combout => \Add3~9_combout\,
	cout => \Add3~10\);

\Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~12_combout\ = (points_B_int(5) & (!\Add5~11\)) # (!points_B_int(5) & ((\Add5~11\) # (GND)))
-- \Add5~13\ = CARRY((!\Add5~11\) # (!points_B_int(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(5),
	datad => VCC,
	cin => \Add5~11\,
	combout => \Add5~12_combout\,
	cout => \Add5~13\);

\points_B_int~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~6_combout\ = (\points_B_int~0_combout\ & ((\Add5~12_combout\) # ((\Add3~2_combout\ & \Add3~9_combout\)))) # (!\points_B_int~0_combout\ & (\Add3~2_combout\ & (\Add3~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_B_int~0_combout\,
	datab => \Add3~2_combout\,
	datac => \Add3~9_combout\,
	datad => \Add5~12_combout\,
	combout => \points_B_int~6_combout\);

\points_B_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_B_int~6_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_B_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(5));

\Add3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~11_combout\ = (points_B_int(6) & (\Add3~10\ & VCC)) # (!points_B_int(6) & (!\Add3~10\))
-- \Add3~12\ = CARRY((!points_B_int(6) & !\Add3~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(6),
	datad => VCC,
	cin => \Add3~10\,
	combout => \Add3~11_combout\,
	cout => \Add3~12\);

\Add5~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~14_combout\ = (points_B_int(6) & (\Add5~13\ $ (GND))) # (!points_B_int(6) & (!\Add5~13\ & VCC))
-- \Add5~15\ = CARRY((points_B_int(6) & !\Add5~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(6),
	datad => VCC,
	cin => \Add5~13\,
	combout => \Add5~14_combout\,
	cout => \Add5~15\);

\points_B_int~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~7_combout\ = (\points_B_int~0_combout\ & ((\Add5~14_combout\) # ((\Add3~2_combout\ & \Add3~11_combout\)))) # (!\points_B_int~0_combout\ & (\Add3~2_combout\ & (\Add3~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_B_int~0_combout\,
	datab => \Add3~2_combout\,
	datac => \Add3~11_combout\,
	datad => \Add5~14_combout\,
	combout => \points_B_int~7_combout\);

\points_B_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_B_int~7_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_B_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(6));

\LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!points_B_int(3) & (!points_B_int(4) & (!points_B_int(5) & !points_B_int(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(3),
	datab => points_B_int(4),
	datac => points_B_int(5),
	datad => points_B_int(6),
	combout => \LessThan1~0_combout\);

\LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \LessThan1~1_combout\ = (points_B_int(7)) # ((\LessThan1~0_combout\ & (!points_B_int(1) & !points_B_int(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(7),
	datab => \LessThan1~0_combout\,
	datac => points_B_int(1),
	datad => points_B_int(2),
	combout => \LessThan1~1_combout\);

\Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~2_combout\ = (!\LessThan1~1_combout\ & ((\LessThan2~26_combout\) # (!\LessThan3~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \LessThan2~26_combout\,
	datac => \LessThan3~26_combout\,
	datad => \LessThan1~1_combout\,
	combout => \Add3~2_combout\);

\Add3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add3~13_combout\ = points_B_int(7) $ (\Add3~12\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(7),
	cin => \Add3~12\,
	combout => \Add3~13_combout\);

\Add5~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add5~16_combout\ = points_B_int(7) $ (\Add5~15\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(7),
	cin => \Add5~15\,
	combout => \Add5~16_combout\);

\points_B_int~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \points_B_int~8_combout\ = (\points_B_int~0_combout\ & ((\Add5~16_combout\) # ((\Add3~2_combout\ & \Add3~13_combout\)))) # (!\points_B_int~0_combout\ & (\Add3~2_combout\ & (\Add3~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \points_B_int~0_combout\,
	datab => \Add3~2_combout\,
	datac => \Add3~13_combout\,
	datad => \Add5~16_combout\,
	combout => \points_B_int~8_combout\);

\points_B_int[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \points_B_int~8_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_B_int[1]~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_B_int(7));

\internal_reset~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \internal_reset~4_combout\ = (points_A_int(7) & points_B_int(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(7),
	datab => points_B_int(7),
	combout => \internal_reset~4_combout\);

\state~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~11_combout\ = ((\state~10_combout\ & ((\internal_reset~4_combout\) # (!\state.game~q\)))) # (!\enable~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~10_combout\,
	datab => \internal_reset~4_combout\,
	datac => \state.game~q\,
	datad => \enable~input_o\,
	combout => \state~11_combout\);

\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (points_B_int(0) & (confirmed_number_int(0) & (points_B_int(1) $ (confirmed_number_int(1))))) # (!points_B_int(0) & (!confirmed_number_int(0) & (points_B_int(1) $ (confirmed_number_int(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(0),
	datab => confirmed_number_int(0),
	datac => points_B_int(1),
	datad => confirmed_number_int(1),
	combout => \Equal1~0_combout\);

\state~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~12_combout\ = (points_A_int(7)) # ((!\state.init_competition~q\ & (!\confirm_prev_in~input_o\ & \confirm~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.init_competition~q\,
	datab => \confirm_prev_in~input_o\,
	datac => \confirm~input_o\,
	datad => points_A_int(7),
	combout => \state~12_combout\);

\ConfirmedNumberOut[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ConfirmedNumberOut(6),
	o => \ConfirmedNumberOut[6]~input_o\);

\confirmed_number_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[6]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => confirmed_number_int(6));

\ConfirmedNumberOut[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ConfirmedNumberOut(2),
	o => \ConfirmedNumberOut[2]~input_o\);

\confirmed_number_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[2]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => confirmed_number_int(2));

\ConfirmedNumberOut[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ConfirmedNumberOut(3),
	o => \ConfirmedNumberOut[3]~input_o\);

\confirmed_number_int[3]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \confirmed_number_int[3]~1_combout\ = !\ConfirmedNumberOut[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ConfirmedNumberOut[3]~input_o\,
	combout => \confirmed_number_int[3]~1_combout\);

\confirmed_number_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \confirmed_number_int[3]~1_combout\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => confirmed_number_int(3));

\Equal1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~1_combout\ = (points_B_int(2) & (confirmed_number_int(2) & (points_B_int(3) $ (confirmed_number_int(3))))) # (!points_B_int(2) & (!confirmed_number_int(2) & (points_B_int(3) $ (confirmed_number_int(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(2),
	datab => confirmed_number_int(2),
	datac => points_B_int(3),
	datad => confirmed_number_int(3),
	combout => \Equal1~1_combout\);

\ConfirmedNumberOut[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ConfirmedNumberOut(5),
	o => \ConfirmedNumberOut[5]~input_o\);

\confirmed_number_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[5]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => confirmed_number_int(5));

\ConfirmedNumberOut[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ConfirmedNumberOut(4),
	o => \ConfirmedNumberOut[4]~input_o\);

\confirmed_number_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[4]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => confirmed_number_int(4));

\Equal1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~2_combout\ = (points_B_int(4) & (confirmed_number_int(4) & (points_B_int(5) $ (!confirmed_number_int(5))))) # (!points_B_int(4) & (!confirmed_number_int(4) & (points_B_int(5) $ (!confirmed_number_int(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(4),
	datab => points_B_int(5),
	datac => confirmed_number_int(5),
	datad => confirmed_number_int(4),
	combout => \Equal1~2_combout\);

\state~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~13_combout\ = (\Equal1~1_combout\ & (\Equal1~2_combout\ & (points_B_int(6) $ (!confirmed_number_int(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_B_int(6),
	datab => confirmed_number_int(6),
	datac => \Equal1~1_combout\,
	datad => \Equal1~2_combout\,
	combout => \state~13_combout\);

\state~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~14_combout\ = (!points_B_int(7) & (!\state~12_combout\ & ((!\state~13_combout\) # (!\Equal1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal1~0_combout\,
	datab => points_B_int(7),
	datac => \state~12_combout\,
	datad => \state~13_combout\,
	combout => \state~14_combout\);

\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (points_A_int(2) & (confirmed_number_int(2) & (points_A_int(3) $ (confirmed_number_int(3))))) # (!points_A_int(2) & (!confirmed_number_int(2) & (points_A_int(3) $ (confirmed_number_int(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(2),
	datab => confirmed_number_int(2),
	datac => points_A_int(3),
	datad => confirmed_number_int(3),
	combout => \Equal0~1_combout\);

\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (points_A_int(4) & (confirmed_number_int(4) & (points_A_int(5) $ (!confirmed_number_int(5))))) # (!points_A_int(4) & (!confirmed_number_int(4) & (points_A_int(5) $ (!confirmed_number_int(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => points_A_int(4),
	datab => points_A_int(5),
	datac => confirmed_number_int(5),
	datad => confirmed_number_int(4),
	combout => \Equal0~2_combout\);

\state~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~15_combout\ = (\Equal0~1_combout\ & (\Equal0~2_combout\ & (points_A_int(6) $ (!confirmed_number_int(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~2_combout\,
	datac => points_A_int(6),
	datad => confirmed_number_int(6),
	combout => \state~15_combout\);

\state~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~16_combout\ = (!\state~11_combout\ & (((\Equal0~0_combout\ & \state~15_combout\)) # (!\state~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \state~11_combout\,
	datac => \state~14_combout\,
	datad => \state~15_combout\,
	combout => \state~16_combout\);

\state~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~17_combout\ = \state.game~q\ $ (\state~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state.game~q\,
	datad => \state~16_combout\,
	combout => \state~17_combout\);

\state.game\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \state~17_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.game~q\);

\internal_reset~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \internal_reset~5_combout\ = (\internal_reset~q\) # ((\enable~input_o\ & (\state.game~q\ & \internal_reset~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datab => \state.game~q\,
	datac => \internal_reset~q\,
	datad => \internal_reset~4_combout\,
	combout => \internal_reset~5_combout\);

internal_reset : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \internal_reset~5_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \internal_reset~q\);

\state_machine~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_machine~0_combout\ = (\internal_reset~q\) # (\reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \internal_reset~q\,
	datab => \reset~input_o\,
	combout => \state_machine~0_combout\);

playerA_penalty_applied : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \PlayerAPenalty~input_o\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \playerA_penalty_applied~q\);

\Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~2_combout\ = (\playerA_penalty_applied~q\) # ((!\LessThan0~1_combout\) # (!\PlayerAPenalty~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \playerA_penalty_applied~q\,
	datac => \PlayerAPenalty~input_o\,
	datad => \LessThan0~1_combout\,
	combout => \Add4~2_combout\);

\Add4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add4~3_combout\ = (\LessThan2~26_combout\ & (\Add4~0_combout\)) # (!\LessThan2~26_combout\ & (((points_A_int(0) & \Add4~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add4~0_combout\,
	datab => points_A_int(0),
	datac => \Add4~2_combout\,
	datad => \LessThan2~26_combout\,
	combout => \Add4~3_combout\);

\points_A_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Add4~3_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \points_A_int[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => points_A_int(0));

\total_cycles_int[0]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[0]~7_combout\ = total_cycles_int(0) $ (VCC)
-- \total_cycles_int[0]~8\ = CARRY(total_cycles_int(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_cycles_int(0),
	datad => VCC,
	combout => \total_cycles_int[0]~7_combout\,
	cout => \total_cycles_int[0]~8\);

\cycle~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_cycle,
	o => \cycle~input_o\);

cycle_last : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \cycle~input_o\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cycle_last~q\);

\tie~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \tie~0_combout\ = (\cycle~input_o\ & (\tie~q\ & !\cycle_last~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cycle~input_o\,
	datab => \tie~q\,
	datad => \cycle_last~q\,
	combout => \tie~0_combout\);

\tie~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \tie~1_combout\ = (\tie~0_combout\) # ((\state.game~q\ & (!\LessThan2~26_combout\ & !\LessThan3~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \tie~0_combout\,
	datab => \state.game~q\,
	datac => \LessThan2~26_combout\,
	datad => \LessThan3~26_combout\,
	combout => \tie~1_combout\);

tie : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \tie~1_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \enable~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \tie~q\);

\total_cycles_int[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[0]~9_combout\ = (\enable~input_o\ & ((\tie~q\) # ((\cycle~input_o\ & !\cycle_last~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \enable~input_o\,
	datab => \tie~q\,
	datac => \cycle~input_o\,
	datad => \cycle_last~q\,
	combout => \total_cycles_int[0]~9_combout\);

\total_cycles_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \total_cycles_int[0]~7_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \total_cycles_int[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_cycles_int(0));

\state_machine~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state_machine~1_combout\ = (\cycle~input_o\ & !\cycle_last~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cycle~input_o\,
	datad => \cycle_last~q\,
	combout => \state_machine~1_combout\);

\total_cycles_int[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[1]~10_combout\ = (total_cycles_int(1) & ((\state_machine~1_combout\ & (!\total_cycles_int[0]~8\)) # (!\state_machine~1_combout\ & (\total_cycles_int[0]~8\ & VCC)))) # (!total_cycles_int(1) & ((\state_machine~1_combout\ & 
-- ((\total_cycles_int[0]~8\) # (GND))) # (!\state_machine~1_combout\ & (!\total_cycles_int[0]~8\))))
-- \total_cycles_int[1]~11\ = CARRY((total_cycles_int(1) & (\state_machine~1_combout\ & !\total_cycles_int[0]~8\)) # (!total_cycles_int(1) & ((\state_machine~1_combout\) # (!\total_cycles_int[0]~8\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_cycles_int(1),
	datab => \state_machine~1_combout\,
	datad => VCC,
	cin => \total_cycles_int[0]~8\,
	combout => \total_cycles_int[1]~10_combout\,
	cout => \total_cycles_int[1]~11\);

\total_cycles_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \total_cycles_int[1]~10_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \total_cycles_int[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_cycles_int(1));

\total_cycles_int[2]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[2]~12_combout\ = ((total_cycles_int(2) $ (\state_machine~1_combout\ $ (\total_cycles_int[1]~11\)))) # (GND)
-- \total_cycles_int[2]~13\ = CARRY((total_cycles_int(2) & ((!\total_cycles_int[1]~11\) # (!\state_machine~1_combout\))) # (!total_cycles_int(2) & (!\state_machine~1_combout\ & !\total_cycles_int[1]~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_cycles_int(2),
	datab => \state_machine~1_combout\,
	datad => VCC,
	cin => \total_cycles_int[1]~11\,
	combout => \total_cycles_int[2]~12_combout\,
	cout => \total_cycles_int[2]~13\);

\total_cycles_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \total_cycles_int[2]~12_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \total_cycles_int[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_cycles_int(2));

\total_cycles_int[3]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[3]~14_combout\ = (total_cycles_int(3) & ((\state_machine~1_combout\ & (!\total_cycles_int[2]~13\)) # (!\state_machine~1_combout\ & (\total_cycles_int[2]~13\ & VCC)))) # (!total_cycles_int(3) & ((\state_machine~1_combout\ & 
-- ((\total_cycles_int[2]~13\) # (GND))) # (!\state_machine~1_combout\ & (!\total_cycles_int[2]~13\))))
-- \total_cycles_int[3]~15\ = CARRY((total_cycles_int(3) & (\state_machine~1_combout\ & !\total_cycles_int[2]~13\)) # (!total_cycles_int(3) & ((\state_machine~1_combout\) # (!\total_cycles_int[2]~13\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_cycles_int(3),
	datab => \state_machine~1_combout\,
	datad => VCC,
	cin => \total_cycles_int[2]~13\,
	combout => \total_cycles_int[3]~14_combout\,
	cout => \total_cycles_int[3]~15\);

\total_cycles_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \total_cycles_int[3]~14_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \total_cycles_int[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_cycles_int(3));

\total_cycles_int[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[4]~16_combout\ = ((total_cycles_int(4) $ (\state_machine~1_combout\ $ (\total_cycles_int[3]~15\)))) # (GND)
-- \total_cycles_int[4]~17\ = CARRY((total_cycles_int(4) & ((!\total_cycles_int[3]~15\) # (!\state_machine~1_combout\))) # (!total_cycles_int(4) & (!\state_machine~1_combout\ & !\total_cycles_int[3]~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_cycles_int(4),
	datab => \state_machine~1_combout\,
	datad => VCC,
	cin => \total_cycles_int[3]~15\,
	combout => \total_cycles_int[4]~16_combout\,
	cout => \total_cycles_int[4]~17\);

\total_cycles_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \total_cycles_int[4]~16_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \total_cycles_int[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_cycles_int(4));

\total_cycles_int[5]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[5]~18_combout\ = (total_cycles_int(5) & ((\state_machine~1_combout\ & (!\total_cycles_int[4]~17\)) # (!\state_machine~1_combout\ & (\total_cycles_int[4]~17\ & VCC)))) # (!total_cycles_int(5) & ((\state_machine~1_combout\ & 
-- ((\total_cycles_int[4]~17\) # (GND))) # (!\state_machine~1_combout\ & (!\total_cycles_int[4]~17\))))
-- \total_cycles_int[5]~19\ = CARRY((total_cycles_int(5) & (\state_machine~1_combout\ & !\total_cycles_int[4]~17\)) # (!total_cycles_int(5) & ((\state_machine~1_combout\) # (!\total_cycles_int[4]~17\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_cycles_int(5),
	datab => \state_machine~1_combout\,
	datad => VCC,
	cin => \total_cycles_int[4]~17\,
	combout => \total_cycles_int[5]~18_combout\,
	cout => \total_cycles_int[5]~19\);

\total_cycles_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \total_cycles_int[5]~18_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \total_cycles_int[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_cycles_int(5));

\total_cycles_int[6]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \total_cycles_int[6]~20_combout\ = total_cycles_int(6) $ (\state_machine~1_combout\ $ (\total_cycles_int[5]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => total_cycles_int(6),
	datab => \state_machine~1_combout\,
	cin => \total_cycles_int[5]~19\,
	combout => \total_cycles_int[6]~20_combout\);

\total_cycles_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \total_cycles_int[6]~20_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \total_cycles_int[0]~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_cycles_int(6));

\MaxPoints[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[0]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MaxPoints[0]~reg0_q\);

\MaxPoints[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[1]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MaxPoints[1]~reg0_q\);

\MaxPoints[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[2]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MaxPoints[2]~reg0_q\);

\MaxPoints[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[3]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MaxPoints[3]~reg0_q\);

\MaxPoints[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[4]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MaxPoints[4]~reg0_q\);

\MaxPoints[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[5]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MaxPoints[5]~reg0_q\);

\MaxPoints[6]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \ConfirmedNumberOut[6]~input_o\,
	ena => \MaxPoints[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MaxPoints[6]~reg0_q\);

\state.win\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \state.game~q\,
	clrn => \ALT_INV_state_machine~0_combout\,
	ena => \state~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.win~q\);

\winner~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \winner~0_combout\ = (\winner~reg0_q\) # ((\enable~input_o\ & \state.win~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \winner~reg0_q\,
	datab => \enable~input_o\,
	datac => \state.win~q\,
	combout => \winner~0_combout\);

\winner~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \winner~0_combout\,
	clrn => \ALT_INV_state_machine~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \winner~reg0_q\);

ww_Points_A(0) <= \Points_A[0]~output_o\;

ww_Points_A(1) <= \Points_A[1]~output_o\;

ww_Points_A(2) <= \Points_A[2]~output_o\;

ww_Points_A(3) <= \Points_A[3]~output_o\;

ww_Points_A(4) <= \Points_A[4]~output_o\;

ww_Points_A(5) <= \Points_A[5]~output_o\;

ww_Points_A(6) <= \Points_A[6]~output_o\;

ww_Points_B(0) <= \Points_B[0]~output_o\;

ww_Points_B(1) <= \Points_B[1]~output_o\;

ww_Points_B(2) <= \Points_B[2]~output_o\;

ww_Points_B(3) <= \Points_B[3]~output_o\;

ww_Points_B(4) <= \Points_B[4]~output_o\;

ww_Points_B(5) <= \Points_B[5]~output_o\;

ww_Points_B(6) <= \Points_B[6]~output_o\;

ww_TotalCycles(0) <= \TotalCycles[0]~output_o\;

ww_TotalCycles(1) <= \TotalCycles[1]~output_o\;

ww_TotalCycles(2) <= \TotalCycles[2]~output_o\;

ww_TotalCycles(3) <= \TotalCycles[3]~output_o\;

ww_TotalCycles(4) <= \TotalCycles[4]~output_o\;

ww_TotalCycles(5) <= \TotalCycles[5]~output_o\;

ww_TotalCycles(6) <= \TotalCycles[6]~output_o\;

ww_MaxPoints(0) <= \MaxPoints[0]~output_o\;

ww_MaxPoints(1) <= \MaxPoints[1]~output_o\;

ww_MaxPoints(2) <= \MaxPoints[2]~output_o\;

ww_MaxPoints(3) <= \MaxPoints[3]~output_o\;

ww_MaxPoints(4) <= \MaxPoints[4]~output_o\;

ww_MaxPoints(5) <= \MaxPoints[5]~output_o\;

ww_MaxPoints(6) <= \MaxPoints[6]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_winner <= \winner~output_o\;
END structure;


