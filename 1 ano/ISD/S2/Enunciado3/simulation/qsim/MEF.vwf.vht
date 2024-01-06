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
-- Generated on "12/21/2023 13:36:59"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          MEF
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY MEF_vhd_vec_tst IS
END MEF_vhd_vec_tst;
ARCHITECTURE MEF_arch OF MEF_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL Q0 : STD_LOGIC;
SIGNAL Q1 : STD_LOGIC;
SIGNAL RESET_L : STD_LOGIC;
SIGNAL X : STD_LOGIC;
COMPONENT MEF
	PORT (
	CLK : IN STD_LOGIC;
	Q0 : OUT STD_LOGIC;
	Q1 : OUT STD_LOGIC;
	RESET_L : IN STD_LOGIC;
	X : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : MEF
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	Q0 => Q0,
	Q1 => Q1,
	RESET_L => RESET_L,
	X => X
	);

-- CLK
t_prcs_CLK: PROCESS
BEGIN
LOOP
	CLK <= '0';
	WAIT FOR 5000 ps;
	CLK <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLK;

-- X
t_prcs_X: PROCESS
BEGIN
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 35000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 15000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 20000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 25000 ps;
	X <= '0';
	WAIT FOR 35000 ps;
	X <= '1';
	WAIT FOR 15000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 40000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 25000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 15000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 25000 ps;
	X <= '1';
	WAIT FOR 35000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 20000 ps;
	X <= '1';
	WAIT FOR 15000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 15000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 15000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 15000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 20000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 15000 ps;
	X <= '0';
	WAIT FOR 10000 ps;
	X <= '1';
	WAIT FOR 15000 ps;
	X <= '0';
	WAIT FOR 15000 ps;
	X <= '1';
	WAIT FOR 10000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
	WAIT FOR 5000 ps;
	X <= '0';
	WAIT FOR 5000 ps;
	X <= '1';
WAIT;
END PROCESS t_prcs_X;

-- RESET_L
t_prcs_RESET_L: PROCESS
BEGIN
	RESET_L <= '0';
WAIT;
END PROCESS t_prcs_RESET_L;
END MEF_arch;
