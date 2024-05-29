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
-- Generated on "05/29/2024 14:57:38"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          TesteElementar
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY TesteElementar_vhd_vec_tst IS
END TesteElementar_vhd_vec_tst;
ARCHITECTURE TesteElementar_arch OF TesteElementar_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLOCK_50 : STD_LOGIC;
SIGNAL HEX0 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX1 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX2 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL HEX3 : STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL KEY : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL LEDG : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL start : STD_LOGIC;
COMPONENT TesteElementar
	PORT (
	CLOCK_50 : IN STD_LOGIC;
	HEX0 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX1 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX2 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	HEX3 : BUFFER STD_LOGIC_VECTOR(6 DOWNTO 0);
	KEY : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	LEDG : BUFFER STD_LOGIC_VECTOR(0 DOWNTO 0);
	start : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : TesteElementar
	PORT MAP (
-- list connections between master ports and signals
	CLOCK_50 => CLOCK_50,
	HEX0 => HEX0,
	HEX1 => HEX1,
	HEX2 => HEX2,
	HEX3 => HEX3,
	KEY => KEY,
	LEDG => LEDG,
	start => start
	);

-- CLOCK_50
t_prcs_CLOCK_50: PROCESS
BEGIN
LOOP
	CLOCK_50 <= '0';
	WAIT FOR 10000 ps;
	CLOCK_50 <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CLOCK_50;

-- start
t_prcs_start: PROCESS
BEGIN
	start <= '0';
WAIT;
END PROCESS t_prcs_start;

-- KEY[1]
t_prcs_KEY_1: PROCESS
BEGIN
	KEY(1) <= '0';
	WAIT FOR 100000 ps;
	KEY(1) <= '1';
	WAIT FOR 100000 ps;
	KEY(1) <= '0';
	WAIT FOR 400000 ps;
	KEY(1) <= '1';
	WAIT FOR 100000 ps;
	KEY(1) <= '0';
	WAIT FOR 200000 ps;
	KEY(1) <= '1';
WAIT;
END PROCESS t_prcs_KEY_1;

-- KEY[0]
t_prcs_KEY_0: PROCESS
BEGIN
	KEY(0) <= '0';
WAIT;
END PROCESS t_prcs_KEY_0;
END TesteElementar_arch;
