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
-- Generated on "02/29/2024 10:46:35"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Mux4_1
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Mux4_1_vhd_vec_tst IS
END Mux4_1_vhd_vec_tst;
ARCHITECTURE Mux4_1_arch OF Mux4_1_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL dataIn : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL dataOut : STD_LOGIC;
SIGNAL sel : STD_LOGIC_VECTOR(1 DOWNTO 0);
COMPONENT Mux4_1
	PORT (
	dataIn : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	dataOut : OUT STD_LOGIC;
	sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Mux4_1
	PORT MAP (
-- list connections between master ports and signals
	dataIn => dataIn,
	dataOut => dataOut,
	sel => sel
	);
-- sel[1]
t_prcs_sel_1: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		sel(1) <= '0';
		WAIT FOR 40000 ps;
		sel(1) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	sel(1) <= '0';
WAIT;
END PROCESS t_prcs_sel_1;
-- sel[0]
t_prcs_sel_0: PROCESS
BEGIN
LOOP
	sel(0) <= '0';
	WAIT FOR 20000 ps;
	sel(0) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_sel_0;
-- dataIn[3]
t_prcs_dataIn_3: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		dataIn(3) <= '0';
		WAIT FOR 160000 ps;
		dataIn(3) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	dataIn(3) <= '0';
WAIT;
END PROCESS t_prcs_dataIn_3;
-- dataIn[2]
t_prcs_dataIn_2: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		dataIn(2) <= '0';
		WAIT FOR 80000 ps;
		dataIn(2) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	dataIn(2) <= '0';
WAIT;
END PROCESS t_prcs_dataIn_2;
-- dataIn[1]
t_prcs_dataIn_1: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		dataIn(1) <= '0';
		WAIT FOR 40000 ps;
		dataIn(1) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	dataIn(1) <= '0';
WAIT;
END PROCESS t_prcs_dataIn_1;
-- dataIn[0]
t_prcs_dataIn_0: PROCESS
BEGIN
LOOP
	dataIn(0) <= '0';
	WAIT FOR 20000 ps;
	dataIn(0) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_dataIn_0;
END Mux4_1_arch;
