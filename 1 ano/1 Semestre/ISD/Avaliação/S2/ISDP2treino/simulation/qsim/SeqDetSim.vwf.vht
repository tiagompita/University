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
-- Generated on "12/21/2023 12:33:06"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          SeqDet1011completo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SeqDet1011completo_vhd_vec_tst IS
END SeqDet1011completo_vhd_vec_tst;
ARCHITECTURE SeqDet1011completo_arch OF SeqDet1011completo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL Q0 : STD_LOGIC;
SIGNAL Q1 : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
SIGNAL x : STD_LOGIC;
SIGNAL y : STD_LOGIC;
COMPONENT SeqDet1011completo
	PORT (
	clk : IN STD_LOGIC;
	Q0 : OUT STD_LOGIC;
	Q1 : OUT STD_LOGIC;
	reset : IN STD_LOGIC;
	x : IN STD_LOGIC;
	y : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : SeqDet1011completo
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Q0 => Q0,
	Q1 => Q1,
	reset => reset,
	x => x,
	y => y
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 5000 ps;
	clk <= '1';
	WAIT FOR 5000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- x
t_prcs_x: PROCESS
BEGIN
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 30000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 40000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 40000 ps;
	x <= '0';
	WAIT FOR 30000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 30000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 70000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 10000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 30000 ps;
	x <= '1';
	WAIT FOR 50000 ps;
	x <= '0';
	WAIT FOR 20000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 30000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 20000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 30000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
	WAIT FOR 30000 ps;
	x <= '0';
	WAIT FOR 10000 ps;
	x <= '1';
WAIT;
END PROCESS t_prcs_x;

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;
END SeqDet1011completo_arch;
