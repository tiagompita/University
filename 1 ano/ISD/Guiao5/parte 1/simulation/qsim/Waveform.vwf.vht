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
-- Generated on "10/26/2023 17:09:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          GateDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY GateDemo_vhd_vec_tst IS
END GateDemo_vhd_vec_tst;
ARCHITECTURE GateDemo_arch OF GateDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL F1 : STD_LOGIC;
SIGNAL X : STD_LOGIC;
SIGNAL Y : STD_LOGIC;
COMPONENT GateDemo
	PORT (
	F1 : OUT STD_LOGIC;
	X : IN STD_LOGIC;
	Y : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : GateDemo
	PORT MAP (
-- list connections between master ports and signals
	F1 => F1,
	X => X,
	Y => Y
	);

-- X
t_prcs_X: PROCESS
BEGIN
	X <= '0';
	WAIT FOR 180000 ps;
	X <= '1';
	WAIT FOR 40000 ps;
	X <= '0';
	WAIT FOR 80000 ps;
	X <= '1';
	WAIT FOR 180000 ps;
	X <= '0';
	WAIT FOR 120000 ps;
	X <= '1';
	WAIT FOR 40000 ps;
	X <= '0';
	WAIT FOR 60000 ps;
	X <= '1';
	WAIT FOR 100000 ps;
	X <= '0';
WAIT;
END PROCESS t_prcs_X;

-- Y
t_prcs_Y: PROCESS
BEGIN
	Y <= '0';
	WAIT FOR 100000 ps;
	Y <= '1';
	WAIT FOR 40000 ps;
	Y <= '0';
	WAIT FOR 160000 ps;
	Y <= '1';
	WAIT FOR 180000 ps;
	Y <= '0';
	WAIT FOR 120000 ps;
	Y <= '1';
	WAIT FOR 40000 ps;
	Y <= '0';
	WAIT FOR 60000 ps;
	Y <= '1';
	WAIT FOR 100000 ps;
	Y <= '0';
WAIT;
END PROCESS t_prcs_Y;
END GateDemo_arch;
