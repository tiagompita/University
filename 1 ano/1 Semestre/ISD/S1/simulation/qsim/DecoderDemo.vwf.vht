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
-- Generated on "11/30/2023 12:38:41"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          DecoderDemo2
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY DecoderDemo2_vhd_vec_tst IS
END DecoderDemo2_vhd_vec_tst;
ARCHITECTURE DecoderDemo2_arch OF DecoderDemo2_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL EN0_L : STD_LOGIC;
SIGNAL EN1 : STD_LOGIC;
SIGNAL X0 : STD_LOGIC;
SIGNAL X1 : STD_LOGIC;
SIGNAL X2 : STD_LOGIC;
SIGNAL X3 : STD_LOGIC;
SIGNAL Y0 : STD_LOGIC;
SIGNAL Y1 : STD_LOGIC;
SIGNAL Y2 : STD_LOGIC;
SIGNAL Y3 : STD_LOGIC;
SIGNAL Y4 : STD_LOGIC;
SIGNAL Y5 : STD_LOGIC;
SIGNAL Y6 : STD_LOGIC;
SIGNAL Y7 : STD_LOGIC;
SIGNAL Y8 : STD_LOGIC;
SIGNAL Y9 : STD_LOGIC;
SIGNAL Y10 : STD_LOGIC;
SIGNAL Y11 : STD_LOGIC;
SIGNAL Y12 : STD_LOGIC;
SIGNAL Y13 : STD_LOGIC;
SIGNAL Y14 : STD_LOGIC;
SIGNAL Y15 : STD_LOGIC;
COMPONENT DecoderDemo2
	PORT (
	EN0_L : IN STD_LOGIC;
	EN1 : IN STD_LOGIC;
	X0 : IN STD_LOGIC;
	X1 : IN STD_LOGIC;
	X2 : IN STD_LOGIC;
	X3 : IN STD_LOGIC;
	Y0 : OUT STD_LOGIC;
	Y1 : OUT STD_LOGIC;
	Y2 : OUT STD_LOGIC;
	Y3 : OUT STD_LOGIC;
	Y4 : OUT STD_LOGIC;
	Y5 : OUT STD_LOGIC;
	Y6 : OUT STD_LOGIC;
	Y7 : OUT STD_LOGIC;
	Y8 : OUT STD_LOGIC;
	Y9 : OUT STD_LOGIC;
	Y10 : OUT STD_LOGIC;
	Y11 : OUT STD_LOGIC;
	Y12 : OUT STD_LOGIC;
	Y13 : OUT STD_LOGIC;
	Y14 : OUT STD_LOGIC;
	Y15 : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : DecoderDemo2
	PORT MAP (
-- list connections between master ports and signals
	EN0_L => EN0_L,
	EN1 => EN1,
	X0 => X0,
	X1 => X1,
	X2 => X2,
	X3 => X3,
	Y0 => Y0,
	Y1 => Y1,
	Y2 => Y2,
	Y3 => Y3,
	Y4 => Y4,
	Y5 => Y5,
	Y6 => Y6,
	Y7 => Y7,
	Y8 => Y8,
	Y9 => Y9,
	Y10 => Y10,
	Y11 => Y11,
	Y12 => Y12,
	Y13 => Y13,
	Y14 => Y14,
	Y15 => Y15
	);

-- EN0_L
t_prcs_EN0_L: PROCESS
BEGIN
	EN0_L <= '1';
	WAIT FOR 20000 ps;
	EN0_L <= '0';
WAIT;
END PROCESS t_prcs_EN0_L;

-- EN1
t_prcs_EN1: PROCESS
BEGIN
	EN1 <= '1';
	WAIT FOR 10000 ps;
	EN1 <= '0';
	WAIT FOR 10000 ps;
	EN1 <= '1';
WAIT;
END PROCESS t_prcs_EN1;

-- X0
t_prcs_X0: PROCESS
BEGIN
	X0 <= '1';
	WAIT FOR 20000 ps;
	X0 <= '0';
	WAIT FOR 10000 ps;
	X0 <= '1';
	WAIT FOR 10000 ps;
	X0 <= '0';
	WAIT FOR 10000 ps;
	X0 <= '1';
	WAIT FOR 10000 ps;
	X0 <= '0';
WAIT;
END PROCESS t_prcs_X0;

-- X1
t_prcs_X1: PROCESS
BEGIN
	X1 <= '1';
	WAIT FOR 20000 ps;
	X1 <= '0';
	WAIT FOR 20000 ps;
	X1 <= '1';
	WAIT FOR 20000 ps;
	X1 <= '0';
WAIT;
END PROCESS t_prcs_X1;
END DecoderDemo2_arch;
