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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "06/02/2024 20:27:03"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MEF_competition
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MEF_competition_vhd_vec_tst IS
END MEF_competition_vhd_vec_tst;
ARCHITECTURE MEF_competition_arch OF MEF_competition_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL confirm : STD_LOGIC;
SIGNAL confirm_prev_in : STD_LOGIC;
SIGNAL ConfirmedNumberOut : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL cycle : STD_LOGIC;
SIGNAL enable : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL MaxPoints : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL PlayerAPenalty : STD_LOGIC;
SIGNAL PlayerATime : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL PlayerBPenalty : STD_LOGIC;
SIGNAL PlayerBTime : STD_LOGIC_VECTOR(13 DOWNTO 0);
SIGNAL Points_A : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL Points_B : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL reset : STD_LOGIC;
SIGNAL TotalCycles : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL winner : STD_LOGIC;
COMPONENT MEF_competition
	PORT (
	clk : IN STD_LOGIC;
	confirm : IN STD_LOGIC;
	confirm_prev_in : IN STD_LOGIC;
	ConfirmedNumberOut : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
	cycle : IN STD_LOGIC;
	enable : IN STD_LOGIC;
	HEX0 : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
	HEX1 : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
	HEX2 : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
	HEX3 : BUFFER STD_LOGIC_VECTOR(1 DOWNTO 0);
	MaxPoints : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	PlayerAPenalty : IN STD_LOGIC;
	PlayerATime : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
	PlayerBPenalty : IN STD_LOGIC;
	PlayerBTime : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
	Points_A : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	Points_B : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	reset : IN STD_LOGIC;
	TotalCycles : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	winner : BUFFER STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : MEF_competition
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	confirm => confirm,
	confirm_prev_in => confirm_prev_in,
	ConfirmedNumberOut => ConfirmedNumberOut,
	cycle => cycle,
	enable => enable,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	MaxPoints => MaxPoints,
	PlayerAPenalty => PlayerAPenalty,
	PlayerATime => PlayerATime,
	PlayerBPenalty => PlayerBPenalty,
	PlayerBTime => PlayerBTime,
	Points_A => Points_A,
	Points_B => Points_B,
	reset => reset,
	TotalCycles => TotalCycles,
	winner => winner
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 16
	LOOP
		clk <= '0';
		WAIT FOR 30000 ps;
		clk <= '1';
		WAIT FOR 30000 ps;
	END LOOP;
	clk <= '0';
	WAIT FOR 30000 ps;
	clk <= '1';
WAIT;
END PROCESS t_prcs_clk;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
	WAIT FOR 30000 ps;
	reset <= '0';
WAIT;
END PROCESS t_prcs_reset;

-- confirm
t_prcs_confirm: PROCESS
BEGIN
	confirm <= '1';
	WAIT FOR 70000 ps;
	confirm <= '0';
WAIT;
END PROCESS t_prcs_confirm;

-- confirm_prev_in
t_prcs_confirm_prev_in: PROCESS
BEGIN
	confirm_prev_in <= '0';
WAIT;
END PROCESS t_prcs_confirm_prev_in;
-- ConfirmedNumberOut[6]
t_prcs_ConfirmedNumberOut_6: PROCESS
BEGIN
	ConfirmedNumberOut(6) <= '0';
WAIT;
END PROCESS t_prcs_ConfirmedNumberOut_6;
-- ConfirmedNumberOut[5]
t_prcs_ConfirmedNumberOut_5: PROCESS
BEGIN
	ConfirmedNumberOut(5) <= '0';
WAIT;
END PROCESS t_prcs_ConfirmedNumberOut_5;
-- ConfirmedNumberOut[4]
t_prcs_ConfirmedNumberOut_4: PROCESS
BEGIN
	ConfirmedNumberOut(4) <= '0';
WAIT;
END PROCESS t_prcs_ConfirmedNumberOut_4;
-- ConfirmedNumberOut[3]
t_prcs_ConfirmedNumberOut_3: PROCESS
BEGIN
	ConfirmedNumberOut(3) <= '0';
WAIT;
END PROCESS t_prcs_ConfirmedNumberOut_3;
-- ConfirmedNumberOut[2]
t_prcs_ConfirmedNumberOut_2: PROCESS
BEGIN
	ConfirmedNumberOut(2) <= '0';
WAIT;
END PROCESS t_prcs_ConfirmedNumberOut_2;
-- ConfirmedNumberOut[1]
t_prcs_ConfirmedNumberOut_1: PROCESS
BEGIN
	ConfirmedNumberOut(1) <= '1';
WAIT;
END PROCESS t_prcs_ConfirmedNumberOut_1;
-- ConfirmedNumberOut[0]
t_prcs_ConfirmedNumberOut_0: PROCESS
BEGIN
	ConfirmedNumberOut(0) <= '0';
WAIT;
END PROCESS t_prcs_ConfirmedNumberOut_0;

-- cycle
t_prcs_cycle: PROCESS
BEGIN
LOOP
	cycle <= '0';
	WAIT FOR 10000 ps;
	cycle <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_cycle;

-- enable
t_prcs_enable: PROCESS
BEGIN
	enable <= '1';
WAIT;
END PROCESS t_prcs_enable;

-- PlayerAPenalty
t_prcs_PlayerAPenalty: PROCESS
BEGIN
	PlayerAPenalty <= '0';
WAIT;
END PROCESS t_prcs_PlayerAPenalty;

-- PlayerBPenalty
t_prcs_PlayerBPenalty: PROCESS
BEGIN
	PlayerBPenalty <= '0';
WAIT;
END PROCESS t_prcs_PlayerBPenalty;
-- PlayerATime[13]
t_prcs_PlayerATime_13: PROCESS
BEGIN
	PlayerATime(13) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_13;
-- PlayerATime[12]
t_prcs_PlayerATime_12: PROCESS
BEGIN
	PlayerATime(12) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_12;
-- PlayerATime[11]
t_prcs_PlayerATime_11: PROCESS
BEGIN
	PlayerATime(11) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_11;
-- PlayerATime[10]
t_prcs_PlayerATime_10: PROCESS
BEGIN
	PlayerATime(10) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_10;
-- PlayerATime[9]
t_prcs_PlayerATime_9: PROCESS
BEGIN
	PlayerATime(9) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_9;
-- PlayerATime[8]
t_prcs_PlayerATime_8: PROCESS
BEGIN
	PlayerATime(8) <= '1';
WAIT;
END PROCESS t_prcs_PlayerATime_8;
-- PlayerATime[7]
t_prcs_PlayerATime_7: PROCESS
BEGIN
	PlayerATime(7) <= '1';
WAIT;
END PROCESS t_prcs_PlayerATime_7;
-- PlayerATime[6]
t_prcs_PlayerATime_6: PROCESS
BEGIN
	PlayerATime(6) <= '1';
WAIT;
END PROCESS t_prcs_PlayerATime_6;
-- PlayerATime[5]
t_prcs_PlayerATime_5: PROCESS
BEGIN
	PlayerATime(5) <= '1';
WAIT;
END PROCESS t_prcs_PlayerATime_5;
-- PlayerATime[4]
t_prcs_PlayerATime_4: PROCESS
BEGIN
	PlayerATime(4) <= '1';
WAIT;
END PROCESS t_prcs_PlayerATime_4;
-- PlayerATime[3]
t_prcs_PlayerATime_3: PROCESS
BEGIN
	PlayerATime(3) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_3;
-- PlayerATime[2]
t_prcs_PlayerATime_2: PROCESS
BEGIN
	PlayerATime(2) <= '1';
WAIT;
END PROCESS t_prcs_PlayerATime_2;
-- PlayerATime[1]
t_prcs_PlayerATime_1: PROCESS
BEGIN
	PlayerATime(1) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_1;
-- PlayerATime[0]
t_prcs_PlayerATime_0: PROCESS
BEGIN
	PlayerATime(0) <= '0';
WAIT;
END PROCESS t_prcs_PlayerATime_0;
-- PlayerBTime[13]
t_prcs_PlayerBTime_13: PROCESS
BEGIN
	PlayerBTime(13) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_13;
-- PlayerBTime[12]
t_prcs_PlayerBTime_12: PROCESS
BEGIN
	PlayerBTime(12) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_12;
-- PlayerBTime[11]
t_prcs_PlayerBTime_11: PROCESS
BEGIN
	PlayerBTime(11) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_11;
-- PlayerBTime[10]
t_prcs_PlayerBTime_10: PROCESS
BEGIN
	PlayerBTime(10) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_10;
-- PlayerBTime[9]
t_prcs_PlayerBTime_9: PROCESS
BEGIN
	PlayerBTime(9) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_9;
-- PlayerBTime[8]
t_prcs_PlayerBTime_8: PROCESS
BEGIN
	PlayerBTime(8) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_8;
-- PlayerBTime[7]
t_prcs_PlayerBTime_7: PROCESS
BEGIN
	PlayerBTime(7) <= '1';
WAIT;
END PROCESS t_prcs_PlayerBTime_7;
-- PlayerBTime[6]
t_prcs_PlayerBTime_6: PROCESS
BEGIN
	PlayerBTime(6) <= '1';
WAIT;
END PROCESS t_prcs_PlayerBTime_6;
-- PlayerBTime[5]
t_prcs_PlayerBTime_5: PROCESS
BEGIN
	PlayerBTime(5) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_5;
-- PlayerBTime[4]
t_prcs_PlayerBTime_4: PROCESS
BEGIN
	PlayerBTime(4) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_4;
-- PlayerBTime[3]
t_prcs_PlayerBTime_3: PROCESS
BEGIN
	PlayerBTime(3) <= '1';
WAIT;
END PROCESS t_prcs_PlayerBTime_3;
-- PlayerBTime[2]
t_prcs_PlayerBTime_2: PROCESS
BEGIN
	PlayerBTime(2) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_2;
-- PlayerBTime[1]
t_prcs_PlayerBTime_1: PROCESS
BEGIN
	PlayerBTime(1) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_1;
-- PlayerBTime[0]
t_prcs_PlayerBTime_0: PROCESS
BEGIN
	PlayerBTime(0) <= '0';
WAIT;
END PROCESS t_prcs_PlayerBTime_0;
END MEF_competition_arch;
