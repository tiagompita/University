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
-- Generated on "02/22/2024 10:56:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AND2Gate
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AND2Gate_vhd_vec_tst IS
END AND2Gate_vhd_vec_tst;
ARCHITECTURE AND2Gate_arch OF AND2Gate_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL input0 : STD_LOGIC;
SIGNAL input1 : STD_LOGIC;
SIGNAL output : STD_LOGIC;
COMPONENT AND2Gate
	PORT (
	input0 : IN STD_LOGIC;
	input1 : IN STD_LOGIC;
	output : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : AND2Gate
	PORT MAP (
-- list connections between master ports and signals
	input0 => input0,
	input1 => input1,
	output => output
	);

-- input0
t_prcs_input0: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		input0 <= '0';
		WAIT FOR 40000 ps;
		input0 <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	input0 <= '0';
WAIT;
END PROCESS t_prcs_input0;

-- input1
t_prcs_input1: PROCESS
BEGIN
LOOP
	input1 <= '0';
	WAIT FOR 20000 ps;
	input1 <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_input1;
END AND2Gate_arch;
