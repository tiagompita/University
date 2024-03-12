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
-- Generated on "03/09/2024 02:36:36"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          AdderDemo
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY AdderDemo_vhd_vec_tst IS
END AdderDemo_vhd_vec_tst;
ARCHITECTURE AdderDemo_arch OF AdderDemo_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL KEY : STD_LOGIC_VECTOR(0 DOWNTO 0);
SIGNAL LEDR : STD_LOGIC_VECTOR(14 DOWNTO 0);
SIGNAL SW : STD_LOGIC_VECTOR(17 DOWNTO 0);
COMPONENT AdderDemo
	PORT (
	KEY : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	LEDR : OUT STD_LOGIC_VECTOR(14 DOWNTO 0);
	SW : IN STD_LOGIC_VECTOR(17 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : AdderDemo
	PORT MAP (
-- list connections between master ports and signals
	KEY => KEY,
	LEDR => LEDR,
	SW => SW
	);

-- SW[17]
t_prcs_SW_17: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		SW(17) <= '0';
		WAIT FOR 160000 ps;
		SW(17) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	SW(17) <= '0';
WAIT;
END PROCESS t_prcs_SW_17;

-- SW[16]
t_prcs_SW_16: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		SW(16) <= '0';
		WAIT FOR 80000 ps;
		SW(16) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	SW(16) <= '0';
WAIT;
END PROCESS t_prcs_SW_16;

-- SW[15]
t_prcs_SW_15: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		SW(15) <= '0';
		WAIT FOR 40000 ps;
		SW(15) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	SW(15) <= '0';
WAIT;
END PROCESS t_prcs_SW_15;

-- SW[14]
t_prcs_SW_14: PROCESS
BEGIN
LOOP
	SW(14) <= '0';
	WAIT FOR 20000 ps;
	SW(14) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_14;

-- SW[13]
t_prcs_SW_13: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		SW(13) <= '0';
		WAIT FOR 80000 ps;
		SW(13) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	SW(13) <= '0';
WAIT;
END PROCESS t_prcs_SW_13;

-- SW[12]
t_prcs_SW_12: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		SW(12) <= '0';
		WAIT FOR 40000 ps;
		SW(12) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	SW(12) <= '0';
WAIT;
END PROCESS t_prcs_SW_12;

-- SW[11]
t_prcs_SW_11: PROCESS
BEGIN
LOOP
	SW(11) <= '0';
	WAIT FOR 20000 ps;
	SW(11) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_11;

-- SW[10]
t_prcs_SW_10: PROCESS
BEGIN
LOOP
	SW(10) <= '0';
	WAIT FOR 10000 ps;
	SW(10) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_10;

-- SW[7]
t_prcs_SW_7: PROCESS
BEGIN
	SW(7) <= '0';
	WAIT FOR 320000 ps;
	SW(7) <= '1';
	WAIT FOR 320000 ps;
	SW(7) <= '0';
	WAIT FOR 320000 ps;
	SW(7) <= '1';
WAIT;
END PROCESS t_prcs_SW_7;

-- SW[6]
t_prcs_SW_6: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		SW(6) <= '0';
		WAIT FOR 160000 ps;
		SW(6) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	SW(6) <= '0';
WAIT;
END PROCESS t_prcs_SW_6;

-- SW[5]
t_prcs_SW_5: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		SW(5) <= '0';
		WAIT FOR 80000 ps;
		SW(5) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	SW(5) <= '0';
WAIT;
END PROCESS t_prcs_SW_5;

-- SW[4]
t_prcs_SW_4: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		SW(4) <= '0';
		WAIT FOR 40000 ps;
		SW(4) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	SW(4) <= '0';
WAIT;
END PROCESS t_prcs_SW_4;

-- SW[0]
t_prcs_SW_0: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		SW(0) <= '0';
		WAIT FOR 160000 ps;
		SW(0) <= '1';
		WAIT FOR 160000 ps;
	END LOOP;
	SW(0) <= '0';
WAIT;
END PROCESS t_prcs_SW_0;

-- SW[1]
t_prcs_SW_1: PROCESS
BEGIN
	FOR i IN 1 TO 6
	LOOP
		SW(1) <= '0';
		WAIT FOR 80000 ps;
		SW(1) <= '1';
		WAIT FOR 80000 ps;
	END LOOP;
	SW(1) <= '0';
WAIT;
END PROCESS t_prcs_SW_1;

-- SW[2]
t_prcs_SW_2: PROCESS
BEGIN
	FOR i IN 1 TO 12
	LOOP
		SW(2) <= '0';
		WAIT FOR 40000 ps;
		SW(2) <= '1';
		WAIT FOR 40000 ps;
	END LOOP;
	SW(2) <= '0';
WAIT;
END PROCESS t_prcs_SW_2;

-- SW[3]
t_prcs_SW_3: PROCESS
BEGIN
LOOP
	SW(3) <= '0';
	WAIT FOR 20000 ps;
	SW(3) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_SW_3;
END AdderDemo_arch;
