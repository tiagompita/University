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

-- DATE "06/02/2024 23:45:02"

-- 
-- Device: Altera EP4CE115F29C7 Package FBGA780
-- 

-- 
-- This VHDL file should be used for Questa Intel FPGA (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	ReactionGame IS
    PORT (
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	HEX5 : OUT std_logic_vector(6 DOWNTO 0);
	HEX6 : OUT std_logic_vector(6 DOWNTO 0);
	HEX7 : OUT std_logic_vector(6 DOWNTO 0);
	LEDG : OUT std_logic_vector(7 DOWNTO 0);
	LEDR : OUT std_logic_vector(17 DOWNTO 0)
	);
END ReactionGame;

-- Design Ports Information
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[6]	=>  Location: PIN_U24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[5]	=>  Location: PIN_U23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[4]	=>  Location: PIN_W25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[3]	=>  Location: PIN_W22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[2]	=>  Location: PIN_W21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[1]	=>  Location: PIN_Y22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX1[0]	=>  Location: PIN_M24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[6]	=>  Location: PIN_W28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[5]	=>  Location: PIN_W27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[4]	=>  Location: PIN_Y26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[3]	=>  Location: PIN_W26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[2]	=>  Location: PIN_Y25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[1]	=>  Location: PIN_AA26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX2[0]	=>  Location: PIN_AA25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[6]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[5]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[4]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[3]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[2]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[1]	=>  Location: PIN_U21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX3[0]	=>  Location: PIN_V21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[6]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[5]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[4]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[3]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[2]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[1]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX5[0]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[6]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[5]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[4]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[3]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[2]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[1]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX7[0]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[7]	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[6]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[5]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[4]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[17]	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[16]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[15]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[14]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[13]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[12]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[11]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[10]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[9]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[8]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[7]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[6]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[5]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[4]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ReactionGame IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_HEX0 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX5 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX7 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(17 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \1kHz|pulse~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \1Hz|pulse~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \10Hz|pulse~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst2|s_key_prev~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX1[6]~output_o\ : std_logic;
SIGNAL \HEX1[5]~output_o\ : std_logic;
SIGNAL \HEX1[4]~output_o\ : std_logic;
SIGNAL \HEX1[3]~output_o\ : std_logic;
SIGNAL \HEX1[2]~output_o\ : std_logic;
SIGNAL \HEX1[1]~output_o\ : std_logic;
SIGNAL \HEX1[0]~output_o\ : std_logic;
SIGNAL \HEX2[6]~output_o\ : std_logic;
SIGNAL \HEX2[5]~output_o\ : std_logic;
SIGNAL \HEX2[4]~output_o\ : std_logic;
SIGNAL \HEX2[3]~output_o\ : std_logic;
SIGNAL \HEX2[2]~output_o\ : std_logic;
SIGNAL \HEX2[1]~output_o\ : std_logic;
SIGNAL \HEX2[0]~output_o\ : std_logic;
SIGNAL \HEX3[6]~output_o\ : std_logic;
SIGNAL \HEX3[5]~output_o\ : std_logic;
SIGNAL \HEX3[4]~output_o\ : std_logic;
SIGNAL \HEX3[3]~output_o\ : std_logic;
SIGNAL \HEX3[2]~output_o\ : std_logic;
SIGNAL \HEX3[1]~output_o\ : std_logic;
SIGNAL \HEX3[0]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX5[6]~output_o\ : std_logic;
SIGNAL \HEX5[5]~output_o\ : std_logic;
SIGNAL \HEX5[4]~output_o\ : std_logic;
SIGNAL \HEX5[3]~output_o\ : std_logic;
SIGNAL \HEX5[2]~output_o\ : std_logic;
SIGNAL \HEX5[1]~output_o\ : std_logic;
SIGNAL \HEX5[0]~output_o\ : std_logic;
SIGNAL \HEX6[6]~output_o\ : std_logic;
SIGNAL \HEX6[5]~output_o\ : std_logic;
SIGNAL \HEX6[4]~output_o\ : std_logic;
SIGNAL \HEX6[3]~output_o\ : std_logic;
SIGNAL \HEX6[2]~output_o\ : std_logic;
SIGNAL \HEX6[1]~output_o\ : std_logic;
SIGNAL \HEX6[0]~output_o\ : std_logic;
SIGNAL \HEX7[6]~output_o\ : std_logic;
SIGNAL \HEX7[5]~output_o\ : std_logic;
SIGNAL \HEX7[4]~output_o\ : std_logic;
SIGNAL \HEX7[3]~output_o\ : std_logic;
SIGNAL \HEX7[2]~output_o\ : std_logic;
SIGNAL \HEX7[1]~output_o\ : std_logic;
SIGNAL \HEX7[0]~output_o\ : std_logic;
SIGNAL \LEDG[7]~output_o\ : std_logic;
SIGNAL \LEDG[6]~output_o\ : std_logic;
SIGNAL \LEDG[5]~output_o\ : std_logic;
SIGNAL \LEDG[4]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDR[17]~output_o\ : std_logic;
SIGNAL \LEDR[16]~output_o\ : std_logic;
SIGNAL \LEDR[15]~output_o\ : std_logic;
SIGNAL \LEDR[14]~output_o\ : std_logic;
SIGNAL \LEDR[13]~output_o\ : std_logic;
SIGNAL \LEDR[12]~output_o\ : std_logic;
SIGNAL \LEDR[11]~output_o\ : std_logic;
SIGNAL \LEDR[10]~output_o\ : std_logic;
SIGNAL \LEDR[9]~output_o\ : std_logic;
SIGNAL \LEDR[8]~output_o\ : std_logic;
SIGNAL \LEDR[7]~output_o\ : std_logic;
SIGNAL \LEDR[6]~output_o\ : std_logic;
SIGNAL \LEDR[5]~output_o\ : std_logic;
SIGNAL \LEDR[4]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \inst|s_key_prev~q\ : std_logic;
SIGNAL \1kHz|Add0~0_combout\ : std_logic;
SIGNAL \1kHz|Add0~1\ : std_logic;
SIGNAL \1kHz|Add0~2_combout\ : std_logic;
SIGNAL \1kHz|Add0~3\ : std_logic;
SIGNAL \1kHz|Add0~4_combout\ : std_logic;
SIGNAL \1kHz|Add0~5\ : std_logic;
SIGNAL \1kHz|Add0~6_combout\ : std_logic;
SIGNAL \1kHz|Add0~7\ : std_logic;
SIGNAL \1kHz|Add0~8_combout\ : std_logic;
SIGNAL \1kHz|s_cnt~3_combout\ : std_logic;
SIGNAL \1kHz|Add0~9\ : std_logic;
SIGNAL \1kHz|Add0~10_combout\ : std_logic;
SIGNAL \1kHz|Add0~11\ : std_logic;
SIGNAL \1kHz|Add0~12_combout\ : std_logic;
SIGNAL \1kHz|s_cnt~1_combout\ : std_logic;
SIGNAL \1kHz|Add0~13\ : std_logic;
SIGNAL \1kHz|Add0~14_combout\ : std_logic;
SIGNAL \1kHz|Add0~15\ : std_logic;
SIGNAL \1kHz|Add0~16_combout\ : std_logic;
SIGNAL \1kHz|s_cnt~0_combout\ : std_logic;
SIGNAL \1kHz|Equal0~1_combout\ : std_logic;
SIGNAL \1kHz|Add0~17\ : std_logic;
SIGNAL \1kHz|Add0~18_combout\ : std_logic;
SIGNAL \1kHz|s_cnt~2_combout\ : std_logic;
SIGNAL \1kHz|Add0~19\ : std_logic;
SIGNAL \1kHz|Add0~20_combout\ : std_logic;
SIGNAL \1kHz|Add0~21\ : std_logic;
SIGNAL \1kHz|Add0~22_combout\ : std_logic;
SIGNAL \1kHz|Equal0~2_combout\ : std_logic;
SIGNAL \1kHz|Equal0~0_combout\ : std_logic;
SIGNAL \1kHz|Add0~23\ : std_logic;
SIGNAL \1kHz|Add0~24_combout\ : std_logic;
SIGNAL \1kHz|Add0~25\ : std_logic;
SIGNAL \1kHz|Add0~26_combout\ : std_logic;
SIGNAL \1kHz|Add0~27\ : std_logic;
SIGNAL \1kHz|Add0~28_combout\ : std_logic;
SIGNAL \1kHz|s_cnt~4_combout\ : std_logic;
SIGNAL \1kHz|Add0~29\ : std_logic;
SIGNAL \1kHz|Add0~30_combout\ : std_logic;
SIGNAL \1kHz|s_cnt~5_combout\ : std_logic;
SIGNAL \1kHz|Equal0~3_combout\ : std_logic;
SIGNAL \1kHz|Equal0~4_combout\ : std_logic;
SIGNAL \1kHz|pulse~q\ : std_logic;
SIGNAL \1kHz|pulse~clkctrl_outclk\ : std_logic;
SIGNAL \MEF|Add4~0_combout\ : std_logic;
SIGNAL \MEF|LessThan0~0_combout\ : std_logic;
SIGNAL \state|confirm_prev~0_combout\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \inst2|s_key_prev~feeder_combout\ : std_logic;
SIGNAL \inst2|s_key_prev~q\ : std_logic;
SIGNAL \inst2|s_key_prev~clkctrl_outclk\ : std_logic;
SIGNAL \state|confirm_prev~q\ : std_logic;
SIGNAL \state|Selector2~0_combout\ : std_logic;
SIGNAL \MEF|Add3~0_combout\ : std_logic;
SIGNAL \MEF|Add5~5\ : std_logic;
SIGNAL \MEF|Add5~7\ : std_logic;
SIGNAL \MEF|Add5~8_combout\ : std_logic;
SIGNAL \MEF|Add3~4\ : std_logic;
SIGNAL \MEF|Add3~5_combout\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \inst4|s_key_prev~q\ : std_logic;
SIGNAL \PLAYER_A|react_time[0]~13_combout\ : std_logic;
SIGNAL \inst25|timer[0]~15_combout\ : std_logic;
SIGNAL \inst25|start_prev~0_combout\ : std_logic;
SIGNAL \inst25|start_prev~q\ : std_logic;
SIGNAL \inst25|start2_prev~0_combout\ : std_logic;
SIGNAL \inst25|start2_prev~q\ : std_logic;
SIGNAL \inst25|state.running~0_combout\ : std_logic;
SIGNAL \inst25|state.running~1_combout\ : std_logic;
SIGNAL \inst25|state.running~5_combout\ : std_logic;
SIGNAL \inst25|state.wait_response~q\ : std_logic;
SIGNAL \inst25|state.idle~feeder_combout\ : std_logic;
SIGNAL \inst25|state.idle~q\ : std_logic;
SIGNAL \inst25|state.penalty~0_combout\ : std_logic;
SIGNAL \inst25|state.penalty~q\ : std_logic;
SIGNAL \inst25|penalty_timer2[0]~10_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[9]~22_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[0]~11\ : std_logic;
SIGNAL \inst25|penalty_timer2[1]~12_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[1]~13\ : std_logic;
SIGNAL \inst25|penalty_timer2[2]~14_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[2]~15\ : std_logic;
SIGNAL \inst25|penalty_timer2[3]~16_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[3]~17\ : std_logic;
SIGNAL \inst25|penalty_timer2[4]~18_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[4]~19\ : std_logic;
SIGNAL \inst25|penalty_timer2[5]~20_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[5]~21\ : std_logic;
SIGNAL \inst25|penalty_timer2[6]~23_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[6]~24\ : std_logic;
SIGNAL \inst25|penalty_timer2[7]~25_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[7]~26\ : std_logic;
SIGNAL \inst25|penalty_timer2[8]~27_combout\ : std_logic;
SIGNAL \inst25|penalty_timer2[8]~28\ : std_logic;
SIGNAL \inst25|penalty_timer2[9]~29_combout\ : std_logic;
SIGNAL \inst25|LessThan1~0_combout\ : std_logic;
SIGNAL \inst25|LessThan1~1_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[0]~10_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[9]~22_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[0]~11\ : std_logic;
SIGNAL \inst25|penalty_timer[1]~12_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[1]~13\ : std_logic;
SIGNAL \inst25|penalty_timer[2]~14_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[2]~15\ : std_logic;
SIGNAL \inst25|penalty_timer[3]~16_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[3]~17\ : std_logic;
SIGNAL \inst25|penalty_timer[4]~18_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[4]~19\ : std_logic;
SIGNAL \inst25|penalty_timer[5]~20_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[5]~21\ : std_logic;
SIGNAL \inst25|penalty_timer[6]~23_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[6]~24\ : std_logic;
SIGNAL \inst25|penalty_timer[7]~25_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[7]~26\ : std_logic;
SIGNAL \inst25|penalty_timer[8]~27_combout\ : std_logic;
SIGNAL \inst25|penalty_timer[8]~28\ : std_logic;
SIGNAL \inst25|penalty_timer[9]~29_combout\ : std_logic;
SIGNAL \inst25|LessThan0~0_combout\ : std_logic;
SIGNAL \inst25|LessThan0~1_combout\ : std_logic;
SIGNAL \inst25|Selector27~0_combout\ : std_logic;
SIGNAL \inst25|Selector27~1_combout\ : std_logic;
SIGNAL \inst25|Selector27~2_combout\ : std_logic;
SIGNAL \inst25|Selector27~3_combout\ : std_logic;
SIGNAL \inst25|player2_responded~q\ : std_logic;
SIGNAL \inst25|Selector26~0_combout\ : std_logic;
SIGNAL \inst25|Selector26~1_combout\ : std_logic;
SIGNAL \inst25|player1_responded~q\ : std_logic;
SIGNAL \inst25|state.running~3_combout\ : std_logic;
SIGNAL \inst25|state.running~2_combout\ : std_logic;
SIGNAL \inst25|state.running~4_combout\ : std_logic;
SIGNAL \inst25|timer[12]~41_combout\ : std_logic;
SIGNAL \inst25|timer[0]~16\ : std_logic;
SIGNAL \inst25|timer[1]~17_combout\ : std_logic;
SIGNAL \inst25|timer[1]~18\ : std_logic;
SIGNAL \inst25|timer[2]~19_combout\ : std_logic;
SIGNAL \inst25|timer[2]~20\ : std_logic;
SIGNAL \inst25|timer[3]~21_combout\ : std_logic;
SIGNAL \inst25|timer[3]~22\ : std_logic;
SIGNAL \inst25|timer[4]~23_combout\ : std_logic;
SIGNAL \inst25|timer[4]~24\ : std_logic;
SIGNAL \inst25|timer[5]~25_combout\ : std_logic;
SIGNAL \inst25|timer[5]~26\ : std_logic;
SIGNAL \inst25|timer[6]~27_combout\ : std_logic;
SIGNAL \inst25|timer[6]~28\ : std_logic;
SIGNAL \inst25|timer[7]~29_combout\ : std_logic;
SIGNAL \inst25|timer[7]~30\ : std_logic;
SIGNAL \inst25|timer[8]~31_combout\ : std_logic;
SIGNAL \inst24|Add0~17\ : std_logic;
SIGNAL \inst24|Add0~18_combout\ : std_logic;
SIGNAL \inst24|temp[9]~9_combout\ : std_logic;
SIGNAL \inst24|Add0~19\ : std_logic;
SIGNAL \inst24|Add0~20_combout\ : std_logic;
SIGNAL \inst24|Add0~21\ : std_logic;
SIGNAL \inst24|Add0~22_combout\ : std_logic;
SIGNAL \inst24|Add0~23\ : std_logic;
SIGNAL \inst24|Add0~24_combout\ : std_logic;
SIGNAL \inst24|temp~3_combout\ : std_logic;
SIGNAL \inst24|Add0~25\ : std_logic;
SIGNAL \inst24|Add0~26_combout\ : std_logic;
SIGNAL \inst24|Add0~27\ : std_logic;
SIGNAL \inst24|Add0~28_combout\ : std_logic;
SIGNAL \inst24|Add0~29\ : std_logic;
SIGNAL \inst24|Add0~30_combout\ : std_logic;
SIGNAL \inst24|Add0~31\ : std_logic;
SIGNAL \inst24|Add0~32_combout\ : std_logic;
SIGNAL \inst24|Add0~33\ : std_logic;
SIGNAL \inst24|Add0~34_combout\ : std_logic;
SIGNAL \inst24|Add0~35\ : std_logic;
SIGNAL \inst24|Add0~36_combout\ : std_logic;
SIGNAL \inst24|Add0~37\ : std_logic;
SIGNAL \inst24|Add0~38_combout\ : std_logic;
SIGNAL \inst24|Add0~39\ : std_logic;
SIGNAL \inst24|Add0~40_combout\ : std_logic;
SIGNAL \inst24|Add0~41\ : std_logic;
SIGNAL \inst24|Add0~42_combout\ : std_logic;
SIGNAL \inst24|Add0~43\ : std_logic;
SIGNAL \inst24|Add0~44_combout\ : std_logic;
SIGNAL \inst24|Add0~45\ : std_logic;
SIGNAL \inst24|Add0~46_combout\ : std_logic;
SIGNAL \inst24|Add0~47\ : std_logic;
SIGNAL \inst24|Add0~48_combout\ : std_logic;
SIGNAL \inst24|Add0~49\ : std_logic;
SIGNAL \inst24|Add0~50_combout\ : std_logic;
SIGNAL \inst24|Add0~51\ : std_logic;
SIGNAL \inst24|Add0~52_combout\ : std_logic;
SIGNAL \inst24|Add0~53\ : std_logic;
SIGNAL \inst24|Add0~54_combout\ : std_logic;
SIGNAL \inst24|Equal0~7_combout\ : std_logic;
SIGNAL \inst24|Add0~55\ : std_logic;
SIGNAL \inst24|Add0~56_combout\ : std_logic;
SIGNAL \inst24|Add0~57\ : std_logic;
SIGNAL \inst24|Add0~58_combout\ : std_logic;
SIGNAL \inst24|Add0~59\ : std_logic;
SIGNAL \inst24|Add0~60_combout\ : std_logic;
SIGNAL \inst24|Add0~61\ : std_logic;
SIGNAL \inst24|Add0~62_combout\ : std_logic;
SIGNAL \inst24|Equal0~8_combout\ : std_logic;
SIGNAL \inst24|Equal0~9_combout\ : std_logic;
SIGNAL \inst24|Equal0~6_combout\ : std_logic;
SIGNAL \inst24|Equal0~5_combout\ : std_logic;
SIGNAL \inst24|Add0~0_combout\ : std_logic;
SIGNAL \inst24|temp~0_combout\ : std_logic;
SIGNAL \inst24|Add0~1\ : std_logic;
SIGNAL \inst24|Add0~2_combout\ : std_logic;
SIGNAL \inst24|Add0~3\ : std_logic;
SIGNAL \inst24|Add0~4_combout\ : std_logic;
SIGNAL \inst24|Add0~5\ : std_logic;
SIGNAL \inst24|Add0~6_combout\ : std_logic;
SIGNAL \inst24|temp[3]~4_combout\ : std_logic;
SIGNAL \inst24|Add0~7\ : std_logic;
SIGNAL \inst24|Add0~8_combout\ : std_logic;
SIGNAL \inst24|Add0~9\ : std_logic;
SIGNAL \inst24|Add0~10_combout\ : std_logic;
SIGNAL \inst24|temp~1_combout\ : std_logic;
SIGNAL \inst24|Equal0~1_combout\ : std_logic;
SIGNAL \inst24|Equal0~2_combout\ : std_logic;
SIGNAL \inst24|Equal0~3_combout\ : std_logic;
SIGNAL \inst24|Equal0~0_combout\ : std_logic;
SIGNAL \inst24|Equal0~4_combout\ : std_logic;
SIGNAL \inst24|Equal0~10_combout\ : std_logic;
SIGNAL \inst24|Add0~11\ : std_logic;
SIGNAL \inst24|Add0~12_combout\ : std_logic;
SIGNAL \inst24|temp~2_combout\ : std_logic;
SIGNAL \inst24|Add0~13\ : std_logic;
SIGNAL \inst24|Add0~14_combout\ : std_logic;
SIGNAL \inst24|temp[7]~7_combout\ : std_logic;
SIGNAL \inst24|Add0~15\ : std_logic;
SIGNAL \inst24|Add0~16_combout\ : std_logic;
SIGNAL \inst24|temp[8]~8_combout\ : std_logic;
SIGNAL \inst25|Don[12]~0_combout\ : std_logic;
SIGNAL \inst25|Don[12]~1_combout\ : std_logic;
SIGNAL \inst25|timer[8]~32\ : std_logic;
SIGNAL \inst25|timer[9]~33_combout\ : std_logic;
SIGNAL \inst25|Equal0~5_combout\ : std_logic;
SIGNAL \inst25|timer[9]~34\ : std_logic;
SIGNAL \inst25|timer[10]~35_combout\ : std_logic;
SIGNAL \inst25|Don[11]~feeder_combout\ : std_logic;
SIGNAL \inst25|timer[10]~36\ : std_logic;
SIGNAL \inst25|timer[11]~37_combout\ : std_logic;
SIGNAL \inst25|Equal0~6_combout\ : std_logic;
SIGNAL \inst25|Don[12]~4_combout\ : std_logic;
SIGNAL \inst25|timer[11]~38\ : std_logic;
SIGNAL \inst25|timer[12]~39_combout\ : std_logic;
SIGNAL \inst25|Equal0~7_combout\ : std_logic;
SIGNAL \inst25|Don[6]~3_combout\ : std_logic;
SIGNAL \inst25|Equal0~3_combout\ : std_logic;
SIGNAL \inst25|Don[1]~feeder_combout\ : std_logic;
SIGNAL \inst25|Equal0~0_combout\ : std_logic;
SIGNAL \inst25|Don[2]~feeder_combout\ : std_logic;
SIGNAL \inst25|Equal0~1_combout\ : std_logic;
SIGNAL \inst25|Don[5]~2_combout\ : std_logic;
SIGNAL \inst25|Equal0~2_combout\ : std_logic;
SIGNAL \inst25|Equal0~4_combout\ : std_logic;
SIGNAL \inst25|Equal0~8_combout\ : std_logic;
SIGNAL \inst25|state.wait_response~0_combout\ : std_logic;
SIGNAL \inst25|Selector28~0_combout\ : std_logic;
SIGNAL \inst25|Selector28~1_combout\ : std_logic;
SIGNAL \inst25|Selector28~2_combout\ : std_logic;
SIGNAL \inst25|Selector28~3_combout\ : std_logic;
SIGNAL \inst25|enable_signal~q\ : std_logic;
SIGNAL \PLAYER_A|state[1]~0_combout\ : std_logic;
SIGNAL \PLAYER_A|state[0]~1_combout\ : std_logic;
SIGNAL \PLAYER_A|state[1]~2_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[0]~39_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[0]~40_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[0]~14\ : std_logic;
SIGNAL \PLAYER_A|react_time[1]~15_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[1]~16\ : std_logic;
SIGNAL \PLAYER_A|react_time[2]~17_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[2]~18\ : std_logic;
SIGNAL \PLAYER_A|react_time[3]~19_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[3]~20\ : std_logic;
SIGNAL \PLAYER_A|react_time[4]~21_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[4]~22\ : std_logic;
SIGNAL \PLAYER_A|react_time[5]~23_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[5]~24\ : std_logic;
SIGNAL \PLAYER_A|react_time[6]~25_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[6]~26\ : std_logic;
SIGNAL \PLAYER_A|react_time[7]~27_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[7]~28\ : std_logic;
SIGNAL \PLAYER_A|react_time[8]~29_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[8]~30\ : std_logic;
SIGNAL \PLAYER_A|react_time[9]~31_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[9]~32\ : std_logic;
SIGNAL \PLAYER_A|react_time[10]~33_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[10]~34\ : std_logic;
SIGNAL \PLAYER_A|react_time[11]~35_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time[11]~36\ : std_logic;
SIGNAL \PLAYER_A|react_time[12]~37_combout\ : std_logic;
SIGNAL \PLAYER_A|reactTime[0]~0_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[0]~13_combout\ : std_logic;
SIGNAL \PLAYER_B|state[1]~0_combout\ : std_logic;
SIGNAL \PLAYER_B|state[0]~1_combout\ : std_logic;
SIGNAL \PLAYER_B|state[1]~2_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[0]~39_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[0]~40_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[0]~14\ : std_logic;
SIGNAL \PLAYER_B|react_time[1]~15_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[1]~16\ : std_logic;
SIGNAL \PLAYER_B|react_time[2]~17_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[2]~18\ : std_logic;
SIGNAL \PLAYER_B|react_time[3]~19_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[3]~20\ : std_logic;
SIGNAL \PLAYER_B|react_time[4]~21_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[4]~22\ : std_logic;
SIGNAL \PLAYER_B|react_time[5]~23_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[5]~24\ : std_logic;
SIGNAL \PLAYER_B|react_time[6]~25_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[6]~26\ : std_logic;
SIGNAL \PLAYER_B|react_time[7]~27_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[7]~28\ : std_logic;
SIGNAL \PLAYER_B|react_time[8]~29_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[8]~30\ : std_logic;
SIGNAL \PLAYER_B|react_time[9]~31_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[9]~32\ : std_logic;
SIGNAL \PLAYER_B|react_time[10]~33_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[10]~34\ : std_logic;
SIGNAL \PLAYER_B|react_time[11]~35_combout\ : std_logic;
SIGNAL \PLAYER_B|react_time[11]~36\ : std_logic;
SIGNAL \PLAYER_B|react_time[12]~37_combout\ : std_logic;
SIGNAL \PLAYER_B|reactTime[0]~0_combout\ : std_logic;
SIGNAL \PLAYER_B|reactTime[9]~feeder_combout\ : std_logic;
SIGNAL \PLAYER_B|reactTime[7]~feeder_combout\ : std_logic;
SIGNAL \PLAYER_A|reactTime[7]~feeder_combout\ : std_logic;
SIGNAL \PLAYER_A|reactTime[5]~feeder_combout\ : std_logic;
SIGNAL \PLAYER_B|reactTime[1]~feeder_combout\ : std_logic;
SIGNAL \MEF|LessThan3~1_cout\ : std_logic;
SIGNAL \MEF|LessThan3~3_cout\ : std_logic;
SIGNAL \MEF|LessThan3~5_cout\ : std_logic;
SIGNAL \MEF|LessThan3~7_cout\ : std_logic;
SIGNAL \MEF|LessThan3~9_cout\ : std_logic;
SIGNAL \MEF|LessThan3~11_cout\ : std_logic;
SIGNAL \MEF|LessThan3~13_cout\ : std_logic;
SIGNAL \MEF|LessThan3~15_cout\ : std_logic;
SIGNAL \MEF|LessThan3~17_cout\ : std_logic;
SIGNAL \MEF|LessThan3~19_cout\ : std_logic;
SIGNAL \MEF|LessThan3~21_cout\ : std_logic;
SIGNAL \MEF|LessThan3~23_cout\ : std_logic;
SIGNAL \MEF|LessThan3~24_combout\ : std_logic;
SIGNAL \MEF|Add3~6\ : std_logic;
SIGNAL \MEF|Add3~8\ : std_logic;
SIGNAL \MEF|Add3~9_combout\ : std_logic;
SIGNAL \MEF|Add5~11\ : std_logic;
SIGNAL \MEF|Add5~12_combout\ : std_logic;
SIGNAL \MEF|Add3~2_combout\ : std_logic;
SIGNAL \MEF|points_B_int~11_combout\ : std_logic;
SIGNAL \inst57~combout\ : std_logic;
SIGNAL \MEF|playerB_penalty_applied~q\ : std_logic;
SIGNAL \MEF|points_B_int[5]~8_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~5_combout\ : std_logic;
SIGNAL \MEF|playerA_time_last[10]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~6_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~7_combout\ : std_logic;
SIGNAL \MEF|playerA_time_last[4]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~2_combout\ : std_logic;
SIGNAL \MEF|playerA_time_last[0]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~0_combout\ : std_logic;
SIGNAL \MEF|playerA_time_last[6]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~3_combout\ : std_logic;
SIGNAL \MEF|playerA_time_last[2]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~1_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~4_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~8_combout\ : std_logic;
SIGNAL \MEF|playerA_valid~q\ : std_logic;
SIGNAL \MEF|points_A_int~2_combout\ : std_logic;
SIGNAL \MEF|points_B_int[5]~17_combout\ : std_logic;
SIGNAL \MEF|LessThan2~1_cout\ : std_logic;
SIGNAL \MEF|LessThan2~3_cout\ : std_logic;
SIGNAL \MEF|LessThan2~5_cout\ : std_logic;
SIGNAL \MEF|LessThan2~7_cout\ : std_logic;
SIGNAL \MEF|LessThan2~9_cout\ : std_logic;
SIGNAL \MEF|LessThan2~11_cout\ : std_logic;
SIGNAL \MEF|LessThan2~13_cout\ : std_logic;
SIGNAL \MEF|LessThan2~15_cout\ : std_logic;
SIGNAL \MEF|LessThan2~17_cout\ : std_logic;
SIGNAL \MEF|LessThan2~19_cout\ : std_logic;
SIGNAL \MEF|LessThan2~21_cout\ : std_logic;
SIGNAL \MEF|LessThan2~23_cout\ : std_logic;
SIGNAL \MEF|LessThan2~24_combout\ : std_logic;
SIGNAL \MEF|points_B_int[5]~10_combout\ : std_logic;
SIGNAL \MEF|Add3~10\ : std_logic;
SIGNAL \MEF|Add3~11_combout\ : std_logic;
SIGNAL \MEF|Add5~13\ : std_logic;
SIGNAL \MEF|Add5~14_combout\ : std_logic;
SIGNAL \MEF|points_B_int~15_combout\ : std_logic;
SIGNAL \MEF|internal_reset~2_combout\ : std_logic;
SIGNAL \MEF|internal_reset~3_combout\ : std_logic;
SIGNAL \MEF|internal_reset~q\ : std_logic;
SIGNAL \MEF|state_machine~0_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~6_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~7_combout\ : std_logic;
SIGNAL \MEF|playerB_time_last[8]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~5_combout\ : std_logic;
SIGNAL \MEF|playerB_time_last[6]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~3_combout\ : std_logic;
SIGNAL \MEF|playerB_time_last[4]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~2_combout\ : std_logic;
SIGNAL \MEF|playerB_time_last[2]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~1_combout\ : std_logic;
SIGNAL \MEF|playerB_time_last[0]~feeder_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~0_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~4_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~8_combout\ : std_logic;
SIGNAL \MEF|playerB_valid~q\ : std_logic;
SIGNAL \MEF|points_B_int~16_combout\ : std_logic;
SIGNAL \MEF|points_B_int~13_combout\ : std_logic;
SIGNAL \MEF|Add5~9\ : std_logic;
SIGNAL \MEF|Add5~10_combout\ : std_logic;
SIGNAL \MEF|Add3~7_combout\ : std_logic;
SIGNAL \MEF|points_B_int~12_combout\ : std_logic;
SIGNAL \MEF|LessThan1~0_combout\ : std_logic;
SIGNAL \MEF|Add5~2_combout\ : std_logic;
SIGNAL \MEF|Add5~0_combout\ : std_logic;
SIGNAL \MEF|Add5~3_combout\ : std_logic;
SIGNAL \MEF|Add5~1\ : std_logic;
SIGNAL \MEF|Add5~4_combout\ : std_logic;
SIGNAL \MEF|points_B_int~9_combout\ : std_logic;
SIGNAL \MEF|Add3~1\ : std_logic;
SIGNAL \MEF|Add3~3_combout\ : std_logic;
SIGNAL \MEF|Add5~6_combout\ : std_logic;
SIGNAL \MEF|points_B_int~14_combout\ : std_logic;
SIGNAL \10Hz|Add0~1_cout\ : std_logic;
SIGNAL \10Hz|Add0~3_cout\ : std_logic;
SIGNAL \10Hz|Add0~5_cout\ : std_logic;
SIGNAL \10Hz|Add0~6_combout\ : std_logic;
SIGNAL \10Hz|Add0~7\ : std_logic;
SIGNAL \10Hz|Add0~8_combout\ : std_logic;
SIGNAL \10Hz|Add0~9\ : std_logic;
SIGNAL \10Hz|Add0~10_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~3_combout\ : std_logic;
SIGNAL \10Hz|Add0~11\ : std_logic;
SIGNAL \10Hz|Add0~12_combout\ : std_logic;
SIGNAL \10Hz|Add0~13\ : std_logic;
SIGNAL \10Hz|Add0~14_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~2_combout\ : std_logic;
SIGNAL \10Hz|Add0~15\ : std_logic;
SIGNAL \10Hz|Add0~16_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~1_combout\ : std_logic;
SIGNAL \10Hz|Add0~17\ : std_logic;
SIGNAL \10Hz|Add0~18_combout\ : std_logic;
SIGNAL \10Hz|Add0~19\ : std_logic;
SIGNAL \10Hz|Add0~20_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~0_combout\ : std_logic;
SIGNAL \10Hz|Add0~21\ : std_logic;
SIGNAL \10Hz|Add0~22_combout\ : std_logic;
SIGNAL \10Hz|Add0~23\ : std_logic;
SIGNAL \10Hz|Add0~24_combout\ : std_logic;
SIGNAL \10Hz|Add0~25\ : std_logic;
SIGNAL \10Hz|Add0~26_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~4_combout\ : std_logic;
SIGNAL \10Hz|Add0~27\ : std_logic;
SIGNAL \10Hz|Add0~28_combout\ : std_logic;
SIGNAL \10Hz|Add0~29\ : std_logic;
SIGNAL \10Hz|Add0~30_combout\ : std_logic;
SIGNAL \10Hz|Add0~31\ : std_logic;
SIGNAL \10Hz|Add0~32_combout\ : std_logic;
SIGNAL \10Hz|Add0~33\ : std_logic;
SIGNAL \10Hz|Add0~34_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~6_combout\ : std_logic;
SIGNAL \10Hz|Add0~35\ : std_logic;
SIGNAL \10Hz|Add0~36_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~7_combout\ : std_logic;
SIGNAL \10Hz|Add0~37\ : std_logic;
SIGNAL \10Hz|Add0~38_combout\ : std_logic;
SIGNAL \10Hz|Add0~39\ : std_logic;
SIGNAL \10Hz|Add0~40_combout\ : std_logic;
SIGNAL \10Hz|Add0~41\ : std_logic;
SIGNAL \10Hz|Add0~42_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~5_combout\ : std_logic;
SIGNAL \10Hz|Equal0~4_combout\ : std_logic;
SIGNAL \10Hz|Equal0~5_combout\ : std_logic;
SIGNAL \10Hz|Equal0~1_combout\ : std_logic;
SIGNAL \10Hz|Equal0~0_combout\ : std_logic;
SIGNAL \10Hz|Equal0~2_combout\ : std_logic;
SIGNAL \10Hz|Equal0~3_combout\ : std_logic;
SIGNAL \10Hz|Equal0~6_combout\ : std_logic;
SIGNAL \10Hz|pulse~feeder_combout\ : std_logic;
SIGNAL \10Hz|pulse~q\ : std_logic;
SIGNAL \10Hz|pulse~clkctrl_outclk\ : std_logic;
SIGNAL \inst11|btn_up_prev~0_combout\ : std_logic;
SIGNAL \inst11|btn_up_prev~q\ : std_logic;
SIGNAL \inst11|Add0~0_combout\ : std_logic;
SIGNAL \inst11|Add0~2_combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \inst3|s_key_prev~feeder_combout\ : std_logic;
SIGNAL \inst3|s_key_prev~q\ : std_logic;
SIGNAL \inst11|btn_down_prev~0_combout\ : std_logic;
SIGNAL \inst11|btn_down_prev~q\ : std_logic;
SIGNAL \inst11|LessThan0~0_combout\ : std_logic;
SIGNAL \inst11|process_0~1_combout\ : std_logic;
SIGNAL \inst11|counter[2]~2_combout\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[0]~5_combout\ : std_logic;
SIGNAL \inst11|process_0~0_combout\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[0]~5_combout\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[0]~6\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[1]~7_combout\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[1]~8\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[2]~9_combout\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[2]~10\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[3]~11_combout\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[3]~12\ : std_logic;
SIGNAL \inst11|btn_up_hold_time[4]~13_combout\ : std_logic;
SIGNAL \inst11|LessThan2~0_combout\ : std_logic;
SIGNAL \inst11|counter[2]~0_combout\ : std_logic;
SIGNAL \inst11|counter[2]~1_combout\ : std_logic;
SIGNAL \inst11|counter[2]~3_combout\ : std_logic;
SIGNAL \inst11|Add0~1\ : std_logic;
SIGNAL \inst11|Add0~4_combout\ : std_logic;
SIGNAL \inst11|Add0~18_combout\ : std_logic;
SIGNAL \inst11|Add0~5\ : std_logic;
SIGNAL \inst11|Add0~7\ : std_logic;
SIGNAL \inst11|Add0~8_combout\ : std_logic;
SIGNAL \inst11|Add0~16_combout\ : std_logic;
SIGNAL \inst11|Add0~9\ : std_logic;
SIGNAL \inst11|Add0~10_combout\ : std_logic;
SIGNAL \inst11|Add0~15_combout\ : std_logic;
SIGNAL \inst11|Add0~11\ : std_logic;
SIGNAL \inst11|Add0~12_combout\ : std_logic;
SIGNAL \inst11|Add0~14_combout\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[0]~6_combout\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[0]~7\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[1]~8_combout\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[1]~9\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[2]~10_combout\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[2]~11\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[3]~12_combout\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[3]~13\ : std_logic;
SIGNAL \inst11|btn_down_hold_time[4]~14_combout\ : std_logic;
SIGNAL \inst11|process_0~2_combout\ : std_logic;
SIGNAL \inst11|process_0~3_combout\ : std_logic;
SIGNAL \inst11|Add0~3_combout\ : std_logic;
SIGNAL \inst11|Add0~6_combout\ : std_logic;
SIGNAL \inst11|Add0~17_combout\ : std_logic;
SIGNAL \MEF|MaxPoints[2]~feeder_combout\ : std_logic;
SIGNAL \MEF|MaxPoints[5]~0_combout\ : std_logic;
SIGNAL \MEF|MaxPoints[3]~3_combout\ : std_logic;
SIGNAL \MEF|winnerB_int~1_combout\ : std_logic;
SIGNAL \MEF|confirmed_number_int[31]~feeder_combout\ : std_logic;
SIGNAL \MEF|MaxPoints[5]~feeder_combout\ : std_logic;
SIGNAL \MEF|MaxPoints[4]~feeder_combout\ : std_logic;
SIGNAL \MEF|winnerB_int~2_combout\ : std_logic;
SIGNAL \MEF|MaxPoints[1]~2_combout\ : std_logic;
SIGNAL \MEF|MaxPoints[0]~1_combout\ : std_logic;
SIGNAL \MEF|winnerB_int~0_combout\ : std_logic;
SIGNAL \MEF|winnerB_int~3_combout\ : std_logic;
SIGNAL \MEF|Equal2~3_combout\ : std_logic;
SIGNAL \MEF|Equal2~2_combout\ : std_logic;
SIGNAL \MEF|Equal2~1_combout\ : std_logic;
SIGNAL \MEF|Equal2~0_combout\ : std_logic;
SIGNAL \MEF|Equal2~4_combout\ : std_logic;
SIGNAL \MEF|winnerB_int~4_combout\ : std_logic;
SIGNAL \MEF|winnerB_int~q\ : std_logic;
SIGNAL \state|Selector2~1_combout\ : std_logic;
SIGNAL \state|state.game~q\ : std_logic;
SIGNAL \inst25|state.running~6_combout\ : std_logic;
SIGNAL \inst25|state.running~q\ : std_logic;
SIGNAL \inst25|state.penalty2~0_combout\ : std_logic;
SIGNAL \inst25|state.penalty2~q\ : std_logic;
SIGNAL \MEF|playerA_penalty_applied~feeder_combout\ : std_logic;
SIGNAL \MEF|playerA_penalty_applied~q\ : std_logic;
SIGNAL \MEF|points_A_int[5]~3_combout\ : std_logic;
SIGNAL \MEF|Add4~2_combout\ : std_logic;
SIGNAL \MEF|points_A_int~11_combout\ : std_logic;
SIGNAL \MEF|Add4~3_combout\ : std_logic;
SIGNAL \MEF|Add4~1\ : std_logic;
SIGNAL \MEF|Add4~4_combout\ : std_logic;
SIGNAL \MEF|Add2~0_combout\ : std_logic;
SIGNAL \MEF|Add2~2_combout\ : std_logic;
SIGNAL \MEF|points_A_int~4_combout\ : std_logic;
SIGNAL \MEF|points_A_int[5]~5_combout\ : std_logic;
SIGNAL \MEF|Add4~5\ : std_logic;
SIGNAL \MEF|Add4~6_combout\ : std_logic;
SIGNAL \MEF|Add2~1\ : std_logic;
SIGNAL \MEF|Add2~3_combout\ : std_logic;
SIGNAL \MEF|points_A_int~9_combout\ : std_logic;
SIGNAL \MEF|Add2~4\ : std_logic;
SIGNAL \MEF|Add2~5_combout\ : std_logic;
SIGNAL \MEF|Add4~7\ : std_logic;
SIGNAL \MEF|Add4~8_combout\ : std_logic;
SIGNAL \MEF|points_A_int~8_combout\ : std_logic;
SIGNAL \MEF|Add2~6\ : std_logic;
SIGNAL \MEF|Add2~7_combout\ : std_logic;
SIGNAL \MEF|Add4~9\ : std_logic;
SIGNAL \MEF|Add4~10_combout\ : std_logic;
SIGNAL \MEF|points_A_int~7_combout\ : std_logic;
SIGNAL \MEF|Add4~11\ : std_logic;
SIGNAL \MEF|Add4~12_combout\ : std_logic;
SIGNAL \MEF|Add2~8\ : std_logic;
SIGNAL \MEF|Add2~9_combout\ : std_logic;
SIGNAL \MEF|points_A_int~6_combout\ : std_logic;
SIGNAL \MEF|Add2~10\ : std_logic;
SIGNAL \MEF|Add2~11_combout\ : std_logic;
SIGNAL \MEF|Add4~13\ : std_logic;
SIGNAL \MEF|Add4~14_combout\ : std_logic;
SIGNAL \MEF|points_A_int~10_combout\ : std_logic;
SIGNAL \MEF|winnerA_int~0_combout\ : std_logic;
SIGNAL \MEF|winnerA_int~q\ : std_logic;
SIGNAL \state|Selector4~1_combout\ : std_logic;
SIGNAL \state|process_0~0_combout\ : std_logic;
SIGNAL \state|Selector4~0_combout\ : std_logic;
SIGNAL \state|state.win_state_B~q\ : std_logic;
SIGNAL \state|Selector3~0_combout\ : std_logic;
SIGNAL \state|state.win_state_A~q\ : std_logic;
SIGNAL \state|Selector0~4_combout\ : std_logic;
SIGNAL \state|state.init~q\ : std_logic;
SIGNAL \state|state.gameINFO~0_combout\ : std_logic;
SIGNAL \state|state.gameINFO~q\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \inst76|Mux0~0_combout\ : std_logic;
SIGNAL \inst66|Mux0~4_combout\ : std_logic;
SIGNAL \inst76|Mux1~0_combout\ : std_logic;
SIGNAL \inst66|Mux1~2_combout\ : std_logic;
SIGNAL \inst76|Mux2~0_combout\ : std_logic;
SIGNAL \inst66|Mux2~2_combout\ : std_logic;
SIGNAL \inst76|Mux3~0_combout\ : std_logic;
SIGNAL \inst63|Mux3~4_combout\ : std_logic;
SIGNAL \inst66|Mux3~0_combout\ : std_logic;
SIGNAL \inst66|Mux3~1_combout\ : std_logic;
SIGNAL \inst76|Mux4~0_combout\ : std_logic;
SIGNAL \inst66|Mux4~0_combout\ : std_logic;
SIGNAL \inst76|Mux5~0_combout\ : std_logic;
SIGNAL \inst66|Mux5~0_combout\ : std_logic;
SIGNAL \inst76|Mux6~0_combout\ : std_logic;
SIGNAL \inst66|Mux6~0_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst65|Mux0~0_combout\ : std_logic;
SIGNAL \inst66|Mux0~2_combout\ : std_logic;
SIGNAL \inst65|Mux1~2_combout\ : std_logic;
SIGNAL \inst65|Mux1~3_combout\ : std_logic;
SIGNAL \inst65|Mux2~0_combout\ : std_logic;
SIGNAL \inst65|Mux2~1_combout\ : std_logic;
SIGNAL \inst65|Mux3~0_combout\ : std_logic;
SIGNAL \inst65|Mux3~1_combout\ : std_logic;
SIGNAL \inst65|Mux3~2_combout\ : std_logic;
SIGNAL \inst65|Mux4~0_combout\ : std_logic;
SIGNAL \inst65|Mux5~0_combout\ : std_logic;
SIGNAL \inst65|Mux5~1_combout\ : std_logic;
SIGNAL \inst65|Mux6~2_combout\ : std_logic;
SIGNAL \inst65|Mux6~4_combout\ : std_logic;
SIGNAL \inst65|Mux6~3_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \inst78|Mux0~0_combout\ : std_logic;
SIGNAL \inst64|Mux0~2_combout\ : std_logic;
SIGNAL \inst78|Mux1~0_combout\ : std_logic;
SIGNAL \inst64|Mux1~0_combout\ : std_logic;
SIGNAL \inst78|Mux2~0_combout\ : std_logic;
SIGNAL \inst64|Mux2~2_combout\ : std_logic;
SIGNAL \inst78|Mux3~0_combout\ : std_logic;
SIGNAL \inst64|Mux3~2_combout\ : std_logic;
SIGNAL \inst78|Mux4~0_combout\ : std_logic;
SIGNAL \inst64|Mux4~0_combout\ : std_logic;
SIGNAL \inst78|Mux5~0_combout\ : std_logic;
SIGNAL \inst64|Mux5~0_combout\ : std_logic;
SIGNAL \inst78|Mux6~0_combout\ : std_logic;
SIGNAL \inst64|Mux6~0_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst63|Mux0~2_combout\ : std_logic;
SIGNAL \inst63|Mux0~3_combout\ : std_logic;
SIGNAL \inst63|Mux1~0_combout\ : std_logic;
SIGNAL \inst63|Mux2~0_combout\ : std_logic;
SIGNAL \inst63|Mux3~5_combout\ : std_logic;
SIGNAL \inst63|Mux3~6_combout\ : std_logic;
SIGNAL \inst63|Mux3~7_combout\ : std_logic;
SIGNAL \inst66|Mux0~3_combout\ : std_logic;
SIGNAL \inst63|Mux4~0_combout\ : std_logic;
SIGNAL \inst63|Mux5~2_combout\ : std_logic;
SIGNAL \inst63|Mux5~3_combout\ : std_logic;
SIGNAL \inst63|Mux6~0_combout\ : std_logic;
SIGNAL \inst63|Mux6~1_combout\ : std_logic;
SIGNAL \MEF|cycle_last~q\ : std_logic;
SIGNAL \MEF|state_machine~1_combout\ : std_logic;
SIGNAL \MEF|total_cycles_int[0]~6_combout\ : std_logic;
SIGNAL \MEF|tie~0_combout\ : std_logic;
SIGNAL \MEF|tie~1_combout\ : std_logic;
SIGNAL \MEF|tie~q\ : std_logic;
SIGNAL \MEF|total_cycles_int[5]~8_combout\ : std_logic;
SIGNAL \MEF|total_cycles_int[0]~7\ : std_logic;
SIGNAL \MEF|total_cycles_int[1]~9_combout\ : std_logic;
SIGNAL \MEF|total_cycles_int[1]~10\ : std_logic;
SIGNAL \MEF|total_cycles_int[2]~11_combout\ : std_logic;
SIGNAL \MEF|total_cycles_int[2]~12\ : std_logic;
SIGNAL \MEF|total_cycles_int[3]~13_combout\ : std_logic;
SIGNAL \MEF|total_cycles_int[3]~14\ : std_logic;
SIGNAL \MEF|total_cycles_int[4]~15_combout\ : std_logic;
SIGNAL \MEF|total_cycles_int[4]~16\ : std_logic;
SIGNAL \MEF|total_cycles_int[5]~17_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \inst74|Mux0~0_combout\ : std_logic;
SIGNAL \inst62|Mux0~0_combout\ : std_logic;
SIGNAL \inst74|Mux1~0_combout\ : std_logic;
SIGNAL \inst62|Mux1~0_combout\ : std_logic;
SIGNAL \inst74|Mux2~0_combout\ : std_logic;
SIGNAL \inst62|Mux2~0_combout\ : std_logic;
SIGNAL \inst74|Mux3~0_combout\ : std_logic;
SIGNAL \inst62|Mux3~0_combout\ : std_logic;
SIGNAL \inst74|Mux4~0_combout\ : std_logic;
SIGNAL \inst62|Mux4~0_combout\ : std_logic;
SIGNAL \inst74|Mux5~0_combout\ : std_logic;
SIGNAL \inst62|Mux5~0_combout\ : std_logic;
SIGNAL \inst74|Mux6~0_combout\ : std_logic;
SIGNAL \inst62|Mux6~0_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst61|Mux0~0_combout\ : std_logic;
SIGNAL \inst61|Mux1~0_combout\ : std_logic;
SIGNAL \inst61|Mux2~0_combout\ : std_logic;
SIGNAL \inst61|Mux3~0_combout\ : std_logic;
SIGNAL \inst61|Mux4~0_combout\ : std_logic;
SIGNAL \inst61|Mux5~0_combout\ : std_logic;
SIGNAL \inst61|Mux6~0_combout\ : std_logic;
SIGNAL \1Hz|Add0~1_cout\ : std_logic;
SIGNAL \1Hz|Add0~3_cout\ : std_logic;
SIGNAL \1Hz|Add0~5_cout\ : std_logic;
SIGNAL \1Hz|Add0~7_cout\ : std_logic;
SIGNAL \1Hz|Add0~9_cout\ : std_logic;
SIGNAL \1Hz|Add0~10_combout\ : std_logic;
SIGNAL \1Hz|Add0~11\ : std_logic;
SIGNAL \1Hz|Add0~12_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~5_combout\ : std_logic;
SIGNAL \1Hz|Add0~13\ : std_logic;
SIGNAL \1Hz|Add0~14_combout\ : std_logic;
SIGNAL \1Hz|Add0~15\ : std_logic;
SIGNAL \1Hz|Add0~16_combout\ : std_logic;
SIGNAL \1Hz|Add0~17\ : std_logic;
SIGNAL \1Hz|Add0~18_combout\ : std_logic;
SIGNAL \1Hz|Add0~19\ : std_logic;
SIGNAL \1Hz|Add0~20_combout\ : std_logic;
SIGNAL \1Hz|Add0~21\ : std_logic;
SIGNAL \1Hz|Add0~22_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~4_combout\ : std_logic;
SIGNAL \1Hz|Add0~23\ : std_logic;
SIGNAL \1Hz|Add0~24_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~3_combout\ : std_logic;
SIGNAL \1Hz|Add0~25\ : std_logic;
SIGNAL \1Hz|Add0~26_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~2_combout\ : std_logic;
SIGNAL \1Hz|Add0~27\ : std_logic;
SIGNAL \1Hz|Add0~28_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~1_combout\ : std_logic;
SIGNAL \1Hz|Add0~29\ : std_logic;
SIGNAL \1Hz|Add0~30_combout\ : std_logic;
SIGNAL \1Hz|Add0~31\ : std_logic;
SIGNAL \1Hz|Add0~32_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~0_combout\ : std_logic;
SIGNAL \1Hz|Equal0~0_combout\ : std_logic;
SIGNAL \1Hz|Add0~33\ : std_logic;
SIGNAL \1Hz|Add0~34_combout\ : std_logic;
SIGNAL \1Hz|Add0~35\ : std_logic;
SIGNAL \1Hz|Add0~36_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~6_combout\ : std_logic;
SIGNAL \1Hz|Add0~37\ : std_logic;
SIGNAL \1Hz|Add0~38_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~7_combout\ : std_logic;
SIGNAL \1Hz|Add0~39\ : std_logic;
SIGNAL \1Hz|Add0~40_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~8_combout\ : std_logic;
SIGNAL \1Hz|Add0~41\ : std_logic;
SIGNAL \1Hz|Add0~42_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~9_combout\ : std_logic;
SIGNAL \1Hz|Equal0~1_combout\ : std_logic;
SIGNAL \1Hz|Equal0~7_combout\ : std_logic;
SIGNAL \1Hz|Add0~43\ : std_logic;
SIGNAL \1Hz|Add0~44_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~10_combout\ : std_logic;
SIGNAL \1Hz|Add0~45\ : std_logic;
SIGNAL \1Hz|Add0~46_combout\ : std_logic;
SIGNAL \1Hz|Add0~47\ : std_logic;
SIGNAL \1Hz|Add0~48_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~11_combout\ : std_logic;
SIGNAL \1Hz|Equal0~4_combout\ : std_logic;
SIGNAL \1Hz|Equal0~2_combout\ : std_logic;
SIGNAL \1Hz|Equal0~3_combout\ : std_logic;
SIGNAL \1Hz|Equal0~5_combout\ : std_logic;
SIGNAL \1Hz|Equal0~6_combout\ : std_logic;
SIGNAL \1Hz|pulse~feeder_combout\ : std_logic;
SIGNAL \1Hz|pulse~q\ : std_logic;
SIGNAL \1Hz|pulse~clkctrl_outclk\ : std_logic;
SIGNAL \inst11|s_blink~0_combout\ : std_logic;
SIGNAL \inst11|s_blink~q\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ : std_logic;
SIGNAL \inst19|Mux0~0_combout\ : std_logic;
SIGNAL \inst60|Mux0~9_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \inst72|Mux0~0_combout\ : std_logic;
SIGNAL \inst60|Mux0~8_combout\ : std_logic;
SIGNAL \inst19|Mux1~0_combout\ : std_logic;
SIGNAL \inst60|Mux1~9_combout\ : std_logic;
SIGNAL \inst72|Mux1~0_combout\ : std_logic;
SIGNAL \inst60|Mux1~8_combout\ : std_logic;
SIGNAL \inst72|Mux2~0_combout\ : std_logic;
SIGNAL \inst19|Mux2~0_combout\ : std_logic;
SIGNAL \inst60|Mux2~9_combout\ : std_logic;
SIGNAL \inst60|Mux2~8_combout\ : std_logic;
SIGNAL \inst19|Mux3~0_combout\ : std_logic;
SIGNAL \inst60|Mux3~9_combout\ : std_logic;
SIGNAL \inst72|Mux3~0_combout\ : std_logic;
SIGNAL \inst60|Mux3~8_combout\ : std_logic;
SIGNAL \inst19|Mux4~0_combout\ : std_logic;
SIGNAL \inst60|Mux4~9_combout\ : std_logic;
SIGNAL \inst72|Mux4~0_combout\ : std_logic;
SIGNAL \inst60|Mux4~8_combout\ : std_logic;
SIGNAL \inst72|Mux5~0_combout\ : std_logic;
SIGNAL \inst19|Mux5~0_combout\ : std_logic;
SIGNAL \inst60|Mux5~9_combout\ : std_logic;
SIGNAL \inst60|Mux5~8_combout\ : std_logic;
SIGNAL \inst72|Mux6~0_combout\ : std_logic;
SIGNAL \inst19|Mux6~0_combout\ : std_logic;
SIGNAL \inst60|Mux6~9_combout\ : std_logic;
SIGNAL \inst60|Mux6~8_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \5453|Mux0~1_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \5453|Mux0~2_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \5453|Mux0~3_combout\ : std_logic;
SIGNAL \5453|Mux0~0_combout\ : std_logic;
SIGNAL \5453|Mux0~4_combout\ : std_logic;
SIGNAL \5453|Mux4~4_combout\ : std_logic;
SIGNAL \5453|Mux1~0_combout\ : std_logic;
SIGNAL \5453|Mux1~1_combout\ : std_logic;
SIGNAL \inst17~combout\ : std_logic;
SIGNAL \5453|Mux1~2_combout\ : std_logic;
SIGNAL \5453|Mux1~3_combout\ : std_logic;
SIGNAL \5453|Mux2~1_combout\ : std_logic;
SIGNAL \5453|Mux2~0_combout\ : std_logic;
SIGNAL \5453|Mux2~2_combout\ : std_logic;
SIGNAL \5453|Mux3~0_combout\ : std_logic;
SIGNAL \5453|Mux3~1_combout\ : std_logic;
SIGNAL \5453|Mux3~2_combout\ : std_logic;
SIGNAL \5453|Mux4~2_combout\ : std_logic;
SIGNAL \5453|Mux4~3_combout\ : std_logic;
SIGNAL \5453|Mux5~0_combout\ : std_logic;
SIGNAL \5453|Mux5~1_combout\ : std_logic;
SIGNAL \5453|Mux5~2_combout\ : std_logic;
SIGNAL \5453|Mux6~1_combout\ : std_logic;
SIGNAL \5453|Mux6~0_combout\ : std_logic;
SIGNAL \5453|Mux6~2_combout\ : std_logic;
SIGNAL \PLAYER_A|light_active[0]~0_combout\ : std_logic;
SIGNAL \PLAYER_A|light_active[0]~1_combout\ : std_logic;
SIGNAL \PLAYER_B|light_active[0]~0_combout\ : std_logic;
SIGNAL \PLAYER_B|light_active[0]~1_combout\ : std_logic;
SIGNAL \inst80|led_state[0]~0_combout\ : std_logic;
SIGNAL \PLAYER_A|react_time\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \inst24|temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \MEF|total_cycles_int\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst11|btn_up_hold_time\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \1kHz|s_cnt\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst11|btn_down_hold_time\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst25|timer\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \inst25|penalty_timer2\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \inst25|penalty_timer\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \PLAYER_B|react_time\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \MEF|points_B_int\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \MEF|points_A_int\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \inst89|Y\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \inst11|counter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \MEF|MaxPoints\ : std_logic_vector(6 DOWNTO 0);
SIGNAL \PLAYER_A|light_active\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst94|output4\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \PLAYER_B|light_active\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst95|output4\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst80|led_state\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \PLAYER_B|reactTime\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \PLAYER_A|reactTime\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \PLAYER_A|state\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \inst25|Don\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \PLAYER_B|state\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \MEF|confirmed_number_int\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \MEF|playerA_time_last\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \MEF|playerB_time_last\ : std_logic_vector(13 DOWNTO 0);
SIGNAL \10Hz|s_cnt\ : std_logic_vector(22 DOWNTO 0);
SIGNAL \1Hz|s_cnt\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \PLAYER_B|ALT_INV_state\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \inst25|ALT_INV_state.running~q\ : std_logic;
SIGNAL \PLAYER_A|ALT_INV_state\ : std_logic_vector(1 DOWNTO 1);
SIGNAL \MEF|ALT_INV_state_machine~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

HEX0 <= ww_HEX0;
ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX4 <= ww_HEX4;
HEX5 <= ww_HEX5;
HEX6 <= ww_HEX6;
HEX7 <= ww_HEX7;
LEDG <= ww_LEDG;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\1kHz|pulse~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \1kHz|pulse~q\);

\1Hz|pulse~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \1Hz|pulse~q\);

\10Hz|pulse~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \10Hz|pulse~q\);

\inst2|s_key_prev~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst2|s_key_prev~q\);
\PLAYER_B|ALT_INV_state\(1) <= NOT \PLAYER_B|state\(1);
\inst25|ALT_INV_state.running~q\ <= NOT \inst25|state.running~q\;
\PLAYER_A|ALT_INV_state\(1) <= NOT \PLAYER_A|state\(1);
\MEF|ALT_INV_state_machine~0_combout\ <= NOT \MEF|state_machine~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X115_Y69_N2
\HEX0[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst66|Mux0~4_combout\,
	devoe => ww_devoe,
	o => \HEX0[6]~output_o\);

-- Location: IOOBUF_X115_Y67_N16
\HEX0[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst66|Mux1~2_combout\,
	devoe => ww_devoe,
	o => \HEX0[5]~output_o\);

-- Location: IOOBUF_X115_Y54_N16
\HEX0[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst66|Mux2~2_combout\,
	devoe => ww_devoe,
	o => \HEX0[4]~output_o\);

-- Location: IOOBUF_X115_Y50_N2
\HEX0[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst66|Mux3~1_combout\,
	devoe => ww_devoe,
	o => \HEX0[3]~output_o\);

-- Location: IOOBUF_X67_Y73_N23
\HEX0[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst66|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[2]~output_o\);

-- Location: IOOBUF_X107_Y73_N23
\HEX0[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst66|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\HEX0[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst66|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X115_Y28_N9
\HEX1[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst65|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[6]~output_o\);

-- Location: IOOBUF_X115_Y22_N2
\HEX1[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst65|Mux1~3_combout\,
	devoe => ww_devoe,
	o => \HEX1[5]~output_o\);

-- Location: IOOBUF_X115_Y20_N9
\HEX1[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst65|Mux2~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[4]~output_o\);

-- Location: IOOBUF_X115_Y30_N2
\HEX1[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst65|Mux3~2_combout\,
	devoe => ww_devoe,
	o => \HEX1[3]~output_o\);

-- Location: IOOBUF_X115_Y25_N23
\HEX1[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst65|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX1[2]~output_o\);

-- Location: IOOBUF_X115_Y30_N9
\HEX1[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst65|Mux5~1_combout\,
	devoe => ww_devoe,
	o => \HEX1[1]~output_o\);

-- Location: IOOBUF_X115_Y41_N2
\HEX1[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst65|Mux6~3_combout\,
	devoe => ww_devoe,
	o => \HEX1[0]~output_o\);

-- Location: IOOBUF_X115_Y21_N16
\HEX2[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst64|Mux0~2_combout\,
	devoe => ww_devoe,
	o => \HEX2[6]~output_o\);

-- Location: IOOBUF_X115_Y20_N2
\HEX2[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst64|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[5]~output_o\);

-- Location: IOOBUF_X115_Y18_N2
\HEX2[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst64|Mux2~2_combout\,
	devoe => ww_devoe,
	o => \HEX2[4]~output_o\);

-- Location: IOOBUF_X115_Y19_N2
\HEX2[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst64|Mux3~2_combout\,
	devoe => ww_devoe,
	o => \HEX2[3]~output_o\);

-- Location: IOOBUF_X115_Y19_N9
\HEX2[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst64|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[2]~output_o\);

-- Location: IOOBUF_X115_Y16_N2
\HEX2[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst64|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[1]~output_o\);

-- Location: IOOBUF_X115_Y17_N9
\HEX2[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst64|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX2[0]~output_o\);

-- Location: IOOBUF_X105_Y0_N2
\HEX3[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|Mux0~3_combout\,
	devoe => ww_devoe,
	o => \HEX3[6]~output_o\);

-- Location: IOOBUF_X105_Y0_N9
\HEX3[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[5]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\HEX3[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[4]~output_o\);

-- Location: IOOBUF_X111_Y0_N2
\HEX3[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|Mux3~7_combout\,
	devoe => ww_devoe,
	o => \HEX3[3]~output_o\);

-- Location: IOOBUF_X100_Y0_N2
\HEX3[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX3[2]~output_o\);

-- Location: IOOBUF_X115_Y29_N2
\HEX3[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|Mux5~3_combout\,
	devoe => ww_devoe,
	o => \HEX3[1]~output_o\);

-- Location: IOOBUF_X115_Y25_N16
\HEX3[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst63|Mux6~1_combout\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst62|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[6]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\HEX4[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst62|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[5]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\HEX4[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst62|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[4]~output_o\);

-- Location: IOOBUF_X74_Y0_N2
\HEX4[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst62|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[3]~output_o\);

-- Location: IOOBUF_X74_Y0_N9
\HEX4[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst62|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[2]~output_o\);

-- Location: IOOBUF_X107_Y0_N9
\HEX4[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst62|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[1]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\HEX4[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst62|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X69_Y0_N2
\HEX5[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst61|Mux0~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[6]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\HEX5[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst61|Mux1~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[5]~output_o\);

-- Location: IOOBUF_X72_Y0_N9
\HEX5[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst61|Mux2~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[4]~output_o\);

-- Location: IOOBUF_X72_Y0_N2
\HEX5[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst61|Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[3]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\HEX5[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst61|Mux4~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[2]~output_o\);

-- Location: IOOBUF_X87_Y0_N16
\HEX5[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst61|Mux5~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[1]~output_o\);

-- Location: IOOBUF_X85_Y0_N9
\HEX5[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst61|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX5[0]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst60|Mux0~8_combout\,
	devoe => ww_devoe,
	o => \HEX6[6]~output_o\);

-- Location: IOOBUF_X67_Y0_N23
\HEX6[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst60|Mux1~8_combout\,
	devoe => ww_devoe,
	o => \HEX6[5]~output_o\);

-- Location: IOOBUF_X67_Y0_N16
\HEX6[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst60|Mux2~8_combout\,
	devoe => ww_devoe,
	o => \HEX6[4]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\HEX6[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst60|Mux3~8_combout\,
	devoe => ww_devoe,
	o => \HEX6[3]~output_o\);

-- Location: IOOBUF_X65_Y0_N9
\HEX6[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst60|Mux4~8_combout\,
	devoe => ww_devoe,
	o => \HEX6[2]~output_o\);

-- Location: IOOBUF_X65_Y0_N2
\HEX6[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst60|Mux5~8_combout\,
	devoe => ww_devoe,
	o => \HEX6[1]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\HEX6[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst60|Mux6~8_combout\,
	devoe => ww_devoe,
	o => \HEX6[0]~output_o\);

-- Location: IOOBUF_X54_Y0_N23
\HEX7[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \5453|Mux0~4_combout\,
	devoe => ww_devoe,
	o => \HEX7[6]~output_o\);

-- Location: IOOBUF_X69_Y0_N9
\HEX7[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \5453|Mux1~3_combout\,
	devoe => ww_devoe,
	o => \HEX7[5]~output_o\);

-- Location: IOOBUF_X67_Y0_N2
\HEX7[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \5453|Mux2~2_combout\,
	devoe => ww_devoe,
	o => \HEX7[4]~output_o\);

-- Location: IOOBUF_X62_Y0_N16
\HEX7[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \5453|Mux3~2_combout\,
	devoe => ww_devoe,
	o => \HEX7[3]~output_o\);

-- Location: IOOBUF_X62_Y0_N23
\HEX7[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \5453|Mux4~3_combout\,
	devoe => ww_devoe,
	o => \HEX7[2]~output_o\);

-- Location: IOOBUF_X67_Y0_N9
\HEX7[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \5453|Mux5~2_combout\,
	devoe => ww_devoe,
	o => \HEX7[1]~output_o\);

-- Location: IOOBUF_X74_Y0_N16
\HEX7[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \5453|Mux6~2_combout\,
	devoe => ww_devoe,
	o => \HEX7[0]~output_o\);

-- Location: IOOBUF_X74_Y73_N23
\LEDG[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst94|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[7]~output_o\);

-- Location: IOOBUF_X72_Y73_N23
\LEDG[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst94|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[6]~output_o\);

-- Location: IOOBUF_X74_Y73_N16
\LEDG[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst94|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[5]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\LEDG[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst94|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[4]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst95|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[3]~output_o\);

-- Location: IOOBUF_X83_Y73_N2
\LEDG[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst95|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[2]~output_o\);

-- Location: IOOBUF_X111_Y73_N9
\LEDG[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst95|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[1]~output_o\);

-- Location: IOOBUF_X107_Y73_N9
\LEDG[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst95|output4\(3),
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X60_Y73_N16
\LEDR[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[17]~output_o\);

-- Location: IOOBUF_X67_Y73_N2
\LEDR[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[16]~output_o\);

-- Location: IOOBUF_X65_Y73_N9
\LEDR[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[15]~output_o\);

-- Location: IOOBUF_X58_Y73_N2
\LEDR[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[14]~output_o\);

-- Location: IOOBUF_X67_Y73_N9
\LEDR[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[13]~output_o\);

-- Location: IOOBUF_X65_Y73_N16
\LEDR[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[12]~output_o\);

-- Location: IOOBUF_X65_Y73_N23
\LEDR[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[11]~output_o\);

-- Location: IOOBUF_X60_Y73_N23
\LEDR[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[10]~output_o\);

-- Location: IOOBUF_X83_Y73_N23
\LEDR[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[9]~output_o\);

-- Location: IOOBUF_X69_Y73_N2
\LEDR[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[8]~output_o\);

-- Location: IOOBUF_X72_Y73_N2
\LEDR[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[7]~output_o\);

-- Location: IOOBUF_X72_Y73_N9
\LEDR[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[6]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\LEDR[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[5]~output_o\);

-- Location: IOOBUF_X87_Y73_N16
\LEDR[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[4]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[3]~output_o\);

-- Location: IOOBUF_X94_Y73_N9
\LEDR[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[2]~output_o\);

-- Location: IOOBUF_X94_Y73_N2
\LEDR[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[1]~output_o\);

-- Location: IOOBUF_X69_Y73_N16
\LEDR[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst80|led_state\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOIBUF_X0_Y36_N15
\CLOCK_50~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CLOCK_50,
	o => \CLOCK_50~input_o\);

-- Location: CLKCTRL_G4
\CLOCK_50~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CLOCK_50~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CLOCK_50~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y40_N8
\KEY[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(0),
	o => \KEY[0]~input_o\);

-- Location: FF_X111_Y33_N23
\inst|s_key_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \KEY[0]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|s_key_prev~q\);

-- Location: LCCOMB_X57_Y70_N0
\1kHz|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~0_combout\ = \1kHz|s_cnt\(0) $ (VCC)
-- \1kHz|Add0~1\ = CARRY(\1kHz|s_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(0),
	datad => VCC,
	combout => \1kHz|Add0~0_combout\,
	cout => \1kHz|Add0~1\);

-- Location: FF_X57_Y70_N1
\1kHz|s_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(0));

-- Location: LCCOMB_X57_Y70_N2
\1kHz|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~2_combout\ = (\1kHz|s_cnt\(1) & (!\1kHz|Add0~1\)) # (!\1kHz|s_cnt\(1) & ((\1kHz|Add0~1\) # (GND)))
-- \1kHz|Add0~3\ = CARRY((!\1kHz|Add0~1\) # (!\1kHz|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(1),
	datad => VCC,
	cin => \1kHz|Add0~1\,
	combout => \1kHz|Add0~2_combout\,
	cout => \1kHz|Add0~3\);

-- Location: FF_X57_Y70_N3
\1kHz|s_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(1));

-- Location: LCCOMB_X57_Y70_N4
\1kHz|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~4_combout\ = (\1kHz|s_cnt\(2) & (\1kHz|Add0~3\ $ (GND))) # (!\1kHz|s_cnt\(2) & (!\1kHz|Add0~3\ & VCC))
-- \1kHz|Add0~5\ = CARRY((\1kHz|s_cnt\(2) & !\1kHz|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(2),
	datad => VCC,
	cin => \1kHz|Add0~3\,
	combout => \1kHz|Add0~4_combout\,
	cout => \1kHz|Add0~5\);

-- Location: FF_X57_Y70_N5
\1kHz|s_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(2));

-- Location: LCCOMB_X57_Y70_N6
\1kHz|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~6_combout\ = (\1kHz|s_cnt\(3) & (!\1kHz|Add0~5\)) # (!\1kHz|s_cnt\(3) & ((\1kHz|Add0~5\) # (GND)))
-- \1kHz|Add0~7\ = CARRY((!\1kHz|Add0~5\) # (!\1kHz|s_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(3),
	datad => VCC,
	cin => \1kHz|Add0~5\,
	combout => \1kHz|Add0~6_combout\,
	cout => \1kHz|Add0~7\);

-- Location: FF_X57_Y70_N7
\1kHz|s_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(3));

-- Location: LCCOMB_X57_Y70_N8
\1kHz|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~8_combout\ = (\1kHz|s_cnt\(4) & (\1kHz|Add0~7\ $ (GND))) # (!\1kHz|s_cnt\(4) & (!\1kHz|Add0~7\ & VCC))
-- \1kHz|Add0~9\ = CARRY((\1kHz|s_cnt\(4) & !\1kHz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(4),
	datad => VCC,
	cin => \1kHz|Add0~7\,
	combout => \1kHz|Add0~8_combout\,
	cout => \1kHz|Add0~9\);

-- Location: LCCOMB_X58_Y70_N28
\1kHz|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|s_cnt~3_combout\ = (!\1kHz|Equal0~4_combout\ & \1kHz|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1kHz|Equal0~4_combout\,
	datad => \1kHz|Add0~8_combout\,
	combout => \1kHz|s_cnt~3_combout\);

-- Location: FF_X58_Y70_N29
\1kHz|s_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|s_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(4));

-- Location: LCCOMB_X57_Y70_N10
\1kHz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~10_combout\ = (\1kHz|s_cnt\(5) & (!\1kHz|Add0~9\)) # (!\1kHz|s_cnt\(5) & ((\1kHz|Add0~9\) # (GND)))
-- \1kHz|Add0~11\ = CARRY((!\1kHz|Add0~9\) # (!\1kHz|s_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(5),
	datad => VCC,
	cin => \1kHz|Add0~9\,
	combout => \1kHz|Add0~10_combout\,
	cout => \1kHz|Add0~11\);

-- Location: FF_X57_Y70_N11
\1kHz|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(5));

-- Location: LCCOMB_X57_Y70_N12
\1kHz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~12_combout\ = (\1kHz|s_cnt\(6) & (\1kHz|Add0~11\ $ (GND))) # (!\1kHz|s_cnt\(6) & (!\1kHz|Add0~11\ & VCC))
-- \1kHz|Add0~13\ = CARRY((\1kHz|s_cnt\(6) & !\1kHz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(6),
	datad => VCC,
	cin => \1kHz|Add0~11\,
	combout => \1kHz|Add0~12_combout\,
	cout => \1kHz|Add0~13\);

-- Location: LCCOMB_X58_Y70_N10
\1kHz|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|s_cnt~1_combout\ = (!\1kHz|Equal0~4_combout\ & \1kHz|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1kHz|Equal0~4_combout\,
	datad => \1kHz|Add0~12_combout\,
	combout => \1kHz|s_cnt~1_combout\);

-- Location: FF_X58_Y70_N11
\1kHz|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|s_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(6));

-- Location: LCCOMB_X57_Y70_N14
\1kHz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~14_combout\ = (\1kHz|s_cnt\(7) & (!\1kHz|Add0~13\)) # (!\1kHz|s_cnt\(7) & ((\1kHz|Add0~13\) # (GND)))
-- \1kHz|Add0~15\ = CARRY((!\1kHz|Add0~13\) # (!\1kHz|s_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(7),
	datad => VCC,
	cin => \1kHz|Add0~13\,
	combout => \1kHz|Add0~14_combout\,
	cout => \1kHz|Add0~15\);

-- Location: FF_X57_Y70_N15
\1kHz|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(7));

-- Location: LCCOMB_X57_Y70_N16
\1kHz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~16_combout\ = (\1kHz|s_cnt\(8) & (\1kHz|Add0~15\ $ (GND))) # (!\1kHz|s_cnt\(8) & (!\1kHz|Add0~15\ & VCC))
-- \1kHz|Add0~17\ = CARRY((\1kHz|s_cnt\(8) & !\1kHz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(8),
	datad => VCC,
	cin => \1kHz|Add0~15\,
	combout => \1kHz|Add0~16_combout\,
	cout => \1kHz|Add0~17\);

-- Location: LCCOMB_X58_Y70_N20
\1kHz|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|s_cnt~0_combout\ = (\1kHz|Add0~16_combout\ & !\1kHz|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|Add0~16_combout\,
	datac => \1kHz|Equal0~4_combout\,
	combout => \1kHz|s_cnt~0_combout\);

-- Location: FF_X58_Y70_N21
\1kHz|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|s_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(8));

-- Location: LCCOMB_X58_Y70_N12
\1kHz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Equal0~1_combout\ = (!\1kHz|s_cnt\(5) & (\1kHz|s_cnt\(8) & (\1kHz|s_cnt\(6) & !\1kHz|s_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(5),
	datab => \1kHz|s_cnt\(8),
	datac => \1kHz|s_cnt\(6),
	datad => \1kHz|s_cnt\(7),
	combout => \1kHz|Equal0~1_combout\);

-- Location: LCCOMB_X57_Y70_N18
\1kHz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~18_combout\ = (\1kHz|s_cnt\(9) & (!\1kHz|Add0~17\)) # (!\1kHz|s_cnt\(9) & ((\1kHz|Add0~17\) # (GND)))
-- \1kHz|Add0~19\ = CARRY((!\1kHz|Add0~17\) # (!\1kHz|s_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(9),
	datad => VCC,
	cin => \1kHz|Add0~17\,
	combout => \1kHz|Add0~18_combout\,
	cout => \1kHz|Add0~19\);

-- Location: LCCOMB_X58_Y70_N6
\1kHz|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|s_cnt~2_combout\ = (!\1kHz|Equal0~4_combout\ & \1kHz|Add0~18_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1kHz|Equal0~4_combout\,
	datad => \1kHz|Add0~18_combout\,
	combout => \1kHz|s_cnt~2_combout\);

-- Location: FF_X58_Y70_N7
\1kHz|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|s_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(9));

-- Location: LCCOMB_X57_Y70_N20
\1kHz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~20_combout\ = (\1kHz|s_cnt\(10) & (\1kHz|Add0~19\ $ (GND))) # (!\1kHz|s_cnt\(10) & (!\1kHz|Add0~19\ & VCC))
-- \1kHz|Add0~21\ = CARRY((\1kHz|s_cnt\(10) & !\1kHz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(10),
	datad => VCC,
	cin => \1kHz|Add0~19\,
	combout => \1kHz|Add0~20_combout\,
	cout => \1kHz|Add0~21\);

-- Location: FF_X57_Y70_N21
\1kHz|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(10));

-- Location: LCCOMB_X57_Y70_N22
\1kHz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~22_combout\ = (\1kHz|s_cnt\(11) & (!\1kHz|Add0~21\)) # (!\1kHz|s_cnt\(11) & ((\1kHz|Add0~21\) # (GND)))
-- \1kHz|Add0~23\ = CARRY((!\1kHz|Add0~21\) # (!\1kHz|s_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(11),
	datad => VCC,
	cin => \1kHz|Add0~21\,
	combout => \1kHz|Add0~22_combout\,
	cout => \1kHz|Add0~23\);

-- Location: FF_X57_Y70_N23
\1kHz|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(11));

-- Location: LCCOMB_X58_Y70_N18
\1kHz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Equal0~2_combout\ = (\1kHz|s_cnt\(9) & (!\1kHz|s_cnt\(11) & (!\1kHz|s_cnt\(4) & !\1kHz|s_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(9),
	datab => \1kHz|s_cnt\(11),
	datac => \1kHz|s_cnt\(4),
	datad => \1kHz|s_cnt\(10),
	combout => \1kHz|Equal0~2_combout\);

-- Location: LCCOMB_X56_Y70_N4
\1kHz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Equal0~0_combout\ = (\1kHz|s_cnt\(3) & (\1kHz|s_cnt\(0) & (\1kHz|s_cnt\(2) & \1kHz|s_cnt\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(3),
	datab => \1kHz|s_cnt\(0),
	datac => \1kHz|s_cnt\(2),
	datad => \1kHz|s_cnt\(1),
	combout => \1kHz|Equal0~0_combout\);

-- Location: LCCOMB_X57_Y70_N24
\1kHz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~24_combout\ = (\1kHz|s_cnt\(12) & (\1kHz|Add0~23\ $ (GND))) # (!\1kHz|s_cnt\(12) & (!\1kHz|Add0~23\ & VCC))
-- \1kHz|Add0~25\ = CARRY((\1kHz|s_cnt\(12) & !\1kHz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(12),
	datad => VCC,
	cin => \1kHz|Add0~23\,
	combout => \1kHz|Add0~24_combout\,
	cout => \1kHz|Add0~25\);

-- Location: FF_X57_Y70_N25
\1kHz|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(12));

-- Location: LCCOMB_X57_Y70_N26
\1kHz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~26_combout\ = (\1kHz|s_cnt\(13) & (!\1kHz|Add0~25\)) # (!\1kHz|s_cnt\(13) & ((\1kHz|Add0~25\) # (GND)))
-- \1kHz|Add0~27\ = CARRY((!\1kHz|Add0~25\) # (!\1kHz|s_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(13),
	datad => VCC,
	cin => \1kHz|Add0~25\,
	combout => \1kHz|Add0~26_combout\,
	cout => \1kHz|Add0~27\);

-- Location: FF_X57_Y70_N27
\1kHz|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(13));

-- Location: LCCOMB_X57_Y70_N28
\1kHz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~28_combout\ = (\1kHz|s_cnt\(14) & (\1kHz|Add0~27\ $ (GND))) # (!\1kHz|s_cnt\(14) & (!\1kHz|Add0~27\ & VCC))
-- \1kHz|Add0~29\ = CARRY((\1kHz|s_cnt\(14) & !\1kHz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(14),
	datad => VCC,
	cin => \1kHz|Add0~27\,
	combout => \1kHz|Add0~28_combout\,
	cout => \1kHz|Add0~29\);

-- Location: LCCOMB_X58_Y70_N4
\1kHz|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|s_cnt~4_combout\ = (!\1kHz|Equal0~4_combout\ & \1kHz|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1kHz|Equal0~4_combout\,
	datad => \1kHz|Add0~28_combout\,
	combout => \1kHz|s_cnt~4_combout\);

-- Location: FF_X58_Y70_N5
\1kHz|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|s_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(14));

-- Location: LCCOMB_X57_Y70_N30
\1kHz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Add0~30_combout\ = \1kHz|Add0~29\ $ (\1kHz|s_cnt\(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \1kHz|s_cnt\(15),
	cin => \1kHz|Add0~29\,
	combout => \1kHz|Add0~30_combout\);

-- Location: LCCOMB_X58_Y70_N22
\1kHz|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|s_cnt~5_combout\ = (!\1kHz|Equal0~4_combout\ & \1kHz|Add0~30_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1kHz|Equal0~4_combout\,
	datad => \1kHz|Add0~30_combout\,
	combout => \1kHz|s_cnt~5_combout\);

-- Location: FF_X58_Y70_N23
\1kHz|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1kHz|s_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|s_cnt\(15));

-- Location: LCCOMB_X58_Y70_N24
\1kHz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Equal0~3_combout\ = (!\1kHz|s_cnt\(13) & (\1kHz|s_cnt\(14) & (\1kHz|s_cnt\(15) & !\1kHz|s_cnt\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(13),
	datab => \1kHz|s_cnt\(14),
	datac => \1kHz|s_cnt\(15),
	datad => \1kHz|s_cnt\(12),
	combout => \1kHz|Equal0~3_combout\);

-- Location: LCCOMB_X58_Y70_N14
\1kHz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1kHz|Equal0~4_combout\ = (\1kHz|Equal0~1_combout\ & (\1kHz|Equal0~2_combout\ & (\1kHz|Equal0~0_combout\ & \1kHz|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|Equal0~1_combout\,
	datab => \1kHz|Equal0~2_combout\,
	datac => \1kHz|Equal0~0_combout\,
	datad => \1kHz|Equal0~3_combout\,
	combout => \1kHz|Equal0~4_combout\);

-- Location: FF_X57_Y70_N31
\1kHz|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \1kHz|Equal0~4_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1kHz|pulse~q\);

-- Location: CLKCTRL_G10
\1kHz|pulse~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \1kHz|pulse~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \1kHz|pulse~clkctrl_outclk\);

-- Location: LCCOMB_X114_Y33_N2
\MEF|Add4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~0_combout\ = \MEF|points_A_int\(0) $ (VCC)
-- \MEF|Add4~1\ = CARRY(\MEF|points_A_int\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(0),
	datad => VCC,
	combout => \MEF|Add4~0_combout\,
	cout => \MEF|Add4~1\);

-- Location: LCCOMB_X113_Y33_N28
\MEF|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan0~0_combout\ = (!\MEF|points_A_int\(3) & (!\MEF|points_A_int\(4) & (!\MEF|points_A_int\(2) & !\MEF|points_A_int\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(3),
	datab => \MEF|points_A_int\(4),
	datac => \MEF|points_A_int\(2),
	datad => \MEF|points_A_int\(5),
	combout => \MEF|LessThan0~0_combout\);

-- Location: LCCOMB_X111_Y33_N28
\state|confirm_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|confirm_prev~0_combout\ = !\inst|s_key_prev~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|s_key_prev~q\,
	combout => \state|confirm_prev~0_combout\);

-- Location: IOIBUF_X115_Y53_N15
\KEY[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(1),
	o => \KEY[1]~input_o\);

-- Location: LCCOMB_X114_Y37_N4
\inst2|s_key_prev~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|s_key_prev~feeder_combout\ = \KEY[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[1]~input_o\,
	combout => \inst2|s_key_prev~feeder_combout\);

-- Location: FF_X114_Y37_N5
\inst2|s_key_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst2|s_key_prev~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|s_key_prev~q\);

-- Location: CLKCTRL_G5
\inst2|s_key_prev~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst2|s_key_prev~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst2|s_key_prev~clkctrl_outclk\);

-- Location: FF_X111_Y33_N29
\state|confirm_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \state|confirm_prev~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state|confirm_prev~q\);

-- Location: LCCOMB_X111_Y33_N10
\state|Selector2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|Selector2~0_combout\ = (!\state|confirm_prev~q\ & (!\inst|s_key_prev~q\ & \state|state.gameINFO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|confirm_prev~q\,
	datac => \inst|s_key_prev~q\,
	datad => \state|state.gameINFO~q\,
	combout => \state|Selector2~0_combout\);

-- Location: LCCOMB_X109_Y37_N0
\MEF|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add3~0_combout\ = \MEF|points_B_int\(1) $ (VCC)
-- \MEF|Add3~1\ = CARRY(\MEF|points_B_int\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(1),
	datad => VCC,
	combout => \MEF|Add3~0_combout\,
	cout => \MEF|Add3~1\);

-- Location: LCCOMB_X108_Y37_N8
\MEF|Add5~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~4_combout\ = (\MEF|points_B_int\(1) & (!\MEF|Add5~1\)) # (!\MEF|points_B_int\(1) & ((\MEF|Add5~1\) # (GND)))
-- \MEF|Add5~5\ = CARRY((!\MEF|Add5~1\) # (!\MEF|points_B_int\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(1),
	datad => VCC,
	cin => \MEF|Add5~1\,
	combout => \MEF|Add5~4_combout\,
	cout => \MEF|Add5~5\);

-- Location: LCCOMB_X108_Y37_N10
\MEF|Add5~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~6_combout\ = (\MEF|points_B_int\(2) & (\MEF|Add5~5\ $ (GND))) # (!\MEF|points_B_int\(2) & (!\MEF|Add5~5\ & VCC))
-- \MEF|Add5~7\ = CARRY((\MEF|points_B_int\(2) & !\MEF|Add5~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(2),
	datad => VCC,
	cin => \MEF|Add5~5\,
	combout => \MEF|Add5~6_combout\,
	cout => \MEF|Add5~7\);

-- Location: LCCOMB_X108_Y37_N12
\MEF|Add5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~8_combout\ = (\MEF|points_B_int\(3) & (!\MEF|Add5~7\)) # (!\MEF|points_B_int\(3) & ((\MEF|Add5~7\) # (GND)))
-- \MEF|Add5~9\ = CARRY((!\MEF|Add5~7\) # (!\MEF|points_B_int\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(3),
	datad => VCC,
	cin => \MEF|Add5~7\,
	combout => \MEF|Add5~8_combout\,
	cout => \MEF|Add5~9\);

-- Location: LCCOMB_X109_Y37_N2
\MEF|Add3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add3~3_combout\ = (\MEF|points_B_int\(2) & (\MEF|Add3~1\ & VCC)) # (!\MEF|points_B_int\(2) & (!\MEF|Add3~1\))
-- \MEF|Add3~4\ = CARRY((!\MEF|points_B_int\(2) & !\MEF|Add3~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(2),
	datad => VCC,
	cin => \MEF|Add3~1\,
	combout => \MEF|Add3~3_combout\,
	cout => \MEF|Add3~4\);

-- Location: LCCOMB_X109_Y37_N4
\MEF|Add3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add3~5_combout\ = (\MEF|points_B_int\(3) & ((GND) # (!\MEF|Add3~4\))) # (!\MEF|points_B_int\(3) & (\MEF|Add3~4\ $ (GND)))
-- \MEF|Add3~6\ = CARRY((\MEF|points_B_int\(3)) # (!\MEF|Add3~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(3),
	datad => VCC,
	cin => \MEF|Add3~4\,
	combout => \MEF|Add3~5_combout\,
	cout => \MEF|Add3~6\);

-- Location: IOIBUF_X115_Y35_N22
\KEY[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(3),
	o => \KEY[3]~input_o\);

-- Location: FF_X110_Y33_N5
\inst4|s_key_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \KEY[3]~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4|s_key_prev~q\);

-- Location: LCCOMB_X111_Y34_N0
\PLAYER_A|react_time[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[0]~13_combout\ = (\inst4|s_key_prev~q\ & (\PLAYER_A|react_time\(0) $ (VCC))) # (!\inst4|s_key_prev~q\ & (\PLAYER_A|react_time\(0) & VCC))
-- \PLAYER_A|react_time[0]~14\ = CARRY((\inst4|s_key_prev~q\ & \PLAYER_A|react_time\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|s_key_prev~q\,
	datab => \PLAYER_A|react_time\(0),
	datad => VCC,
	combout => \PLAYER_A|react_time[0]~13_combout\,
	cout => \PLAYER_A|react_time[0]~14\);

-- Location: LCCOMB_X109_Y32_N4
\inst25|timer[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[0]~15_combout\ = \inst25|timer\(0) $ (VCC)
-- \inst25|timer[0]~16\ = CARRY(\inst25|timer\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|timer\(0),
	datad => VCC,
	combout => \inst25|timer[0]~15_combout\,
	cout => \inst25|timer[0]~16\);

-- Location: LCCOMB_X110_Y33_N10
\inst25|start_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|start_prev~0_combout\ = !\inst|s_key_prev~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|s_key_prev~q\,
	combout => \inst25|start_prev~0_combout\);

-- Location: FF_X110_Y33_N11
\inst25|start_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|start_prev~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|start_prev~q\);

-- Location: LCCOMB_X110_Y33_N8
\inst25|start2_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|start2_prev~0_combout\ = !\inst4|s_key_prev~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|s_key_prev~q\,
	combout => \inst25|start2_prev~0_combout\);

-- Location: FF_X110_Y33_N9
\inst25|start2_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|start2_prev~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|start2_prev~q\);

-- Location: LCCOMB_X110_Y33_N18
\inst25|state.running~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.running~0_combout\ = (\inst25|start_prev~q\ & ((\inst25|start2_prev~q\) # ((\inst4|s_key_prev~q\)))) # (!\inst25|start_prev~q\ & (\inst|s_key_prev~q\ & ((\inst25|start2_prev~q\) # (\inst4|s_key_prev~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|start_prev~q\,
	datab => \inst25|start2_prev~q\,
	datac => \inst4|s_key_prev~q\,
	datad => \inst|s_key_prev~q\,
	combout => \inst25|state.running~0_combout\);

-- Location: LCCOMB_X110_Y32_N18
\inst25|state.running~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.running~1_combout\ = (\inst25|state.running~q\ & (\inst25|state.running~0_combout\ & !\inst25|Equal0~8_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|state.running~q\,
	datac => \inst25|state.running~0_combout\,
	datad => \inst25|Equal0~8_combout\,
	combout => \inst25|state.running~1_combout\);

-- Location: LCCOMB_X110_Y32_N4
\inst25|state.running~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.running~5_combout\ = (\state|state.game~q\ & (!\inst25|state.running~1_combout\ & ((\inst25|state.running~q\) # (\inst25|state.running~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datab => \inst25|state.running~q\,
	datac => \inst25|state.running~4_combout\,
	datad => \inst25|state.running~1_combout\,
	combout => \inst25|state.running~5_combout\);

-- Location: FF_X110_Y32_N27
\inst25|state.wait_response\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|state.wait_response~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \inst25|state.running~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|state.wait_response~q\);

-- Location: LCCOMB_X110_Y32_N0
\inst25|state.idle~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.idle~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst25|state.idle~feeder_combout\);

-- Location: FF_X110_Y32_N1
\inst25|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|state.idle~feeder_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \inst25|state.running~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|state.idle~q\);

-- Location: LCCOMB_X110_Y32_N10
\inst25|state.penalty~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.penalty~0_combout\ = (!\inst|s_key_prev~q\ & (\inst25|state.running~q\ & (!\inst25|start_prev~q\ & !\inst25|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_key_prev~q\,
	datab => \inst25|state.running~q\,
	datac => \inst25|start_prev~q\,
	datad => \inst25|Equal0~8_combout\,
	combout => \inst25|state.penalty~0_combout\);

-- Location: FF_X110_Y32_N11
\inst25|state.penalty\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|state.penalty~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \inst25|state.running~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|state.penalty~q\);

-- Location: LCCOMB_X109_Y33_N4
\inst25|penalty_timer2[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[0]~10_combout\ = \inst25|penalty_timer2\(0) $ (VCC)
-- \inst25|penalty_timer2[0]~11\ = CARRY(\inst25|penalty_timer2\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer2\(0),
	datad => VCC,
	combout => \inst25|penalty_timer2[0]~10_combout\,
	cout => \inst25|penalty_timer2[0]~11\);

-- Location: LCCOMB_X109_Y33_N30
\inst25|penalty_timer2[9]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[9]~22_combout\ = (\inst25|state.penalty2~q\ & \state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|state.penalty2~q\,
	datac => \state|state.game~q\,
	combout => \inst25|penalty_timer2[9]~22_combout\);

-- Location: FF_X109_Y33_N5
\inst25|penalty_timer2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[0]~10_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(0));

-- Location: LCCOMB_X109_Y33_N6
\inst25|penalty_timer2[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[1]~12_combout\ = (\inst25|penalty_timer2\(1) & (!\inst25|penalty_timer2[0]~11\)) # (!\inst25|penalty_timer2\(1) & ((\inst25|penalty_timer2[0]~11\) # (GND)))
-- \inst25|penalty_timer2[1]~13\ = CARRY((!\inst25|penalty_timer2[0]~11\) # (!\inst25|penalty_timer2\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer2\(1),
	datad => VCC,
	cin => \inst25|penalty_timer2[0]~11\,
	combout => \inst25|penalty_timer2[1]~12_combout\,
	cout => \inst25|penalty_timer2[1]~13\);

-- Location: FF_X109_Y33_N7
\inst25|penalty_timer2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[1]~12_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(1));

-- Location: LCCOMB_X109_Y33_N8
\inst25|penalty_timer2[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[2]~14_combout\ = (\inst25|penalty_timer2\(2) & (\inst25|penalty_timer2[1]~13\ $ (GND))) # (!\inst25|penalty_timer2\(2) & (!\inst25|penalty_timer2[1]~13\ & VCC))
-- \inst25|penalty_timer2[2]~15\ = CARRY((\inst25|penalty_timer2\(2) & !\inst25|penalty_timer2[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer2\(2),
	datad => VCC,
	cin => \inst25|penalty_timer2[1]~13\,
	combout => \inst25|penalty_timer2[2]~14_combout\,
	cout => \inst25|penalty_timer2[2]~15\);

-- Location: FF_X109_Y33_N9
\inst25|penalty_timer2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[2]~14_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(2));

-- Location: LCCOMB_X109_Y33_N10
\inst25|penalty_timer2[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[3]~16_combout\ = (\inst25|penalty_timer2\(3) & (!\inst25|penalty_timer2[2]~15\)) # (!\inst25|penalty_timer2\(3) & ((\inst25|penalty_timer2[2]~15\) # (GND)))
-- \inst25|penalty_timer2[3]~17\ = CARRY((!\inst25|penalty_timer2[2]~15\) # (!\inst25|penalty_timer2\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer2\(3),
	datad => VCC,
	cin => \inst25|penalty_timer2[2]~15\,
	combout => \inst25|penalty_timer2[3]~16_combout\,
	cout => \inst25|penalty_timer2[3]~17\);

-- Location: FF_X109_Y33_N11
\inst25|penalty_timer2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[3]~16_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(3));

-- Location: LCCOMB_X109_Y33_N12
\inst25|penalty_timer2[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[4]~18_combout\ = (\inst25|penalty_timer2\(4) & (\inst25|penalty_timer2[3]~17\ $ (GND))) # (!\inst25|penalty_timer2\(4) & (!\inst25|penalty_timer2[3]~17\ & VCC))
-- \inst25|penalty_timer2[4]~19\ = CARRY((\inst25|penalty_timer2\(4) & !\inst25|penalty_timer2[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer2\(4),
	datad => VCC,
	cin => \inst25|penalty_timer2[3]~17\,
	combout => \inst25|penalty_timer2[4]~18_combout\,
	cout => \inst25|penalty_timer2[4]~19\);

-- Location: FF_X109_Y33_N13
\inst25|penalty_timer2[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[4]~18_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(4));

-- Location: LCCOMB_X109_Y33_N14
\inst25|penalty_timer2[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[5]~20_combout\ = (\inst25|penalty_timer2\(5) & (!\inst25|penalty_timer2[4]~19\)) # (!\inst25|penalty_timer2\(5) & ((\inst25|penalty_timer2[4]~19\) # (GND)))
-- \inst25|penalty_timer2[5]~21\ = CARRY((!\inst25|penalty_timer2[4]~19\) # (!\inst25|penalty_timer2\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer2\(5),
	datad => VCC,
	cin => \inst25|penalty_timer2[4]~19\,
	combout => \inst25|penalty_timer2[5]~20_combout\,
	cout => \inst25|penalty_timer2[5]~21\);

-- Location: FF_X109_Y33_N15
\inst25|penalty_timer2[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[5]~20_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(5));

-- Location: LCCOMB_X109_Y33_N16
\inst25|penalty_timer2[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[6]~23_combout\ = (\inst25|penalty_timer2\(6) & (\inst25|penalty_timer2[5]~21\ $ (GND))) # (!\inst25|penalty_timer2\(6) & (!\inst25|penalty_timer2[5]~21\ & VCC))
-- \inst25|penalty_timer2[6]~24\ = CARRY((\inst25|penalty_timer2\(6) & !\inst25|penalty_timer2[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer2\(6),
	datad => VCC,
	cin => \inst25|penalty_timer2[5]~21\,
	combout => \inst25|penalty_timer2[6]~23_combout\,
	cout => \inst25|penalty_timer2[6]~24\);

-- Location: FF_X109_Y33_N17
\inst25|penalty_timer2[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[6]~23_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(6));

-- Location: LCCOMB_X109_Y33_N18
\inst25|penalty_timer2[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[7]~25_combout\ = (\inst25|penalty_timer2\(7) & (!\inst25|penalty_timer2[6]~24\)) # (!\inst25|penalty_timer2\(7) & ((\inst25|penalty_timer2[6]~24\) # (GND)))
-- \inst25|penalty_timer2[7]~26\ = CARRY((!\inst25|penalty_timer2[6]~24\) # (!\inst25|penalty_timer2\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer2\(7),
	datad => VCC,
	cin => \inst25|penalty_timer2[6]~24\,
	combout => \inst25|penalty_timer2[7]~25_combout\,
	cout => \inst25|penalty_timer2[7]~26\);

-- Location: FF_X109_Y33_N19
\inst25|penalty_timer2[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[7]~25_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(7));

-- Location: LCCOMB_X109_Y33_N20
\inst25|penalty_timer2[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[8]~27_combout\ = (\inst25|penalty_timer2\(8) & (\inst25|penalty_timer2[7]~26\ $ (GND))) # (!\inst25|penalty_timer2\(8) & (!\inst25|penalty_timer2[7]~26\ & VCC))
-- \inst25|penalty_timer2[8]~28\ = CARRY((\inst25|penalty_timer2\(8) & !\inst25|penalty_timer2[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer2\(8),
	datad => VCC,
	cin => \inst25|penalty_timer2[7]~26\,
	combout => \inst25|penalty_timer2[8]~27_combout\,
	cout => \inst25|penalty_timer2[8]~28\);

-- Location: FF_X109_Y33_N21
\inst25|penalty_timer2[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[8]~27_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(8));

-- Location: LCCOMB_X109_Y33_N22
\inst25|penalty_timer2[9]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer2[9]~29_combout\ = \inst25|penalty_timer2\(9) $ (\inst25|penalty_timer2[8]~28\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer2\(9),
	cin => \inst25|penalty_timer2[8]~28\,
	combout => \inst25|penalty_timer2[9]~29_combout\);

-- Location: FF_X109_Y33_N23
\inst25|penalty_timer2[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer2[9]~29_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan1~1_combout\,
	ena => \inst25|penalty_timer2[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer2\(9));

-- Location: LCCOMB_X109_Y33_N24
\inst25|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|LessThan1~0_combout\ = (\inst25|penalty_timer2\(6) & (\inst25|penalty_timer2\(5) & ((\inst25|penalty_timer2\(4)) # (\inst25|penalty_timer2\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer2\(4),
	datab => \inst25|penalty_timer2\(6),
	datac => \inst25|penalty_timer2\(5),
	datad => \inst25|penalty_timer2\(3),
	combout => \inst25|LessThan1~0_combout\);

-- Location: LCCOMB_X109_Y33_N26
\inst25|LessThan1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|LessThan1~1_combout\ = (\inst25|penalty_timer2\(9) & (\inst25|penalty_timer2\(7) & (\inst25|penalty_timer2\(8) & \inst25|LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer2\(9),
	datab => \inst25|penalty_timer2\(7),
	datac => \inst25|penalty_timer2\(8),
	datad => \inst25|LessThan1~0_combout\,
	combout => \inst25|LessThan1~1_combout\);

-- Location: LCCOMB_X108_Y33_N0
\inst25|penalty_timer[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[0]~10_combout\ = \inst25|penalty_timer\(0) $ (VCC)
-- \inst25|penalty_timer[0]~11\ = CARRY(\inst25|penalty_timer\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer\(0),
	datad => VCC,
	combout => \inst25|penalty_timer[0]~10_combout\,
	cout => \inst25|penalty_timer[0]~11\);

-- Location: LCCOMB_X110_Y33_N4
\inst25|penalty_timer[9]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[9]~22_combout\ = (\inst25|state.penalty~q\ & \state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|state.penalty~q\,
	datad => \state|state.game~q\,
	combout => \inst25|penalty_timer[9]~22_combout\);

-- Location: FF_X108_Y33_N1
\inst25|penalty_timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[0]~10_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(0));

-- Location: LCCOMB_X108_Y33_N2
\inst25|penalty_timer[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[1]~12_combout\ = (\inst25|penalty_timer\(1) & (!\inst25|penalty_timer[0]~11\)) # (!\inst25|penalty_timer\(1) & ((\inst25|penalty_timer[0]~11\) # (GND)))
-- \inst25|penalty_timer[1]~13\ = CARRY((!\inst25|penalty_timer[0]~11\) # (!\inst25|penalty_timer\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer\(1),
	datad => VCC,
	cin => \inst25|penalty_timer[0]~11\,
	combout => \inst25|penalty_timer[1]~12_combout\,
	cout => \inst25|penalty_timer[1]~13\);

-- Location: FF_X108_Y33_N3
\inst25|penalty_timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[1]~12_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(1));

-- Location: LCCOMB_X108_Y33_N4
\inst25|penalty_timer[2]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[2]~14_combout\ = (\inst25|penalty_timer\(2) & (\inst25|penalty_timer[1]~13\ $ (GND))) # (!\inst25|penalty_timer\(2) & (!\inst25|penalty_timer[1]~13\ & VCC))
-- \inst25|penalty_timer[2]~15\ = CARRY((\inst25|penalty_timer\(2) & !\inst25|penalty_timer[1]~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer\(2),
	datad => VCC,
	cin => \inst25|penalty_timer[1]~13\,
	combout => \inst25|penalty_timer[2]~14_combout\,
	cout => \inst25|penalty_timer[2]~15\);

-- Location: FF_X108_Y33_N5
\inst25|penalty_timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[2]~14_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(2));

-- Location: LCCOMB_X108_Y33_N6
\inst25|penalty_timer[3]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[3]~16_combout\ = (\inst25|penalty_timer\(3) & (!\inst25|penalty_timer[2]~15\)) # (!\inst25|penalty_timer\(3) & ((\inst25|penalty_timer[2]~15\) # (GND)))
-- \inst25|penalty_timer[3]~17\ = CARRY((!\inst25|penalty_timer[2]~15\) # (!\inst25|penalty_timer\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer\(3),
	datad => VCC,
	cin => \inst25|penalty_timer[2]~15\,
	combout => \inst25|penalty_timer[3]~16_combout\,
	cout => \inst25|penalty_timer[3]~17\);

-- Location: FF_X108_Y33_N7
\inst25|penalty_timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[3]~16_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(3));

-- Location: LCCOMB_X108_Y33_N8
\inst25|penalty_timer[4]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[4]~18_combout\ = (\inst25|penalty_timer\(4) & (\inst25|penalty_timer[3]~17\ $ (GND))) # (!\inst25|penalty_timer\(4) & (!\inst25|penalty_timer[3]~17\ & VCC))
-- \inst25|penalty_timer[4]~19\ = CARRY((\inst25|penalty_timer\(4) & !\inst25|penalty_timer[3]~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer\(4),
	datad => VCC,
	cin => \inst25|penalty_timer[3]~17\,
	combout => \inst25|penalty_timer[4]~18_combout\,
	cout => \inst25|penalty_timer[4]~19\);

-- Location: FF_X108_Y33_N9
\inst25|penalty_timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[4]~18_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(4));

-- Location: LCCOMB_X108_Y33_N10
\inst25|penalty_timer[5]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[5]~20_combout\ = (\inst25|penalty_timer\(5) & (!\inst25|penalty_timer[4]~19\)) # (!\inst25|penalty_timer\(5) & ((\inst25|penalty_timer[4]~19\) # (GND)))
-- \inst25|penalty_timer[5]~21\ = CARRY((!\inst25|penalty_timer[4]~19\) # (!\inst25|penalty_timer\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer\(5),
	datad => VCC,
	cin => \inst25|penalty_timer[4]~19\,
	combout => \inst25|penalty_timer[5]~20_combout\,
	cout => \inst25|penalty_timer[5]~21\);

-- Location: FF_X108_Y33_N11
\inst25|penalty_timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[5]~20_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(5));

-- Location: LCCOMB_X108_Y33_N12
\inst25|penalty_timer[6]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[6]~23_combout\ = (\inst25|penalty_timer\(6) & (\inst25|penalty_timer[5]~21\ $ (GND))) # (!\inst25|penalty_timer\(6) & (!\inst25|penalty_timer[5]~21\ & VCC))
-- \inst25|penalty_timer[6]~24\ = CARRY((\inst25|penalty_timer\(6) & !\inst25|penalty_timer[5]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer\(6),
	datad => VCC,
	cin => \inst25|penalty_timer[5]~21\,
	combout => \inst25|penalty_timer[6]~23_combout\,
	cout => \inst25|penalty_timer[6]~24\);

-- Location: FF_X108_Y33_N13
\inst25|penalty_timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[6]~23_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(6));

-- Location: LCCOMB_X108_Y33_N14
\inst25|penalty_timer[7]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[7]~25_combout\ = (\inst25|penalty_timer\(7) & (!\inst25|penalty_timer[6]~24\)) # (!\inst25|penalty_timer\(7) & ((\inst25|penalty_timer[6]~24\) # (GND)))
-- \inst25|penalty_timer[7]~26\ = CARRY((!\inst25|penalty_timer[6]~24\) # (!\inst25|penalty_timer\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer\(7),
	datad => VCC,
	cin => \inst25|penalty_timer[6]~24\,
	combout => \inst25|penalty_timer[7]~25_combout\,
	cout => \inst25|penalty_timer[7]~26\);

-- Location: FF_X108_Y33_N15
\inst25|penalty_timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[7]~25_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(7));

-- Location: LCCOMB_X108_Y33_N16
\inst25|penalty_timer[8]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[8]~27_combout\ = (\inst25|penalty_timer\(8) & (\inst25|penalty_timer[7]~26\ $ (GND))) # (!\inst25|penalty_timer\(8) & (!\inst25|penalty_timer[7]~26\ & VCC))
-- \inst25|penalty_timer[8]~28\ = CARRY((\inst25|penalty_timer\(8) & !\inst25|penalty_timer[7]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|penalty_timer\(8),
	datad => VCC,
	cin => \inst25|penalty_timer[7]~26\,
	combout => \inst25|penalty_timer[8]~27_combout\,
	cout => \inst25|penalty_timer[8]~28\);

-- Location: FF_X108_Y33_N17
\inst25|penalty_timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[8]~27_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(8));

-- Location: LCCOMB_X108_Y33_N18
\inst25|penalty_timer[9]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|penalty_timer[9]~29_combout\ = \inst25|penalty_timer[8]~28\ $ (\inst25|penalty_timer\(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst25|penalty_timer\(9),
	cin => \inst25|penalty_timer[8]~28\,
	combout => \inst25|penalty_timer[9]~29_combout\);

-- Location: FF_X108_Y33_N19
\inst25|penalty_timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|penalty_timer[9]~29_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|LessThan0~1_combout\,
	ena => \inst25|penalty_timer[9]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|penalty_timer\(9));

-- Location: LCCOMB_X108_Y33_N28
\inst25|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|LessThan0~0_combout\ = (\inst25|penalty_timer\(6) & (\inst25|penalty_timer\(5) & ((\inst25|penalty_timer\(4)) # (\inst25|penalty_timer\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer\(6),
	datab => \inst25|penalty_timer\(4),
	datac => \inst25|penalty_timer\(5),
	datad => \inst25|penalty_timer\(3),
	combout => \inst25|LessThan0~0_combout\);

-- Location: LCCOMB_X108_Y33_N22
\inst25|LessThan0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|LessThan0~1_combout\ = (\inst25|penalty_timer\(9) & (\inst25|penalty_timer\(8) & (\inst25|penalty_timer\(7) & \inst25|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|penalty_timer\(9),
	datab => \inst25|penalty_timer\(8),
	datac => \inst25|penalty_timer\(7),
	datad => \inst25|LessThan0~0_combout\,
	combout => \inst25|LessThan0~1_combout\);

-- Location: LCCOMB_X110_Y33_N28
\inst25|Selector27~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector27~0_combout\ = (\inst25|state.penalty2~q\ & (\inst25|LessThan1~1_combout\ & ((\inst25|LessThan0~1_combout\) # (!\inst25|state.penalty~q\)))) # (!\inst25|state.penalty2~q\ & (((\inst25|LessThan0~1_combout\)) # (!\inst25|state.penalty~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.penalty2~q\,
	datab => \inst25|state.penalty~q\,
	datac => \inst25|LessThan1~1_combout\,
	datad => \inst25|LessThan0~1_combout\,
	combout => \inst25|Selector27~0_combout\);

-- Location: LCCOMB_X110_Y32_N6
\inst25|Selector27~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector27~1_combout\ = (!\inst25|state.running~q\ & (\inst25|Selector27~0_combout\ & ((\inst25|state.idle~q\) # (!\inst25|state.running~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.running~q\,
	datab => \inst25|state.idle~q\,
	datac => \inst25|state.running~0_combout\,
	datad => \inst25|Selector27~0_combout\,
	combout => \inst25|Selector27~1_combout\);

-- Location: LCCOMB_X110_Y32_N12
\inst25|Selector27~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector27~2_combout\ = (\inst25|player2_responded~q\ & (((!\inst25|player1_responded~q\ & \inst25|state.wait_response~q\)) # (!\inst25|Selector27~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|player1_responded~q\,
	datab => \inst25|player2_responded~q\,
	datac => \inst25|state.wait_response~q\,
	datad => \inst25|Selector27~1_combout\,
	combout => \inst25|Selector27~2_combout\);

-- Location: LCCOMB_X110_Y32_N28
\inst25|Selector27~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector27~3_combout\ = (\inst25|Selector27~2_combout\) # ((!\inst4|s_key_prev~q\ & (\inst25|state.wait_response~q\ & !\inst25|player2_responded~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst4|s_key_prev~q\,
	datab => \inst25|state.wait_response~q\,
	datac => \inst25|player2_responded~q\,
	datad => \inst25|Selector27~2_combout\,
	combout => \inst25|Selector27~3_combout\);

-- Location: FF_X110_Y32_N29
\inst25|player2_responded\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Selector27~3_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|player2_responded~q\);

-- Location: LCCOMB_X110_Y32_N2
\inst25|Selector26~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector26~0_combout\ = (\inst25|player1_responded~q\ & (((!\inst25|player2_responded~q\ & \inst25|state.wait_response~q\)) # (!\inst25|Selector27~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|player1_responded~q\,
	datab => \inst25|player2_responded~q\,
	datac => \inst25|state.wait_response~q\,
	datad => \inst25|Selector27~1_combout\,
	combout => \inst25|Selector26~0_combout\);

-- Location: LCCOMB_X110_Y32_N30
\inst25|Selector26~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector26~1_combout\ = (\inst25|Selector26~0_combout\) # ((!\inst|s_key_prev~q\ & (\inst25|state.wait_response~q\ & !\inst25|player1_responded~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_key_prev~q\,
	datab => \inst25|state.wait_response~q\,
	datac => \inst25|player1_responded~q\,
	datad => \inst25|Selector26~0_combout\,
	combout => \inst25|Selector26~1_combout\);

-- Location: FF_X110_Y32_N31
\inst25|player1_responded\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Selector26~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|player1_responded~q\);

-- Location: LCCOMB_X110_Y32_N24
\inst25|state.running~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.running~3_combout\ = (\inst25|player1_responded~q\ & (\inst25|state.wait_response~q\ & \inst25|player2_responded~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|player1_responded~q\,
	datab => \inst25|state.wait_response~q\,
	datad => \inst25|player2_responded~q\,
	combout => \inst25|state.running~3_combout\);

-- Location: LCCOMB_X109_Y33_N28
\inst25|state.running~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.running~2_combout\ = (!\inst25|state.wait_response~q\ & ((\inst25|state.penalty2~q\ & (\inst25|LessThan1~1_combout\)) # (!\inst25|state.penalty2~q\ & ((\inst25|LessThan0~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.wait_response~q\,
	datab => \inst25|state.penalty2~q\,
	datac => \inst25|LessThan1~1_combout\,
	datad => \inst25|LessThan0~1_combout\,
	combout => \inst25|state.running~2_combout\);

-- Location: LCCOMB_X110_Y32_N22
\inst25|state.running~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.running~4_combout\ = (\inst25|state.idle~q\ & ((\inst25|state.running~3_combout\) # ((\inst25|state.running~2_combout\)))) # (!\inst25|state.idle~q\ & (((!\inst25|state.running~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.running~3_combout\,
	datab => \inst25|state.idle~q\,
	datac => \inst25|state.running~2_combout\,
	datad => \inst25|state.running~0_combout\,
	combout => \inst25|state.running~4_combout\);

-- Location: LCCOMB_X109_Y32_N2
\inst25|timer[12]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[12]~41_combout\ = (\state|state.game~q\ & ((\inst25|state.running~q\ & (!\inst25|Equal0~8_combout\)) # (!\inst25|state.running~q\ & ((\inst25|state.running~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datab => \inst25|state.running~q\,
	datac => \inst25|Equal0~8_combout\,
	datad => \inst25|state.running~4_combout\,
	combout => \inst25|timer[12]~41_combout\);

-- Location: FF_X109_Y32_N5
\inst25|timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[0]~15_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(0));

-- Location: LCCOMB_X109_Y32_N6
\inst25|timer[1]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[1]~17_combout\ = (\inst25|timer\(1) & (!\inst25|timer[0]~16\)) # (!\inst25|timer\(1) & ((\inst25|timer[0]~16\) # (GND)))
-- \inst25|timer[1]~18\ = CARRY((!\inst25|timer[0]~16\) # (!\inst25|timer\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(1),
	datad => VCC,
	cin => \inst25|timer[0]~16\,
	combout => \inst25|timer[1]~17_combout\,
	cout => \inst25|timer[1]~18\);

-- Location: FF_X109_Y32_N7
\inst25|timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[1]~17_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(1));

-- Location: LCCOMB_X109_Y32_N8
\inst25|timer[2]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[2]~19_combout\ = (\inst25|timer\(2) & (\inst25|timer[1]~18\ $ (GND))) # (!\inst25|timer\(2) & (!\inst25|timer[1]~18\ & VCC))
-- \inst25|timer[2]~20\ = CARRY((\inst25|timer\(2) & !\inst25|timer[1]~18\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|timer\(2),
	datad => VCC,
	cin => \inst25|timer[1]~18\,
	combout => \inst25|timer[2]~19_combout\,
	cout => \inst25|timer[2]~20\);

-- Location: FF_X109_Y32_N9
\inst25|timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[2]~19_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(2));

-- Location: LCCOMB_X109_Y32_N10
\inst25|timer[3]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[3]~21_combout\ = (\inst25|timer\(3) & (!\inst25|timer[2]~20\)) # (!\inst25|timer\(3) & ((\inst25|timer[2]~20\) # (GND)))
-- \inst25|timer[3]~22\ = CARRY((!\inst25|timer[2]~20\) # (!\inst25|timer\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(3),
	datad => VCC,
	cin => \inst25|timer[2]~20\,
	combout => \inst25|timer[3]~21_combout\,
	cout => \inst25|timer[3]~22\);

-- Location: FF_X109_Y32_N11
\inst25|timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[3]~21_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(3));

-- Location: LCCOMB_X109_Y32_N12
\inst25|timer[4]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[4]~23_combout\ = (\inst25|timer\(4) & (\inst25|timer[3]~22\ $ (GND))) # (!\inst25|timer\(4) & (!\inst25|timer[3]~22\ & VCC))
-- \inst25|timer[4]~24\ = CARRY((\inst25|timer\(4) & !\inst25|timer[3]~22\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(4),
	datad => VCC,
	cin => \inst25|timer[3]~22\,
	combout => \inst25|timer[4]~23_combout\,
	cout => \inst25|timer[4]~24\);

-- Location: FF_X109_Y32_N13
\inst25|timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[4]~23_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(4));

-- Location: LCCOMB_X109_Y32_N14
\inst25|timer[5]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[5]~25_combout\ = (\inst25|timer\(5) & (!\inst25|timer[4]~24\)) # (!\inst25|timer\(5) & ((\inst25|timer[4]~24\) # (GND)))
-- \inst25|timer[5]~26\ = CARRY((!\inst25|timer[4]~24\) # (!\inst25|timer\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|timer\(5),
	datad => VCC,
	cin => \inst25|timer[4]~24\,
	combout => \inst25|timer[5]~25_combout\,
	cout => \inst25|timer[5]~26\);

-- Location: FF_X109_Y32_N15
\inst25|timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[5]~25_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(5));

-- Location: LCCOMB_X109_Y32_N16
\inst25|timer[6]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[6]~27_combout\ = (\inst25|timer\(6) & (\inst25|timer[5]~26\ $ (GND))) # (!\inst25|timer\(6) & (!\inst25|timer[5]~26\ & VCC))
-- \inst25|timer[6]~28\ = CARRY((\inst25|timer\(6) & !\inst25|timer[5]~26\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|timer\(6),
	datad => VCC,
	cin => \inst25|timer[5]~26\,
	combout => \inst25|timer[6]~27_combout\,
	cout => \inst25|timer[6]~28\);

-- Location: FF_X109_Y32_N17
\inst25|timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[6]~27_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(6));

-- Location: LCCOMB_X109_Y32_N18
\inst25|timer[7]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[7]~29_combout\ = (\inst25|timer\(7) & (!\inst25|timer[6]~28\)) # (!\inst25|timer\(7) & ((\inst25|timer[6]~28\) # (GND)))
-- \inst25|timer[7]~30\ = CARRY((!\inst25|timer[6]~28\) # (!\inst25|timer\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|timer\(7),
	datad => VCC,
	cin => \inst25|timer[6]~28\,
	combout => \inst25|timer[7]~29_combout\,
	cout => \inst25|timer[7]~30\);

-- Location: FF_X109_Y32_N19
\inst25|timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[7]~29_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(7));

-- Location: LCCOMB_X109_Y32_N20
\inst25|timer[8]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[8]~31_combout\ = (\inst25|timer\(8) & (\inst25|timer[7]~30\ $ (GND))) # (!\inst25|timer\(8) & (!\inst25|timer[7]~30\ & VCC))
-- \inst25|timer[8]~32\ = CARRY((\inst25|timer\(8) & !\inst25|timer[7]~30\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|timer\(8),
	datad => VCC,
	cin => \inst25|timer[7]~30\,
	combout => \inst25|timer[8]~31_combout\,
	cout => \inst25|timer[8]~32\);

-- Location: FF_X109_Y32_N21
\inst25|timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[8]~31_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(8));

-- Location: LCCOMB_X107_Y33_N16
\inst24|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~16_combout\ = (\inst24|temp\(8) & (!\inst24|Add0~15\ & VCC)) # (!\inst24|temp\(8) & (\inst24|Add0~15\ $ (GND)))
-- \inst24|Add0~17\ = CARRY((!\inst24|temp\(8) & !\inst24|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(8),
	datad => VCC,
	cin => \inst24|Add0~15\,
	combout => \inst24|Add0~16_combout\,
	cout => \inst24|Add0~17\);

-- Location: LCCOMB_X107_Y33_N18
\inst24|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~18_combout\ = (\inst24|temp\(9) & ((\inst24|Add0~17\) # (GND))) # (!\inst24|temp\(9) & (!\inst24|Add0~17\))
-- \inst24|Add0~19\ = CARRY((\inst24|temp\(9)) # (!\inst24|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(9),
	datad => VCC,
	cin => \inst24|Add0~17\,
	combout => \inst24|Add0~18_combout\,
	cout => \inst24|Add0~19\);

-- Location: LCCOMB_X108_Y33_N20
\inst24|temp[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp[9]~9_combout\ = !\inst24|Add0~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|Add0~18_combout\,
	combout => \inst24|temp[9]~9_combout\);

-- Location: FF_X108_Y33_N21
\inst24|temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|temp[9]~9_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(9));

-- Location: LCCOMB_X107_Y33_N20
\inst24|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~20_combout\ = (\inst24|temp\(10) & (\inst24|Add0~19\ $ (GND))) # (!\inst24|temp\(10) & (!\inst24|Add0~19\ & VCC))
-- \inst24|Add0~21\ = CARRY((\inst24|temp\(10) & !\inst24|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(10),
	datad => VCC,
	cin => \inst24|Add0~19\,
	combout => \inst24|Add0~20_combout\,
	cout => \inst24|Add0~21\);

-- Location: FF_X107_Y33_N21
\inst24|temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~20_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(10));

-- Location: LCCOMB_X107_Y33_N22
\inst24|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~22_combout\ = (\inst24|temp\(11) & (!\inst24|Add0~21\)) # (!\inst24|temp\(11) & ((\inst24|Add0~21\) # (GND)))
-- \inst24|Add0~23\ = CARRY((!\inst24|Add0~21\) # (!\inst24|temp\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(11),
	datad => VCC,
	cin => \inst24|Add0~21\,
	combout => \inst24|Add0~22_combout\,
	cout => \inst24|Add0~23\);

-- Location: FF_X107_Y33_N23
\inst24|temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~22_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(11));

-- Location: LCCOMB_X107_Y33_N24
\inst24|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~24_combout\ = (\inst24|temp\(12) & (\inst24|Add0~23\ $ (GND))) # (!\inst24|temp\(12) & (!\inst24|Add0~23\ & VCC))
-- \inst24|Add0~25\ = CARRY((\inst24|temp\(12) & !\inst24|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(12),
	datad => VCC,
	cin => \inst24|Add0~23\,
	combout => \inst24|Add0~24_combout\,
	cout => \inst24|Add0~25\);

-- Location: LCCOMB_X110_Y33_N22
\inst24|temp~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp~3_combout\ = (!\inst24|Equal0~10_combout\ & \inst24|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst24|Equal0~10_combout\,
	datad => \inst24|Add0~24_combout\,
	combout => \inst24|temp~3_combout\);

-- Location: FF_X110_Y33_N23
\inst24|temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|temp~3_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(12));

-- Location: LCCOMB_X107_Y33_N26
\inst24|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~26_combout\ = (\inst24|temp\(13) & (!\inst24|Add0~25\)) # (!\inst24|temp\(13) & ((\inst24|Add0~25\) # (GND)))
-- \inst24|Add0~27\ = CARRY((!\inst24|Add0~25\) # (!\inst24|temp\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(13),
	datad => VCC,
	cin => \inst24|Add0~25\,
	combout => \inst24|Add0~26_combout\,
	cout => \inst24|Add0~27\);

-- Location: FF_X107_Y33_N27
\inst24|temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~26_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(13));

-- Location: LCCOMB_X107_Y33_N28
\inst24|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~28_combout\ = (\inst24|temp\(14) & (\inst24|Add0~27\ $ (GND))) # (!\inst24|temp\(14) & (!\inst24|Add0~27\ & VCC))
-- \inst24|Add0~29\ = CARRY((\inst24|temp\(14) & !\inst24|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(14),
	datad => VCC,
	cin => \inst24|Add0~27\,
	combout => \inst24|Add0~28_combout\,
	cout => \inst24|Add0~29\);

-- Location: FF_X107_Y33_N29
\inst24|temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~28_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(14));

-- Location: LCCOMB_X107_Y33_N30
\inst24|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~30_combout\ = (\inst24|temp\(15) & (!\inst24|Add0~29\)) # (!\inst24|temp\(15) & ((\inst24|Add0~29\) # (GND)))
-- \inst24|Add0~31\ = CARRY((!\inst24|Add0~29\) # (!\inst24|temp\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(15),
	datad => VCC,
	cin => \inst24|Add0~29\,
	combout => \inst24|Add0~30_combout\,
	cout => \inst24|Add0~31\);

-- Location: FF_X107_Y33_N31
\inst24|temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~30_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(15));

-- Location: LCCOMB_X107_Y32_N0
\inst24|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~32_combout\ = (\inst24|temp\(16) & (\inst24|Add0~31\ $ (GND))) # (!\inst24|temp\(16) & (!\inst24|Add0~31\ & VCC))
-- \inst24|Add0~33\ = CARRY((\inst24|temp\(16) & !\inst24|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(16),
	datad => VCC,
	cin => \inst24|Add0~31\,
	combout => \inst24|Add0~32_combout\,
	cout => \inst24|Add0~33\);

-- Location: FF_X107_Y32_N1
\inst24|temp[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~32_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(16));

-- Location: LCCOMB_X107_Y32_N2
\inst24|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~34_combout\ = (\inst24|temp\(17) & (!\inst24|Add0~33\)) # (!\inst24|temp\(17) & ((\inst24|Add0~33\) # (GND)))
-- \inst24|Add0~35\ = CARRY((!\inst24|Add0~33\) # (!\inst24|temp\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(17),
	datad => VCC,
	cin => \inst24|Add0~33\,
	combout => \inst24|Add0~34_combout\,
	cout => \inst24|Add0~35\);

-- Location: FF_X107_Y32_N3
\inst24|temp[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~34_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(17));

-- Location: LCCOMB_X107_Y32_N4
\inst24|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~36_combout\ = (\inst24|temp\(18) & (\inst24|Add0~35\ $ (GND))) # (!\inst24|temp\(18) & (!\inst24|Add0~35\ & VCC))
-- \inst24|Add0~37\ = CARRY((\inst24|temp\(18) & !\inst24|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(18),
	datad => VCC,
	cin => \inst24|Add0~35\,
	combout => \inst24|Add0~36_combout\,
	cout => \inst24|Add0~37\);

-- Location: FF_X107_Y32_N5
\inst24|temp[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~36_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(18));

-- Location: LCCOMB_X107_Y32_N6
\inst24|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~38_combout\ = (\inst24|temp\(19) & (!\inst24|Add0~37\)) # (!\inst24|temp\(19) & ((\inst24|Add0~37\) # (GND)))
-- \inst24|Add0~39\ = CARRY((!\inst24|Add0~37\) # (!\inst24|temp\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(19),
	datad => VCC,
	cin => \inst24|Add0~37\,
	combout => \inst24|Add0~38_combout\,
	cout => \inst24|Add0~39\);

-- Location: FF_X107_Y32_N7
\inst24|temp[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~38_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(19));

-- Location: LCCOMB_X107_Y32_N8
\inst24|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~40_combout\ = (\inst24|temp\(20) & (\inst24|Add0~39\ $ (GND))) # (!\inst24|temp\(20) & (!\inst24|Add0~39\ & VCC))
-- \inst24|Add0~41\ = CARRY((\inst24|temp\(20) & !\inst24|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(20),
	datad => VCC,
	cin => \inst24|Add0~39\,
	combout => \inst24|Add0~40_combout\,
	cout => \inst24|Add0~41\);

-- Location: FF_X107_Y32_N9
\inst24|temp[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~40_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(20));

-- Location: LCCOMB_X107_Y32_N10
\inst24|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~42_combout\ = (\inst24|temp\(21) & (!\inst24|Add0~41\)) # (!\inst24|temp\(21) & ((\inst24|Add0~41\) # (GND)))
-- \inst24|Add0~43\ = CARRY((!\inst24|Add0~41\) # (!\inst24|temp\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(21),
	datad => VCC,
	cin => \inst24|Add0~41\,
	combout => \inst24|Add0~42_combout\,
	cout => \inst24|Add0~43\);

-- Location: FF_X107_Y32_N11
\inst24|temp[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~42_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(21));

-- Location: LCCOMB_X107_Y32_N12
\inst24|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~44_combout\ = (\inst24|temp\(22) & (\inst24|Add0~43\ $ (GND))) # (!\inst24|temp\(22) & (!\inst24|Add0~43\ & VCC))
-- \inst24|Add0~45\ = CARRY((\inst24|temp\(22) & !\inst24|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(22),
	datad => VCC,
	cin => \inst24|Add0~43\,
	combout => \inst24|Add0~44_combout\,
	cout => \inst24|Add0~45\);

-- Location: FF_X107_Y32_N13
\inst24|temp[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~44_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(22));

-- Location: LCCOMB_X107_Y32_N14
\inst24|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~46_combout\ = (\inst24|temp\(23) & (!\inst24|Add0~45\)) # (!\inst24|temp\(23) & ((\inst24|Add0~45\) # (GND)))
-- \inst24|Add0~47\ = CARRY((!\inst24|Add0~45\) # (!\inst24|temp\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(23),
	datad => VCC,
	cin => \inst24|Add0~45\,
	combout => \inst24|Add0~46_combout\,
	cout => \inst24|Add0~47\);

-- Location: FF_X107_Y32_N15
\inst24|temp[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~46_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(23));

-- Location: LCCOMB_X107_Y32_N16
\inst24|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~48_combout\ = (\inst24|temp\(24) & (\inst24|Add0~47\ $ (GND))) # (!\inst24|temp\(24) & (!\inst24|Add0~47\ & VCC))
-- \inst24|Add0~49\ = CARRY((\inst24|temp\(24) & !\inst24|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(24),
	datad => VCC,
	cin => \inst24|Add0~47\,
	combout => \inst24|Add0~48_combout\,
	cout => \inst24|Add0~49\);

-- Location: FF_X107_Y32_N17
\inst24|temp[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~48_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(24));

-- Location: LCCOMB_X107_Y32_N18
\inst24|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~50_combout\ = (\inst24|temp\(25) & (!\inst24|Add0~49\)) # (!\inst24|temp\(25) & ((\inst24|Add0~49\) # (GND)))
-- \inst24|Add0~51\ = CARRY((!\inst24|Add0~49\) # (!\inst24|temp\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(25),
	datad => VCC,
	cin => \inst24|Add0~49\,
	combout => \inst24|Add0~50_combout\,
	cout => \inst24|Add0~51\);

-- Location: FF_X107_Y32_N19
\inst24|temp[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~50_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(25));

-- Location: LCCOMB_X107_Y32_N20
\inst24|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~52_combout\ = (\inst24|temp\(26) & (\inst24|Add0~51\ $ (GND))) # (!\inst24|temp\(26) & (!\inst24|Add0~51\ & VCC))
-- \inst24|Add0~53\ = CARRY((\inst24|temp\(26) & !\inst24|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(26),
	datad => VCC,
	cin => \inst24|Add0~51\,
	combout => \inst24|Add0~52_combout\,
	cout => \inst24|Add0~53\);

-- Location: FF_X107_Y32_N21
\inst24|temp[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~52_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(26));

-- Location: LCCOMB_X107_Y32_N22
\inst24|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~54_combout\ = (\inst24|temp\(27) & (!\inst24|Add0~53\)) # (!\inst24|temp\(27) & ((\inst24|Add0~53\) # (GND)))
-- \inst24|Add0~55\ = CARRY((!\inst24|Add0~53\) # (!\inst24|temp\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(27),
	datad => VCC,
	cin => \inst24|Add0~53\,
	combout => \inst24|Add0~54_combout\,
	cout => \inst24|Add0~55\);

-- Location: FF_X107_Y32_N23
\inst24|temp[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~54_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(27));

-- Location: LCCOMB_X108_Y32_N2
\inst24|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~7_combout\ = (!\inst24|temp\(26) & !\inst24|temp\(27))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(26),
	datad => \inst24|temp\(27),
	combout => \inst24|Equal0~7_combout\);

-- Location: LCCOMB_X107_Y32_N24
\inst24|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~56_combout\ = (\inst24|temp\(28) & (\inst24|Add0~55\ $ (GND))) # (!\inst24|temp\(28) & (!\inst24|Add0~55\ & VCC))
-- \inst24|Add0~57\ = CARRY((\inst24|temp\(28) & !\inst24|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(28),
	datad => VCC,
	cin => \inst24|Add0~55\,
	combout => \inst24|Add0~56_combout\,
	cout => \inst24|Add0~57\);

-- Location: FF_X107_Y32_N25
\inst24|temp[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~56_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(28));

-- Location: LCCOMB_X107_Y32_N26
\inst24|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~58_combout\ = (\inst24|temp\(29) & (!\inst24|Add0~57\)) # (!\inst24|temp\(29) & ((\inst24|Add0~57\) # (GND)))
-- \inst24|Add0~59\ = CARRY((!\inst24|Add0~57\) # (!\inst24|temp\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(29),
	datad => VCC,
	cin => \inst24|Add0~57\,
	combout => \inst24|Add0~58_combout\,
	cout => \inst24|Add0~59\);

-- Location: FF_X107_Y32_N27
\inst24|temp[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~58_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(29));

-- Location: LCCOMB_X107_Y32_N28
\inst24|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~60_combout\ = (\inst24|temp\(30) & (\inst24|Add0~59\ $ (GND))) # (!\inst24|temp\(30) & (!\inst24|Add0~59\ & VCC))
-- \inst24|Add0~61\ = CARRY((\inst24|temp\(30) & !\inst24|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(30),
	datad => VCC,
	cin => \inst24|Add0~59\,
	combout => \inst24|Add0~60_combout\,
	cout => \inst24|Add0~61\);

-- Location: FF_X107_Y32_N29
\inst24|temp[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~60_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(30));

-- Location: LCCOMB_X107_Y32_N30
\inst24|Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~62_combout\ = \inst24|temp\(31) $ (\inst24|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(31),
	cin => \inst24|Add0~61\,
	combout => \inst24|Add0~62_combout\);

-- Location: FF_X107_Y32_N31
\inst24|temp[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~62_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(31));

-- Location: LCCOMB_X108_Y32_N24
\inst24|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~8_combout\ = (!\inst24|temp\(30) & (!\inst24|temp\(31) & (!\inst24|temp\(29) & !\inst24|temp\(28))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(30),
	datab => \inst24|temp\(31),
	datac => \inst24|temp\(29),
	datad => \inst24|temp\(28),
	combout => \inst24|Equal0~8_combout\);

-- Location: LCCOMB_X108_Y32_N6
\inst24|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~9_combout\ = (!\inst24|temp\(24) & (\inst24|Equal0~7_combout\ & (!\inst24|temp\(25) & \inst24|Equal0~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(24),
	datab => \inst24|Equal0~7_combout\,
	datac => \inst24|temp\(25),
	datad => \inst24|Equal0~8_combout\,
	combout => \inst24|Equal0~9_combout\);

-- Location: LCCOMB_X111_Y32_N0
\inst24|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~6_combout\ = (!\inst24|temp\(21) & (!\inst24|temp\(23) & (!\inst24|temp\(22) & !\inst24|temp\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(21),
	datab => \inst24|temp\(23),
	datac => \inst24|temp\(22),
	datad => \inst24|temp\(20),
	combout => \inst24|Equal0~6_combout\);

-- Location: LCCOMB_X107_Y31_N24
\inst24|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~5_combout\ = (!\inst24|temp\(16) & (!\inst24|temp\(18) & (!\inst24|temp\(17) & !\inst24|temp\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(16),
	datab => \inst24|temp\(18),
	datac => \inst24|temp\(17),
	datad => \inst24|temp\(19),
	combout => \inst24|Equal0~5_combout\);

-- Location: LCCOMB_X107_Y33_N0
\inst24|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~0_combout\ = \inst24|temp\(0) $ (VCC)
-- \inst24|Add0~1\ = CARRY(\inst24|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(0),
	datad => VCC,
	combout => \inst24|Add0~0_combout\,
	cout => \inst24|Add0~1\);

-- Location: LCCOMB_X110_Y33_N16
\inst24|temp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp~0_combout\ = (!\inst24|Equal0~10_combout\ & \inst24|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst24|Equal0~10_combout\,
	datad => \inst24|Add0~0_combout\,
	combout => \inst24|temp~0_combout\);

-- Location: FF_X110_Y33_N17
\inst24|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|temp~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(0));

-- Location: LCCOMB_X107_Y33_N2
\inst24|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~2_combout\ = (\inst24|temp\(1) & (!\inst24|Add0~1\)) # (!\inst24|temp\(1) & ((\inst24|Add0~1\) # (GND)))
-- \inst24|Add0~3\ = CARRY((!\inst24|Add0~1\) # (!\inst24|temp\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(1),
	datad => VCC,
	cin => \inst24|Add0~1\,
	combout => \inst24|Add0~2_combout\,
	cout => \inst24|Add0~3\);

-- Location: FF_X107_Y33_N3
\inst24|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~2_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(1));

-- Location: LCCOMB_X107_Y33_N4
\inst24|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~4_combout\ = (\inst24|temp\(2) & (\inst24|Add0~3\ $ (GND))) # (!\inst24|temp\(2) & (!\inst24|Add0~3\ & VCC))
-- \inst24|Add0~5\ = CARRY((\inst24|temp\(2) & !\inst24|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(2),
	datad => VCC,
	cin => \inst24|Add0~3\,
	combout => \inst24|Add0~4_combout\,
	cout => \inst24|Add0~5\);

-- Location: FF_X107_Y33_N5
\inst24|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~4_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(2));

-- Location: LCCOMB_X107_Y33_N6
\inst24|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~6_combout\ = (\inst24|temp\(3) & ((\inst24|Add0~5\) # (GND))) # (!\inst24|temp\(3) & (!\inst24|Add0~5\))
-- \inst24|Add0~7\ = CARRY((\inst24|temp\(3)) # (!\inst24|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(3),
	datad => VCC,
	cin => \inst24|Add0~5\,
	combout => \inst24|Add0~6_combout\,
	cout => \inst24|Add0~7\);

-- Location: LCCOMB_X106_Y33_N16
\inst24|temp[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp[3]~4_combout\ = !\inst24|Add0~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|Add0~6_combout\,
	combout => \inst24|temp[3]~4_combout\);

-- Location: FF_X107_Y33_N17
\inst24|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp[3]~4_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(3));

-- Location: LCCOMB_X107_Y33_N8
\inst24|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~8_combout\ = (\inst24|temp\(4) & (\inst24|Add0~7\ $ (GND))) # (!\inst24|temp\(4) & (!\inst24|Add0~7\ & VCC))
-- \inst24|Add0~9\ = CARRY((\inst24|temp\(4) & !\inst24|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(4),
	datad => VCC,
	cin => \inst24|Add0~7\,
	combout => \inst24|Add0~8_combout\,
	cout => \inst24|Add0~9\);

-- Location: FF_X107_Y33_N9
\inst24|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|Add0~8_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(4));

-- Location: LCCOMB_X107_Y33_N10
\inst24|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~10_combout\ = (\inst24|temp\(5) & ((\inst24|Add0~9\) # (GND))) # (!\inst24|temp\(5) & (!\inst24|Add0~9\))
-- \inst24|Add0~11\ = CARRY((\inst24|temp\(5)) # (!\inst24|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(5),
	datad => VCC,
	cin => \inst24|Add0~9\,
	combout => \inst24|Add0~10_combout\,
	cout => \inst24|Add0~11\);

-- Location: LCCOMB_X110_Y33_N2
\inst24|temp~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp~1_combout\ = \inst24|Equal0~10_combout\ $ (!\inst24|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst24|Equal0~10_combout\,
	datad => \inst24|Add0~10_combout\,
	combout => \inst24|temp~1_combout\);

-- Location: FF_X110_Y33_N3
\inst24|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|temp~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(5));

-- Location: LCCOMB_X110_Y33_N12
\inst24|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~1_combout\ = (!\inst24|temp\(7) & (\inst24|temp\(6) & (!\inst24|temp\(4) & \inst24|temp\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(7),
	datab => \inst24|temp\(6),
	datac => \inst24|temp\(4),
	datad => \inst24|temp\(5),
	combout => \inst24|Equal0~1_combout\);

-- Location: LCCOMB_X108_Y33_N26
\inst24|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~2_combout\ = (!\inst24|temp\(9) & (!\inst24|temp\(10) & (!\inst24|temp\(8) & !\inst24|temp\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(9),
	datab => \inst24|temp\(10),
	datac => \inst24|temp\(8),
	datad => \inst24|temp\(11),
	combout => \inst24|Equal0~2_combout\);

-- Location: LCCOMB_X110_Y33_N26
\inst24|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~3_combout\ = (\inst24|temp\(12) & (!\inst24|temp\(15) & (!\inst24|temp\(14) & !\inst24|temp\(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(12),
	datab => \inst24|temp\(15),
	datac => \inst24|temp\(14),
	datad => \inst24|temp\(13),
	combout => \inst24|Equal0~3_combout\);

-- Location: LCCOMB_X110_Y33_N6
\inst24|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~0_combout\ = (!\inst24|temp\(1) & (!\inst24|temp\(2) & (!\inst24|temp\(3) & !\inst24|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|temp\(1),
	datab => \inst24|temp\(2),
	datac => \inst24|temp\(3),
	datad => \inst24|temp\(0),
	combout => \inst24|Equal0~0_combout\);

-- Location: LCCOMB_X110_Y33_N20
\inst24|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~4_combout\ = (\inst24|Equal0~1_combout\ & (\inst24|Equal0~2_combout\ & (\inst24|Equal0~3_combout\ & \inst24|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|Equal0~1_combout\,
	datab => \inst24|Equal0~2_combout\,
	datac => \inst24|Equal0~3_combout\,
	datad => \inst24|Equal0~0_combout\,
	combout => \inst24|Equal0~4_combout\);

-- Location: LCCOMB_X110_Y33_N30
\inst24|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Equal0~10_combout\ = (\inst24|Equal0~9_combout\ & (\inst24|Equal0~6_combout\ & (\inst24|Equal0~5_combout\ & \inst24|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst24|Equal0~9_combout\,
	datab => \inst24|Equal0~6_combout\,
	datac => \inst24|Equal0~5_combout\,
	datad => \inst24|Equal0~4_combout\,
	combout => \inst24|Equal0~10_combout\);

-- Location: LCCOMB_X107_Y33_N12
\inst24|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~12_combout\ = (\inst24|temp\(6) & (!\inst24|Add0~11\ & VCC)) # (!\inst24|temp\(6) & (\inst24|Add0~11\ $ (GND)))
-- \inst24|Add0~13\ = CARRY((!\inst24|temp\(6) & !\inst24|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(6),
	datad => VCC,
	cin => \inst24|Add0~11\,
	combout => \inst24|Add0~12_combout\,
	cout => \inst24|Add0~13\);

-- Location: LCCOMB_X110_Y33_N24
\inst24|temp~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp~2_combout\ = \inst24|Equal0~10_combout\ $ (!\inst24|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst24|Equal0~10_combout\,
	datad => \inst24|Add0~12_combout\,
	combout => \inst24|temp~2_combout\);

-- Location: FF_X110_Y33_N25
\inst24|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|temp~2_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(6));

-- Location: LCCOMB_X107_Y33_N14
\inst24|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|Add0~14_combout\ = (\inst24|temp\(7) & ((\inst24|Add0~13\) # (GND))) # (!\inst24|temp\(7) & (!\inst24|Add0~13\))
-- \inst24|Add0~15\ = CARRY((\inst24|temp\(7)) # (!\inst24|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst24|temp\(7),
	datad => VCC,
	cin => \inst24|Add0~13\,
	combout => \inst24|Add0~14_combout\,
	cout => \inst24|Add0~15\);

-- Location: LCCOMB_X108_Y33_N24
\inst24|temp[7]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp[7]~7_combout\ = !\inst24|Add0~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|Add0~14_combout\,
	combout => \inst24|temp[7]~7_combout\);

-- Location: FF_X108_Y33_N25
\inst24|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|temp[7]~7_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(7));

-- Location: LCCOMB_X108_Y33_N30
\inst24|temp[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst24|temp[8]~8_combout\ = !\inst24|Add0~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst24|Add0~16_combout\,
	combout => \inst24|temp[8]~8_combout\);

-- Location: FF_X108_Y33_N31
\inst24|temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst24|temp[8]~8_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst24|temp\(8));

-- Location: LCCOMB_X109_Y33_N2
\inst25|Don[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[12]~0_combout\ = (\inst25|state.idle~q\ & (!\inst25|state.running~2_combout\ & (!\inst25|state.running~3_combout\))) # (!\inst25|state.idle~q\ & (((\inst25|state.running~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.idle~q\,
	datab => \inst25|state.running~2_combout\,
	datac => \inst25|state.running~3_combout\,
	datad => \inst25|state.running~0_combout\,
	combout => \inst25|Don[12]~0_combout\);

-- Location: LCCOMB_X109_Y33_N0
\inst25|Don[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[12]~1_combout\ = (!\inst25|state.running~q\ & (\state|state.game~q\ & (\inst2|s_key_prev~q\ & !\inst25|Don[12]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.running~q\,
	datab => \state|state.game~q\,
	datac => \inst2|s_key_prev~q\,
	datad => \inst25|Don[12]~0_combout\,
	combout => \inst25|Don[12]~1_combout\);

-- Location: FF_X108_Y32_N3
\inst25|Don[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp\(8),
	sload => VCC,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(8));

-- Location: FF_X108_Y32_N9
\inst25|Don[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp\(9),
	sload => VCC,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(9));

-- Location: LCCOMB_X109_Y32_N22
\inst25|timer[9]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[9]~33_combout\ = (\inst25|timer\(9) & (!\inst25|timer[8]~32\)) # (!\inst25|timer\(9) & ((\inst25|timer[8]~32\) # (GND)))
-- \inst25|timer[9]~34\ = CARRY((!\inst25|timer[8]~32\) # (!\inst25|timer\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(9),
	datad => VCC,
	cin => \inst25|timer[8]~32\,
	combout => \inst25|timer[9]~33_combout\,
	cout => \inst25|timer[9]~34\);

-- Location: FF_X109_Y32_N23
\inst25|timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[9]~33_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(9));

-- Location: LCCOMB_X108_Y32_N8
\inst25|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~5_combout\ = (\inst25|timer\(8) & (!\inst25|Don\(8) & (\inst25|Don\(9) $ (\inst25|timer\(9))))) # (!\inst25|timer\(8) & (\inst25|Don\(8) & (\inst25|Don\(9) $ (\inst25|timer\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(8),
	datab => \inst25|Don\(8),
	datac => \inst25|Don\(9),
	datad => \inst25|timer\(9),
	combout => \inst25|Equal0~5_combout\);

-- Location: LCCOMB_X109_Y32_N24
\inst25|timer[10]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[10]~35_combout\ = (\inst25|timer\(10) & (\inst25|timer[9]~34\ $ (GND))) # (!\inst25|timer\(10) & (!\inst25|timer[9]~34\ & VCC))
-- \inst25|timer[10]~36\ = CARRY((\inst25|timer\(10) & !\inst25|timer[9]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst25|timer\(10),
	datad => VCC,
	cin => \inst25|timer[9]~34\,
	combout => \inst25|timer[10]~35_combout\,
	cout => \inst25|timer[10]~36\);

-- Location: FF_X109_Y32_N25
\inst25|timer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[10]~35_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(10));

-- Location: LCCOMB_X108_Y32_N16
\inst25|Don[11]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[11]~feeder_combout\ = \inst24|temp\(11)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|temp\(11),
	combout => \inst25|Don[11]~feeder_combout\);

-- Location: FF_X108_Y32_N17
\inst25|Don[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Don[11]~feeder_combout\,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(11));

-- Location: FF_X108_Y32_N31
\inst25|Don[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp\(10),
	sload => VCC,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(10));

-- Location: LCCOMB_X109_Y32_N26
\inst25|timer[11]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[11]~37_combout\ = (\inst25|timer\(11) & (!\inst25|timer[10]~36\)) # (!\inst25|timer\(11) & ((\inst25|timer[10]~36\) # (GND)))
-- \inst25|timer[11]~38\ = CARRY((!\inst25|timer[10]~36\) # (!\inst25|timer\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(11),
	datad => VCC,
	cin => \inst25|timer[10]~36\,
	combout => \inst25|timer[11]~37_combout\,
	cout => \inst25|timer[11]~38\);

-- Location: FF_X109_Y32_N27
\inst25|timer[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[11]~37_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(11));

-- Location: LCCOMB_X108_Y32_N30
\inst25|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~6_combout\ = (\inst25|timer\(10) & (\inst25|Don\(10) & (\inst25|Don\(11) $ (!\inst25|timer\(11))))) # (!\inst25|timer\(10) & (!\inst25|Don\(10) & (\inst25|Don\(11) $ (!\inst25|timer\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(10),
	datab => \inst25|Don\(11),
	datac => \inst25|Don\(10),
	datad => \inst25|timer\(11),
	combout => \inst25|Equal0~6_combout\);

-- Location: LCCOMB_X109_Y32_N0
\inst25|Don[12]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[12]~4_combout\ = !\inst24|temp\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|temp\(12),
	combout => \inst25|Don[12]~4_combout\);

-- Location: FF_X109_Y32_N1
\inst25|Don[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Don[12]~4_combout\,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(12));

-- Location: LCCOMB_X109_Y32_N28
\inst25|timer[12]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|timer[12]~39_combout\ = \inst25|timer[11]~38\ $ (!\inst25|timer\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst25|timer\(12),
	cin => \inst25|timer[11]~38\,
	combout => \inst25|timer[12]~39_combout\);

-- Location: FF_X109_Y32_N29
\inst25|timer[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|timer[12]~39_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \inst25|ALT_INV_state.running~q\,
	ena => \inst25|timer[12]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|timer\(12));

-- Location: LCCOMB_X108_Y32_N26
\inst25|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~7_combout\ = \inst25|Don\(12) $ (!\inst25|timer\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst25|Don\(12),
	datad => \inst25|timer\(12),
	combout => \inst25|Equal0~7_combout\);

-- Location: LCCOMB_X108_Y32_N12
\inst25|Don[6]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[6]~3_combout\ = !\inst24|temp\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|temp\(6),
	combout => \inst25|Don[6]~3_combout\);

-- Location: FF_X108_Y32_N13
\inst25|Don[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Don[6]~3_combout\,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(6));

-- Location: FF_X108_Y32_N23
\inst25|Don[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp\(7),
	sload => VCC,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(7));

-- Location: LCCOMB_X108_Y32_N22
\inst25|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~3_combout\ = (\inst25|Don\(6) & (\inst25|timer\(6) & (\inst25|timer\(7) $ (\inst25|Don\(7))))) # (!\inst25|Don\(6) & (!\inst25|timer\(6) & (\inst25|timer\(7) $ (\inst25|Don\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|Don\(6),
	datab => \inst25|timer\(7),
	datac => \inst25|Don\(7),
	datad => \inst25|timer\(6),
	combout => \inst25|Equal0~3_combout\);

-- Location: LCCOMB_X108_Y32_N18
\inst25|Don[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[1]~feeder_combout\ = \inst24|temp\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst24|temp\(1),
	combout => \inst25|Don[1]~feeder_combout\);

-- Location: FF_X108_Y32_N19
\inst25|Don[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Don[1]~feeder_combout\,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(1));

-- Location: FF_X108_Y32_N5
\inst25|Don[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp\(0),
	sload => VCC,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(0));

-- Location: LCCOMB_X108_Y32_N4
\inst25|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~0_combout\ = (\inst25|timer\(1) & (\inst25|Don\(1) & (\inst25|Don\(0) $ (!\inst25|timer\(0))))) # (!\inst25|timer\(1) & (!\inst25|Don\(1) & (\inst25|Don\(0) $ (!\inst25|timer\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(1),
	datab => \inst25|Don\(1),
	datac => \inst25|Don\(0),
	datad => \inst25|timer\(0),
	combout => \inst25|Equal0~0_combout\);

-- Location: FF_X108_Y32_N15
\inst25|Don[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp\(3),
	sload => VCC,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(3));

-- Location: LCCOMB_X108_Y32_N28
\inst25|Don[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[2]~feeder_combout\ = \inst24|temp\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|temp\(2),
	combout => \inst25|Don[2]~feeder_combout\);

-- Location: FF_X108_Y32_N29
\inst25|Don[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Don[2]~feeder_combout\,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(2));

-- Location: LCCOMB_X108_Y32_N14
\inst25|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~1_combout\ = (\inst25|timer\(3) & (!\inst25|Don\(3) & (\inst25|timer\(2) $ (!\inst25|Don\(2))))) # (!\inst25|timer\(3) & (\inst25|Don\(3) & (\inst25|timer\(2) $ (!\inst25|Don\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|timer\(3),
	datab => \inst25|timer\(2),
	datac => \inst25|Don\(3),
	datad => \inst25|Don\(2),
	combout => \inst25|Equal0~1_combout\);

-- Location: LCCOMB_X108_Y32_N10
\inst25|Don[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Don[5]~2_combout\ = !\inst24|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst24|temp\(5),
	combout => \inst25|Don[5]~2_combout\);

-- Location: FF_X108_Y32_N11
\inst25|Don[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Don[5]~2_combout\,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(5));

-- Location: FF_X108_Y32_N1
\inst25|Don[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst24|temp\(4),
	sload => VCC,
	ena => \inst25|Don[12]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|Don\(4));

-- Location: LCCOMB_X108_Y32_N0
\inst25|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~2_combout\ = (\inst25|Don\(5) & (\inst25|timer\(5) & (\inst25|Don\(4) $ (!\inst25|timer\(4))))) # (!\inst25|Don\(5) & (!\inst25|timer\(5) & (\inst25|Don\(4) $ (!\inst25|timer\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|Don\(5),
	datab => \inst25|timer\(5),
	datac => \inst25|Don\(4),
	datad => \inst25|timer\(4),
	combout => \inst25|Equal0~2_combout\);

-- Location: LCCOMB_X108_Y32_N20
\inst25|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~4_combout\ = (\inst25|Equal0~3_combout\ & (\inst25|Equal0~0_combout\ & (\inst25|Equal0~1_combout\ & \inst25|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|Equal0~3_combout\,
	datab => \inst25|Equal0~0_combout\,
	datac => \inst25|Equal0~1_combout\,
	datad => \inst25|Equal0~2_combout\,
	combout => \inst25|Equal0~4_combout\);

-- Location: LCCOMB_X109_Y32_N30
\inst25|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Equal0~8_combout\ = (\inst25|Equal0~5_combout\ & (\inst25|Equal0~6_combout\ & (!\inst25|Equal0~7_combout\ & \inst25|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|Equal0~5_combout\,
	datab => \inst25|Equal0~6_combout\,
	datac => \inst25|Equal0~7_combout\,
	datad => \inst25|Equal0~4_combout\,
	combout => \inst25|Equal0~8_combout\);

-- Location: LCCOMB_X110_Y32_N26
\inst25|state.wait_response~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.wait_response~0_combout\ = (\inst25|state.running~q\ & \inst25|Equal0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|state.running~q\,
	datad => \inst25|Equal0~8_combout\,
	combout => \inst25|state.wait_response~0_combout\);

-- Location: LCCOMB_X110_Y32_N14
\inst25|Selector28~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector28~0_combout\ = (\inst25|player1_responded~q\ & ((\inst25|player2_responded~q\) # ((\inst4|s_key_prev~q\)))) # (!\inst25|player1_responded~q\ & (\inst|s_key_prev~q\ & ((\inst25|player2_responded~q\) # (\inst4|s_key_prev~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|player1_responded~q\,
	datab => \inst25|player2_responded~q\,
	datac => \inst4|s_key_prev~q\,
	datad => \inst|s_key_prev~q\,
	combout => \inst25|Selector28~0_combout\);

-- Location: LCCOMB_X110_Y32_N8
\inst25|Selector28~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector28~1_combout\ = (\inst25|state.penalty~q\) # ((\inst25|state.wait_response~q\ & \inst25|Selector28~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.wait_response~q\,
	datab => \inst25|Selector28~0_combout\,
	datad => \inst25|state.penalty~q\,
	combout => \inst25|Selector28~1_combout\);

-- Location: LCCOMB_X110_Y33_N14
\inst25|Selector28~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector28~2_combout\ = (\inst25|state.penalty2~q\) # ((\inst25|state.running~0_combout\ & ((\inst25|state.running~q\) # (!\inst25|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.penalty2~q\,
	datab => \inst25|state.running~0_combout\,
	datac => \inst25|state.idle~q\,
	datad => \inst25|state.running~q\,
	combout => \inst25|Selector28~2_combout\);

-- Location: LCCOMB_X110_Y32_N20
\inst25|Selector28~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|Selector28~3_combout\ = (\inst25|state.wait_response~0_combout\) # ((\inst25|enable_signal~q\ & ((\inst25|Selector28~1_combout\) # (\inst25|Selector28~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|state.wait_response~0_combout\,
	datab => \inst25|Selector28~1_combout\,
	datac => \inst25|enable_signal~q\,
	datad => \inst25|Selector28~2_combout\,
	combout => \inst25|Selector28~3_combout\);

-- Location: FF_X110_Y32_N21
\inst25|enable_signal\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|Selector28~3_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|state.game~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|enable_signal~q\);

-- Location: LCCOMB_X110_Y35_N28
\PLAYER_A|state[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|state[1]~0_combout\ = (\inst4|s_key_prev~q\ & ((\PLAYER_A|state\(0)) # ((!\PLAYER_A|state\(1) & \inst25|enable_signal~q\)))) # (!\inst4|s_key_prev~q\ & (((\PLAYER_A|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|state\(0),
	datab => \PLAYER_A|state\(1),
	datac => \inst25|enable_signal~q\,
	datad => \inst4|s_key_prev~q\,
	combout => \PLAYER_A|state[1]~0_combout\);

-- Location: LCCOMB_X110_Y35_N6
\PLAYER_A|state[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|state[0]~1_combout\ = (\state|state.game~q\ & ((\PLAYER_A|state\(0) & ((!\PLAYER_A|state[1]~0_combout\))) # (!\PLAYER_A|state\(0) & (!\PLAYER_A|state\(1) & \PLAYER_A|state[1]~0_combout\)))) # (!\state|state.game~q\ & (((\PLAYER_A|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datab => \PLAYER_A|state\(1),
	datac => \PLAYER_A|state\(0),
	datad => \PLAYER_A|state[1]~0_combout\,
	combout => \PLAYER_A|state[0]~1_combout\);

-- Location: FF_X110_Y35_N7
\PLAYER_A|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|state[0]~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|state\(0));

-- Location: LCCOMB_X110_Y35_N30
\PLAYER_A|state[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|state[1]~2_combout\ = (\PLAYER_A|state[1]~0_combout\ & ((\PLAYER_A|state\(1) & ((!\state|state.game~q\))) # (!\PLAYER_A|state\(1) & (\PLAYER_A|state\(0) & \state|state.game~q\)))) # (!\PLAYER_A|state[1]~0_combout\ & (((\PLAYER_A|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|state\(0),
	datab => \PLAYER_A|state[1]~0_combout\,
	datac => \PLAYER_A|state\(1),
	datad => \state|state.game~q\,
	combout => \PLAYER_A|state[1]~2_combout\);

-- Location: FF_X110_Y35_N31
\PLAYER_A|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|state[1]~2_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|state\(1));

-- Location: LCCOMB_X111_Y34_N30
\PLAYER_A|react_time[0]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[0]~39_combout\ = (\PLAYER_A|state\(1)) # ((\inst25|enable_signal~q\ & \inst4|s_key_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|enable_signal~q\,
	datac => \PLAYER_A|state\(1),
	datad => \inst4|s_key_prev~q\,
	combout => \PLAYER_A|react_time[0]~39_combout\);

-- Location: LCCOMB_X111_Y34_N28
\PLAYER_A|react_time[0]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[0]~40_combout\ = (\state|state.game~q\ & (\PLAYER_A|react_time[0]~39_combout\ & !\PLAYER_A|state\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datac => \PLAYER_A|react_time[0]~39_combout\,
	datad => \PLAYER_A|state\(0),
	combout => \PLAYER_A|react_time[0]~40_combout\);

-- Location: FF_X111_Y34_N1
\PLAYER_A|react_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[0]~13_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(0));

-- Location: LCCOMB_X111_Y34_N2
\PLAYER_A|react_time[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[1]~15_combout\ = (\PLAYER_A|react_time\(1) & (!\PLAYER_A|react_time[0]~14\)) # (!\PLAYER_A|react_time\(1) & ((\PLAYER_A|react_time[0]~14\) # (GND)))
-- \PLAYER_A|react_time[1]~16\ = CARRY((!\PLAYER_A|react_time[0]~14\) # (!\PLAYER_A|react_time\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_A|react_time\(1),
	datad => VCC,
	cin => \PLAYER_A|react_time[0]~14\,
	combout => \PLAYER_A|react_time[1]~15_combout\,
	cout => \PLAYER_A|react_time[1]~16\);

-- Location: FF_X111_Y34_N3
\PLAYER_A|react_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[1]~15_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(1));

-- Location: LCCOMB_X111_Y34_N4
\PLAYER_A|react_time[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[2]~17_combout\ = (\PLAYER_A|react_time\(2) & (\PLAYER_A|react_time[1]~16\ $ (GND))) # (!\PLAYER_A|react_time\(2) & (!\PLAYER_A|react_time[1]~16\ & VCC))
-- \PLAYER_A|react_time[2]~18\ = CARRY((\PLAYER_A|react_time\(2) & !\PLAYER_A|react_time[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_A|react_time\(2),
	datad => VCC,
	cin => \PLAYER_A|react_time[1]~16\,
	combout => \PLAYER_A|react_time[2]~17_combout\,
	cout => \PLAYER_A|react_time[2]~18\);

-- Location: FF_X111_Y34_N5
\PLAYER_A|react_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[2]~17_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(2));

-- Location: LCCOMB_X111_Y34_N6
\PLAYER_A|react_time[3]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[3]~19_combout\ = (\PLAYER_A|react_time\(3) & (!\PLAYER_A|react_time[2]~18\)) # (!\PLAYER_A|react_time\(3) & ((\PLAYER_A|react_time[2]~18\) # (GND)))
-- \PLAYER_A|react_time[3]~20\ = CARRY((!\PLAYER_A|react_time[2]~18\) # (!\PLAYER_A|react_time\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|react_time\(3),
	datad => VCC,
	cin => \PLAYER_A|react_time[2]~18\,
	combout => \PLAYER_A|react_time[3]~19_combout\,
	cout => \PLAYER_A|react_time[3]~20\);

-- Location: FF_X111_Y34_N7
\PLAYER_A|react_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[3]~19_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(3));

-- Location: LCCOMB_X111_Y34_N8
\PLAYER_A|react_time[4]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[4]~21_combout\ = (\PLAYER_A|react_time\(4) & (\PLAYER_A|react_time[3]~20\ $ (GND))) # (!\PLAYER_A|react_time\(4) & (!\PLAYER_A|react_time[3]~20\ & VCC))
-- \PLAYER_A|react_time[4]~22\ = CARRY((\PLAYER_A|react_time\(4) & !\PLAYER_A|react_time[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_A|react_time\(4),
	datad => VCC,
	cin => \PLAYER_A|react_time[3]~20\,
	combout => \PLAYER_A|react_time[4]~21_combout\,
	cout => \PLAYER_A|react_time[4]~22\);

-- Location: FF_X111_Y34_N9
\PLAYER_A|react_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[4]~21_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(4));

-- Location: LCCOMB_X111_Y34_N10
\PLAYER_A|react_time[5]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[5]~23_combout\ = (\PLAYER_A|react_time\(5) & (!\PLAYER_A|react_time[4]~22\)) # (!\PLAYER_A|react_time\(5) & ((\PLAYER_A|react_time[4]~22\) # (GND)))
-- \PLAYER_A|react_time[5]~24\ = CARRY((!\PLAYER_A|react_time[4]~22\) # (!\PLAYER_A|react_time\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|react_time\(5),
	datad => VCC,
	cin => \PLAYER_A|react_time[4]~22\,
	combout => \PLAYER_A|react_time[5]~23_combout\,
	cout => \PLAYER_A|react_time[5]~24\);

-- Location: FF_X111_Y34_N11
\PLAYER_A|react_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[5]~23_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(5));

-- Location: LCCOMB_X111_Y34_N12
\PLAYER_A|react_time[6]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[6]~25_combout\ = (\PLAYER_A|react_time\(6) & (\PLAYER_A|react_time[5]~24\ $ (GND))) # (!\PLAYER_A|react_time\(6) & (!\PLAYER_A|react_time[5]~24\ & VCC))
-- \PLAYER_A|react_time[6]~26\ = CARRY((\PLAYER_A|react_time\(6) & !\PLAYER_A|react_time[5]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|react_time\(6),
	datad => VCC,
	cin => \PLAYER_A|react_time[5]~24\,
	combout => \PLAYER_A|react_time[6]~25_combout\,
	cout => \PLAYER_A|react_time[6]~26\);

-- Location: FF_X111_Y34_N13
\PLAYER_A|react_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[6]~25_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(6));

-- Location: LCCOMB_X111_Y34_N14
\PLAYER_A|react_time[7]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[7]~27_combout\ = (\PLAYER_A|react_time\(7) & (!\PLAYER_A|react_time[6]~26\)) # (!\PLAYER_A|react_time\(7) & ((\PLAYER_A|react_time[6]~26\) # (GND)))
-- \PLAYER_A|react_time[7]~28\ = CARRY((!\PLAYER_A|react_time[6]~26\) # (!\PLAYER_A|react_time\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_A|react_time\(7),
	datad => VCC,
	cin => \PLAYER_A|react_time[6]~26\,
	combout => \PLAYER_A|react_time[7]~27_combout\,
	cout => \PLAYER_A|react_time[7]~28\);

-- Location: FF_X111_Y34_N15
\PLAYER_A|react_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[7]~27_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(7));

-- Location: LCCOMB_X111_Y34_N16
\PLAYER_A|react_time[8]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[8]~29_combout\ = (\PLAYER_A|react_time\(8) & (\PLAYER_A|react_time[7]~28\ $ (GND))) # (!\PLAYER_A|react_time\(8) & (!\PLAYER_A|react_time[7]~28\ & VCC))
-- \PLAYER_A|react_time[8]~30\ = CARRY((\PLAYER_A|react_time\(8) & !\PLAYER_A|react_time[7]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_A|react_time\(8),
	datad => VCC,
	cin => \PLAYER_A|react_time[7]~28\,
	combout => \PLAYER_A|react_time[8]~29_combout\,
	cout => \PLAYER_A|react_time[8]~30\);

-- Location: FF_X111_Y34_N17
\PLAYER_A|react_time[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[8]~29_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(8));

-- Location: LCCOMB_X111_Y34_N18
\PLAYER_A|react_time[9]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[9]~31_combout\ = (\PLAYER_A|react_time\(9) & (!\PLAYER_A|react_time[8]~30\)) # (!\PLAYER_A|react_time\(9) & ((\PLAYER_A|react_time[8]~30\) # (GND)))
-- \PLAYER_A|react_time[9]~32\ = CARRY((!\PLAYER_A|react_time[8]~30\) # (!\PLAYER_A|react_time\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_A|react_time\(9),
	datad => VCC,
	cin => \PLAYER_A|react_time[8]~30\,
	combout => \PLAYER_A|react_time[9]~31_combout\,
	cout => \PLAYER_A|react_time[9]~32\);

-- Location: FF_X111_Y34_N19
\PLAYER_A|react_time[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[9]~31_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(9));

-- Location: LCCOMB_X111_Y34_N20
\PLAYER_A|react_time[10]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[10]~33_combout\ = (\PLAYER_A|react_time\(10) & (\PLAYER_A|react_time[9]~32\ $ (GND))) # (!\PLAYER_A|react_time\(10) & (!\PLAYER_A|react_time[9]~32\ & VCC))
-- \PLAYER_A|react_time[10]~34\ = CARRY((\PLAYER_A|react_time\(10) & !\PLAYER_A|react_time[9]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_A|react_time\(10),
	datad => VCC,
	cin => \PLAYER_A|react_time[9]~32\,
	combout => \PLAYER_A|react_time[10]~33_combout\,
	cout => \PLAYER_A|react_time[10]~34\);

-- Location: FF_X111_Y34_N21
\PLAYER_A|react_time[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[10]~33_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(10));

-- Location: LCCOMB_X111_Y34_N22
\PLAYER_A|react_time[11]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[11]~35_combout\ = (\PLAYER_A|react_time\(11) & (!\PLAYER_A|react_time[10]~34\)) # (!\PLAYER_A|react_time\(11) & ((\PLAYER_A|react_time[10]~34\) # (GND)))
-- \PLAYER_A|react_time[11]~36\ = CARRY((!\PLAYER_A|react_time[10]~34\) # (!\PLAYER_A|react_time\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|react_time\(11),
	datad => VCC,
	cin => \PLAYER_A|react_time[10]~34\,
	combout => \PLAYER_A|react_time[11]~35_combout\,
	cout => \PLAYER_A|react_time[11]~36\);

-- Location: FF_X111_Y34_N23
\PLAYER_A|react_time[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[11]~35_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(11));

-- Location: LCCOMB_X111_Y34_N24
\PLAYER_A|react_time[12]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|react_time[12]~37_combout\ = \PLAYER_A|react_time[11]~36\ $ (!\PLAYER_A|react_time\(12))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|react_time\(12),
	cin => \PLAYER_A|react_time[11]~36\,
	combout => \PLAYER_A|react_time[12]~37_combout\);

-- Location: FF_X111_Y34_N25
\PLAYER_A|react_time[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|react_time[12]~37_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_A|ALT_INV_state\(1),
	ena => \PLAYER_A|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|react_time\(12));

-- Location: LCCOMB_X111_Y35_N30
\PLAYER_A|reactTime[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|reactTime[0]~0_combout\ = (!\PLAYER_A|state\(0) & (\PLAYER_A|state\(1) & (\state|state.game~q\ & !\inst4|s_key_prev~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|state\(0),
	datab => \PLAYER_A|state\(1),
	datac => \state|state.game~q\,
	datad => \inst4|s_key_prev~q\,
	combout => \PLAYER_A|reactTime[0]~0_combout\);

-- Location: FF_X112_Y35_N31
\PLAYER_A|reactTime[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(12),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(12));

-- Location: LCCOMB_X109_Y35_N6
\PLAYER_B|react_time[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[0]~13_combout\ = (\PLAYER_B|react_time\(0) & (\inst|s_key_prev~q\ $ (VCC))) # (!\PLAYER_B|react_time\(0) & (\inst|s_key_prev~q\ & VCC))
-- \PLAYER_B|react_time[0]~14\ = CARRY((\PLAYER_B|react_time\(0) & \inst|s_key_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|react_time\(0),
	datab => \inst|s_key_prev~q\,
	datad => VCC,
	combout => \PLAYER_B|react_time[0]~13_combout\,
	cout => \PLAYER_B|react_time[0]~14\);

-- Location: LCCOMB_X110_Y35_N26
\PLAYER_B|state[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|state[1]~0_combout\ = (\inst|s_key_prev~q\ & ((\PLAYER_B|state\(0)) # ((!\PLAYER_B|state\(1) & \inst25|enable_signal~q\)))) # (!\inst|s_key_prev~q\ & (\PLAYER_B|state\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|state\(1),
	datab => \PLAYER_B|state\(0),
	datac => \inst|s_key_prev~q\,
	datad => \inst25|enable_signal~q\,
	combout => \PLAYER_B|state[1]~0_combout\);

-- Location: LCCOMB_X110_Y35_N16
\PLAYER_B|state[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|state[0]~1_combout\ = (\state|state.game~q\ & ((\PLAYER_B|state\(0) & ((!\PLAYER_B|state[1]~0_combout\))) # (!\PLAYER_B|state\(0) & (!\PLAYER_B|state\(1) & \PLAYER_B|state[1]~0_combout\)))) # (!\state|state.game~q\ & (((\PLAYER_B|state\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|state\(1),
	datab => \state|state.game~q\,
	datac => \PLAYER_B|state\(0),
	datad => \PLAYER_B|state[1]~0_combout\,
	combout => \PLAYER_B|state[0]~1_combout\);

-- Location: FF_X110_Y35_N17
\PLAYER_B|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|state[0]~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|state\(0));

-- Location: LCCOMB_X110_Y35_N12
\PLAYER_B|state[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|state[1]~2_combout\ = (\state|state.game~q\ & ((\PLAYER_B|state\(1) & ((!\PLAYER_B|state[1]~0_combout\))) # (!\PLAYER_B|state\(1) & (\PLAYER_B|state\(0) & \PLAYER_B|state[1]~0_combout\)))) # (!\state|state.game~q\ & (((\PLAYER_B|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datab => \PLAYER_B|state\(0),
	datac => \PLAYER_B|state\(1),
	datad => \PLAYER_B|state[1]~0_combout\,
	combout => \PLAYER_B|state[1]~2_combout\);

-- Location: FF_X110_Y35_N13
\PLAYER_B|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|state[1]~2_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|state\(1));

-- Location: LCCOMB_X110_Y35_N20
\PLAYER_B|react_time[0]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[0]~39_combout\ = (\PLAYER_B|state\(1)) # ((\inst25|enable_signal~q\ & \inst|s_key_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|enable_signal~q\,
	datac => \inst|s_key_prev~q\,
	datad => \PLAYER_B|state\(1),
	combout => \PLAYER_B|react_time[0]~39_combout\);

-- Location: LCCOMB_X110_Y35_N22
\PLAYER_B|react_time[0]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[0]~40_combout\ = (\state|state.game~q\ & (!\PLAYER_B|state\(0) & \PLAYER_B|react_time[0]~39_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datab => \PLAYER_B|state\(0),
	datad => \PLAYER_B|react_time[0]~39_combout\,
	combout => \PLAYER_B|react_time[0]~40_combout\);

-- Location: FF_X109_Y35_N7
\PLAYER_B|react_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[0]~13_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(0));

-- Location: LCCOMB_X109_Y35_N8
\PLAYER_B|react_time[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[1]~15_combout\ = (\PLAYER_B|react_time\(1) & (!\PLAYER_B|react_time[0]~14\)) # (!\PLAYER_B|react_time\(1) & ((\PLAYER_B|react_time[0]~14\) # (GND)))
-- \PLAYER_B|react_time[1]~16\ = CARRY((!\PLAYER_B|react_time[0]~14\) # (!\PLAYER_B|react_time\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_B|react_time\(1),
	datad => VCC,
	cin => \PLAYER_B|react_time[0]~14\,
	combout => \PLAYER_B|react_time[1]~15_combout\,
	cout => \PLAYER_B|react_time[1]~16\);

-- Location: FF_X109_Y35_N9
\PLAYER_B|react_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[1]~15_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(1));

-- Location: LCCOMB_X109_Y35_N10
\PLAYER_B|react_time[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[2]~17_combout\ = (\PLAYER_B|react_time\(2) & (\PLAYER_B|react_time[1]~16\ $ (GND))) # (!\PLAYER_B|react_time\(2) & (!\PLAYER_B|react_time[1]~16\ & VCC))
-- \PLAYER_B|react_time[2]~18\ = CARRY((\PLAYER_B|react_time\(2) & !\PLAYER_B|react_time[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|react_time\(2),
	datad => VCC,
	cin => \PLAYER_B|react_time[1]~16\,
	combout => \PLAYER_B|react_time[2]~17_combout\,
	cout => \PLAYER_B|react_time[2]~18\);

-- Location: FF_X109_Y35_N11
\PLAYER_B|react_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[2]~17_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(2));

-- Location: LCCOMB_X109_Y35_N12
\PLAYER_B|react_time[3]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[3]~19_combout\ = (\PLAYER_B|react_time\(3) & (!\PLAYER_B|react_time[2]~18\)) # (!\PLAYER_B|react_time\(3) & ((\PLAYER_B|react_time[2]~18\) # (GND)))
-- \PLAYER_B|react_time[3]~20\ = CARRY((!\PLAYER_B|react_time[2]~18\) # (!\PLAYER_B|react_time\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|react_time\(3),
	datad => VCC,
	cin => \PLAYER_B|react_time[2]~18\,
	combout => \PLAYER_B|react_time[3]~19_combout\,
	cout => \PLAYER_B|react_time[3]~20\);

-- Location: FF_X109_Y35_N13
\PLAYER_B|react_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[3]~19_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(3));

-- Location: LCCOMB_X109_Y35_N14
\PLAYER_B|react_time[4]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[4]~21_combout\ = (\PLAYER_B|react_time\(4) & (\PLAYER_B|react_time[3]~20\ $ (GND))) # (!\PLAYER_B|react_time\(4) & (!\PLAYER_B|react_time[3]~20\ & VCC))
-- \PLAYER_B|react_time[4]~22\ = CARRY((\PLAYER_B|react_time\(4) & !\PLAYER_B|react_time[3]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_B|react_time\(4),
	datad => VCC,
	cin => \PLAYER_B|react_time[3]~20\,
	combout => \PLAYER_B|react_time[4]~21_combout\,
	cout => \PLAYER_B|react_time[4]~22\);

-- Location: FF_X109_Y35_N15
\PLAYER_B|react_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[4]~21_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(4));

-- Location: LCCOMB_X109_Y35_N16
\PLAYER_B|react_time[5]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[5]~23_combout\ = (\PLAYER_B|react_time\(5) & (!\PLAYER_B|react_time[4]~22\)) # (!\PLAYER_B|react_time\(5) & ((\PLAYER_B|react_time[4]~22\) # (GND)))
-- \PLAYER_B|react_time[5]~24\ = CARRY((!\PLAYER_B|react_time[4]~22\) # (!\PLAYER_B|react_time\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_B|react_time\(5),
	datad => VCC,
	cin => \PLAYER_B|react_time[4]~22\,
	combout => \PLAYER_B|react_time[5]~23_combout\,
	cout => \PLAYER_B|react_time[5]~24\);

-- Location: FF_X109_Y35_N17
\PLAYER_B|react_time[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[5]~23_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(5));

-- Location: LCCOMB_X109_Y35_N18
\PLAYER_B|react_time[6]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[6]~25_combout\ = (\PLAYER_B|react_time\(6) & (\PLAYER_B|react_time[5]~24\ $ (GND))) # (!\PLAYER_B|react_time\(6) & (!\PLAYER_B|react_time[5]~24\ & VCC))
-- \PLAYER_B|react_time[6]~26\ = CARRY((\PLAYER_B|react_time\(6) & !\PLAYER_B|react_time[5]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_B|react_time\(6),
	datad => VCC,
	cin => \PLAYER_B|react_time[5]~24\,
	combout => \PLAYER_B|react_time[6]~25_combout\,
	cout => \PLAYER_B|react_time[6]~26\);

-- Location: FF_X109_Y35_N19
\PLAYER_B|react_time[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[6]~25_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(6));

-- Location: LCCOMB_X109_Y35_N20
\PLAYER_B|react_time[7]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[7]~27_combout\ = (\PLAYER_B|react_time\(7) & (!\PLAYER_B|react_time[6]~26\)) # (!\PLAYER_B|react_time\(7) & ((\PLAYER_B|react_time[6]~26\) # (GND)))
-- \PLAYER_B|react_time[7]~28\ = CARRY((!\PLAYER_B|react_time[6]~26\) # (!\PLAYER_B|react_time\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_B|react_time\(7),
	datad => VCC,
	cin => \PLAYER_B|react_time[6]~26\,
	combout => \PLAYER_B|react_time[7]~27_combout\,
	cout => \PLAYER_B|react_time[7]~28\);

-- Location: FF_X109_Y35_N21
\PLAYER_B|react_time[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[7]~27_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(7));

-- Location: LCCOMB_X109_Y35_N22
\PLAYER_B|react_time[8]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[8]~29_combout\ = (\PLAYER_B|react_time\(8) & (\PLAYER_B|react_time[7]~28\ $ (GND))) # (!\PLAYER_B|react_time\(8) & (!\PLAYER_B|react_time[7]~28\ & VCC))
-- \PLAYER_B|react_time[8]~30\ = CARRY((\PLAYER_B|react_time\(8) & !\PLAYER_B|react_time[7]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|react_time\(8),
	datad => VCC,
	cin => \PLAYER_B|react_time[7]~28\,
	combout => \PLAYER_B|react_time[8]~29_combout\,
	cout => \PLAYER_B|react_time[8]~30\);

-- Location: FF_X109_Y35_N23
\PLAYER_B|react_time[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[8]~29_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(8));

-- Location: LCCOMB_X109_Y35_N24
\PLAYER_B|react_time[9]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[9]~31_combout\ = (\PLAYER_B|react_time\(9) & (!\PLAYER_B|react_time[8]~30\)) # (!\PLAYER_B|react_time\(9) & ((\PLAYER_B|react_time[8]~30\) # (GND)))
-- \PLAYER_B|react_time[9]~32\ = CARRY((!\PLAYER_B|react_time[8]~30\) # (!\PLAYER_B|react_time\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_B|react_time\(9),
	datad => VCC,
	cin => \PLAYER_B|react_time[8]~30\,
	combout => \PLAYER_B|react_time[9]~31_combout\,
	cout => \PLAYER_B|react_time[9]~32\);

-- Location: FF_X109_Y35_N25
\PLAYER_B|react_time[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[9]~31_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(9));

-- Location: LCCOMB_X109_Y35_N26
\PLAYER_B|react_time[10]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[10]~33_combout\ = (\PLAYER_B|react_time\(10) & (\PLAYER_B|react_time[9]~32\ $ (GND))) # (!\PLAYER_B|react_time\(10) & (!\PLAYER_B|react_time[9]~32\ & VCC))
-- \PLAYER_B|react_time[10]~34\ = CARRY((\PLAYER_B|react_time\(10) & !\PLAYER_B|react_time[9]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|react_time\(10),
	datad => VCC,
	cin => \PLAYER_B|react_time[9]~32\,
	combout => \PLAYER_B|react_time[10]~33_combout\,
	cout => \PLAYER_B|react_time[10]~34\);

-- Location: FF_X109_Y35_N27
\PLAYER_B|react_time[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[10]~33_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(10));

-- Location: LCCOMB_X109_Y35_N28
\PLAYER_B|react_time[11]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[11]~35_combout\ = (\PLAYER_B|react_time\(11) & (!\PLAYER_B|react_time[10]~34\)) # (!\PLAYER_B|react_time\(11) & ((\PLAYER_B|react_time[10]~34\) # (GND)))
-- \PLAYER_B|react_time[11]~36\ = CARRY((!\PLAYER_B|react_time[10]~34\) # (!\PLAYER_B|react_time\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \PLAYER_B|react_time\(11),
	datad => VCC,
	cin => \PLAYER_B|react_time[10]~34\,
	combout => \PLAYER_B|react_time[11]~35_combout\,
	cout => \PLAYER_B|react_time[11]~36\);

-- Location: FF_X109_Y35_N29
\PLAYER_B|react_time[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[11]~35_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(11));

-- Location: LCCOMB_X109_Y35_N30
\PLAYER_B|react_time[12]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|react_time[12]~37_combout\ = \PLAYER_B|react_time\(12) $ (!\PLAYER_B|react_time[11]~36\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|react_time\(12),
	cin => \PLAYER_B|react_time[11]~36\,
	combout => \PLAYER_B|react_time[12]~37_combout\);

-- Location: FF_X109_Y35_N31
\PLAYER_B|react_time[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|react_time[12]~37_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sclr => \PLAYER_B|ALT_INV_state\(1),
	ena => \PLAYER_B|react_time[0]~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|react_time\(12));

-- Location: LCCOMB_X110_Y35_N14
\PLAYER_B|reactTime[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|reactTime[0]~0_combout\ = (\PLAYER_B|state\(1) & (!\PLAYER_B|state\(0) & (!\inst|s_key_prev~q\ & \state|state.game~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|state\(1),
	datab => \PLAYER_B|state\(0),
	datac => \inst|s_key_prev~q\,
	datad => \state|state.game~q\,
	combout => \PLAYER_B|reactTime[0]~0_combout\);

-- Location: FF_X111_Y35_N29
\PLAYER_B|reactTime[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(12),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(12));

-- Location: FF_X112_Y35_N25
\PLAYER_A|reactTime[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(11),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(11));

-- Location: FF_X112_Y35_N29
\PLAYER_B|reactTime[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(11),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(11));

-- Location: FF_X112_Y35_N27
\PLAYER_A|reactTime[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(10),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(10));

-- Location: FF_X111_Y35_N25
\PLAYER_B|reactTime[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(10),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(10));

-- Location: LCCOMB_X112_Y35_N4
\PLAYER_B|reactTime[9]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|reactTime[9]~feeder_combout\ = \PLAYER_B|react_time\(9)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_B|react_time\(9),
	combout => \PLAYER_B|reactTime[9]~feeder_combout\);

-- Location: FF_X112_Y35_N5
\PLAYER_B|reactTime[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|reactTime[9]~feeder_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(9));

-- Location: FF_X112_Y35_N21
\PLAYER_A|reactTime[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(9),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(9));

-- Location: FF_X112_Y35_N23
\PLAYER_A|reactTime[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(8),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(8));

-- Location: FF_X112_Y35_N9
\PLAYER_B|reactTime[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(8),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(8));

-- Location: LCCOMB_X112_Y35_N2
\PLAYER_B|reactTime[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|reactTime[7]~feeder_combout\ = \PLAYER_B|react_time\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_B|react_time\(7),
	combout => \PLAYER_B|reactTime[7]~feeder_combout\);

-- Location: FF_X112_Y35_N3
\PLAYER_B|reactTime[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|reactTime[7]~feeder_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(7));

-- Location: LCCOMB_X111_Y35_N0
\PLAYER_A|reactTime[7]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|reactTime[7]~feeder_combout\ = \PLAYER_A|react_time\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|react_time\(7),
	combout => \PLAYER_A|reactTime[7]~feeder_combout\);

-- Location: FF_X111_Y35_N1
\PLAYER_A|reactTime[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|reactTime[7]~feeder_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(7));

-- Location: FF_X111_Y35_N17
\PLAYER_B|reactTime[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(6),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(6));

-- Location: FF_X112_Y35_N19
\PLAYER_A|reactTime[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(6),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(6));

-- Location: FF_X112_Y35_N17
\PLAYER_B|reactTime[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(5),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(5));

-- Location: LCCOMB_X111_Y35_N2
\PLAYER_A|reactTime[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|reactTime[5]~feeder_combout\ = \PLAYER_A|react_time\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|react_time\(5),
	combout => \PLAYER_A|reactTime[5]~feeder_combout\);

-- Location: FF_X111_Y35_N3
\PLAYER_A|reactTime[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|reactTime[5]~feeder_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(5));

-- Location: FF_X111_Y35_N13
\PLAYER_B|reactTime[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(4),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(4));

-- Location: FF_X112_Y35_N15
\PLAYER_A|reactTime[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(4),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(4));

-- Location: FF_X111_Y35_N11
\PLAYER_A|reactTime[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(3),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(3));

-- Location: FF_X112_Y35_N13
\PLAYER_B|reactTime[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(3),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(3));

-- Location: FF_X112_Y35_N11
\PLAYER_A|reactTime[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(2),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(2));

-- Location: FF_X111_Y35_N9
\PLAYER_B|reactTime[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(2),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(2));

-- Location: FF_X111_Y35_N7
\PLAYER_A|reactTime[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(1),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(1));

-- Location: LCCOMB_X112_Y35_N0
\PLAYER_B|reactTime[1]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|reactTime[1]~feeder_combout\ = \PLAYER_B|react_time\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_B|react_time\(1),
	combout => \PLAYER_B|reactTime[1]~feeder_combout\);

-- Location: FF_X112_Y35_N1
\PLAYER_B|reactTime[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|reactTime[1]~feeder_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(1));

-- Location: FF_X112_Y35_N7
\PLAYER_A|reactTime[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|react_time\(0),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_A|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|reactTime\(0));

-- Location: FF_X111_Y35_N5
\PLAYER_B|reactTime[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|react_time\(0),
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	ena => \PLAYER_B|reactTime[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|reactTime\(0));

-- Location: LCCOMB_X111_Y35_N4
\MEF|LessThan3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~1_cout\ = CARRY((\PLAYER_A|reactTime\(0) & !\PLAYER_B|reactTime\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(0),
	datab => \PLAYER_B|reactTime\(0),
	datad => VCC,
	cout => \MEF|LessThan3~1_cout\);

-- Location: LCCOMB_X111_Y35_N6
\MEF|LessThan3~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~3_cout\ = CARRY((\PLAYER_A|reactTime\(1) & (\PLAYER_B|reactTime\(1) & !\MEF|LessThan3~1_cout\)) # (!\PLAYER_A|reactTime\(1) & ((\PLAYER_B|reactTime\(1)) # (!\MEF|LessThan3~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(1),
	datab => \PLAYER_B|reactTime\(1),
	datad => VCC,
	cin => \MEF|LessThan3~1_cout\,
	cout => \MEF|LessThan3~3_cout\);

-- Location: LCCOMB_X111_Y35_N8
\MEF|LessThan3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~5_cout\ = CARRY((\PLAYER_A|reactTime\(2) & ((!\MEF|LessThan3~3_cout\) # (!\PLAYER_B|reactTime\(2)))) # (!\PLAYER_A|reactTime\(2) & (!\PLAYER_B|reactTime\(2) & !\MEF|LessThan3~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(2),
	datab => \PLAYER_B|reactTime\(2),
	datad => VCC,
	cin => \MEF|LessThan3~3_cout\,
	cout => \MEF|LessThan3~5_cout\);

-- Location: LCCOMB_X111_Y35_N10
\MEF|LessThan3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~7_cout\ = CARRY((\PLAYER_A|reactTime\(3) & (\PLAYER_B|reactTime\(3) & !\MEF|LessThan3~5_cout\)) # (!\PLAYER_A|reactTime\(3) & ((\PLAYER_B|reactTime\(3)) # (!\MEF|LessThan3~5_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(3),
	datab => \PLAYER_B|reactTime\(3),
	datad => VCC,
	cin => \MEF|LessThan3~5_cout\,
	cout => \MEF|LessThan3~7_cout\);

-- Location: LCCOMB_X111_Y35_N12
\MEF|LessThan3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~9_cout\ = CARRY((\PLAYER_B|reactTime\(4) & (\PLAYER_A|reactTime\(4) & !\MEF|LessThan3~7_cout\)) # (!\PLAYER_B|reactTime\(4) & ((\PLAYER_A|reactTime\(4)) # (!\MEF|LessThan3~7_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(4),
	datab => \PLAYER_A|reactTime\(4),
	datad => VCC,
	cin => \MEF|LessThan3~7_cout\,
	cout => \MEF|LessThan3~9_cout\);

-- Location: LCCOMB_X111_Y35_N14
\MEF|LessThan3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~11_cout\ = CARRY((\PLAYER_B|reactTime\(5) & ((!\MEF|LessThan3~9_cout\) # (!\PLAYER_A|reactTime\(5)))) # (!\PLAYER_B|reactTime\(5) & (!\PLAYER_A|reactTime\(5) & !\MEF|LessThan3~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(5),
	datab => \PLAYER_A|reactTime\(5),
	datad => VCC,
	cin => \MEF|LessThan3~9_cout\,
	cout => \MEF|LessThan3~11_cout\);

-- Location: LCCOMB_X111_Y35_N16
\MEF|LessThan3~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~13_cout\ = CARRY((\PLAYER_B|reactTime\(6) & (\PLAYER_A|reactTime\(6) & !\MEF|LessThan3~11_cout\)) # (!\PLAYER_B|reactTime\(6) & ((\PLAYER_A|reactTime\(6)) # (!\MEF|LessThan3~11_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(6),
	datab => \PLAYER_A|reactTime\(6),
	datad => VCC,
	cin => \MEF|LessThan3~11_cout\,
	cout => \MEF|LessThan3~13_cout\);

-- Location: LCCOMB_X111_Y35_N18
\MEF|LessThan3~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~15_cout\ = CARRY((\PLAYER_B|reactTime\(7) & ((!\MEF|LessThan3~13_cout\) # (!\PLAYER_A|reactTime\(7)))) # (!\PLAYER_B|reactTime\(7) & (!\PLAYER_A|reactTime\(7) & !\MEF|LessThan3~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(7),
	datab => \PLAYER_A|reactTime\(7),
	datad => VCC,
	cin => \MEF|LessThan3~13_cout\,
	cout => \MEF|LessThan3~15_cout\);

-- Location: LCCOMB_X111_Y35_N20
\MEF|LessThan3~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~17_cout\ = CARRY((\PLAYER_A|reactTime\(8) & ((!\MEF|LessThan3~15_cout\) # (!\PLAYER_B|reactTime\(8)))) # (!\PLAYER_A|reactTime\(8) & (!\PLAYER_B|reactTime\(8) & !\MEF|LessThan3~15_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(8),
	datab => \PLAYER_B|reactTime\(8),
	datad => VCC,
	cin => \MEF|LessThan3~15_cout\,
	cout => \MEF|LessThan3~17_cout\);

-- Location: LCCOMB_X111_Y35_N22
\MEF|LessThan3~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~19_cout\ = CARRY((\PLAYER_B|reactTime\(9) & ((!\MEF|LessThan3~17_cout\) # (!\PLAYER_A|reactTime\(9)))) # (!\PLAYER_B|reactTime\(9) & (!\PLAYER_A|reactTime\(9) & !\MEF|LessThan3~17_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(9),
	datab => \PLAYER_A|reactTime\(9),
	datad => VCC,
	cin => \MEF|LessThan3~17_cout\,
	cout => \MEF|LessThan3~19_cout\);

-- Location: LCCOMB_X111_Y35_N24
\MEF|LessThan3~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~21_cout\ = CARRY((\PLAYER_A|reactTime\(10) & ((!\MEF|LessThan3~19_cout\) # (!\PLAYER_B|reactTime\(10)))) # (!\PLAYER_A|reactTime\(10) & (!\PLAYER_B|reactTime\(10) & !\MEF|LessThan3~19_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(10),
	datab => \PLAYER_B|reactTime\(10),
	datad => VCC,
	cin => \MEF|LessThan3~19_cout\,
	cout => \MEF|LessThan3~21_cout\);

-- Location: LCCOMB_X111_Y35_N26
\MEF|LessThan3~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~23_cout\ = CARRY((\PLAYER_A|reactTime\(11) & (\PLAYER_B|reactTime\(11) & !\MEF|LessThan3~21_cout\)) # (!\PLAYER_A|reactTime\(11) & ((\PLAYER_B|reactTime\(11)) # (!\MEF|LessThan3~21_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(11),
	datab => \PLAYER_B|reactTime\(11),
	datad => VCC,
	cin => \MEF|LessThan3~21_cout\,
	cout => \MEF|LessThan3~23_cout\);

-- Location: LCCOMB_X111_Y35_N28
\MEF|LessThan3~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan3~24_combout\ = (\PLAYER_A|reactTime\(12) & ((!\MEF|LessThan3~23_cout\) # (!\PLAYER_B|reactTime\(12)))) # (!\PLAYER_A|reactTime\(12) & (!\PLAYER_B|reactTime\(12) & !\MEF|LessThan3~23_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(12),
	datab => \PLAYER_B|reactTime\(12),
	cin => \MEF|LessThan3~23_cout\,
	combout => \MEF|LessThan3~24_combout\);

-- Location: LCCOMB_X109_Y37_N6
\MEF|Add3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add3~7_combout\ = (\MEF|points_B_int\(4) & (\MEF|Add3~6\ & VCC)) # (!\MEF|points_B_int\(4) & (!\MEF|Add3~6\))
-- \MEF|Add3~8\ = CARRY((!\MEF|points_B_int\(4) & !\MEF|Add3~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(4),
	datad => VCC,
	cin => \MEF|Add3~6\,
	combout => \MEF|Add3~7_combout\,
	cout => \MEF|Add3~8\);

-- Location: LCCOMB_X109_Y37_N8
\MEF|Add3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add3~9_combout\ = (\MEF|points_B_int\(5) & ((GND) # (!\MEF|Add3~8\))) # (!\MEF|points_B_int\(5) & (\MEF|Add3~8\ $ (GND)))
-- \MEF|Add3~10\ = CARRY((\MEF|points_B_int\(5)) # (!\MEF|Add3~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(5),
	datad => VCC,
	cin => \MEF|Add3~8\,
	combout => \MEF|Add3~9_combout\,
	cout => \MEF|Add3~10\);

-- Location: LCCOMB_X108_Y37_N14
\MEF|Add5~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~10_combout\ = (\MEF|points_B_int\(4) & (\MEF|Add5~9\ $ (GND))) # (!\MEF|points_B_int\(4) & (!\MEF|Add5~9\ & VCC))
-- \MEF|Add5~11\ = CARRY((\MEF|points_B_int\(4) & !\MEF|Add5~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(4),
	datad => VCC,
	cin => \MEF|Add5~9\,
	combout => \MEF|Add5~10_combout\,
	cout => \MEF|Add5~11\);

-- Location: LCCOMB_X108_Y37_N16
\MEF|Add5~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~12_combout\ = (\MEF|points_B_int\(5) & (!\MEF|Add5~11\)) # (!\MEF|points_B_int\(5) & ((\MEF|Add5~11\) # (GND)))
-- \MEF|Add5~13\ = CARRY((!\MEF|Add5~11\) # (!\MEF|points_B_int\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(5),
	datad => VCC,
	cin => \MEF|Add5~11\,
	combout => \MEF|Add5~12_combout\,
	cout => \MEF|Add5~13\);

-- Location: LCCOMB_X110_Y37_N28
\MEF|Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add3~2_combout\ = (!\MEF|points_B_int\(6) & (!\MEF|points_B_int~16_combout\ & ((\MEF|points_B_int\(1)) # (!\MEF|LessThan1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(1),
	datab => \MEF|LessThan1~0_combout\,
	datac => \MEF|points_B_int\(6),
	datad => \MEF|points_B_int~16_combout\,
	combout => \MEF|Add3~2_combout\);

-- Location: LCCOMB_X110_Y37_N4
\MEF|points_B_int~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int~11_combout\ = (\MEF|Add3~9_combout\ & ((\MEF|Add3~2_combout\) # ((\MEF|Add5~12_combout\ & \MEF|points_B_int~16_combout\)))) # (!\MEF|Add3~9_combout\ & (\MEF|Add5~12_combout\ & (\MEF|points_B_int~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add3~9_combout\,
	datab => \MEF|Add5~12_combout\,
	datac => \MEF|points_B_int~16_combout\,
	datad => \MEF|Add3~2_combout\,
	combout => \MEF|points_B_int~11_combout\);

-- Location: LCCOMB_X113_Y33_N26
inst57 : cycloneive_lcell_comb
-- Equation(s):
-- \inst57~combout\ = (\state|state.game~q\) # (\state|state.gameINFO~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \state|state.gameINFO~q\,
	combout => \inst57~combout\);

-- Location: FF_X110_Y37_N17
\MEF|playerB_penalty_applied\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst25|state.penalty~q\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_penalty_applied~q\);

-- Location: LCCOMB_X110_Y37_N16
\MEF|points_B_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int[5]~8_combout\ = (\inst25|state.penalty~q\ & !\MEF|playerB_penalty_applied~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst25|state.penalty~q\,
	datac => \MEF|playerB_penalty_applied~q\,
	combout => \MEF|points_B_int[5]~8_combout\);

-- Location: FF_X112_Y37_N25
\MEF|playerA_time_last[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(9),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(9));

-- Location: FF_X112_Y37_N19
\MEF|playerA_time_last[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(8),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(8));

-- Location: LCCOMB_X112_Y37_N24
\MEF|playerA_valid~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~5_combout\ = (\PLAYER_A|reactTime\(9) & (\MEF|playerA_time_last\(9) & (\PLAYER_A|reactTime\(8) $ (!\MEF|playerA_time_last\(8))))) # (!\PLAYER_A|reactTime\(9) & (!\MEF|playerA_time_last\(9) & (\PLAYER_A|reactTime\(8) $ 
-- (!\MEF|playerA_time_last\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(9),
	datab => \PLAYER_A|reactTime\(8),
	datac => \MEF|playerA_time_last\(9),
	datad => \MEF|playerA_time_last\(8),
	combout => \MEF|playerA_valid~5_combout\);

-- Location: LCCOMB_X112_Y37_N10
\MEF|playerA_time_last[10]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_time_last[10]~feeder_combout\ = \PLAYER_A|reactTime\(10)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|reactTime\(10),
	combout => \MEF|playerA_time_last[10]~feeder_combout\);

-- Location: FF_X112_Y37_N11
\MEF|playerA_time_last[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerA_time_last[10]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(10));

-- Location: FF_X112_Y37_N13
\MEF|playerA_time_last[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(11),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(11));

-- Location: LCCOMB_X112_Y37_N12
\MEF|playerA_valid~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~6_combout\ = (\MEF|playerA_time_last\(10) & (\PLAYER_A|reactTime\(10) & (\PLAYER_A|reactTime\(11) $ (!\MEF|playerA_time_last\(11))))) # (!\MEF|playerA_time_last\(10) & (!\PLAYER_A|reactTime\(10) & (\PLAYER_A|reactTime\(11) $ 
-- (!\MEF|playerA_time_last\(11)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerA_time_last\(10),
	datab => \PLAYER_A|reactTime\(11),
	datac => \MEF|playerA_time_last\(11),
	datad => \PLAYER_A|reactTime\(10),
	combout => \MEF|playerA_valid~6_combout\);

-- Location: FF_X112_Y37_N23
\MEF|playerA_time_last[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(12),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(12));

-- Location: LCCOMB_X112_Y37_N22
\MEF|playerA_valid~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~7_combout\ = (\MEF|playerA_valid~6_combout\ & (!\MEF|playerA_valid~q\ & (\PLAYER_A|reactTime\(12) $ (!\MEF|playerA_time_last\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerA_valid~6_combout\,
	datab => \PLAYER_A|reactTime\(12),
	datac => \MEF|playerA_time_last\(12),
	datad => \MEF|playerA_valid~q\,
	combout => \MEF|playerA_valid~7_combout\);

-- Location: LCCOMB_X114_Y37_N26
\MEF|playerA_time_last[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_time_last[4]~feeder_combout\ = \PLAYER_A|reactTime\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|reactTime\(4),
	combout => \MEF|playerA_time_last[4]~feeder_combout\);

-- Location: FF_X114_Y37_N27
\MEF|playerA_time_last[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerA_time_last[4]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(4));

-- Location: FF_X114_Y37_N21
\MEF|playerA_time_last[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(5),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(5));

-- Location: LCCOMB_X114_Y37_N20
\MEF|playerA_valid~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~2_combout\ = (\MEF|playerA_time_last\(4) & (\PLAYER_A|reactTime\(4) & (\PLAYER_A|reactTime\(5) $ (!\MEF|playerA_time_last\(5))))) # (!\MEF|playerA_time_last\(4) & (!\PLAYER_A|reactTime\(4) & (\PLAYER_A|reactTime\(5) $ 
-- (!\MEF|playerA_time_last\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerA_time_last\(4),
	datab => \PLAYER_A|reactTime\(5),
	datac => \MEF|playerA_time_last\(5),
	datad => \PLAYER_A|reactTime\(4),
	combout => \MEF|playerA_valid~2_combout\);

-- Location: LCCOMB_X112_Y37_N20
\MEF|playerA_time_last[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_time_last[0]~feeder_combout\ = \PLAYER_A|reactTime\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|reactTime\(0),
	combout => \MEF|playerA_time_last[0]~feeder_combout\);

-- Location: FF_X112_Y37_N21
\MEF|playerA_time_last[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerA_time_last[0]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(0));

-- Location: FF_X112_Y37_N31
\MEF|playerA_time_last[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(1),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(1));

-- Location: LCCOMB_X112_Y37_N30
\MEF|playerA_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~0_combout\ = (\MEF|playerA_time_last\(0) & (\PLAYER_A|reactTime\(0) & (\PLAYER_A|reactTime\(1) $ (!\MEF|playerA_time_last\(1))))) # (!\MEF|playerA_time_last\(0) & (!\PLAYER_A|reactTime\(0) & (\PLAYER_A|reactTime\(1) $ 
-- (!\MEF|playerA_time_last\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerA_time_last\(0),
	datab => \PLAYER_A|reactTime\(1),
	datac => \MEF|playerA_time_last\(1),
	datad => \PLAYER_A|reactTime\(0),
	combout => \MEF|playerA_valid~0_combout\);

-- Location: LCCOMB_X112_Y37_N28
\MEF|playerA_time_last[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_time_last[6]~feeder_combout\ = \PLAYER_A|reactTime\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|reactTime\(6),
	combout => \MEF|playerA_time_last[6]~feeder_combout\);

-- Location: FF_X112_Y37_N29
\MEF|playerA_time_last[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerA_time_last[6]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(6));

-- Location: FF_X112_Y37_N7
\MEF|playerA_time_last[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(7),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(7));

-- Location: LCCOMB_X112_Y37_N6
\MEF|playerA_valid~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~3_combout\ = (\PLAYER_A|reactTime\(7) & (\MEF|playerA_time_last\(7) & (\MEF|playerA_time_last\(6) $ (!\PLAYER_A|reactTime\(6))))) # (!\PLAYER_A|reactTime\(7) & (!\MEF|playerA_time_last\(7) & (\MEF|playerA_time_last\(6) $ 
-- (!\PLAYER_A|reactTime\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(7),
	datab => \MEF|playerA_time_last\(6),
	datac => \MEF|playerA_time_last\(7),
	datad => \PLAYER_A|reactTime\(6),
	combout => \MEF|playerA_valid~3_combout\);

-- Location: LCCOMB_X114_Y37_N10
\MEF|playerA_time_last[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_time_last[2]~feeder_combout\ = \PLAYER_A|reactTime\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_A|reactTime\(2),
	combout => \MEF|playerA_time_last[2]~feeder_combout\);

-- Location: FF_X114_Y37_N11
\MEF|playerA_time_last[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerA_time_last[2]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(2));

-- Location: FF_X114_Y37_N25
\MEF|playerA_time_last[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_A|reactTime\(3),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_time_last\(3));

-- Location: LCCOMB_X114_Y37_N24
\MEF|playerA_valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~1_combout\ = (\MEF|playerA_time_last\(2) & (\PLAYER_A|reactTime\(2) & (\PLAYER_A|reactTime\(3) $ (!\MEF|playerA_time_last\(3))))) # (!\MEF|playerA_time_last\(2) & (!\PLAYER_A|reactTime\(2) & (\PLAYER_A|reactTime\(3) $ 
-- (!\MEF|playerA_time_last\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerA_time_last\(2),
	datab => \PLAYER_A|reactTime\(3),
	datac => \MEF|playerA_time_last\(3),
	datad => \PLAYER_A|reactTime\(2),
	combout => \MEF|playerA_valid~1_combout\);

-- Location: LCCOMB_X113_Y37_N16
\MEF|playerA_valid~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~4_combout\ = (\MEF|playerA_valid~2_combout\ & (\MEF|playerA_valid~0_combout\ & (\MEF|playerA_valid~3_combout\ & \MEF|playerA_valid~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerA_valid~2_combout\,
	datab => \MEF|playerA_valid~0_combout\,
	datac => \MEF|playerA_valid~3_combout\,
	datad => \MEF|playerA_valid~1_combout\,
	combout => \MEF|playerA_valid~4_combout\);

-- Location: LCCOMB_X112_Y37_N16
\MEF|playerA_valid~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_valid~8_combout\ = (!\MEF|points_A_int~2_combout\ & (((!\MEF|playerA_valid~4_combout\) # (!\MEF|playerA_valid~7_combout\)) # (!\MEF|playerA_valid~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int~2_combout\,
	datab => \MEF|playerA_valid~5_combout\,
	datac => \MEF|playerA_valid~7_combout\,
	datad => \MEF|playerA_valid~4_combout\,
	combout => \MEF|playerA_valid~8_combout\);

-- Location: FF_X112_Y37_N17
\MEF|playerA_valid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerA_valid~8_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_valid~q\);

-- Location: LCCOMB_X112_Y37_N18
\MEF|points_A_int~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~2_combout\ = (\MEF|playerB_valid~q\ & \MEF|playerA_valid~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerB_valid~q\,
	datad => \MEF|playerA_valid~q\,
	combout => \MEF|points_A_int~2_combout\);

-- Location: LCCOMB_X110_Y37_N30
\MEF|points_B_int[5]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int[5]~17_combout\ = (\MEF|points_A_int~2_combout\ & ((\state|state.gameINFO~q\) # ((\state|state.game~q\)))) # (!\MEF|points_A_int~2_combout\ & (\MEF|points_B_int[5]~8_combout\ & ((\state|state.gameINFO~q\) # (\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int~2_combout\,
	datab => \state|state.gameINFO~q\,
	datac => \state|state.game~q\,
	datad => \MEF|points_B_int[5]~8_combout\,
	combout => \MEF|points_B_int[5]~17_combout\);

-- Location: LCCOMB_X112_Y35_N6
\MEF|LessThan2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~1_cout\ = CARRY((!\PLAYER_A|reactTime\(0) & \PLAYER_B|reactTime\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(0),
	datab => \PLAYER_B|reactTime\(0),
	datad => VCC,
	cout => \MEF|LessThan2~1_cout\);

-- Location: LCCOMB_X112_Y35_N8
\MEF|LessThan2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~3_cout\ = CARRY((\PLAYER_B|reactTime\(1) & (\PLAYER_A|reactTime\(1) & !\MEF|LessThan2~1_cout\)) # (!\PLAYER_B|reactTime\(1) & ((\PLAYER_A|reactTime\(1)) # (!\MEF|LessThan2~1_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(1),
	datab => \PLAYER_A|reactTime\(1),
	datad => VCC,
	cin => \MEF|LessThan2~1_cout\,
	cout => \MEF|LessThan2~3_cout\);

-- Location: LCCOMB_X112_Y35_N10
\MEF|LessThan2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~5_cout\ = CARRY((\PLAYER_B|reactTime\(2) & ((!\MEF|LessThan2~3_cout\) # (!\PLAYER_A|reactTime\(2)))) # (!\PLAYER_B|reactTime\(2) & (!\PLAYER_A|reactTime\(2) & !\MEF|LessThan2~3_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(2),
	datab => \PLAYER_A|reactTime\(2),
	datad => VCC,
	cin => \MEF|LessThan2~3_cout\,
	cout => \MEF|LessThan2~5_cout\);

-- Location: LCCOMB_X112_Y35_N12
\MEF|LessThan2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~7_cout\ = CARRY((\PLAYER_A|reactTime\(3) & ((!\MEF|LessThan2~5_cout\) # (!\PLAYER_B|reactTime\(3)))) # (!\PLAYER_A|reactTime\(3) & (!\PLAYER_B|reactTime\(3) & !\MEF|LessThan2~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(3),
	datab => \PLAYER_B|reactTime\(3),
	datad => VCC,
	cin => \MEF|LessThan2~5_cout\,
	cout => \MEF|LessThan2~7_cout\);

-- Location: LCCOMB_X112_Y35_N14
\MEF|LessThan2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~9_cout\ = CARRY((\PLAYER_B|reactTime\(4) & ((!\MEF|LessThan2~7_cout\) # (!\PLAYER_A|reactTime\(4)))) # (!\PLAYER_B|reactTime\(4) & (!\PLAYER_A|reactTime\(4) & !\MEF|LessThan2~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(4),
	datab => \PLAYER_A|reactTime\(4),
	datad => VCC,
	cin => \MEF|LessThan2~7_cout\,
	cout => \MEF|LessThan2~9_cout\);

-- Location: LCCOMB_X112_Y35_N16
\MEF|LessThan2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~11_cout\ = CARRY((\PLAYER_A|reactTime\(5) & ((!\MEF|LessThan2~9_cout\) # (!\PLAYER_B|reactTime\(5)))) # (!\PLAYER_A|reactTime\(5) & (!\PLAYER_B|reactTime\(5) & !\MEF|LessThan2~9_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(5),
	datab => \PLAYER_B|reactTime\(5),
	datad => VCC,
	cin => \MEF|LessThan2~9_cout\,
	cout => \MEF|LessThan2~11_cout\);

-- Location: LCCOMB_X112_Y35_N18
\MEF|LessThan2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~13_cout\ = CARRY((\PLAYER_B|reactTime\(6) & ((!\MEF|LessThan2~11_cout\) # (!\PLAYER_A|reactTime\(6)))) # (!\PLAYER_B|reactTime\(6) & (!\PLAYER_A|reactTime\(6) & !\MEF|LessThan2~11_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(6),
	datab => \PLAYER_A|reactTime\(6),
	datad => VCC,
	cin => \MEF|LessThan2~11_cout\,
	cout => \MEF|LessThan2~13_cout\);

-- Location: LCCOMB_X112_Y35_N20
\MEF|LessThan2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~15_cout\ = CARRY((\PLAYER_A|reactTime\(7) & ((!\MEF|LessThan2~13_cout\) # (!\PLAYER_B|reactTime\(7)))) # (!\PLAYER_A|reactTime\(7) & (!\PLAYER_B|reactTime\(7) & !\MEF|LessThan2~13_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(7),
	datab => \PLAYER_B|reactTime\(7),
	datad => VCC,
	cin => \MEF|LessThan2~13_cout\,
	cout => \MEF|LessThan2~15_cout\);

-- Location: LCCOMB_X112_Y35_N22
\MEF|LessThan2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~17_cout\ = CARRY((\PLAYER_A|reactTime\(8) & (\PLAYER_B|reactTime\(8) & !\MEF|LessThan2~15_cout\)) # (!\PLAYER_A|reactTime\(8) & ((\PLAYER_B|reactTime\(8)) # (!\MEF|LessThan2~15_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(8),
	datab => \PLAYER_B|reactTime\(8),
	datad => VCC,
	cin => \MEF|LessThan2~15_cout\,
	cout => \MEF|LessThan2~17_cout\);

-- Location: LCCOMB_X112_Y35_N24
\MEF|LessThan2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~19_cout\ = CARRY((\PLAYER_B|reactTime\(9) & (\PLAYER_A|reactTime\(9) & !\MEF|LessThan2~17_cout\)) # (!\PLAYER_B|reactTime\(9) & ((\PLAYER_A|reactTime\(9)) # (!\MEF|LessThan2~17_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(9),
	datab => \PLAYER_A|reactTime\(9),
	datad => VCC,
	cin => \MEF|LessThan2~17_cout\,
	cout => \MEF|LessThan2~19_cout\);

-- Location: LCCOMB_X112_Y35_N26
\MEF|LessThan2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~21_cout\ = CARRY((\PLAYER_A|reactTime\(10) & (\PLAYER_B|reactTime\(10) & !\MEF|LessThan2~19_cout\)) # (!\PLAYER_A|reactTime\(10) & ((\PLAYER_B|reactTime\(10)) # (!\MEF|LessThan2~19_cout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(10),
	datab => \PLAYER_B|reactTime\(10),
	datad => VCC,
	cin => \MEF|LessThan2~19_cout\,
	cout => \MEF|LessThan2~21_cout\);

-- Location: LCCOMB_X112_Y35_N28
\MEF|LessThan2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~23_cout\ = CARRY((\PLAYER_A|reactTime\(11) & ((!\MEF|LessThan2~21_cout\) # (!\PLAYER_B|reactTime\(11)))) # (!\PLAYER_A|reactTime\(11) & (!\PLAYER_B|reactTime\(11) & !\MEF|LessThan2~21_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(11),
	datab => \PLAYER_B|reactTime\(11),
	datad => VCC,
	cin => \MEF|LessThan2~21_cout\,
	cout => \MEF|LessThan2~23_cout\);

-- Location: LCCOMB_X112_Y35_N30
\MEF|LessThan2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan2~24_combout\ = (\PLAYER_A|reactTime\(12) & (!\MEF|LessThan2~23_cout\ & \PLAYER_B|reactTime\(12))) # (!\PLAYER_A|reactTime\(12) & ((\PLAYER_B|reactTime\(12)) # (!\MEF|LessThan2~23_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|reactTime\(12),
	datad => \PLAYER_B|reactTime\(12),
	cin => \MEF|LessThan2~23_cout\,
	combout => \MEF|LessThan2~24_combout\);

-- Location: LCCOMB_X110_Y37_N18
\MEF|points_B_int[5]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int[5]~10_combout\ = (\MEF|points_B_int[5]~17_combout\ & ((\MEF|points_B_int[5]~8_combout\) # ((\MEF|LessThan3~24_combout\ & !\MEF|LessThan2~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|LessThan3~24_combout\,
	datab => \MEF|points_B_int[5]~8_combout\,
	datac => \MEF|points_B_int[5]~17_combout\,
	datad => \MEF|LessThan2~24_combout\,
	combout => \MEF|points_B_int[5]~10_combout\);

-- Location: FF_X110_Y37_N5
\MEF|points_B_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_B_int~11_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_B_int[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_B_int\(5));

-- Location: LCCOMB_X109_Y37_N10
\MEF|Add3~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add3~11_combout\ = \MEF|Add3~10\ $ (!\MEF|points_B_int\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \MEF|points_B_int\(6),
	cin => \MEF|Add3~10\,
	combout => \MEF|Add3~11_combout\);

-- Location: LCCOMB_X108_Y37_N18
\MEF|Add5~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~14_combout\ = \MEF|Add5~13\ $ (!\MEF|points_B_int\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \MEF|points_B_int\(6),
	cin => \MEF|Add5~13\,
	combout => \MEF|Add5~14_combout\);

-- Location: LCCOMB_X110_Y37_N26
\MEF|points_B_int~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int~15_combout\ = (\MEF|Add3~11_combout\ & ((\MEF|Add3~2_combout\) # ((\MEF|Add5~14_combout\ & \MEF|points_B_int~16_combout\)))) # (!\MEF|Add3~11_combout\ & (\MEF|Add5~14_combout\ & (\MEF|points_B_int~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add3~11_combout\,
	datab => \MEF|Add5~14_combout\,
	datac => \MEF|points_B_int~16_combout\,
	datad => \MEF|Add3~2_combout\,
	combout => \MEF|points_B_int~15_combout\);

-- Location: FF_X110_Y37_N27
\MEF|points_B_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_B_int~15_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_B_int[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_B_int\(6));

-- Location: LCCOMB_X111_Y37_N18
\MEF|internal_reset~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|internal_reset~2_combout\ = (\MEF|winnerA_int~q\) # ((\MEF|winnerB_int~q\) # ((\MEF|points_B_int\(6) & \MEF|points_A_int\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(6),
	datab => \MEF|winnerA_int~q\,
	datac => \MEF|winnerB_int~q\,
	datad => \MEF|points_A_int\(6),
	combout => \MEF|internal_reset~2_combout\);

-- Location: LCCOMB_X113_Y37_N12
\MEF|internal_reset~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|internal_reset~3_combout\ = (\MEF|internal_reset~q\) # ((\MEF|internal_reset~2_combout\ & ((\state|state.gameINFO~q\) # (\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.gameINFO~q\,
	datab => \state|state.game~q\,
	datac => \MEF|internal_reset~q\,
	datad => \MEF|internal_reset~2_combout\,
	combout => \MEF|internal_reset~3_combout\);

-- Location: FF_X113_Y37_N13
\MEF|internal_reset\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|internal_reset~3_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|internal_reset~q\);

-- Location: LCCOMB_X113_Y37_N14
\MEF|state_machine~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|state_machine~0_combout\ = (\MEF|internal_reset~q\) # (!\inst2|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_key_prev~q\,
	datad => \MEF|internal_reset~q\,
	combout => \MEF|state_machine~0_combout\);

-- Location: FF_X112_Y37_N27
\MEF|playerB_time_last[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(12),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(12));

-- Location: FF_X112_Y37_N15
\MEF|playerB_time_last[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(10),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(10));

-- Location: FF_X112_Y37_N1
\MEF|playerB_time_last[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(11),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(11));

-- Location: LCCOMB_X112_Y37_N0
\MEF|playerB_valid~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~6_combout\ = (\PLAYER_B|reactTime\(11) & (\MEF|playerB_time_last\(11) & (\MEF|playerB_time_last\(10) $ (!\PLAYER_B|reactTime\(10))))) # (!\PLAYER_B|reactTime\(11) & (!\MEF|playerB_time_last\(11) & (\MEF|playerB_time_last\(10) $ 
-- (!\PLAYER_B|reactTime\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(11),
	datab => \MEF|playerB_time_last\(10),
	datac => \MEF|playerB_time_last\(11),
	datad => \PLAYER_B|reactTime\(10),
	combout => \MEF|playerB_valid~6_combout\);

-- Location: LCCOMB_X112_Y37_N26
\MEF|playerB_valid~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~7_combout\ = (!\MEF|playerB_valid~q\ & (\MEF|playerB_valid~6_combout\ & (\PLAYER_B|reactTime\(12) $ (!\MEF|playerB_time_last\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerB_valid~q\,
	datab => \PLAYER_B|reactTime\(12),
	datac => \MEF|playerB_time_last\(12),
	datad => \MEF|playerB_valid~6_combout\,
	combout => \MEF|playerB_valid~7_combout\);

-- Location: FF_X114_Y37_N15
\MEF|playerB_time_last[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(9),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(9));

-- Location: LCCOMB_X114_Y37_N28
\MEF|playerB_time_last[8]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_time_last[8]~feeder_combout\ = \PLAYER_B|reactTime\(8)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \PLAYER_B|reactTime\(8),
	combout => \MEF|playerB_time_last[8]~feeder_combout\);

-- Location: FF_X114_Y37_N29
\MEF|playerB_time_last[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerB_time_last[8]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(8));

-- Location: LCCOMB_X114_Y37_N14
\MEF|playerB_valid~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~5_combout\ = (\PLAYER_B|reactTime\(8) & (\MEF|playerB_time_last\(8) & (\PLAYER_B|reactTime\(9) $ (!\MEF|playerB_time_last\(9))))) # (!\PLAYER_B|reactTime\(8) & (!\MEF|playerB_time_last\(8) & (\PLAYER_B|reactTime\(9) $ 
-- (!\MEF|playerB_time_last\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(8),
	datab => \PLAYER_B|reactTime\(9),
	datac => \MEF|playerB_time_last\(9),
	datad => \MEF|playerB_time_last\(8),
	combout => \MEF|playerB_valid~5_combout\);

-- Location: FF_X114_Y37_N13
\MEF|playerB_time_last[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(7),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(7));

-- Location: LCCOMB_X114_Y37_N2
\MEF|playerB_time_last[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_time_last[6]~feeder_combout\ = \PLAYER_B|reactTime\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_B|reactTime\(6),
	combout => \MEF|playerB_time_last[6]~feeder_combout\);

-- Location: FF_X114_Y37_N3
\MEF|playerB_time_last[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerB_time_last[6]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(6));

-- Location: LCCOMB_X114_Y37_N12
\MEF|playerB_valid~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~3_combout\ = (\PLAYER_B|reactTime\(7) & (\MEF|playerB_time_last\(7) & (\PLAYER_B|reactTime\(6) $ (!\MEF|playerB_time_last\(6))))) # (!\PLAYER_B|reactTime\(7) & (!\MEF|playerB_time_last\(7) & (\PLAYER_B|reactTime\(6) $ 
-- (!\MEF|playerB_time_last\(6)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|reactTime\(7),
	datab => \PLAYER_B|reactTime\(6),
	datac => \MEF|playerB_time_last\(7),
	datad => \MEF|playerB_time_last\(6),
	combout => \MEF|playerB_valid~3_combout\);

-- Location: LCCOMB_X114_Y37_N6
\MEF|playerB_time_last[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_time_last[4]~feeder_combout\ = \PLAYER_B|reactTime\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_B|reactTime\(4),
	combout => \MEF|playerB_time_last[4]~feeder_combout\);

-- Location: FF_X114_Y37_N7
\MEF|playerB_time_last[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerB_time_last[4]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(4));

-- Location: FF_X114_Y37_N17
\MEF|playerB_time_last[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(5),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(5));

-- Location: LCCOMB_X114_Y37_N16
\MEF|playerB_valid~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~2_combout\ = (\MEF|playerB_time_last\(4) & (\PLAYER_B|reactTime\(4) & (\PLAYER_B|reactTime\(5) $ (!\MEF|playerB_time_last\(5))))) # (!\MEF|playerB_time_last\(4) & (!\PLAYER_B|reactTime\(4) & (\PLAYER_B|reactTime\(5) $ 
-- (!\MEF|playerB_time_last\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerB_time_last\(4),
	datab => \PLAYER_B|reactTime\(5),
	datac => \MEF|playerB_time_last\(5),
	datad => \PLAYER_B|reactTime\(4),
	combout => \MEF|playerB_valid~2_combout\);

-- Location: LCCOMB_X114_Y37_N30
\MEF|playerB_time_last[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_time_last[2]~feeder_combout\ = \PLAYER_B|reactTime\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_B|reactTime\(2),
	combout => \MEF|playerB_time_last[2]~feeder_combout\);

-- Location: FF_X114_Y37_N31
\MEF|playerB_time_last[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerB_time_last[2]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(2));

-- Location: FF_X114_Y37_N9
\MEF|playerB_time_last[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(3),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(3));

-- Location: LCCOMB_X114_Y37_N8
\MEF|playerB_valid~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~1_combout\ = (\MEF|playerB_time_last\(2) & (\PLAYER_B|reactTime\(2) & (\PLAYER_B|reactTime\(3) $ (!\MEF|playerB_time_last\(3))))) # (!\MEF|playerB_time_last\(2) & (!\PLAYER_B|reactTime\(2) & (\PLAYER_B|reactTime\(3) $ 
-- (!\MEF|playerB_time_last\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerB_time_last\(2),
	datab => \PLAYER_B|reactTime\(3),
	datac => \MEF|playerB_time_last\(3),
	datad => \PLAYER_B|reactTime\(2),
	combout => \MEF|playerB_valid~1_combout\);

-- Location: LCCOMB_X114_Y37_N22
\MEF|playerB_time_last[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_time_last[0]~feeder_combout\ = \PLAYER_B|reactTime\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \PLAYER_B|reactTime\(0),
	combout => \MEF|playerB_time_last[0]~feeder_combout\);

-- Location: FF_X114_Y37_N23
\MEF|playerB_time_last[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerB_time_last[0]~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(0));

-- Location: FF_X114_Y37_N1
\MEF|playerB_time_last[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \PLAYER_B|reactTime\(1),
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_time_last\(1));

-- Location: LCCOMB_X114_Y37_N0
\MEF|playerB_valid~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~0_combout\ = (\MEF|playerB_time_last\(0) & (\PLAYER_B|reactTime\(0) & (\PLAYER_B|reactTime\(1) $ (!\MEF|playerB_time_last\(1))))) # (!\MEF|playerB_time_last\(0) & (!\PLAYER_B|reactTime\(0) & (\PLAYER_B|reactTime\(1) $ 
-- (!\MEF|playerB_time_last\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerB_time_last\(0),
	datab => \PLAYER_B|reactTime\(1),
	datac => \MEF|playerB_time_last\(1),
	datad => \PLAYER_B|reactTime\(0),
	combout => \MEF|playerB_valid~0_combout\);

-- Location: LCCOMB_X114_Y37_N18
\MEF|playerB_valid~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~4_combout\ = (\MEF|playerB_valid~3_combout\ & (\MEF|playerB_valid~2_combout\ & (\MEF|playerB_valid~1_combout\ & \MEF|playerB_valid~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerB_valid~3_combout\,
	datab => \MEF|playerB_valid~2_combout\,
	datac => \MEF|playerB_valid~1_combout\,
	datad => \MEF|playerB_valid~0_combout\,
	combout => \MEF|playerB_valid~4_combout\);

-- Location: LCCOMB_X113_Y37_N30
\MEF|playerB_valid~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerB_valid~8_combout\ = (!\MEF|points_A_int~2_combout\ & (((!\MEF|playerB_valid~4_combout\) # (!\MEF|playerB_valid~5_combout\)) # (!\MEF|playerB_valid~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|playerB_valid~7_combout\,
	datab => \MEF|points_A_int~2_combout\,
	datac => \MEF|playerB_valid~5_combout\,
	datad => \MEF|playerB_valid~4_combout\,
	combout => \MEF|playerB_valid~8_combout\);

-- Location: FF_X113_Y37_N31
\MEF|playerB_valid\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerB_valid~8_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerB_valid~q\);

-- Location: LCCOMB_X110_Y37_N20
\MEF|points_B_int~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int~16_combout\ = (\MEF|LessThan3~24_combout\ & (\MEF|playerB_valid~q\ & (\MEF|playerA_valid~q\ & !\MEF|LessThan2~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|LessThan3~24_combout\,
	datab => \MEF|playerB_valid~q\,
	datac => \MEF|playerA_valid~q\,
	datad => \MEF|LessThan2~24_combout\,
	combout => \MEF|points_B_int~16_combout\);

-- Location: LCCOMB_X110_Y37_N0
\MEF|points_B_int~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int~13_combout\ = (\MEF|Add5~8_combout\ & ((\MEF|points_B_int~16_combout\) # ((\MEF|Add3~5_combout\ & \MEF|Add3~2_combout\)))) # (!\MEF|Add5~8_combout\ & (\MEF|Add3~5_combout\ & ((\MEF|Add3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add5~8_combout\,
	datab => \MEF|Add3~5_combout\,
	datac => \MEF|points_B_int~16_combout\,
	datad => \MEF|Add3~2_combout\,
	combout => \MEF|points_B_int~13_combout\);

-- Location: FF_X110_Y37_N1
\MEF|points_B_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_B_int~13_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_B_int[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_B_int\(3));

-- Location: LCCOMB_X110_Y37_N6
\MEF|points_B_int~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int~12_combout\ = (\MEF|Add5~10_combout\ & ((\MEF|points_B_int~16_combout\) # ((\MEF|Add3~7_combout\ & \MEF|Add3~2_combout\)))) # (!\MEF|Add5~10_combout\ & (\MEF|Add3~7_combout\ & ((\MEF|Add3~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add5~10_combout\,
	datab => \MEF|Add3~7_combout\,
	datac => \MEF|points_B_int~16_combout\,
	datad => \MEF|Add3~2_combout\,
	combout => \MEF|points_B_int~12_combout\);

-- Location: FF_X110_Y37_N7
\MEF|points_B_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_B_int~12_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_B_int[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_B_int\(4));

-- Location: LCCOMB_X110_Y37_N24
\MEF|LessThan1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|LessThan1~0_combout\ = (!\MEF|points_B_int\(4) & (!\MEF|points_B_int\(3) & (!\MEF|points_B_int\(5) & !\MEF|points_B_int\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(4),
	datab => \MEF|points_B_int\(3),
	datac => \MEF|points_B_int\(5),
	datad => \MEF|points_B_int\(2),
	combout => \MEF|LessThan1~0_combout\);

-- Location: LCCOMB_X110_Y37_N10
\MEF|Add5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~2_combout\ = ((!\MEF|points_B_int\(6) & ((\MEF|points_B_int\(1)) # (!\MEF|LessThan1~0_combout\)))) # (!\MEF|points_B_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(1),
	datab => \MEF|LessThan1~0_combout\,
	datac => \MEF|points_B_int\(6),
	datad => \MEF|points_B_int[5]~8_combout\,
	combout => \MEF|Add5~2_combout\);

-- Location: LCCOMB_X108_Y37_N6
\MEF|Add5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~0_combout\ = \MEF|points_B_int\(0) $ (VCC)
-- \MEF|Add5~1\ = CARRY(\MEF|points_B_int\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(0),
	datad => VCC,
	combout => \MEF|Add5~0_combout\,
	cout => \MEF|Add5~1\);

-- Location: LCCOMB_X110_Y37_N12
\MEF|Add5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add5~3_combout\ = (\MEF|points_B_int~16_combout\ & (((\MEF|Add5~0_combout\)))) # (!\MEF|points_B_int~16_combout\ & (\MEF|Add5~2_combout\ & ((\MEF|points_B_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add5~2_combout\,
	datab => \MEF|Add5~0_combout\,
	datac => \MEF|points_B_int\(0),
	datad => \MEF|points_B_int~16_combout\,
	combout => \MEF|Add5~3_combout\);

-- Location: FF_X110_Y37_N13
\MEF|points_B_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|Add5~3_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_B_int\(0));

-- Location: LCCOMB_X110_Y37_N22
\MEF|points_B_int~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int~9_combout\ = (\MEF|Add3~0_combout\ & ((\MEF|Add3~2_combout\) # ((\MEF|Add5~4_combout\ & \MEF|points_B_int~16_combout\)))) # (!\MEF|Add3~0_combout\ & (\MEF|Add5~4_combout\ & (\MEF|points_B_int~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add3~0_combout\,
	datab => \MEF|Add5~4_combout\,
	datac => \MEF|points_B_int~16_combout\,
	datad => \MEF|Add3~2_combout\,
	combout => \MEF|points_B_int~9_combout\);

-- Location: FF_X110_Y37_N23
\MEF|points_B_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_B_int~9_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_B_int[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_B_int\(1));

-- Location: LCCOMB_X110_Y37_N2
\MEF|points_B_int~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_B_int~14_combout\ = (\MEF|Add3~3_combout\ & ((\MEF|Add3~2_combout\) # ((\MEF|Add5~6_combout\ & \MEF|points_B_int~16_combout\)))) # (!\MEF|Add3~3_combout\ & (\MEF|Add5~6_combout\ & (\MEF|points_B_int~16_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add3~3_combout\,
	datab => \MEF|Add5~6_combout\,
	datac => \MEF|points_B_int~16_combout\,
	datad => \MEF|Add3~2_combout\,
	combout => \MEF|points_B_int~14_combout\);

-- Location: FF_X110_Y37_N3
\MEF|points_B_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_B_int~14_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_B_int[5]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_B_int\(2));

-- Location: LCCOMB_X54_Y70_N10
\10Hz|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~1_cout\ = CARRY((\1kHz|s_cnt\(1) & \1kHz|s_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(1),
	datab => \1kHz|s_cnt\(0),
	datad => VCC,
	cout => \10Hz|Add0~1_cout\);

-- Location: LCCOMB_X54_Y70_N12
\10Hz|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~3_cout\ = CARRY((!\10Hz|Add0~1_cout\) # (!\1kHz|s_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(2),
	datad => VCC,
	cin => \10Hz|Add0~1_cout\,
	cout => \10Hz|Add0~3_cout\);

-- Location: LCCOMB_X54_Y70_N14
\10Hz|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~5_cout\ = CARRY((\1kHz|s_cnt\(3) & !\10Hz|Add0~3_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1kHz|s_cnt\(3),
	datad => VCC,
	cin => \10Hz|Add0~3_cout\,
	cout => \10Hz|Add0~5_cout\);

-- Location: LCCOMB_X54_Y70_N16
\10Hz|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~6_combout\ = (\10Hz|s_cnt\(4) & (!\10Hz|Add0~5_cout\)) # (!\10Hz|s_cnt\(4) & ((\10Hz|Add0~5_cout\) # (GND)))
-- \10Hz|Add0~7\ = CARRY((!\10Hz|Add0~5_cout\) # (!\10Hz|s_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(4),
	datad => VCC,
	cin => \10Hz|Add0~5_cout\,
	combout => \10Hz|Add0~6_combout\,
	cout => \10Hz|Add0~7\);

-- Location: FF_X54_Y70_N17
\10Hz|s_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(4));

-- Location: LCCOMB_X54_Y70_N18
\10Hz|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~8_combout\ = (\10Hz|s_cnt\(5) & (\10Hz|Add0~7\ $ (GND))) # (!\10Hz|s_cnt\(5) & (!\10Hz|Add0~7\ & VCC))
-- \10Hz|Add0~9\ = CARRY((\10Hz|s_cnt\(5) & !\10Hz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(5),
	datad => VCC,
	cin => \10Hz|Add0~7\,
	combout => \10Hz|Add0~8_combout\,
	cout => \10Hz|Add0~9\);

-- Location: FF_X54_Y70_N19
\10Hz|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(5));

-- Location: LCCOMB_X54_Y70_N20
\10Hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~10_combout\ = (\10Hz|s_cnt\(6) & (!\10Hz|Add0~9\)) # (!\10Hz|s_cnt\(6) & ((\10Hz|Add0~9\) # (GND)))
-- \10Hz|Add0~11\ = CARRY((!\10Hz|Add0~9\) # (!\10Hz|s_cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(6),
	datad => VCC,
	cin => \10Hz|Add0~9\,
	combout => \10Hz|Add0~10_combout\,
	cout => \10Hz|Add0~11\);

-- Location: LCCOMB_X54_Y70_N4
\10Hz|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~3_combout\ = (\10Hz|Add0~10_combout\ & !\10Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|Add0~10_combout\,
	datad => \10Hz|Equal0~6_combout\,
	combout => \10Hz|s_cnt~3_combout\);

-- Location: FF_X54_Y70_N5
\10Hz|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(6));

-- Location: LCCOMB_X54_Y70_N22
\10Hz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~12_combout\ = (\10Hz|s_cnt\(7) & (\10Hz|Add0~11\ $ (GND))) # (!\10Hz|s_cnt\(7) & (!\10Hz|Add0~11\ & VCC))
-- \10Hz|Add0~13\ = CARRY((\10Hz|s_cnt\(7) & !\10Hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(7),
	datad => VCC,
	cin => \10Hz|Add0~11\,
	combout => \10Hz|Add0~12_combout\,
	cout => \10Hz|Add0~13\);

-- Location: FF_X54_Y70_N23
\10Hz|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(7));

-- Location: LCCOMB_X54_Y70_N24
\10Hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~14_combout\ = (\10Hz|s_cnt\(8) & (!\10Hz|Add0~13\)) # (!\10Hz|s_cnt\(8) & ((\10Hz|Add0~13\) # (GND)))
-- \10Hz|Add0~15\ = CARRY((!\10Hz|Add0~13\) # (!\10Hz|s_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(8),
	datad => VCC,
	cin => \10Hz|Add0~13\,
	combout => \10Hz|Add0~14_combout\,
	cout => \10Hz|Add0~15\);

-- Location: LCCOMB_X54_Y70_N6
\10Hz|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~2_combout\ = (\10Hz|Add0~14_combout\ & !\10Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|Add0~14_combout\,
	datad => \10Hz|Equal0~6_combout\,
	combout => \10Hz|s_cnt~2_combout\);

-- Location: FF_X54_Y70_N7
\10Hz|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(8));

-- Location: LCCOMB_X54_Y70_N26
\10Hz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~16_combout\ = (\10Hz|s_cnt\(9) & (\10Hz|Add0~15\ $ (GND))) # (!\10Hz|s_cnt\(9) & (!\10Hz|Add0~15\ & VCC))
-- \10Hz|Add0~17\ = CARRY((\10Hz|s_cnt\(9) & !\10Hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(9),
	datad => VCC,
	cin => \10Hz|Add0~15\,
	combout => \10Hz|Add0~16_combout\,
	cout => \10Hz|Add0~17\);

-- Location: LCCOMB_X54_Y70_N2
\10Hz|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~1_combout\ = (\10Hz|Add0~16_combout\ & !\10Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Add0~16_combout\,
	datad => \10Hz|Equal0~6_combout\,
	combout => \10Hz|s_cnt~1_combout\);

-- Location: FF_X54_Y70_N3
\10Hz|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(9));

-- Location: LCCOMB_X54_Y70_N28
\10Hz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~18_combout\ = (\10Hz|s_cnt\(10) & (!\10Hz|Add0~17\)) # (!\10Hz|s_cnt\(10) & ((\10Hz|Add0~17\) # (GND)))
-- \10Hz|Add0~19\ = CARRY((!\10Hz|Add0~17\) # (!\10Hz|s_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(10),
	datad => VCC,
	cin => \10Hz|Add0~17\,
	combout => \10Hz|Add0~18_combout\,
	cout => \10Hz|Add0~19\);

-- Location: FF_X54_Y70_N29
\10Hz|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(10));

-- Location: LCCOMB_X54_Y70_N30
\10Hz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~20_combout\ = (\10Hz|s_cnt\(11) & (\10Hz|Add0~19\ $ (GND))) # (!\10Hz|s_cnt\(11) & (!\10Hz|Add0~19\ & VCC))
-- \10Hz|Add0~21\ = CARRY((\10Hz|s_cnt\(11) & !\10Hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(11),
	datad => VCC,
	cin => \10Hz|Add0~19\,
	combout => \10Hz|Add0~20_combout\,
	cout => \10Hz|Add0~21\);

-- Location: LCCOMB_X54_Y70_N8
\10Hz|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~0_combout\ = (\10Hz|Add0~20_combout\ & !\10Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Add0~20_combout\,
	datad => \10Hz|Equal0~6_combout\,
	combout => \10Hz|s_cnt~0_combout\);

-- Location: FF_X54_Y70_N9
\10Hz|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(11));

-- Location: LCCOMB_X54_Y69_N0
\10Hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~22_combout\ = (\10Hz|s_cnt\(12) & (!\10Hz|Add0~21\)) # (!\10Hz|s_cnt\(12) & ((\10Hz|Add0~21\) # (GND)))
-- \10Hz|Add0~23\ = CARRY((!\10Hz|Add0~21\) # (!\10Hz|s_cnt\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(12),
	datad => VCC,
	cin => \10Hz|Add0~21\,
	combout => \10Hz|Add0~22_combout\,
	cout => \10Hz|Add0~23\);

-- Location: FF_X54_Y69_N1
\10Hz|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(12));

-- Location: LCCOMB_X54_Y69_N2
\10Hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~24_combout\ = (\10Hz|s_cnt\(13) & (\10Hz|Add0~23\ $ (GND))) # (!\10Hz|s_cnt\(13) & (!\10Hz|Add0~23\ & VCC))
-- \10Hz|Add0~25\ = CARRY((\10Hz|s_cnt\(13) & !\10Hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(13),
	datad => VCC,
	cin => \10Hz|Add0~23\,
	combout => \10Hz|Add0~24_combout\,
	cout => \10Hz|Add0~25\);

-- Location: FF_X54_Y69_N3
\10Hz|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~24_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(13));

-- Location: LCCOMB_X54_Y69_N4
\10Hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~26_combout\ = (\10Hz|s_cnt\(14) & (!\10Hz|Add0~25\)) # (!\10Hz|s_cnt\(14) & ((\10Hz|Add0~25\) # (GND)))
-- \10Hz|Add0~27\ = CARRY((!\10Hz|Add0~25\) # (!\10Hz|s_cnt\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(14),
	datad => VCC,
	cin => \10Hz|Add0~25\,
	combout => \10Hz|Add0~26_combout\,
	cout => \10Hz|Add0~27\);

-- Location: LCCOMB_X54_Y69_N30
\10Hz|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~4_combout\ = (!\10Hz|Equal0~6_combout\ & \10Hz|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~6_combout\,
	datad => \10Hz|Add0~26_combout\,
	combout => \10Hz|s_cnt~4_combout\);

-- Location: FF_X54_Y69_N31
\10Hz|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(14));

-- Location: LCCOMB_X54_Y69_N6
\10Hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~28_combout\ = (\10Hz|s_cnt\(15) & (\10Hz|Add0~27\ $ (GND))) # (!\10Hz|s_cnt\(15) & (!\10Hz|Add0~27\ & VCC))
-- \10Hz|Add0~29\ = CARRY((\10Hz|s_cnt\(15) & !\10Hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(15),
	datad => VCC,
	cin => \10Hz|Add0~27\,
	combout => \10Hz|Add0~28_combout\,
	cout => \10Hz|Add0~29\);

-- Location: FF_X54_Y69_N7
\10Hz|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~28_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(15));

-- Location: LCCOMB_X54_Y69_N8
\10Hz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~30_combout\ = (\10Hz|s_cnt\(16) & (!\10Hz|Add0~29\)) # (!\10Hz|s_cnt\(16) & ((\10Hz|Add0~29\) # (GND)))
-- \10Hz|Add0~31\ = CARRY((!\10Hz|Add0~29\) # (!\10Hz|s_cnt\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(16),
	datad => VCC,
	cin => \10Hz|Add0~29\,
	combout => \10Hz|Add0~30_combout\,
	cout => \10Hz|Add0~31\);

-- Location: FF_X54_Y69_N9
\10Hz|s_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(16));

-- Location: LCCOMB_X54_Y69_N10
\10Hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~32_combout\ = (\10Hz|s_cnt\(17) & (\10Hz|Add0~31\ $ (GND))) # (!\10Hz|s_cnt\(17) & (!\10Hz|Add0~31\ & VCC))
-- \10Hz|Add0~33\ = CARRY((\10Hz|s_cnt\(17) & !\10Hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(17),
	datad => VCC,
	cin => \10Hz|Add0~31\,
	combout => \10Hz|Add0~32_combout\,
	cout => \10Hz|Add0~33\);

-- Location: FF_X54_Y69_N11
\10Hz|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(17));

-- Location: LCCOMB_X54_Y69_N12
\10Hz|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~34_combout\ = (\10Hz|s_cnt\(18) & (!\10Hz|Add0~33\)) # (!\10Hz|s_cnt\(18) & ((\10Hz|Add0~33\) # (GND)))
-- \10Hz|Add0~35\ = CARRY((!\10Hz|Add0~33\) # (!\10Hz|s_cnt\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(18),
	datad => VCC,
	cin => \10Hz|Add0~33\,
	combout => \10Hz|Add0~34_combout\,
	cout => \10Hz|Add0~35\);

-- Location: LCCOMB_X54_Y69_N22
\10Hz|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~6_combout\ = (!\10Hz|Equal0~6_combout\ & \10Hz|Add0~34_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~6_combout\,
	datad => \10Hz|Add0~34_combout\,
	combout => \10Hz|s_cnt~6_combout\);

-- Location: FF_X54_Y69_N23
\10Hz|s_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(18));

-- Location: LCCOMB_X54_Y69_N14
\10Hz|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~36_combout\ = (\10Hz|s_cnt\(19) & (\10Hz|Add0~35\ $ (GND))) # (!\10Hz|s_cnt\(19) & (!\10Hz|Add0~35\ & VCC))
-- \10Hz|Add0~37\ = CARRY((\10Hz|s_cnt\(19) & !\10Hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(19),
	datad => VCC,
	cin => \10Hz|Add0~35\,
	combout => \10Hz|Add0~36_combout\,
	cout => \10Hz|Add0~37\);

-- Location: LCCOMB_X54_Y69_N24
\10Hz|s_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~7_combout\ = (!\10Hz|Equal0~6_combout\ & \10Hz|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~6_combout\,
	datad => \10Hz|Add0~36_combout\,
	combout => \10Hz|s_cnt~7_combout\);

-- Location: FF_X54_Y69_N25
\10Hz|s_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(19));

-- Location: LCCOMB_X54_Y69_N16
\10Hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~38_combout\ = (\10Hz|s_cnt\(20) & (!\10Hz|Add0~37\)) # (!\10Hz|s_cnt\(20) & ((\10Hz|Add0~37\) # (GND)))
-- \10Hz|Add0~39\ = CARRY((!\10Hz|Add0~37\) # (!\10Hz|s_cnt\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(20),
	datad => VCC,
	cin => \10Hz|Add0~37\,
	combout => \10Hz|Add0~38_combout\,
	cout => \10Hz|Add0~39\);

-- Location: FF_X54_Y69_N17
\10Hz|s_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~38_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(20));

-- Location: LCCOMB_X54_Y69_N18
\10Hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~40_combout\ = (\10Hz|s_cnt\(21) & (\10Hz|Add0~39\ $ (GND))) # (!\10Hz|s_cnt\(21) & (!\10Hz|Add0~39\ & VCC))
-- \10Hz|Add0~41\ = CARRY((\10Hz|s_cnt\(21) & !\10Hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(21),
	datad => VCC,
	cin => \10Hz|Add0~39\,
	combout => \10Hz|Add0~40_combout\,
	cout => \10Hz|Add0~41\);

-- Location: FF_X54_Y69_N19
\10Hz|s_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~40_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(21));

-- Location: LCCOMB_X54_Y69_N20
\10Hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~42_combout\ = \10Hz|Add0~41\ $ (\10Hz|s_cnt\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \10Hz|s_cnt\(22),
	cin => \10Hz|Add0~41\,
	combout => \10Hz|Add0~42_combout\);

-- Location: LCCOMB_X54_Y69_N28
\10Hz|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~5_combout\ = (!\10Hz|Equal0~6_combout\ & \10Hz|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~6_combout\,
	datad => \10Hz|Add0~42_combout\,
	combout => \10Hz|s_cnt~5_combout\);

-- Location: FF_X54_Y69_N29
\10Hz|s_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|s_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(22));

-- Location: LCCOMB_X55_Y69_N0
\10Hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~4_combout\ = (!\10Hz|s_cnt\(17) & (\10Hz|s_cnt\(14) & (!\10Hz|s_cnt\(15) & !\10Hz|s_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(17),
	datab => \10Hz|s_cnt\(14),
	datac => \10Hz|s_cnt\(15),
	datad => \10Hz|s_cnt\(16),
	combout => \10Hz|Equal0~4_combout\);

-- Location: LCCOMB_X54_Y69_N26
\10Hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~5_combout\ = (!\10Hz|s_cnt\(21) & (!\10Hz|s_cnt\(20) & (\10Hz|s_cnt\(18) & \10Hz|s_cnt\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(21),
	datab => \10Hz|s_cnt\(20),
	datac => \10Hz|s_cnt\(18),
	datad => \10Hz|s_cnt\(19),
	combout => \10Hz|Equal0~5_combout\);

-- Location: LCCOMB_X54_Y70_N0
\10Hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~1_combout\ = (!\10Hz|s_cnt\(12) & (!\10Hz|s_cnt\(10) & (\10Hz|s_cnt\(11) & \10Hz|s_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(12),
	datab => \10Hz|s_cnt\(10),
	datac => \10Hz|s_cnt\(11),
	datad => \10Hz|s_cnt\(9),
	combout => \10Hz|Equal0~1_combout\);

-- Location: LCCOMB_X55_Y70_N30
\10Hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~0_combout\ = (\10Hz|s_cnt\(5) & (\10Hz|s_cnt\(4) & \1kHz|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(5),
	datac => \10Hz|s_cnt\(4),
	datad => \1kHz|Equal0~0_combout\,
	combout => \10Hz|Equal0~0_combout\);

-- Location: LCCOMB_X55_Y70_N20
\10Hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~2_combout\ = (!\10Hz|s_cnt\(13) & (\10Hz|s_cnt\(8) & (!\10Hz|s_cnt\(6) & !\10Hz|s_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(13),
	datab => \10Hz|s_cnt\(8),
	datac => \10Hz|s_cnt\(6),
	datad => \10Hz|s_cnt\(7),
	combout => \10Hz|Equal0~2_combout\);

-- Location: LCCOMB_X55_Y70_N28
\10Hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~3_combout\ = (\10Hz|Equal0~1_combout\ & (\10Hz|Equal0~0_combout\ & \10Hz|Equal0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|Equal0~1_combout\,
	datac => \10Hz|Equal0~0_combout\,
	datad => \10Hz|Equal0~2_combout\,
	combout => \10Hz|Equal0~3_combout\);

-- Location: LCCOMB_X55_Y70_N4
\10Hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~6_combout\ = (\10Hz|s_cnt\(22) & (\10Hz|Equal0~4_combout\ & (\10Hz|Equal0~5_combout\ & \10Hz|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(22),
	datab => \10Hz|Equal0~4_combout\,
	datac => \10Hz|Equal0~5_combout\,
	datad => \10Hz|Equal0~3_combout\,
	combout => \10Hz|Equal0~6_combout\);

-- Location: LCCOMB_X55_Y70_N0
\10Hz|pulse~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|pulse~feeder_combout\ = \10Hz|Equal0~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~6_combout\,
	combout => \10Hz|pulse~feeder_combout\);

-- Location: FF_X55_Y70_N1
\10Hz|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|pulse~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|pulse~q\);

-- Location: CLKCTRL_G11
\10Hz|pulse~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \10Hz|pulse~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \10Hz|pulse~clkctrl_outclk\);

-- Location: LCCOMB_X110_Y36_N6
\inst11|btn_up_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_up_prev~0_combout\ = !\inst4|s_key_prev~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst4|s_key_prev~q\,
	combout => \inst11|btn_up_prev~0_combout\);

-- Location: FF_X110_Y36_N7
\inst11|btn_up_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_up_prev~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_up_prev~q\);

-- Location: LCCOMB_X111_Y36_N12
\inst11|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~0_combout\ = \inst11|counter\(0) $ (VCC)
-- \inst11|Add0~1\ = CARRY(\inst11|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datad => VCC,
	combout => \inst11|Add0~0_combout\,
	cout => \inst11|Add0~1\);

-- Location: LCCOMB_X113_Y36_N16
\inst11|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~2_combout\ = (\inst2|s_key_prev~q\ & \inst11|Add0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst2|s_key_prev~q\,
	datad => \inst11|Add0~0_combout\,
	combout => \inst11|Add0~2_combout\);

-- Location: IOIBUF_X115_Y42_N15
\KEY[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_KEY(2),
	o => \KEY[2]~input_o\);

-- Location: LCCOMB_X113_Y36_N10
\inst3|s_key_prev~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst3|s_key_prev~feeder_combout\ = \KEY[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[2]~input_o\,
	combout => \inst3|s_key_prev~feeder_combout\);

-- Location: FF_X113_Y36_N11
\inst3|s_key_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst3|s_key_prev~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|s_key_prev~q\);

-- Location: LCCOMB_X114_Y36_N26
\inst11|btn_down_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_down_prev~0_combout\ = !\inst3|s_key_prev~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst3|s_key_prev~q\,
	combout => \inst11|btn_down_prev~0_combout\);

-- Location: FF_X114_Y36_N27
\inst11|btn_down_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_down_prev~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_down_prev~q\);

-- Location: LCCOMB_X112_Y36_N18
\inst11|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|LessThan0~0_combout\ = (\inst11|counter\(3) & (\inst11|counter\(1) & !\inst11|counter\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(3),
	datac => \inst11|counter\(1),
	datad => \inst11|counter\(2),
	combout => \inst11|LessThan0~0_combout\);

-- Location: LCCOMB_X113_Y36_N20
\inst11|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|process_0~1_combout\ = (\inst3|s_key_prev~q\) # ((!\inst11|counter\(5) & (!\inst11|counter\(4) & \inst11|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datab => \inst3|s_key_prev~q\,
	datac => \inst11|counter\(4),
	datad => \inst11|LessThan0~0_combout\,
	combout => \inst11|process_0~1_combout\);

-- Location: LCCOMB_X112_Y36_N8
\inst11|counter[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|counter[2]~2_combout\ = (!\inst11|process_0~3_combout\ & ((\inst11|btn_down_prev~q\) # (\inst11|process_0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_down_prev~q\,
	datac => \inst11|process_0~1_combout\,
	datad => \inst11|process_0~3_combout\,
	combout => \inst11|counter[2]~2_combout\);

-- Location: LCCOMB_X112_Y36_N20
\inst11|btn_up_hold_time[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_up_hold_time[0]~5_combout\ = \inst11|btn_up_hold_time\(0) $ (VCC)
-- \inst11|btn_up_hold_time[0]~6\ = CARRY(\inst11|btn_up_hold_time\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|btn_up_hold_time\(0),
	datad => VCC,
	combout => \inst11|btn_up_hold_time[0]~5_combout\,
	cout => \inst11|btn_up_hold_time[0]~6\);

-- Location: LCCOMB_X111_Y36_N28
\inst11|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|process_0~0_combout\ = (\inst4|s_key_prev~q\) # ((\inst11|counter\(5) & (\inst11|counter\(4) & !\inst11|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datab => \inst11|counter\(4),
	datac => \inst11|LessThan0~0_combout\,
	datad => \inst4|s_key_prev~q\,
	combout => \inst11|process_0~0_combout\);

-- Location: LCCOMB_X112_Y36_N30
\inst11|btn_down_hold_time[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_down_hold_time[0]~5_combout\ = (\inst2|s_key_prev~q\ & !\state|state.init~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_key_prev~q\,
	datac => \state|state.init~q\,
	combout => \inst11|btn_down_hold_time[0]~5_combout\);

-- Location: FF_X112_Y36_N21
\inst11|btn_up_hold_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_up_hold_time[0]~5_combout\,
	sclr => \inst11|process_0~0_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_up_hold_time\(0));

-- Location: LCCOMB_X112_Y36_N22
\inst11|btn_up_hold_time[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_up_hold_time[1]~7_combout\ = (\inst11|btn_up_hold_time\(1) & (!\inst11|btn_up_hold_time[0]~6\)) # (!\inst11|btn_up_hold_time\(1) & ((\inst11|btn_up_hold_time[0]~6\) # (GND)))
-- \inst11|btn_up_hold_time[1]~8\ = CARRY((!\inst11|btn_up_hold_time[0]~6\) # (!\inst11|btn_up_hold_time\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_up_hold_time\(1),
	datad => VCC,
	cin => \inst11|btn_up_hold_time[0]~6\,
	combout => \inst11|btn_up_hold_time[1]~7_combout\,
	cout => \inst11|btn_up_hold_time[1]~8\);

-- Location: FF_X112_Y36_N23
\inst11|btn_up_hold_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_up_hold_time[1]~7_combout\,
	sclr => \inst11|process_0~0_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_up_hold_time\(1));

-- Location: LCCOMB_X112_Y36_N24
\inst11|btn_up_hold_time[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_up_hold_time[2]~9_combout\ = (\inst11|btn_up_hold_time\(2) & (\inst11|btn_up_hold_time[1]~8\ $ (GND))) # (!\inst11|btn_up_hold_time\(2) & (!\inst11|btn_up_hold_time[1]~8\ & VCC))
-- \inst11|btn_up_hold_time[2]~10\ = CARRY((\inst11|btn_up_hold_time\(2) & !\inst11|btn_up_hold_time[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst11|btn_up_hold_time\(2),
	datad => VCC,
	cin => \inst11|btn_up_hold_time[1]~8\,
	combout => \inst11|btn_up_hold_time[2]~9_combout\,
	cout => \inst11|btn_up_hold_time[2]~10\);

-- Location: FF_X112_Y36_N25
\inst11|btn_up_hold_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_up_hold_time[2]~9_combout\,
	sclr => \inst11|process_0~0_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_up_hold_time\(2));

-- Location: LCCOMB_X112_Y36_N26
\inst11|btn_up_hold_time[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_up_hold_time[3]~11_combout\ = (\inst11|btn_up_hold_time\(3) & (!\inst11|btn_up_hold_time[2]~10\)) # (!\inst11|btn_up_hold_time\(3) & ((\inst11|btn_up_hold_time[2]~10\) # (GND)))
-- \inst11|btn_up_hold_time[3]~12\ = CARRY((!\inst11|btn_up_hold_time[2]~10\) # (!\inst11|btn_up_hold_time\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_up_hold_time\(3),
	datad => VCC,
	cin => \inst11|btn_up_hold_time[2]~10\,
	combout => \inst11|btn_up_hold_time[3]~11_combout\,
	cout => \inst11|btn_up_hold_time[3]~12\);

-- Location: FF_X112_Y36_N27
\inst11|btn_up_hold_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_up_hold_time[3]~11_combout\,
	sclr => \inst11|process_0~0_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_up_hold_time\(3));

-- Location: LCCOMB_X112_Y36_N28
\inst11|btn_up_hold_time[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_up_hold_time[4]~13_combout\ = \inst11|btn_up_hold_time[3]~12\ $ (!\inst11|btn_up_hold_time\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst11|btn_up_hold_time\(4),
	cin => \inst11|btn_up_hold_time[3]~12\,
	combout => \inst11|btn_up_hold_time[4]~13_combout\);

-- Location: FF_X112_Y36_N29
\inst11|btn_up_hold_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_up_hold_time[4]~13_combout\,
	sclr => \inst11|process_0~0_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_up_hold_time\(4));

-- Location: LCCOMB_X112_Y36_N0
\inst11|LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|LessThan2~0_combout\ = (!\inst11|btn_up_hold_time\(4) & (((!\inst11|btn_up_hold_time\(1) & !\inst11|btn_up_hold_time\(2))) # (!\inst11|btn_up_hold_time\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_up_hold_time\(1),
	datab => \inst11|btn_up_hold_time\(2),
	datac => \inst11|btn_up_hold_time\(3),
	datad => \inst11|btn_up_hold_time\(4),
	combout => \inst11|LessThan2~0_combout\);

-- Location: LCCOMB_X112_Y36_N12
\inst11|counter[2]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|counter[2]~0_combout\ = (\inst11|LessThan2~0_combout\) # ((\inst11|counter\(4) & (!\inst11|LessThan0~0_combout\ & \inst11|counter\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(4),
	datab => \inst11|LessThan0~0_combout\,
	datac => \inst11|counter\(5),
	datad => \inst11|LessThan2~0_combout\,
	combout => \inst11|counter[2]~0_combout\);

-- Location: LCCOMB_X112_Y36_N6
\inst11|counter[2]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|counter[2]~1_combout\ = (\inst11|counter[2]~0_combout\ & ((\inst11|btn_up_prev~q\) # (\inst11|process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter[2]~0_combout\,
	datac => \inst11|btn_up_prev~q\,
	datad => \inst11|process_0~0_combout\,
	combout => \inst11|counter[2]~1_combout\);

-- Location: LCCOMB_X112_Y36_N2
\inst11|counter[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|counter[2]~3_combout\ = ((!\state|state.init~q\ & ((!\inst11|counter[2]~1_combout\) # (!\inst11|counter[2]~2_combout\)))) # (!\inst2|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst2|s_key_prev~q\,
	datac => \inst11|counter[2]~2_combout\,
	datad => \inst11|counter[2]~1_combout\,
	combout => \inst11|counter[2]~3_combout\);

-- Location: FF_X113_Y36_N17
\inst11|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|Add0~2_combout\,
	ena => \inst11|counter[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|counter\(0));

-- Location: LCCOMB_X111_Y36_N14
\inst11|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~4_combout\ = (\inst11|Add0~3_combout\ & ((\inst11|counter\(1) & (!\inst11|Add0~1\)) # (!\inst11|counter\(1) & (\inst11|Add0~1\ & VCC)))) # (!\inst11|Add0~3_combout\ & ((\inst11|counter\(1) & ((\inst11|Add0~1\) # (GND))) # 
-- (!\inst11|counter\(1) & (!\inst11|Add0~1\))))
-- \inst11|Add0~5\ = CARRY((\inst11|Add0~3_combout\ & (\inst11|counter\(1) & !\inst11|Add0~1\)) # (!\inst11|Add0~3_combout\ & ((\inst11|counter\(1)) # (!\inst11|Add0~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|Add0~3_combout\,
	datab => \inst11|counter\(1),
	datad => VCC,
	cin => \inst11|Add0~1\,
	combout => \inst11|Add0~4_combout\,
	cout => \inst11|Add0~5\);

-- Location: LCCOMB_X112_Y36_N14
\inst11|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~18_combout\ = (\inst2|s_key_prev~q\ & !\inst11|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|s_key_prev~q\,
	datad => \inst11|Add0~4_combout\,
	combout => \inst11|Add0~18_combout\);

-- Location: FF_X112_Y36_N15
\inst11|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|Add0~18_combout\,
	ena => \inst11|counter[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|counter\(1));

-- Location: LCCOMB_X111_Y36_N16
\inst11|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~6_combout\ = ((\inst11|Add0~3_combout\ $ (\inst11|counter\(2) $ (!\inst11|Add0~5\)))) # (GND)
-- \inst11|Add0~7\ = CARRY((\inst11|Add0~3_combout\ & ((\inst11|counter\(2)) # (!\inst11|Add0~5\))) # (!\inst11|Add0~3_combout\ & (\inst11|counter\(2) & !\inst11|Add0~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|Add0~3_combout\,
	datab => \inst11|counter\(2),
	datad => VCC,
	cin => \inst11|Add0~5\,
	combout => \inst11|Add0~6_combout\,
	cout => \inst11|Add0~7\);

-- Location: LCCOMB_X111_Y36_N18
\inst11|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~8_combout\ = (\inst11|Add0~3_combout\ & ((\inst11|counter\(3) & (!\inst11|Add0~7\)) # (!\inst11|counter\(3) & (\inst11|Add0~7\ & VCC)))) # (!\inst11|Add0~3_combout\ & ((\inst11|counter\(3) & ((\inst11|Add0~7\) # (GND))) # 
-- (!\inst11|counter\(3) & (!\inst11|Add0~7\))))
-- \inst11|Add0~9\ = CARRY((\inst11|Add0~3_combout\ & (\inst11|counter\(3) & !\inst11|Add0~7\)) # (!\inst11|Add0~3_combout\ & ((\inst11|counter\(3)) # (!\inst11|Add0~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|Add0~3_combout\,
	datab => \inst11|counter\(3),
	datad => VCC,
	cin => \inst11|Add0~7\,
	combout => \inst11|Add0~8_combout\,
	cout => \inst11|Add0~9\);

-- Location: LCCOMB_X112_Y36_N10
\inst11|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~16_combout\ = (\inst2|s_key_prev~q\ & !\inst11|Add0~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|s_key_prev~q\,
	datad => \inst11|Add0~8_combout\,
	combout => \inst11|Add0~16_combout\);

-- Location: FF_X112_Y36_N11
\inst11|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|Add0~16_combout\,
	ena => \inst11|counter[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|counter\(3));

-- Location: LCCOMB_X111_Y36_N20
\inst11|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~10_combout\ = ((\inst11|Add0~3_combout\ $ (\inst11|counter\(4) $ (!\inst11|Add0~9\)))) # (GND)
-- \inst11|Add0~11\ = CARRY((\inst11|Add0~3_combout\ & ((\inst11|counter\(4)) # (!\inst11|Add0~9\))) # (!\inst11|Add0~3_combout\ & (\inst11|counter\(4) & !\inst11|Add0~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|Add0~3_combout\,
	datab => \inst11|counter\(4),
	datad => VCC,
	cin => \inst11|Add0~9\,
	combout => \inst11|Add0~10_combout\,
	cout => \inst11|Add0~11\);

-- Location: LCCOMB_X111_Y36_N26
\inst11|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~15_combout\ = (\inst2|s_key_prev~q\ & \inst11|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|s_key_prev~q\,
	datad => \inst11|Add0~10_combout\,
	combout => \inst11|Add0~15_combout\);

-- Location: FF_X111_Y36_N27
\inst11|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|Add0~15_combout\,
	ena => \inst11|counter[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|counter\(4));

-- Location: LCCOMB_X111_Y36_N22
\inst11|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~12_combout\ = \inst11|counter\(5) $ (\inst11|Add0~11\ $ (\inst11|Add0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datad => \inst11|Add0~3_combout\,
	cin => \inst11|Add0~11\,
	combout => \inst11|Add0~12_combout\);

-- Location: LCCOMB_X112_Y36_N4
\inst11|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~14_combout\ = (\inst2|s_key_prev~q\ & \inst11|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst2|s_key_prev~q\,
	datad => \inst11|Add0~12_combout\,
	combout => \inst11|Add0~14_combout\);

-- Location: FF_X112_Y36_N5
\inst11|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|Add0~14_combout\,
	ena => \inst11|counter[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|counter\(5));

-- Location: LCCOMB_X111_Y36_N0
\inst11|btn_down_hold_time[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_down_hold_time[0]~6_combout\ = \inst11|btn_down_hold_time\(0) $ (VCC)
-- \inst11|btn_down_hold_time[0]~7\ = CARRY(\inst11|btn_down_hold_time\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|btn_down_hold_time\(0),
	datad => VCC,
	combout => \inst11|btn_down_hold_time[0]~6_combout\,
	cout => \inst11|btn_down_hold_time[0]~7\);

-- Location: FF_X111_Y36_N1
\inst11|btn_down_hold_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_down_hold_time[0]~6_combout\,
	sclr => \inst11|process_0~1_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_down_hold_time\(0));

-- Location: LCCOMB_X111_Y36_N2
\inst11|btn_down_hold_time[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_down_hold_time[1]~8_combout\ = (\inst11|btn_down_hold_time\(1) & (!\inst11|btn_down_hold_time[0]~7\)) # (!\inst11|btn_down_hold_time\(1) & ((\inst11|btn_down_hold_time[0]~7\) # (GND)))
-- \inst11|btn_down_hold_time[1]~9\ = CARRY((!\inst11|btn_down_hold_time[0]~7\) # (!\inst11|btn_down_hold_time\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst11|btn_down_hold_time\(1),
	datad => VCC,
	cin => \inst11|btn_down_hold_time[0]~7\,
	combout => \inst11|btn_down_hold_time[1]~8_combout\,
	cout => \inst11|btn_down_hold_time[1]~9\);

-- Location: FF_X111_Y36_N3
\inst11|btn_down_hold_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_down_hold_time[1]~8_combout\,
	sclr => \inst11|process_0~1_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_down_hold_time\(1));

-- Location: LCCOMB_X111_Y36_N4
\inst11|btn_down_hold_time[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_down_hold_time[2]~10_combout\ = (\inst11|btn_down_hold_time\(2) & (\inst11|btn_down_hold_time[1]~9\ $ (GND))) # (!\inst11|btn_down_hold_time\(2) & (!\inst11|btn_down_hold_time[1]~9\ & VCC))
-- \inst11|btn_down_hold_time[2]~11\ = CARRY((\inst11|btn_down_hold_time\(2) & !\inst11|btn_down_hold_time[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_down_hold_time\(2),
	datad => VCC,
	cin => \inst11|btn_down_hold_time[1]~9\,
	combout => \inst11|btn_down_hold_time[2]~10_combout\,
	cout => \inst11|btn_down_hold_time[2]~11\);

-- Location: FF_X111_Y36_N5
\inst11|btn_down_hold_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_down_hold_time[2]~10_combout\,
	sclr => \inst11|process_0~1_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_down_hold_time\(2));

-- Location: LCCOMB_X111_Y36_N6
\inst11|btn_down_hold_time[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_down_hold_time[3]~12_combout\ = (\inst11|btn_down_hold_time\(3) & (!\inst11|btn_down_hold_time[2]~11\)) # (!\inst11|btn_down_hold_time\(3) & ((\inst11|btn_down_hold_time[2]~11\) # (GND)))
-- \inst11|btn_down_hold_time[3]~13\ = CARRY((!\inst11|btn_down_hold_time[2]~11\) # (!\inst11|btn_down_hold_time\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_down_hold_time\(3),
	datad => VCC,
	cin => \inst11|btn_down_hold_time[2]~11\,
	combout => \inst11|btn_down_hold_time[3]~12_combout\,
	cout => \inst11|btn_down_hold_time[3]~13\);

-- Location: FF_X111_Y36_N7
\inst11|btn_down_hold_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_down_hold_time[3]~12_combout\,
	sclr => \inst11|process_0~1_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_down_hold_time\(3));

-- Location: LCCOMB_X111_Y36_N8
\inst11|btn_down_hold_time[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|btn_down_hold_time[4]~14_combout\ = \inst11|btn_down_hold_time[3]~13\ $ (!\inst11|btn_down_hold_time\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst11|btn_down_hold_time\(4),
	cin => \inst11|btn_down_hold_time[3]~13\,
	combout => \inst11|btn_down_hold_time[4]~14_combout\);

-- Location: FF_X111_Y36_N9
\inst11|btn_down_hold_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|btn_down_hold_time[4]~14_combout\,
	sclr => \inst11|process_0~1_combout\,
	ena => \inst11|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|btn_down_hold_time\(4));

-- Location: LCCOMB_X111_Y36_N30
\inst11|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|process_0~2_combout\ = (\inst11|btn_down_hold_time\(4)) # ((\inst11|btn_down_hold_time\(3) & ((\inst11|btn_down_hold_time\(1)) # (\inst11|btn_down_hold_time\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_down_hold_time\(3),
	datab => \inst11|btn_down_hold_time\(1),
	datac => \inst11|btn_down_hold_time\(4),
	datad => \inst11|btn_down_hold_time\(2),
	combout => \inst11|process_0~2_combout\);

-- Location: LCCOMB_X111_Y36_N24
\inst11|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|process_0~3_combout\ = (\inst11|process_0~2_combout\ & ((\inst11|counter\(5)) # ((\inst11|counter\(4)) # (!\inst11|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datab => \inst11|counter\(4),
	datac => \inst11|process_0~2_combout\,
	datad => \inst11|LessThan0~0_combout\,
	combout => \inst11|process_0~3_combout\);

-- Location: LCCOMB_X111_Y36_N10
\inst11|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~3_combout\ = (\inst11|process_0~3_combout\) # ((\inst11|counter[2]~0_combout\ & ((\inst11|btn_up_prev~q\) # (\inst11|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|btn_up_prev~q\,
	datab => \inst11|process_0~3_combout\,
	datac => \inst11|counter[2]~0_combout\,
	datad => \inst11|process_0~0_combout\,
	combout => \inst11|Add0~3_combout\);

-- Location: LCCOMB_X112_Y36_N16
\inst11|Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|Add0~17_combout\ = (\inst2|s_key_prev~q\ & \inst11|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|s_key_prev~q\,
	datac => \inst11|Add0~6_combout\,
	combout => \inst11|Add0~17_combout\);

-- Location: FF_X112_Y36_N17
\inst11|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst11|Add0~17_combout\,
	ena => \inst11|counter[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|counter\(2));

-- Location: LCCOMB_X110_Y36_N12
\MEF|MaxPoints[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|MaxPoints[2]~feeder_combout\ = \inst11|counter\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst11|counter\(2),
	combout => \MEF|MaxPoints[2]~feeder_combout\);

-- Location: LCCOMB_X110_Y36_N28
\MEF|MaxPoints[5]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|MaxPoints[5]~0_combout\ = (!\MEF|internal_reset~q\ & (\inst2|s_key_prev~q\ & ((\state|state.gameINFO~q\) # (\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|internal_reset~q\,
	datab => \state|state.gameINFO~q\,
	datac => \state|state.game~q\,
	datad => \inst2|s_key_prev~q\,
	combout => \MEF|MaxPoints[5]~0_combout\);

-- Location: FF_X110_Y36_N13
\MEF|MaxPoints[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|MaxPoints[2]~feeder_combout\,
	ena => \MEF|MaxPoints[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|MaxPoints\(2));

-- Location: LCCOMB_X110_Y36_N26
\MEF|MaxPoints[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|MaxPoints[3]~3_combout\ = !\inst11|counter\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst11|counter\(3),
	combout => \MEF|MaxPoints[3]~3_combout\);

-- Location: FF_X110_Y36_N27
\MEF|MaxPoints[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|MaxPoints[3]~3_combout\,
	ena => \MEF|MaxPoints[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|MaxPoints\(3));

-- Location: LCCOMB_X110_Y37_N14
\MEF|winnerB_int~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|winnerB_int~1_combout\ = (\MEF|points_B_int\(2) & (\MEF|MaxPoints\(2) & (\MEF|points_B_int\(3) $ (!\MEF|MaxPoints\(3))))) # (!\MEF|points_B_int\(2) & (!\MEF|MaxPoints\(2) & (\MEF|points_B_int\(3) $ (!\MEF|MaxPoints\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(2),
	datab => \MEF|points_B_int\(3),
	datac => \MEF|MaxPoints\(2),
	datad => \MEF|MaxPoints\(3),
	combout => \MEF|winnerB_int~1_combout\);

-- Location: LCCOMB_X110_Y36_N2
\MEF|confirmed_number_int[31]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|confirmed_number_int[31]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \MEF|confirmed_number_int[31]~feeder_combout\);

-- Location: FF_X110_Y36_N3
\MEF|confirmed_number_int[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|confirmed_number_int[31]~feeder_combout\,
	ena => \MEF|MaxPoints[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|confirmed_number_int\(31));

-- Location: LCCOMB_X110_Y36_N22
\MEF|MaxPoints[5]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|MaxPoints[5]~feeder_combout\ = \inst11|counter\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst11|counter\(5),
	combout => \MEF|MaxPoints[5]~feeder_combout\);

-- Location: FF_X110_Y36_N23
\MEF|MaxPoints[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|MaxPoints[5]~feeder_combout\,
	ena => \MEF|MaxPoints[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|MaxPoints\(5));

-- Location: LCCOMB_X110_Y36_N8
\MEF|MaxPoints[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|MaxPoints[4]~feeder_combout\ = \inst11|counter\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst11|counter\(4),
	combout => \MEF|MaxPoints[4]~feeder_combout\);

-- Location: FF_X110_Y36_N9
\MEF|MaxPoints[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|MaxPoints[4]~feeder_combout\,
	ena => \MEF|MaxPoints[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|MaxPoints\(4));

-- Location: LCCOMB_X110_Y36_N24
\MEF|winnerB_int~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|winnerB_int~2_combout\ = (\MEF|MaxPoints\(5) & (\MEF|points_B_int\(5) & (\MEF|MaxPoints\(4) $ (!\MEF|points_B_int\(4))))) # (!\MEF|MaxPoints\(5) & (!\MEF|points_B_int\(5) & (\MEF|MaxPoints\(4) $ (!\MEF|points_B_int\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(5),
	datab => \MEF|MaxPoints\(4),
	datac => \MEF|points_B_int\(4),
	datad => \MEF|points_B_int\(5),
	combout => \MEF|winnerB_int~2_combout\);

-- Location: LCCOMB_X110_Y36_N4
\MEF|MaxPoints[1]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|MaxPoints[1]~2_combout\ = !\inst11|counter\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst11|counter\(1),
	combout => \MEF|MaxPoints[1]~2_combout\);

-- Location: FF_X110_Y36_N5
\MEF|MaxPoints[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|MaxPoints[1]~2_combout\,
	ena => \MEF|MaxPoints[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|MaxPoints\(1));

-- Location: LCCOMB_X114_Y36_N16
\MEF|MaxPoints[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|MaxPoints[0]~1_combout\ = !\inst11|counter\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(0),
	combout => \MEF|MaxPoints[0]~1_combout\);

-- Location: FF_X114_Y36_N17
\MEF|MaxPoints[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|MaxPoints[0]~1_combout\,
	ena => \MEF|MaxPoints[5]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|MaxPoints\(0));

-- Location: LCCOMB_X110_Y37_N8
\MEF|winnerB_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|winnerB_int~0_combout\ = (\MEF|points_B_int\(0) & (!\MEF|MaxPoints\(0) & (\MEF|MaxPoints\(1) $ (!\MEF|points_B_int\(1))))) # (!\MEF|points_B_int\(0) & (\MEF|MaxPoints\(0) & (\MEF|MaxPoints\(1) $ (!\MEF|points_B_int\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(0),
	datab => \MEF|MaxPoints\(1),
	datac => \MEF|points_B_int\(1),
	datad => \MEF|MaxPoints\(0),
	combout => \MEF|winnerB_int~0_combout\);

-- Location: LCCOMB_X111_Y37_N28
\MEF|winnerB_int~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|winnerB_int~3_combout\ = (\MEF|winnerB_int~1_combout\ & (\MEF|confirmed_number_int\(31) & (\MEF|winnerB_int~2_combout\ & \MEF|winnerB_int~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|winnerB_int~1_combout\,
	datab => \MEF|confirmed_number_int\(31),
	datac => \MEF|winnerB_int~2_combout\,
	datad => \MEF|winnerB_int~0_combout\,
	combout => \MEF|winnerB_int~3_combout\);

-- Location: LCCOMB_X111_Y37_N12
\MEF|Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Equal2~3_combout\ = (\MEF|confirmed_number_int\(31) & !\MEF|points_A_int\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|confirmed_number_int\(31),
	datad => \MEF|points_A_int\(6),
	combout => \MEF|Equal2~3_combout\);

-- Location: LCCOMB_X111_Y33_N2
\MEF|Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Equal2~2_combout\ = (\MEF|MaxPoints\(5) & (\MEF|points_A_int\(5) & (\MEF|points_A_int\(4) $ (!\MEF|MaxPoints\(4))))) # (!\MEF|MaxPoints\(5) & (!\MEF|points_A_int\(5) & (\MEF|points_A_int\(4) $ (!\MEF|MaxPoints\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(5),
	datab => \MEF|points_A_int\(5),
	datac => \MEF|points_A_int\(4),
	datad => \MEF|MaxPoints\(4),
	combout => \MEF|Equal2~2_combout\);

-- Location: LCCOMB_X110_Y33_N0
\MEF|Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Equal2~1_combout\ = (\MEF|points_A_int\(3) & (\MEF|MaxPoints\(3) & (\MEF|points_A_int\(2) $ (!\MEF|MaxPoints\(2))))) # (!\MEF|points_A_int\(3) & (!\MEF|MaxPoints\(3) & (\MEF|points_A_int\(2) $ (!\MEF|MaxPoints\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(3),
	datab => \MEF|MaxPoints\(3),
	datac => \MEF|points_A_int\(2),
	datad => \MEF|MaxPoints\(2),
	combout => \MEF|Equal2~1_combout\);

-- Location: LCCOMB_X113_Y33_N22
\MEF|Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Equal2~0_combout\ = (\MEF|MaxPoints\(1) & (\MEF|points_A_int\(1) & (\MEF|points_A_int\(0) $ (\MEF|MaxPoints\(0))))) # (!\MEF|MaxPoints\(1) & (!\MEF|points_A_int\(1) & (\MEF|points_A_int\(0) $ (\MEF|MaxPoints\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000110000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(1),
	datab => \MEF|points_A_int\(0),
	datac => \MEF|points_A_int\(1),
	datad => \MEF|MaxPoints\(0),
	combout => \MEF|Equal2~0_combout\);

-- Location: LCCOMB_X111_Y37_N10
\MEF|Equal2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Equal2~4_combout\ = (\MEF|Equal2~3_combout\ & (\MEF|Equal2~2_combout\ & (\MEF|Equal2~1_combout\ & \MEF|Equal2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Equal2~3_combout\,
	datab => \MEF|Equal2~2_combout\,
	datac => \MEF|Equal2~1_combout\,
	datad => \MEF|Equal2~0_combout\,
	combout => \MEF|Equal2~4_combout\);

-- Location: LCCOMB_X111_Y37_N14
\MEF|winnerB_int~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|winnerB_int~4_combout\ = (!\MEF|points_B_int\(6) & ((\MEF|points_A_int\(6)) # ((\MEF|winnerB_int~3_combout\ & !\MEF|Equal2~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(6),
	datab => \MEF|winnerB_int~3_combout\,
	datac => \MEF|points_B_int\(6),
	datad => \MEF|Equal2~4_combout\,
	combout => \MEF|winnerB_int~4_combout\);

-- Location: FF_X111_Y37_N15
\MEF|winnerB_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|winnerB_int~4_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|winnerB_int~q\);

-- Location: LCCOMB_X111_Y33_N4
\state|Selector2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|Selector2~1_combout\ = (\state|Selector2~0_combout\) # ((\state|state.game~q\ & (!\MEF|winnerA_int~q\ & !\MEF|winnerB_int~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|Selector2~0_combout\,
	datab => \state|state.game~q\,
	datac => \MEF|winnerA_int~q\,
	datad => \MEF|winnerB_int~q\,
	combout => \state|Selector2~1_combout\);

-- Location: FF_X111_Y33_N13
\state|state.game\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \state|Selector2~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state|state.game~q\);

-- Location: LCCOMB_X111_Y32_N18
\inst25|state.running~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.running~6_combout\ = (\state|state.game~q\ & ((\inst25|state.running~q\ & ((\inst25|state.running~1_combout\))) # (!\inst25|state.running~q\ & (\inst25|state.running~4_combout\ & !\inst25|state.running~1_combout\)))) # (!\state|state.game~q\ 
-- & (((\inst25|state.running~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datab => \inst25|state.running~4_combout\,
	datac => \inst25|state.running~q\,
	datad => \inst25|state.running~1_combout\,
	combout => \inst25|state.running~6_combout\);

-- Location: FF_X111_Y32_N19
\inst25|state.running\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|state.running~6_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|state.running~q\);

-- Location: LCCOMB_X110_Y32_N16
\inst25|state.penalty2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst25|state.penalty2~0_combout\ = (\inst25|state.running~q\ & (!\inst25|Equal0~8_combout\ & ((\inst|s_key_prev~q\) # (\inst25|start_prev~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_key_prev~q\,
	datab => \inst25|state.running~q\,
	datac => \inst25|start_prev~q\,
	datad => \inst25|Equal0~8_combout\,
	combout => \inst25|state.penalty2~0_combout\);

-- Location: FF_X110_Y32_N17
\inst25|state.penalty2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \inst25|state.penalty2~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \inst25|state.running~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst25|state.penalty2~q\);

-- Location: LCCOMB_X112_Y37_N8
\MEF|playerA_penalty_applied~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|playerA_penalty_applied~feeder_combout\ = \inst25|state.penalty2~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst25|state.penalty2~q\,
	combout => \MEF|playerA_penalty_applied~feeder_combout\);

-- Location: FF_X112_Y37_N9
\MEF|playerA_penalty_applied\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|playerA_penalty_applied~feeder_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|playerA_penalty_applied~q\);

-- Location: LCCOMB_X112_Y37_N14
\MEF|points_A_int[5]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int[5]~3_combout\ = (!\MEF|playerA_penalty_applied~q\ & \inst25|state.penalty2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|playerA_penalty_applied~q\,
	datad => \inst25|state.penalty2~q\,
	combout => \MEF|points_A_int[5]~3_combout\);

-- Location: LCCOMB_X113_Y33_N0
\MEF|Add4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~2_combout\ = ((!\MEF|points_A_int\(6) & ((\MEF|points_A_int\(1)) # (!\MEF|LessThan0~0_combout\)))) # (!\MEF|points_A_int[5]~3_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(6),
	datab => \MEF|LessThan0~0_combout\,
	datac => \MEF|points_A_int\(1),
	datad => \MEF|points_A_int[5]~3_combout\,
	combout => \MEF|Add4~2_combout\);

-- Location: LCCOMB_X113_Y33_N20
\MEF|points_A_int~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~11_combout\ = (\MEF|playerA_valid~q\ & (\MEF|LessThan2~24_combout\ & \MEF|playerB_valid~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|playerA_valid~q\,
	datac => \MEF|LessThan2~24_combout\,
	datad => \MEF|playerB_valid~q\,
	combout => \MEF|points_A_int~11_combout\);

-- Location: LCCOMB_X113_Y33_N14
\MEF|Add4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~3_combout\ = (\MEF|points_A_int~11_combout\ & (\MEF|Add4~0_combout\)) # (!\MEF|points_A_int~11_combout\ & (((\MEF|Add4~2_combout\ & \MEF|points_A_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add4~0_combout\,
	datab => \MEF|Add4~2_combout\,
	datac => \MEF|points_A_int\(0),
	datad => \MEF|points_A_int~11_combout\,
	combout => \MEF|Add4~3_combout\);

-- Location: FF_X113_Y33_N15
\MEF|points_A_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|Add4~3_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_A_int\(0));

-- Location: LCCOMB_X114_Y33_N4
\MEF|Add4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~4_combout\ = (\MEF|points_A_int\(1) & (!\MEF|Add4~1\)) # (!\MEF|points_A_int\(1) & ((\MEF|Add4~1\) # (GND)))
-- \MEF|Add4~5\ = CARRY((!\MEF|Add4~1\) # (!\MEF|points_A_int\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(1),
	datad => VCC,
	cin => \MEF|Add4~1\,
	combout => \MEF|Add4~4_combout\,
	cout => \MEF|Add4~5\);

-- Location: LCCOMB_X114_Y33_N16
\MEF|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add2~0_combout\ = \MEF|points_A_int\(1) $ (VCC)
-- \MEF|Add2~1\ = CARRY(\MEF|points_A_int\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(1),
	datad => VCC,
	combout => \MEF|Add2~0_combout\,
	cout => \MEF|Add2~1\);

-- Location: LCCOMB_X113_Y33_N18
\MEF|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add2~2_combout\ = (!\MEF|points_A_int\(6) & (!\MEF|points_A_int~11_combout\ & ((\MEF|points_A_int\(1)) # (!\MEF|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(6),
	datab => \MEF|LessThan0~0_combout\,
	datac => \MEF|points_A_int\(1),
	datad => \MEF|points_A_int~11_combout\,
	combout => \MEF|Add2~2_combout\);

-- Location: LCCOMB_X113_Y33_N8
\MEF|points_A_int~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~4_combout\ = (\MEF|Add4~4_combout\ & ((\MEF|points_A_int~11_combout\) # ((\MEF|Add2~0_combout\ & \MEF|Add2~2_combout\)))) # (!\MEF|Add4~4_combout\ & (\MEF|Add2~0_combout\ & ((\MEF|Add2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add4~4_combout\,
	datab => \MEF|Add2~0_combout\,
	datac => \MEF|points_A_int~11_combout\,
	datad => \MEF|Add2~2_combout\,
	combout => \MEF|points_A_int~4_combout\);

-- Location: LCCOMB_X113_Y33_N12
\MEF|points_A_int[5]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int[5]~5_combout\ = (\inst57~combout\ & ((\MEF|points_A_int[5]~3_combout\) # ((\MEF|points_A_int~2_combout\ & \MEF|LessThan2~24_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst57~combout\,
	datab => \MEF|points_A_int~2_combout\,
	datac => \MEF|LessThan2~24_combout\,
	datad => \MEF|points_A_int[5]~3_combout\,
	combout => \MEF|points_A_int[5]~5_combout\);

-- Location: FF_X113_Y33_N9
\MEF|points_A_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_A_int~4_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_A_int[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_A_int\(1));

-- Location: LCCOMB_X114_Y33_N6
\MEF|Add4~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~6_combout\ = (\MEF|points_A_int\(2) & (\MEF|Add4~5\ $ (GND))) # (!\MEF|points_A_int\(2) & (!\MEF|Add4~5\ & VCC))
-- \MEF|Add4~7\ = CARRY((\MEF|points_A_int\(2) & !\MEF|Add4~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(2),
	datad => VCC,
	cin => \MEF|Add4~5\,
	combout => \MEF|Add4~6_combout\,
	cout => \MEF|Add4~7\);

-- Location: LCCOMB_X114_Y33_N18
\MEF|Add2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add2~3_combout\ = (\MEF|points_A_int\(2) & (\MEF|Add2~1\ & VCC)) # (!\MEF|points_A_int\(2) & (!\MEF|Add2~1\))
-- \MEF|Add2~4\ = CARRY((!\MEF|points_A_int\(2) & !\MEF|Add2~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(2),
	datad => VCC,
	cin => \MEF|Add2~1\,
	combout => \MEF|Add2~3_combout\,
	cout => \MEF|Add2~4\);

-- Location: LCCOMB_X113_Y33_N4
\MEF|points_A_int~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~9_combout\ = (\MEF|Add4~6_combout\ & ((\MEF|points_A_int~11_combout\) # ((\MEF|Add2~3_combout\ & \MEF|Add2~2_combout\)))) # (!\MEF|Add4~6_combout\ & (\MEF|Add2~3_combout\ & ((\MEF|Add2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add4~6_combout\,
	datab => \MEF|Add2~3_combout\,
	datac => \MEF|points_A_int~11_combout\,
	datad => \MEF|Add2~2_combout\,
	combout => \MEF|points_A_int~9_combout\);

-- Location: FF_X113_Y33_N5
\MEF|points_A_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_A_int~9_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_A_int[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_A_int\(2));

-- Location: LCCOMB_X114_Y33_N20
\MEF|Add2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add2~5_combout\ = (\MEF|points_A_int\(3) & ((GND) # (!\MEF|Add2~4\))) # (!\MEF|points_A_int\(3) & (\MEF|Add2~4\ $ (GND)))
-- \MEF|Add2~6\ = CARRY((\MEF|points_A_int\(3)) # (!\MEF|Add2~4\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(3),
	datad => VCC,
	cin => \MEF|Add2~4\,
	combout => \MEF|Add2~5_combout\,
	cout => \MEF|Add2~6\);

-- Location: LCCOMB_X114_Y33_N8
\MEF|Add4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~8_combout\ = (\MEF|points_A_int\(3) & (!\MEF|Add4~7\)) # (!\MEF|points_A_int\(3) & ((\MEF|Add4~7\) # (GND)))
-- \MEF|Add4~9\ = CARRY((!\MEF|Add4~7\) # (!\MEF|points_A_int\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(3),
	datad => VCC,
	cin => \MEF|Add4~7\,
	combout => \MEF|Add4~8_combout\,
	cout => \MEF|Add4~9\);

-- Location: LCCOMB_X113_Y33_N30
\MEF|points_A_int~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~8_combout\ = (\MEF|Add2~5_combout\ & ((\MEF|Add2~2_combout\) # ((\MEF|points_A_int~11_combout\ & \MEF|Add4~8_combout\)))) # (!\MEF|Add2~5_combout\ & (\MEF|points_A_int~11_combout\ & (\MEF|Add4~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add2~5_combout\,
	datab => \MEF|points_A_int~11_combout\,
	datac => \MEF|Add4~8_combout\,
	datad => \MEF|Add2~2_combout\,
	combout => \MEF|points_A_int~8_combout\);

-- Location: FF_X113_Y33_N31
\MEF|points_A_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_A_int~8_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_A_int[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_A_int\(3));

-- Location: LCCOMB_X114_Y33_N22
\MEF|Add2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add2~7_combout\ = (\MEF|points_A_int\(4) & (\MEF|Add2~6\ & VCC)) # (!\MEF|points_A_int\(4) & (!\MEF|Add2~6\))
-- \MEF|Add2~8\ = CARRY((!\MEF|points_A_int\(4) & !\MEF|Add2~6\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(4),
	datad => VCC,
	cin => \MEF|Add2~6\,
	combout => \MEF|Add2~7_combout\,
	cout => \MEF|Add2~8\);

-- Location: LCCOMB_X114_Y33_N10
\MEF|Add4~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~10_combout\ = (\MEF|points_A_int\(4) & (\MEF|Add4~9\ $ (GND))) # (!\MEF|points_A_int\(4) & (!\MEF|Add4~9\ & VCC))
-- \MEF|Add4~11\ = CARRY((\MEF|points_A_int\(4) & !\MEF|Add4~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(4),
	datad => VCC,
	cin => \MEF|Add4~9\,
	combout => \MEF|Add4~10_combout\,
	cout => \MEF|Add4~11\);

-- Location: LCCOMB_X113_Y33_N16
\MEF|points_A_int~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~7_combout\ = (\MEF|Add2~7_combout\ & ((\MEF|Add2~2_combout\) # ((\MEF|Add4~10_combout\ & \MEF|points_A_int~11_combout\)))) # (!\MEF|Add2~7_combout\ & (\MEF|Add4~10_combout\ & (\MEF|points_A_int~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add2~7_combout\,
	datab => \MEF|Add4~10_combout\,
	datac => \MEF|points_A_int~11_combout\,
	datad => \MEF|Add2~2_combout\,
	combout => \MEF|points_A_int~7_combout\);

-- Location: FF_X113_Y33_N17
\MEF|points_A_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_A_int~7_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_A_int[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_A_int\(4));

-- Location: LCCOMB_X114_Y33_N12
\MEF|Add4~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~12_combout\ = (\MEF|points_A_int\(5) & (!\MEF|Add4~11\)) # (!\MEF|points_A_int\(5) & ((\MEF|Add4~11\) # (GND)))
-- \MEF|Add4~13\ = CARRY((!\MEF|Add4~11\) # (!\MEF|points_A_int\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(5),
	datad => VCC,
	cin => \MEF|Add4~11\,
	combout => \MEF|Add4~12_combout\,
	cout => \MEF|Add4~13\);

-- Location: LCCOMB_X114_Y33_N24
\MEF|Add2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add2~9_combout\ = (\MEF|points_A_int\(5) & ((GND) # (!\MEF|Add2~8\))) # (!\MEF|points_A_int\(5) & (\MEF|Add2~8\ $ (GND)))
-- \MEF|Add2~10\ = CARRY((\MEF|points_A_int\(5)) # (!\MEF|Add2~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(5),
	datad => VCC,
	cin => \MEF|Add2~8\,
	combout => \MEF|Add2~9_combout\,
	cout => \MEF|Add2~10\);

-- Location: LCCOMB_X113_Y33_N6
\MEF|points_A_int~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~6_combout\ = (\MEF|Add4~12_combout\ & ((\MEF|points_A_int~11_combout\) # ((\MEF|Add2~9_combout\ & \MEF|Add2~2_combout\)))) # (!\MEF|Add4~12_combout\ & (\MEF|Add2~9_combout\ & ((\MEF|Add2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add4~12_combout\,
	datab => \MEF|Add2~9_combout\,
	datac => \MEF|points_A_int~11_combout\,
	datad => \MEF|Add2~2_combout\,
	combout => \MEF|points_A_int~6_combout\);

-- Location: FF_X113_Y33_N7
\MEF|points_A_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_A_int~6_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_A_int[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_A_int\(5));

-- Location: LCCOMB_X114_Y33_N26
\MEF|Add2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add2~11_combout\ = \MEF|Add2~10\ $ (!\MEF|points_A_int\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \MEF|points_A_int\(6),
	cin => \MEF|Add2~10\,
	combout => \MEF|Add2~11_combout\);

-- Location: LCCOMB_X114_Y33_N14
\MEF|Add4~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|Add4~14_combout\ = \MEF|Add4~13\ $ (!\MEF|points_A_int\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \MEF|points_A_int\(6),
	cin => \MEF|Add4~13\,
	combout => \MEF|Add4~14_combout\);

-- Location: LCCOMB_X113_Y33_N10
\MEF|points_A_int~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|points_A_int~10_combout\ = (\MEF|Add2~11_combout\ & ((\MEF|Add2~2_combout\) # ((\MEF|points_A_int~11_combout\ & \MEF|Add4~14_combout\)))) # (!\MEF|Add2~11_combout\ & (\MEF|points_A_int~11_combout\ & (\MEF|Add4~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|Add2~11_combout\,
	datab => \MEF|points_A_int~11_combout\,
	datac => \MEF|Add4~14_combout\,
	datad => \MEF|Add2~2_combout\,
	combout => \MEF|points_A_int~10_combout\);

-- Location: FF_X113_Y33_N11
\MEF|points_A_int[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|points_A_int~10_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|points_A_int[5]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|points_A_int\(6));

-- Location: LCCOMB_X111_Y37_N24
\MEF|winnerA_int~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|winnerA_int~0_combout\ = (!\MEF|points_A_int\(6) & ((\MEF|points_B_int\(6)) # (\MEF|Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(6),
	datac => \MEF|points_B_int\(6),
	datad => \MEF|Equal2~4_combout\,
	combout => \MEF|winnerA_int~0_combout\);

-- Location: FF_X111_Y37_N25
\MEF|winnerA_int\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|winnerA_int~0_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|winnerA_int~q\);

-- Location: LCCOMB_X112_Y33_N22
\state|Selector4~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|Selector4~1_combout\ = (!\MEF|winnerA_int~q\ & \state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|winnerA_int~q\,
	datad => \state|state.game~q\,
	combout => \state|Selector4~1_combout\);

-- Location: LCCOMB_X111_Y33_N16
\state|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|process_0~0_combout\ = (\inst|s_key_prev~q\) # (\state|confirm_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|s_key_prev~q\,
	datad => \state|confirm_prev~q\,
	combout => \state|process_0~0_combout\);

-- Location: LCCOMB_X112_Y33_N10
\state|Selector4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|Selector4~0_combout\ = (\state|state.game~q\ & (((\MEF|winnerA_int~q\) # (\MEF|winnerB_int~q\)))) # (!\state|state.game~q\ & (!\state|process_0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110111010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|process_0~0_combout\,
	datab => \state|state.game~q\,
	datac => \MEF|winnerA_int~q\,
	datad => \MEF|winnerB_int~q\,
	combout => \state|Selector4~0_combout\);

-- Location: FF_X112_Y33_N23
\state|state.win_state_B\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \state|Selector4~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state|state.win_state_B~q\);

-- Location: LCCOMB_X112_Y33_N24
\state|Selector3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|Selector3~0_combout\ = (\MEF|winnerA_int~q\ & \state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|winnerA_int~q\,
	datad => \state|state.game~q\,
	combout => \state|Selector3~0_combout\);

-- Location: FF_X112_Y33_N25
\state|state.win_state_A\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \state|Selector3~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	ena => \state|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state|state.win_state_A~q\);

-- Location: LCCOMB_X111_Y33_N20
\state|Selector0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|Selector0~4_combout\ = (\state|process_0~0_combout\ & (((\state|state.init~q\)))) # (!\state|process_0~0_combout\ & (!\state|state.win_state_B~q\ & ((!\state|state.win_state_A~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.win_state_B~q\,
	datab => \state|process_0~0_combout\,
	datac => \state|state.init~q\,
	datad => \state|state.win_state_A~q\,
	combout => \state|Selector0~4_combout\);

-- Location: FF_X111_Y33_N21
\state|state.init\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \state|Selector0~4_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state|state.init~q\);

-- Location: LCCOMB_X111_Y33_N18
\state|state.gameINFO~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state|state.gameINFO~0_combout\ = (\inst|s_key_prev~q\ & (((\state|state.gameINFO~q\)))) # (!\inst|s_key_prev~q\ & ((\state|confirm_prev~q\ & ((\state|state.gameINFO~q\))) # (!\state|confirm_prev~q\ & (!\state|state.init~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|s_key_prev~q\,
	datab => \state|state.init~q\,
	datac => \state|state.gameINFO~q\,
	datad => \state|confirm_prev~q\,
	combout => \state|state.gameINFO~0_combout\);

-- Location: FF_X111_Y33_N19
\state|state.gameINFO\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \state|state.gameINFO~0_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state|state.gameINFO~q\);

-- Location: LCCOMB_X108_Y38_N16
\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|points_B_int\(3) $ (VCC)
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|points_B_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(3),
	datad => VCC,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X108_Y38_N18
\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|points_B_int\(4) & (\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|points_B_int\(4) & 
-- (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|points_B_int\(4) & !\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(4),
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X108_Y38_N20
\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|points_B_int\(5) & (\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|points_B_int\(5) & 
-- (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|points_B_int\(5) & !\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(5),
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X108_Y38_N22
\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X109_Y38_N4
\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ = (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X108_Y38_N14
\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\MEF|points_B_int\(5) & \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(5),
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X108_Y38_N12
\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_B_int\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_B_int\(4),
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X109_Y38_N10
\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ = (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X108_Y38_N10
\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ = (\MEF|points_B_int\(3) & \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(3),
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X108_Y38_N28
\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ = (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X109_Y38_N2
\inst44|Mod1|auto_generated|divider|divider|StageOut[18]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ = (\MEF|points_B_int\(2) & !\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_B_int\(2),
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X109_Y38_N24
\inst44|Mod1|auto_generated|divider|divider|StageOut[18]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\MEF|points_B_int\(2) & \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_B_int\(2),
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X108_Y38_N0
\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst44|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\) # (\inst44|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\)))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst44|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\) # (\inst44|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datad => VCC,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X108_Y38_N2
\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- (!\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- !\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X108_Y38_N4
\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X108_Y38_N6
\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- (!\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- !\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X108_Y38_N8
\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X108_Y38_N30
\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|points_B_int\(3))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(3),
	datab => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\);

-- Location: LCCOMB_X108_Y40_N0
\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X108_Y38_N26
\inst44|Mod1|auto_generated|divider|divider|StageOut[28]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|points_B_int\(5))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \MEF|points_B_int\(5),
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\);

-- Location: LCCOMB_X108_Y40_N8
\inst44|Mod1|auto_generated|divider|divider|StageOut[28]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X108_Y40_N10
\inst44|Mod1|auto_generated|divider|divider|StageOut[27]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X108_Y38_N24
\inst44|Mod1|auto_generated|divider|divider|StageOut[27]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|points_B_int\(4))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(4),
	datab => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\);

-- Location: LCCOMB_X108_Y40_N6
\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ = (\MEF|points_B_int\(2) & \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_B_int\(2),
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X108_Y40_N16
\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X108_Y40_N12
\inst44|Mod1|auto_generated|divider|divider|StageOut[24]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ = (\MEF|points_B_int\(1) & \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(1),
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X108_Y40_N2
\inst44|Mod1|auto_generated|divider|divider|StageOut[24]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ = (\MEF|points_B_int\(1) & !\inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(1),
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X108_Y40_N20
\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\inst44|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\) # (\inst44|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\)))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\inst44|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\) # (\inst44|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datad => VCC,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X108_Y40_N22
\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- (!\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- !\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X108_Y40_N24
\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))))
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X108_Y40_N26
\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst44|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ & 
-- !\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\,
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X108_Y40_N28
\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\inst44|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\) # ((\inst44|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (!\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datad => VCC,
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X108_Y40_N30
\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X108_Y40_N18
\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- ((\inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\);

-- Location: LCCOMB_X108_Y40_N4
\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\) # 
-- ((\inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\);

-- Location: LCCOMB_X108_Y40_N14
\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\MEF|points_B_int\(1))) # 
-- (!\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(1),
	datac => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \inst44|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X111_Y44_N8
\inst76|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst76|Mux0~0_combout\ = (\MEF|points_B_int\(0) & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\) # (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\MEF|points_B_int\(0) & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_B_int\(0),
	combout => \inst76|Mux0~0_combout\);

-- Location: LCCOMB_X111_Y44_N20
\inst66|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux0~4_combout\ = (!\state|state.gameINFO~q\ & (\state|state.init~q\ & ((!\inst76|Mux0~0_combout\) # (!\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.gameINFO~q\,
	datab => \state|state.init~q\,
	datac => \state|state.game~q\,
	datad => \inst76|Mux0~0_combout\,
	combout => \inst66|Mux0~4_combout\);

-- Location: LCCOMB_X111_Y44_N30
\inst76|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst76|Mux1~0_combout\ = (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\MEF|points_B_int\(0) & (\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & 
-- ((\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\MEF|points_B_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_B_int\(0),
	combout => \inst76|Mux1~0_combout\);

-- Location: LCCOMB_X111_Y44_N26
\inst66|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux1~2_combout\ = (!\state|state.gameINFO~q\ & (\state|state.init~q\ & ((\inst76|Mux1~0_combout\) # (!\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.gameINFO~q\,
	datab => \state|state.init~q\,
	datac => \state|state.game~q\,
	datad => \inst76|Mux1~0_combout\,
	combout => \inst66|Mux1~2_combout\);

-- Location: LCCOMB_X111_Y44_N4
\inst76|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst76|Mux2~0_combout\ = (\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\MEF|points_B_int\(0))))) # 
-- (!\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\)) # 
-- (!\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\MEF|points_B_int\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101011100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_B_int\(0),
	combout => \inst76|Mux2~0_combout\);

-- Location: LCCOMB_X111_Y44_N24
\inst66|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux2~2_combout\ = (!\state|state.gameINFO~q\ & (\state|state.init~q\ & ((\inst76|Mux2~0_combout\) # (!\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.gameINFO~q\,
	datab => \state|state.init~q\,
	datac => \state|state.game~q\,
	datad => \inst76|Mux2~0_combout\,
	combout => \inst66|Mux2~2_combout\);

-- Location: LCCOMB_X111_Y44_N18
\inst76|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst76|Mux3~0_combout\ = (\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\MEF|points_B_int\(0)))) # 
-- (!\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & !\MEF|points_B_int\(0))))) # (!\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (!\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (\MEF|points_B_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_B_int\(0),
	combout => \inst76|Mux3~0_combout\);

-- Location: LCCOMB_X111_Y32_N8
\inst63|Mux3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux3~4_combout\ = (!\state|state.game~q\ & \state|state.init~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \state|state.init~q\,
	combout => \inst63|Mux3~4_combout\);

-- Location: LCCOMB_X114_Y29_N8
\inst66|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux3~0_combout\ = (\state|state.init~q\ & (!\state|state.gameINFO~q\ & \state|state.game~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datac => \state|state.gameINFO~q\,
	datad => \state|state.game~q\,
	combout => \inst66|Mux3~0_combout\);

-- Location: LCCOMB_X111_Y33_N14
\inst66|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux3~1_combout\ = (\state|state.gameINFO~q\ & (!\inst63|Mux3~4_combout\ & ((\inst76|Mux3~0_combout\) # (!\inst66|Mux3~0_combout\)))) # (!\state|state.gameINFO~q\ & ((\inst76|Mux3~0_combout\) # ((!\inst66|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.gameINFO~q\,
	datab => \inst76|Mux3~0_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst66|Mux3~0_combout\,
	combout => \inst66|Mux3~1_combout\);

-- Location: LCCOMB_X111_Y44_N28
\inst76|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst76|Mux4~0_combout\ = (\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # 
-- (!\MEF|points_B_int\(0))))) # (!\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- !\MEF|points_B_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_B_int\(0),
	combout => \inst76|Mux4~0_combout\);

-- Location: LCCOMB_X111_Y44_N22
\inst66|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux4~0_combout\ = (\inst76|Mux4~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \inst76|Mux4~0_combout\,
	combout => \inst66|Mux4~0_combout\);

-- Location: LCCOMB_X111_Y44_N16
\inst76|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst76|Mux5~0_combout\ = (\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\MEF|points_B_int\(0) & ((\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))) # (!\MEF|points_B_int\(0) & 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ $ (\MEF|points_B_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_B_int\(0),
	combout => \inst76|Mux5~0_combout\);

-- Location: LCCOMB_X111_Y44_N14
\inst66|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux5~0_combout\ = (\inst76|Mux5~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \inst76|Mux5~0_combout\,
	combout => \inst66|Mux5~0_combout\);

-- Location: LCCOMB_X111_Y44_N12
\inst76|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst76|Mux6~0_combout\ = (\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\MEF|points_B_int\(0) & (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (\inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (\MEF|points_B_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst44|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \inst44|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_B_int\(0),
	combout => \inst76|Mux6~0_combout\);

-- Location: LCCOMB_X111_Y44_N10
\inst66|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux6~0_combout\ = (\state|state.init~q\ & ((\inst76|Mux6~0_combout\) # (!\state|state.game~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|state.init~q\,
	datac => \state|state.game~q\,
	datad => \inst76|Mux6~0_combout\,
	combout => \inst66|Mux6~0_combout\);

-- Location: LCCOMB_X114_Y35_N6
\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|points_B_int\(3) $ (VCC)
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|points_B_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(3),
	datad => VCC,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X114_Y35_N8
\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|points_B_int\(4) & (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|points_B_int\(4) & 
-- (!\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|points_B_int\(4) & !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(4),
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X114_Y35_N10
\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|points_B_int\(5) & (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|points_B_int\(5) & 
-- (!\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|points_B_int\(5) & !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(5),
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X114_Y35_N12
\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X114_Y35_N26
\inst44|Div0|auto_generated|divider|divider|StageOut[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\);

-- Location: LCCOMB_X114_Y35_N0
\inst44|Div0|auto_generated|divider|divider|StageOut[18]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ = (\MEF|points_B_int\(5) & \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_B_int\(5),
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\);

-- Location: LCCOMB_X114_Y35_N2
\inst44|Div0|auto_generated|divider|divider|StageOut[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\);

-- Location: LCCOMB_X114_Y35_N24
\inst44|Div0|auto_generated|divider|divider|StageOut[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ = (\MEF|points_B_int\(4) & \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_B_int\(4),
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\);

-- Location: LCCOMB_X114_Y35_N20
\inst44|Div0|auto_generated|divider|divider|StageOut[16]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ = (\MEF|points_B_int\(3) & \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_B_int\(3),
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\);

-- Location: LCCOMB_X114_Y35_N22
\inst44|Div0|auto_generated|divider|divider|StageOut[16]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\);

-- Location: LCCOMB_X113_Y35_N12
\inst44|Div0|auto_generated|divider|divider|StageOut[15]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ = (!\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_B_int\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_B_int\(2),
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\);

-- Location: LCCOMB_X113_Y35_N28
\inst44|Div0|auto_generated|divider|divider|StageOut[15]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_B_int\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_B_int\(2),
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\);

-- Location: LCCOMB_X113_Y35_N16
\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst44|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\) # (\inst44|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\)))
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst44|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\) # (\inst44|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\,
	datad => VCC,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X113_Y35_N18
\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst44|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\) # 
-- (\inst44|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\)))) # (!\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst44|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & 
-- (!\inst44|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\)))
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst44|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & (!\inst44|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & 
-- !\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\,
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X113_Y35_N20
\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst44|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst44|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))) # (!\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst44|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst44|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))))
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst44|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst44|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\,
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X113_Y35_N22
\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\inst44|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ & (!\inst44|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ & 
-- !\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\,
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X113_Y35_N24
\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X114_Y35_N30
\inst44|Div0|auto_generated|divider|divider|StageOut[23]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|points_B_int\(4))) # (!\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(4),
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\);

-- Location: LCCOMB_X113_Y35_N30
\inst44|Div0|auto_generated|divider|divider|StageOut[23]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\);

-- Location: LCCOMB_X114_Y35_N4
\inst44|Div0|auto_generated|divider|divider|StageOut[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\MEF|points_B_int\(3)))) # (!\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_B_int\(3),
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\);

-- Location: LCCOMB_X113_Y35_N14
\inst44|Div0|auto_generated|divider|divider|StageOut[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\);

-- Location: LCCOMB_X113_Y35_N26
\inst44|Div0|auto_generated|divider|divider|StageOut[21]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ = (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\);

-- Location: LCCOMB_X113_Y35_N0
\inst44|Div0|auto_generated|divider|divider|StageOut[21]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ = (\MEF|points_B_int\(2) & \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_B_int\(2),
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\);

-- Location: LCCOMB_X112_Y38_N0
\inst44|Div0|auto_generated|divider|divider|StageOut[20]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ = (\MEF|points_B_int\(1) & \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_B_int\(1),
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\);

-- Location: LCCOMB_X112_Y38_N26
\inst44|Div0|auto_generated|divider|divider|StageOut[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ = (\MEF|points_B_int\(1) & !\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_B_int\(1),
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst44|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\);

-- Location: LCCOMB_X113_Y35_N2
\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\inst44|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\) # (\inst44|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\,
	datad => VCC,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X113_Y35_N4
\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\inst44|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ & (!\inst44|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ & 
-- !\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\,
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X113_Y35_N6
\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & ((\inst44|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\) # 
-- (\inst44|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\,
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X113_Y35_N8
\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst44|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ & (!\inst44|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ & 
-- !\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\,
	datad => VCC,
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X113_Y35_N10
\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X114_Y35_N28
\inst65|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux0~0_combout\ = (\state|state.game~q\ & ((\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # 
-- (!\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \state|state.game~q\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst65|Mux0~0_combout\);

-- Location: LCCOMB_X112_Y33_N16
\inst66|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux0~2_combout\ = (!\state|state.gameINFO~q\ & \state|state.init~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|state.gameINFO~q\,
	datad => \state|state.init~q\,
	combout => \inst66|Mux0~2_combout\);

-- Location: LCCOMB_X112_Y33_N14
\inst65|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux1~2_combout\ = ((\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- !\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # (!\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\) # 
-- (!\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))) # (!\inst66|Mux0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst66|Mux0~2_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst65|Mux1~2_combout\);

-- Location: LCCOMB_X113_Y29_N2
\inst65|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux1~3_combout\ = (\inst65|Mux1~2_combout\ & ((\state|state.game~q\) # (!\state|state.init~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|state.init~q\,
	datac => \state|state.game~q\,
	datad => \inst65|Mux1~2_combout\,
	combout => \inst65|Mux1~3_combout\);

-- Location: LCCOMB_X113_Y33_N24
\inst65|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux2~0_combout\ = (\state|state.game~q\ & (((\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # 
-- (!\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \state|state.game~q\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst65|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y29_N30
\inst65|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux2~1_combout\ = (\state|state.init~q\ & ((\state|state.gameINFO~q\) # (\inst65|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst65|Mux2~0_combout\,
	combout => \inst65|Mux2~1_combout\);

-- Location: LCCOMB_X112_Y33_N30
\inst65|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux3~0_combout\ = ((\state|state.gameINFO~q\ & ((\state|state.game~q\))) # (!\state|state.gameINFO~q\ & (\state|state.win_state_A~q\ & !\state|state.game~q\))) # (!\state|state.init~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.win_state_A~q\,
	datab => \state|state.gameINFO~q\,
	datac => \state|state.game~q\,
	datad => \state|state.init~q\,
	combout => \inst65|Mux3~0_combout\);

-- Location: LCCOMB_X112_Y33_N12
\inst65|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux3~1_combout\ = (\inst66|Mux3~0_combout\ & ((\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- !\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)) # (!\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ 
-- (!\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst66|Mux3~0_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \inst65|Mux3~1_combout\);

-- Location: LCCOMB_X112_Y33_N18
\inst65|Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux3~2_combout\ = (\inst65|Mux3~0_combout\) # (\inst65|Mux3~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst65|Mux3~0_combout\,
	datad => \inst65|Mux3~1_combout\,
	combout => \inst65|Mux3~2_combout\);

-- Location: LCCOMB_X114_Y33_N28
\inst65|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux4~0_combout\ = (!\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\state|state.game~q\ & 
-- \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \state|state.game~q\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst65|Mux4~0_combout\);

-- Location: LCCOMB_X112_Y33_N28
\inst65|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux5~0_combout\ = ((!\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ 
-- (\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # (!\inst66|Mux3~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111101001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst66|Mux3~0_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \inst65|Mux5~0_combout\);

-- Location: LCCOMB_X112_Y33_N20
\inst65|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux5~1_combout\ = (\inst65|Mux5~0_combout\ & ((\state|state.win_state_B~q\) # ((\state|state.game~q\) # (!\inst66|Mux0~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.win_state_B~q\,
	datab => \inst66|Mux0~2_combout\,
	datac => \state|state.game~q\,
	datad => \inst65|Mux5~0_combout\,
	combout => \inst65|Mux5~1_combout\);

-- Location: LCCOMB_X112_Y33_N26
\inst65|Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux6~2_combout\ = ((\state|state.gameINFO~q\ & ((\state|state.game~q\))) # (!\state|state.gameINFO~q\ & (\state|state.win_state_B~q\ & !\state|state.game~q\))) # (!\state|state.init~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.win_state_B~q\,
	datab => \state|state.gameINFO~q\,
	datac => \state|state.game~q\,
	datad => \state|state.init~q\,
	combout => \inst65|Mux6~2_combout\);

-- Location: LCCOMB_X112_Y33_N8
\inst65|Mux6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux6~4_combout\ = (\state|state.game~q\ & (\state|state.init~q\ & (!\state|state.gameINFO~q\ & \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datab => \state|state.init~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst65|Mux6~4_combout\);

-- Location: LCCOMB_X112_Y33_N4
\inst65|Mux6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst65|Mux6~3_combout\ = (\inst65|Mux6~2_combout\) # ((\inst65|Mux6~4_combout\ & (\inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ $ (\inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst65|Mux6~2_combout\,
	datab => \inst65|Mux6~4_combout\,
	datac => \inst44|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst44|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \inst65|Mux6~3_combout\);

-- Location: LCCOMB_X108_Y31_N12
\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|points_A_int\(3) $ (VCC)
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|points_A_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(3),
	datad => VCC,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X108_Y31_N14
\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|points_A_int\(4) & (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|points_A_int\(4) & 
-- (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|points_A_int\(4) & !\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(4),
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X108_Y31_N16
\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|points_A_int\(5) & (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|points_A_int\(5) & 
-- (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|points_A_int\(5) & !\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(5),
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X108_Y31_N18
\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X108_Y31_N24
\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ = (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X108_Y31_N20
\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_A_int\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|points_A_int\(5),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X108_Y31_N22
\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_A_int\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_A_int\(4),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X107_Y31_N4
\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X107_Y31_N14
\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_A_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_A_int\(3),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X108_Y31_N0
\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ = (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X107_Y31_N16
\inst41|Mod1|auto_generated|divider|divider|StageOut[18]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_A_int\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|points_A_int\(2),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X107_Y31_N22
\inst41|Mod1|auto_generated|divider|divider|StageOut[18]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ = (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_A_int\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|points_A_int\(2),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X108_Y31_N2
\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst41|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\inst41|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\)))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst41|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\inst41|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datad => VCC,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X108_Y31_N4
\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- !\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X108_Y31_N6
\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X108_Y31_N8
\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- !\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X108_Y31_N10
\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X109_Y31_N26
\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ = (\MEF|points_A_int\(2) & \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(2),
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X109_Y31_N28
\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X109_Y31_N30
\inst41|Mod1|auto_generated|divider|divider|StageOut[24]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ = (!\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \MEF|points_A_int\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \MEF|points_A_int\(1),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X109_Y31_N4
\inst41|Mod1|auto_generated|divider|divider|StageOut[24]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \MEF|points_A_int\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \MEF|points_A_int\(1),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X109_Y31_N10
\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\inst41|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\inst41|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\)))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\inst41|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\inst41|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datad => VCC,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X109_Y31_N12
\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- !\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X108_Y31_N30
\inst41|Mod1|auto_generated|divider|divider|StageOut[28]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|points_A_int\(5))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|points_A_int\(5),
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\);

-- Location: LCCOMB_X109_Y31_N0
\inst41|Mod1|auto_generated|divider|divider|StageOut[28]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X109_Y31_N6
\inst41|Mod1|auto_generated|divider|divider|StageOut[27]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X108_Y31_N28
\inst41|Mod1|auto_generated|divider|divider|StageOut[27]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\MEF|points_A_int\(4)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \MEF|points_A_int\(4),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\);

-- Location: LCCOMB_X108_Y31_N26
\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\MEF|points_A_int\(3)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|points_A_int\(3),
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\);

-- Location: LCCOMB_X109_Y31_N24
\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X109_Y31_N14
\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))))
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X109_Y31_N16
\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst41|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ & 
-- !\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\,
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X109_Y31_N18
\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\inst41|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\) # ((\inst41|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (!\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datad => VCC,
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X109_Y31_N20
\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X109_Y31_N8
\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\);

-- Location: LCCOMB_X109_Y31_N2
\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- ((\inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\);

-- Location: LCCOMB_X109_Y31_N22
\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\MEF|points_A_int\(1)))) # 
-- (!\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \MEF|points_A_int\(1),
	combout => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X114_Y29_N12
\inst78|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst78|Mux0~0_combout\ = (\MEF|points_A_int\(0) & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\) # (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\MEF|points_A_int\(0) & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111011110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_A_int\(0),
	combout => \inst78|Mux0~0_combout\);

-- Location: LCCOMB_X114_Y29_N10
\inst64|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst64|Mux0~2_combout\ = (\state|state.init~q\ & (!\state|state.gameINFO~q\ & ((!\inst78|Mux0~0_combout\) # (!\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \state|state.game~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst78|Mux0~0_combout\,
	combout => \inst64|Mux0~2_combout\);

-- Location: LCCOMB_X114_Y29_N18
\inst78|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst78|Mux1~0_combout\ = (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\MEF|points_A_int\(0) & (\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & 
-- ((\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\MEF|points_A_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_A_int\(0),
	combout => \inst78|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y29_N20
\inst64|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst64|Mux1~0_combout\ = (\inst63|Mux3~4_combout\ & (!\state|state.gameINFO~q\ & ((\inst78|Mux1~0_combout\) # (!\inst66|Mux3~0_combout\)))) # (!\inst63|Mux3~4_combout\ & ((\inst78|Mux1~0_combout\) # ((!\inst66|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|Mux3~4_combout\,
	datab => \inst78|Mux1~0_combout\,
	datac => \state|state.gameINFO~q\,
	datad => \inst66|Mux3~0_combout\,
	combout => \inst64|Mux1~0_combout\);

-- Location: LCCOMB_X114_Y29_N2
\inst78|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst78|Mux2~0_combout\ = (\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (((!\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & \MEF|points_A_int\(0))))) # 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\)) # 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\MEF|points_A_int\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_A_int\(0),
	combout => \inst78|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y29_N24
\inst64|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst64|Mux2~2_combout\ = (\state|state.init~q\ & (!\state|state.gameINFO~q\ & ((\inst78|Mux2~0_combout\) # (!\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \state|state.game~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst78|Mux2~0_combout\,
	combout => \inst64|Mux2~2_combout\);

-- Location: LCCOMB_X114_Y29_N0
\inst78|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst78|Mux3~0_combout\ = (\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\MEF|points_A_int\(0)))) # 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & !\MEF|points_A_int\(0))))) # (!\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (\MEF|points_A_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_A_int\(0),
	combout => \inst78|Mux3~0_combout\);

-- Location: LCCOMB_X114_Y29_N22
\inst64|Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst64|Mux3~2_combout\ = (\state|state.init~q\ & (!\state|state.gameINFO~q\ & ((\inst78|Mux3~0_combout\) # (!\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \state|state.game~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst78|Mux3~0_combout\,
	combout => \inst64|Mux3~2_combout\);

-- Location: LCCOMB_X114_Y29_N26
\inst78|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst78|Mux4~0_combout\ = (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # 
-- (!\MEF|points_A_int\(0))))) # (!\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- !\MEF|points_A_int\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_A_int\(0),
	combout => \inst78|Mux4~0_combout\);

-- Location: LCCOMB_X113_Y29_N16
\inst64|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst64|Mux4~0_combout\ = (\state|state.init~q\ & ((\inst78|Mux4~0_combout\) # (!\state|state.game~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|state.init~q\,
	datac => \state|state.game~q\,
	datad => \inst78|Mux4~0_combout\,
	combout => \inst64|Mux4~0_combout\);

-- Location: LCCOMB_X114_Y29_N4
\inst78|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst78|Mux5~0_combout\ = (\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\MEF|points_A_int\(0) & ((\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))) # (!\MEF|points_A_int\(0) & 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & 
-- (\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ $ (\MEF|points_A_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_A_int\(0),
	combout => \inst78|Mux5~0_combout\);

-- Location: LCCOMB_X114_Y29_N14
\inst64|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst64|Mux5~0_combout\ = (\inst78|Mux5~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst78|Mux5~0_combout\,
	datad => \state|state.game~q\,
	combout => \inst64|Mux5~0_combout\);

-- Location: LCCOMB_X114_Y29_N16
\inst78|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst78|Mux6~0_combout\ = (\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (!\MEF|points_A_int\(0))))) # (!\inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\MEF|points_A_int\(0) & (\inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (!\inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst41|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst41|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \MEF|points_A_int\(0),
	combout => \inst78|Mux6~0_combout\);

-- Location: LCCOMB_X114_Y29_N6
\inst64|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst64|Mux6~0_combout\ = (\inst63|Mux3~4_combout\ & (!\state|state.gameINFO~q\ & ((\inst78|Mux6~0_combout\) # (!\inst66|Mux3~0_combout\)))) # (!\inst63|Mux3~4_combout\ & ((\inst78|Mux6~0_combout\) # ((!\inst66|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110001011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|Mux3~4_combout\,
	datab => \inst78|Mux6~0_combout\,
	datac => \state|state.gameINFO~q\,
	datad => \inst66|Mux3~0_combout\,
	combout => \inst64|Mux6~0_combout\);

-- Location: LCCOMB_X109_Y29_N20
\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|points_A_int\(3) $ (VCC)
-- \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|points_A_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(3),
	datad => VCC,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X109_Y29_N22
\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|points_A_int\(4) & (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|points_A_int\(4) & 
-- (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|points_A_int\(4) & !\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(4),
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X109_Y29_N24
\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|points_A_int\(5) & (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|points_A_int\(5) & 
-- (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|points_A_int\(5) & !\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(5),
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X109_Y29_N26
\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X108_Y29_N12
\inst41|Div0|auto_generated|divider|divider|StageOut[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ = (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\);

-- Location: LCCOMB_X109_Y29_N28
\inst41|Div0|auto_generated|divider|divider|StageOut[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ = (\MEF|points_A_int\(4) & \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|points_A_int\(4),
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\);

-- Location: LCCOMB_X109_Y29_N30
\inst41|Div0|auto_generated|divider|divider|StageOut[16]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_A_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_A_int\(3),
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\);

-- Location: LCCOMB_X108_Y29_N14
\inst41|Div0|auto_generated|divider|divider|StageOut[16]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\);

-- Location: LCCOMB_X108_Y29_N6
\inst41|Div0|auto_generated|divider|divider|StageOut[15]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ = (\MEF|points_A_int\(2) & !\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_A_int\(2),
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\);

-- Location: LCCOMB_X108_Y29_N20
\inst41|Div0|auto_generated|divider|divider|StageOut[15]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ = (\MEF|points_A_int\(2) & \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|points_A_int\(2),
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\);

-- Location: LCCOMB_X108_Y29_N22
\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst41|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\) # (\inst41|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\)))
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst41|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\) # (\inst41|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\,
	datad => VCC,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X108_Y29_N24
\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst41|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\) # 
-- (\inst41|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\)))) # (!\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst41|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & 
-- (!\inst41|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\)))
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst41|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & (!\inst41|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & 
-- !\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\,
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X108_Y29_N26
\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst41|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst41|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))) # (!\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst41|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst41|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))))
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst41|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst41|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\,
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X109_Y29_N4
\inst41|Div0|auto_generated|divider|divider|StageOut[18]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|points_A_int\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|points_A_int\(5),
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\);

-- Location: LCCOMB_X109_Y29_N2
\inst41|Div0|auto_generated|divider|divider|StageOut[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ = (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\);

-- Location: LCCOMB_X108_Y29_N28
\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\inst41|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ & (!\inst41|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ & 
-- !\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\,
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X108_Y29_N30
\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X108_Y29_N16
\inst41|Div0|auto_generated|divider|divider|StageOut[23]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\);

-- Location: LCCOMB_X109_Y29_N8
\inst41|Div0|auto_generated|divider|divider|StageOut[23]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|points_A_int\(4))) # (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \MEF|points_A_int\(4),
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\);

-- Location: LCCOMB_X109_Y29_N6
\inst41|Div0|auto_generated|divider|divider|StageOut[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\MEF|points_A_int\(3)))) # (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datab => \MEF|points_A_int\(3),
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\);

-- Location: LCCOMB_X109_Y29_N0
\inst41|Div0|auto_generated|divider|divider|StageOut[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\);

-- Location: LCCOMB_X108_Y29_N0
\inst41|Div0|auto_generated|divider|divider|StageOut[21]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\);

-- Location: LCCOMB_X108_Y29_N18
\inst41|Div0|auto_generated|divider|divider|StageOut[21]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ = (\MEF|points_A_int\(2) & \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(2),
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\);

-- Location: LCCOMB_X110_Y29_N4
\inst41|Div0|auto_generated|divider|divider|StageOut[20]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ = (\MEF|points_A_int\(1) & \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(1),
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\);

-- Location: LCCOMB_X110_Y29_N22
\inst41|Div0|auto_generated|divider|divider|StageOut[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ = (\MEF|points_A_int\(1) & !\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|points_A_int\(1),
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst41|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\);

-- Location: LCCOMB_X109_Y29_N10
\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\inst41|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\) # (\inst41|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\,
	datad => VCC,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X109_Y29_N12
\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\inst41|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ & (!\inst41|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ & 
-- !\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\,
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X109_Y29_N14
\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & ((\inst41|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\) # 
-- (\inst41|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\,
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X109_Y29_N16
\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst41|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ & (!\inst41|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ & 
-- !\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\,
	datad => VCC,
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X109_Y29_N18
\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X108_Y29_N10
\inst63|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux0~2_combout\ = ((\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # 
-- (!\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & !\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # 
-- (!\inst66|Mux0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst63|Mux0~2_combout\);

-- Location: LCCOMB_X108_Y29_N4
\inst63|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux0~3_combout\ = (\inst63|Mux0~2_combout\ & ((\state|state.game~q\) # (!\state|state.init~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|Mux0~2_combout\,
	datab => \state|state.init~q\,
	datad => \state|state.game~q\,
	combout => \inst63|Mux0~3_combout\);

-- Location: LCCOMB_X108_Y29_N8
\inst63|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux1~0_combout\ = (\state|state.game~q\ & ((\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- !\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # (!\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & ((\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\) # 
-- (!\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \state|state.game~q\,
	combout => \inst63|Mux1~0_combout\);

-- Location: LCCOMB_X108_Y29_N2
\inst63|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux2~0_combout\ = (\state|state.game~q\ & (((!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # 
-- (!\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \state|state.game~q\,
	combout => \inst63|Mux2~0_combout\);

-- Location: LCCOMB_X112_Y33_N6
\inst89|Y[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst89|Y\(3) = (\state|state.win_state_B~q\) # (\state|state.win_state_A~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|state.win_state_B~q\,
	datac => \state|state.win_state_A~q\,
	combout => \inst89|Y\(3));

-- Location: LCCOMB_X111_Y33_N0
\inst63|Mux3~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux3~5_combout\ = (\state|state.game~q\ & \state|state.init~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.game~q\,
	datad => \state|state.init~q\,
	combout => \inst63|Mux3~5_combout\);

-- Location: LCCOMB_X111_Y33_N26
\inst63|Mux3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux3~6_combout\ = (\inst63|Mux3~5_combout\ & ((\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # (!\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ $ 
-- (!\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst63|Mux3~5_combout\,
	combout => \inst63|Mux3~6_combout\);

-- Location: LCCOMB_X112_Y33_N2
\inst63|Mux3~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux3~7_combout\ = (\inst63|Mux3~6_combout\) # ((\inst89|Y\(3) & (!\state|state.game~q\ & \state|state.init~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst89|Y\(3),
	datab => \state|state.game~q\,
	datac => \inst63|Mux3~6_combout\,
	datad => \state|state.init~q\,
	combout => \inst63|Mux3~7_combout\);

-- Location: LCCOMB_X111_Y33_N8
\inst66|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst66|Mux0~3_combout\ = (!\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\inst63|Mux3~4_combout\ & 
-- \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \inst66|Mux0~3_combout\);

-- Location: LCCOMB_X111_Y33_N6
\inst63|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux4~0_combout\ = ((\inst66|Mux0~3_combout\) # ((\inst89|Y\(3) & \inst63|Mux3~4_combout\))) # (!\inst66|Mux0~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst89|Y\(3),
	datab => \inst66|Mux0~2_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst66|Mux0~3_combout\,
	combout => \inst63|Mux4~0_combout\);

-- Location: LCCOMB_X111_Y33_N24
\inst63|Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux5~2_combout\ = (!\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\inst63|Mux3~4_combout\ & (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ 
-- (\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	combout => \inst63|Mux5~2_combout\);

-- Location: LCCOMB_X111_Y33_N12
\inst63|Mux5~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux5~3_combout\ = (\state|state.gameINFO~q\) # ((\inst63|Mux5~2_combout\) # (!\state|state.init~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.gameINFO~q\,
	datab => \state|state.init~q\,
	datad => \inst63|Mux5~2_combout\,
	combout => \inst63|Mux5~3_combout\);

-- Location: LCCOMB_X111_Y33_N30
\inst63|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux6~0_combout\ = (\inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst63|Mux3~5_combout\ & (\inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst41|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst41|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst41|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst63|Mux3~5_combout\,
	combout => \inst63|Mux6~0_combout\);

-- Location: LCCOMB_X114_Y29_N28
\inst63|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst63|Mux6~1_combout\ = (\inst63|Mux6~0_combout\) # ((\state|state.init~q\ & \state|state.gameINFO~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst63|Mux6~0_combout\,
	combout => \inst63|Mux6~1_combout\);

-- Location: FF_X112_Y37_N5
\MEF|cycle_last\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	asdata => \inst25|enable_signal~q\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	sload => VCC,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|cycle_last~q\);

-- Location: LCCOMB_X109_Y37_N12
\MEF|state_machine~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|state_machine~1_combout\ = (!\MEF|cycle_last~q\ & \inst25|enable_signal~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|cycle_last~q\,
	datad => \inst25|enable_signal~q\,
	combout => \MEF|state_machine~1_combout\);

-- Location: LCCOMB_X109_Y37_N16
\MEF|total_cycles_int[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|total_cycles_int[0]~6_combout\ = \MEF|total_cycles_int\(0) $ (VCC)
-- \MEF|total_cycles_int[0]~7\ = CARRY(\MEF|total_cycles_int\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|total_cycles_int\(0),
	datad => VCC,
	combout => \MEF|total_cycles_int[0]~6_combout\,
	cout => \MEF|total_cycles_int[0]~7\);

-- Location: LCCOMB_X112_Y37_N4
\MEF|tie~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|tie~0_combout\ = (\inst25|enable_signal~q\ & (!\MEF|cycle_last~q\ & \MEF|tie~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|enable_signal~q\,
	datac => \MEF|cycle_last~q\,
	datad => \MEF|tie~q\,
	combout => \MEF|tie~0_combout\);

-- Location: LCCOMB_X112_Y37_N2
\MEF|tie~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|tie~1_combout\ = (\MEF|tie~0_combout\) # ((!\MEF|LessThan2~24_combout\ & (\MEF|points_A_int~2_combout\ & !\MEF|LessThan3~24_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|LessThan2~24_combout\,
	datab => \MEF|tie~0_combout\,
	datac => \MEF|points_A_int~2_combout\,
	datad => \MEF|LessThan3~24_combout\,
	combout => \MEF|tie~1_combout\);

-- Location: FF_X112_Y37_N3
\MEF|tie\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|tie~1_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \inst57~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|tie~q\);

-- Location: LCCOMB_X109_Y37_N14
\MEF|total_cycles_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|total_cycles_int[5]~8_combout\ = (\MEF|state_machine~1_combout\ & (((\state|state.gameINFO~q\) # (\state|state.game~q\)))) # (!\MEF|state_machine~1_combout\ & (\MEF|tie~q\ & ((\state|state.gameINFO~q\) # (\state|state.game~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|state_machine~1_combout\,
	datab => \MEF|tie~q\,
	datac => \state|state.gameINFO~q\,
	datad => \state|state.game~q\,
	combout => \MEF|total_cycles_int[5]~8_combout\);

-- Location: FF_X109_Y37_N17
\MEF|total_cycles_int[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|total_cycles_int[0]~6_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|total_cycles_int[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|total_cycles_int\(0));

-- Location: LCCOMB_X109_Y37_N18
\MEF|total_cycles_int[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|total_cycles_int[1]~9_combout\ = (\MEF|state_machine~1_combout\ & ((\MEF|total_cycles_int\(1) & (!\MEF|total_cycles_int[0]~7\)) # (!\MEF|total_cycles_int\(1) & ((\MEF|total_cycles_int[0]~7\) # (GND))))) # (!\MEF|state_machine~1_combout\ & 
-- ((\MEF|total_cycles_int\(1) & (\MEF|total_cycles_int[0]~7\ & VCC)) # (!\MEF|total_cycles_int\(1) & (!\MEF|total_cycles_int[0]~7\))))
-- \MEF|total_cycles_int[1]~10\ = CARRY((\MEF|state_machine~1_combout\ & ((!\MEF|total_cycles_int[0]~7\) # (!\MEF|total_cycles_int\(1)))) # (!\MEF|state_machine~1_combout\ & (!\MEF|total_cycles_int\(1) & !\MEF|total_cycles_int[0]~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|state_machine~1_combout\,
	datab => \MEF|total_cycles_int\(1),
	datad => VCC,
	cin => \MEF|total_cycles_int[0]~7\,
	combout => \MEF|total_cycles_int[1]~9_combout\,
	cout => \MEF|total_cycles_int[1]~10\);

-- Location: FF_X109_Y37_N19
\MEF|total_cycles_int[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|total_cycles_int[1]~9_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|total_cycles_int[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|total_cycles_int\(1));

-- Location: LCCOMB_X109_Y37_N20
\MEF|total_cycles_int[2]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|total_cycles_int[2]~11_combout\ = ((\MEF|state_machine~1_combout\ $ (\MEF|total_cycles_int\(2) $ (\MEF|total_cycles_int[1]~10\)))) # (GND)
-- \MEF|total_cycles_int[2]~12\ = CARRY((\MEF|state_machine~1_combout\ & (\MEF|total_cycles_int\(2) & !\MEF|total_cycles_int[1]~10\)) # (!\MEF|state_machine~1_combout\ & ((\MEF|total_cycles_int\(2)) # (!\MEF|total_cycles_int[1]~10\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|state_machine~1_combout\,
	datab => \MEF|total_cycles_int\(2),
	datad => VCC,
	cin => \MEF|total_cycles_int[1]~10\,
	combout => \MEF|total_cycles_int[2]~11_combout\,
	cout => \MEF|total_cycles_int[2]~12\);

-- Location: FF_X109_Y37_N21
\MEF|total_cycles_int[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|total_cycles_int[2]~11_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|total_cycles_int[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|total_cycles_int\(2));

-- Location: LCCOMB_X109_Y37_N22
\MEF|total_cycles_int[3]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|total_cycles_int[3]~13_combout\ = (\MEF|state_machine~1_combout\ & ((\MEF|total_cycles_int\(3) & (!\MEF|total_cycles_int[2]~12\)) # (!\MEF|total_cycles_int\(3) & ((\MEF|total_cycles_int[2]~12\) # (GND))))) # (!\MEF|state_machine~1_combout\ & 
-- ((\MEF|total_cycles_int\(3) & (\MEF|total_cycles_int[2]~12\ & VCC)) # (!\MEF|total_cycles_int\(3) & (!\MEF|total_cycles_int[2]~12\))))
-- \MEF|total_cycles_int[3]~14\ = CARRY((\MEF|state_machine~1_combout\ & ((!\MEF|total_cycles_int[2]~12\) # (!\MEF|total_cycles_int\(3)))) # (!\MEF|state_machine~1_combout\ & (!\MEF|total_cycles_int\(3) & !\MEF|total_cycles_int[2]~12\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|state_machine~1_combout\,
	datab => \MEF|total_cycles_int\(3),
	datad => VCC,
	cin => \MEF|total_cycles_int[2]~12\,
	combout => \MEF|total_cycles_int[3]~13_combout\,
	cout => \MEF|total_cycles_int[3]~14\);

-- Location: FF_X109_Y37_N23
\MEF|total_cycles_int[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|total_cycles_int[3]~13_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|total_cycles_int[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|total_cycles_int\(3));

-- Location: LCCOMB_X109_Y37_N24
\MEF|total_cycles_int[4]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|total_cycles_int[4]~15_combout\ = ((\MEF|state_machine~1_combout\ $ (\MEF|total_cycles_int\(4) $ (\MEF|total_cycles_int[3]~14\)))) # (GND)
-- \MEF|total_cycles_int[4]~16\ = CARRY((\MEF|state_machine~1_combout\ & (\MEF|total_cycles_int\(4) & !\MEF|total_cycles_int[3]~14\)) # (!\MEF|state_machine~1_combout\ & ((\MEF|total_cycles_int\(4)) # (!\MEF|total_cycles_int[3]~14\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|state_machine~1_combout\,
	datab => \MEF|total_cycles_int\(4),
	datad => VCC,
	cin => \MEF|total_cycles_int[3]~14\,
	combout => \MEF|total_cycles_int[4]~15_combout\,
	cout => \MEF|total_cycles_int[4]~16\);

-- Location: FF_X109_Y37_N25
\MEF|total_cycles_int[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|total_cycles_int[4]~15_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|total_cycles_int[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|total_cycles_int\(4));

-- Location: LCCOMB_X109_Y37_N26
\MEF|total_cycles_int[5]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \MEF|total_cycles_int[5]~17_combout\ = \MEF|total_cycles_int\(5) $ (\MEF|total_cycles_int[4]~16\ $ (!\MEF|state_machine~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(5),
	datad => \MEF|state_machine~1_combout\,
	cin => \MEF|total_cycles_int[4]~16\,
	combout => \MEF|total_cycles_int[5]~17_combout\);

-- Location: FF_X109_Y37_N27
\MEF|total_cycles_int[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \MEF|total_cycles_int[5]~17_combout\,
	clrn => \MEF|ALT_INV_state_machine~0_combout\,
	ena => \MEF|total_cycles_int[5]~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \MEF|total_cycles_int\(5));

-- Location: LCCOMB_X103_Y29_N24
\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|total_cycles_int\(3) $ (VCC)
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|total_cycles_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(3),
	datad => VCC,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X103_Y29_N26
\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|total_cycles_int\(4) & (\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|total_cycles_int\(4) & 
-- (!\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|total_cycles_int\(4) & !\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(4),
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X103_Y29_N28
\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|total_cycles_int\(5) & (\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|total_cycles_int\(5) & 
-- (!\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|total_cycles_int\(5) & !\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|total_cycles_int\(5),
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X103_Y29_N30
\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X105_Y29_N24
\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ = (!\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X103_Y29_N16
\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|total_cycles_int\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|total_cycles_int\(5),
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X103_Y29_N22
\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ = (\MEF|total_cycles_int\(4) & \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(4),
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X103_Y29_N0
\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X105_Y29_N10
\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ = (!\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X103_Y29_N20
\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ = (\MEF|total_cycles_int\(3) & \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(3),
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X105_Y29_N22
\inst47|Mod1|auto_generated|divider|divider|StageOut[18]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ = (\MEF|total_cycles_int\(2) & !\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(2),
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X105_Y29_N4
\inst47|Mod1|auto_generated|divider|divider|StageOut[18]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\MEF|total_cycles_int\(2) & \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(2),
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X103_Y29_N6
\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst47|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\) # (\inst47|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\)))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst47|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\) # (\inst47|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datad => VCC,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X103_Y29_N8
\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- (!\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\)))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- !\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X103_Y29_N10
\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X103_Y29_N12
\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- (!\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- !\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X103_Y29_N14
\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X103_Y29_N18
\inst47|Mod1|auto_generated|divider|divider|StageOut[28]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|total_cycles_int\(5))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \MEF|total_cycles_int\(5),
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\);

-- Location: LCCOMB_X103_Y28_N16
\inst47|Mod1|auto_generated|divider|divider|StageOut[28]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ = (!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X103_Y28_N26
\inst47|Mod1|auto_generated|divider|divider|StageOut[27]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ = (!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X103_Y29_N4
\inst47|Mod1|auto_generated|divider|divider|StageOut[27]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\MEF|total_cycles_int\(4)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datab => \MEF|total_cycles_int\(4),
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\);

-- Location: LCCOMB_X103_Y28_N28
\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ = (!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X103_Y29_N2
\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|total_cycles_int\(3))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(3),
	datab => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\);

-- Location: LCCOMB_X103_Y28_N22
\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ = (\MEF|total_cycles_int\(2) & \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|total_cycles_int\(2),
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X103_Y28_N24
\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ = (!\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X103_Y28_N12
\inst47|Mod1|auto_generated|divider|divider|StageOut[24]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ = (\MEF|total_cycles_int\(1) & \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|total_cycles_int\(1),
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X103_Y28_N14
\inst47|Mod1|auto_generated|divider|divider|StageOut[24]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ = (\MEF|total_cycles_int\(1) & !\inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|total_cycles_int\(1),
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X103_Y28_N0
\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\inst47|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\) # (\inst47|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\)))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\inst47|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\) # (\inst47|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datad => VCC,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X103_Y28_N2
\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- (!\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- !\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X103_Y28_N4
\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\)))))
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X103_Y28_N6
\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst47|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ & 
-- !\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\,
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X103_Y28_N8
\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\inst47|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\) # ((\inst47|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (!\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datad => VCC,
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X103_Y28_N10
\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X103_Y28_N18
\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- ((\inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datac => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\);

-- Location: LCCOMB_X103_Y28_N20
\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\) # 
-- ((\inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datac => \inst47|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\);

-- Location: LCCOMB_X103_Y28_N30
\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\MEF|total_cycles_int\(1))) # 
-- (!\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \MEF|total_cycles_int\(1),
	datad => \inst47|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X100_Y5_N28
\inst74|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst74|Mux0~0_combout\ = (\MEF|total_cycles_int\(0) & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\) # (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\MEF|total_cycles_int\(0) & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|total_cycles_int\(0),
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst74|Mux0~0_combout\);

-- Location: LCCOMB_X100_Y5_N10
\inst62|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst62|Mux0~0_combout\ = (!\inst74|Mux0~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \inst74|Mux0~0_combout\,
	combout => \inst62|Mux0~0_combout\);

-- Location: LCCOMB_X100_Y5_N16
\inst74|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst74|Mux1~0_combout\ = (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\MEF|total_cycles_int\(0) & (\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\MEF|total_cycles_int\(0)) # 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|total_cycles_int\(0),
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst74|Mux1~0_combout\);

-- Location: LCCOMB_X100_Y5_N22
\inst62|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst62|Mux1~0_combout\ = (\inst74|Mux1~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \inst74|Mux1~0_combout\,
	combout => \inst62|Mux1~0_combout\);

-- Location: LCCOMB_X100_Y5_N12
\inst74|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst74|Mux2~0_combout\ = (\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\MEF|total_cycles_int\(0))))) # 
-- (!\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\)) # 
-- (!\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\MEF|total_cycles_int\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|total_cycles_int\(0),
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst74|Mux2~0_combout\);

-- Location: LCCOMB_X100_Y5_N26
\inst62|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst62|Mux2~0_combout\ = (\inst74|Mux2~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \inst74|Mux2~0_combout\,
	combout => \inst62|Mux2~0_combout\);

-- Location: LCCOMB_X100_Y5_N8
\inst74|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst74|Mux3~0_combout\ = (\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\MEF|total_cycles_int\(0)))) # 
-- (!\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & !\MEF|total_cycles_int\(0))))) # (!\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (!\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (\MEF|total_cycles_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|total_cycles_int\(0),
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst74|Mux3~0_combout\);

-- Location: LCCOMB_X100_Y5_N30
\inst62|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst62|Mux3~0_combout\ = (\inst74|Mux3~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst74|Mux3~0_combout\,
	datac => \state|state.game~q\,
	combout => \inst62|Mux3~0_combout\);

-- Location: LCCOMB_X100_Y5_N4
\inst74|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst74|Mux4~0_combout\ = (\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # 
-- (!\MEF|total_cycles_int\(0))))) # (!\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\MEF|total_cycles_int\(0) & 
-- \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|total_cycles_int\(0),
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst74|Mux4~0_combout\);

-- Location: LCCOMB_X100_Y5_N18
\inst62|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst62|Mux4~0_combout\ = (\inst74|Mux4~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst74|Mux4~0_combout\,
	datac => \state|state.game~q\,
	combout => \inst62|Mux4~0_combout\);

-- Location: LCCOMB_X100_Y5_N20
\inst74|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst74|Mux5~0_combout\ = (\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\MEF|total_cycles_int\(0) & ((\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))) # (!\MEF|total_cycles_int\(0) & 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\MEF|total_cycles_int\(0) $ 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110001001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|total_cycles_int\(0),
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst74|Mux5~0_combout\);

-- Location: LCCOMB_X100_Y5_N6
\inst62|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst62|Mux5~0_combout\ = (\inst74|Mux5~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \inst74|Mux5~0_combout\,
	combout => \inst62|Mux5~0_combout\);

-- Location: LCCOMB_X100_Y5_N24
\inst74|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst74|Mux6~0_combout\ = (\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\MEF|total_cycles_int\(0) & (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (\inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (\MEF|total_cycles_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000010010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst47|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|total_cycles_int\(0),
	datad => \inst47|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst74|Mux6~0_combout\);

-- Location: LCCOMB_X100_Y5_N14
\inst62|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst62|Mux6~0_combout\ = (\inst74|Mux6~0_combout\) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \state|state.game~q\,
	datad => \inst74|Mux6~0_combout\,
	combout => \inst62|Mux6~0_combout\);

-- Location: LCCOMB_X110_Y38_N20
\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|total_cycles_int\(3) $ (VCC)
-- \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|total_cycles_int\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(3),
	datad => VCC,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X110_Y38_N22
\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|total_cycles_int\(4) & (\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|total_cycles_int\(4) & 
-- (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|total_cycles_int\(4) & !\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(4),
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X110_Y38_N24
\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|total_cycles_int\(5) & (\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|total_cycles_int\(5) & 
-- (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|total_cycles_int\(5) & !\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(5),
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X110_Y38_N26
\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X110_Y38_N16
\inst47|Div0|auto_generated|divider|divider|StageOut[18]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|total_cycles_int\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|total_cycles_int\(5),
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\);

-- Location: LCCOMB_X110_Y38_N6
\inst47|Div0|auto_generated|divider|divider|StageOut[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ = (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\);

-- Location: LCCOMB_X110_Y38_N10
\inst47|Div0|auto_generated|divider|divider|StageOut[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\);

-- Location: LCCOMB_X110_Y38_N4
\inst47|Div0|auto_generated|divider|divider|StageOut[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|total_cycles_int\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|total_cycles_int\(4),
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\);

-- Location: LCCOMB_X110_Y38_N14
\inst47|Div0|auto_generated|divider|divider|StageOut[16]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ = (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\);

-- Location: LCCOMB_X110_Y38_N28
\inst47|Div0|auto_generated|divider|divider|StageOut[16]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ = (\MEF|total_cycles_int\(3) & \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(3),
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\);

-- Location: LCCOMB_X111_Y38_N8
\inst47|Div0|auto_generated|divider|divider|StageOut[15]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ = (\MEF|total_cycles_int\(2) & \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|total_cycles_int\(2),
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\);

-- Location: LCCOMB_X111_Y38_N2
\inst47|Div0|auto_generated|divider|divider|StageOut[15]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ = (\MEF|total_cycles_int\(2) & !\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|total_cycles_int\(2),
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\);

-- Location: LCCOMB_X111_Y38_N10
\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst47|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\) # (\inst47|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\)))
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst47|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\) # (\inst47|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\,
	datad => VCC,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X111_Y38_N12
\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst47|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\) # 
-- (\inst47|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\)))) # (!\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst47|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & 
-- (!\inst47|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\)))
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst47|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & (!\inst47|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & 
-- !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\,
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X111_Y38_N14
\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst47|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst47|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))) # (!\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst47|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst47|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))))
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst47|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst47|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\,
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X111_Y38_N16
\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\inst47|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ & (!\inst47|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ & 
-- !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\,
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X111_Y38_N18
\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X110_Y38_N0
\inst47|Div0|auto_generated|divider|divider|StageOut[23]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\MEF|total_cycles_int\(4)))) # (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \MEF|total_cycles_int\(4),
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\);

-- Location: LCCOMB_X111_Y38_N20
\inst47|Div0|auto_generated|divider|divider|StageOut[23]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\);

-- Location: LCCOMB_X111_Y38_N6
\inst47|Div0|auto_generated|divider|divider|StageOut[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\);

-- Location: LCCOMB_X110_Y38_N30
\inst47|Div0|auto_generated|divider|divider|StageOut[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|total_cycles_int\(3))) # (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|total_cycles_int\(3),
	datab => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\);

-- Location: LCCOMB_X111_Y38_N4
\inst47|Div0|auto_generated|divider|divider|StageOut[21]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ = (\MEF|total_cycles_int\(2) & \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|total_cycles_int\(2),
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\);

-- Location: LCCOMB_X111_Y38_N0
\inst47|Div0|auto_generated|divider|divider|StageOut[21]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ = (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\);

-- Location: LCCOMB_X110_Y38_N12
\inst47|Div0|auto_generated|divider|divider|StageOut[20]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ = (\MEF|total_cycles_int\(1) & \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|total_cycles_int\(1),
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\);

-- Location: LCCOMB_X110_Y38_N18
\inst47|Div0|auto_generated|divider|divider|StageOut[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ = (\MEF|total_cycles_int\(1) & !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|total_cycles_int\(1),
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst47|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\);

-- Location: LCCOMB_X111_Y38_N22
\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\inst47|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\) # (\inst47|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\,
	datad => VCC,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X111_Y38_N24
\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\inst47|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ & (!\inst47|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ & 
-- !\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\,
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X111_Y38_N26
\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & ((\inst47|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\) # 
-- (\inst47|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\,
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X111_Y38_N28
\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst47|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ & (!\inst47|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ & 
-- !\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\,
	datab => \inst47|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\,
	datad => VCC,
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X111_Y38_N30
\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X113_Y37_N4
\inst61|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst61|Mux0~0_combout\ = ((\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # 
-- (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # 
-- (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.game~q\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst61|Mux0~0_combout\);

-- Location: LCCOMB_X113_Y37_N2
\inst61|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst61|Mux1~0_combout\ = ((\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((!\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\) # 
-- (!\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.game~q\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst61|Mux1~0_combout\);

-- Location: LCCOMB_X113_Y37_N20
\inst61|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst61|Mux2~0_combout\ = (((!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # 
-- (!\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.game~q\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst61|Mux2~0_combout\);

-- Location: LCCOMB_X113_Y37_N22
\inst61|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst61|Mux3~0_combout\ = ((\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (!\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)) # (!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (!\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.game~q\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst61|Mux3~0_combout\);

-- Location: LCCOMB_X113_Y37_N28
\inst61|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst61|Mux4~0_combout\ = ((\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- !\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.game~q\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst61|Mux4~0_combout\);

-- Location: LCCOMB_X113_Y37_N18
\inst61|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst61|Mux5~0_combout\ = ((!\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)))) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011101110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.game~q\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst61|Mux5~0_combout\);

-- Location: LCCOMB_X113_Y37_N24
\inst61|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst61|Mux6~0_combout\ = ((\inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ $ 
-- (\inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # (!\state|state.game~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst47|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.game~q\,
	datac => \inst47|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \inst47|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst61|Mux6~0_combout\);

-- Location: LCCOMB_X56_Y70_N8
\1Hz|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~1_cout\ = CARRY((\1kHz|s_cnt\(1) & \1kHz|s_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(1),
	datab => \1kHz|s_cnt\(0),
	datad => VCC,
	cout => \1Hz|Add0~1_cout\);

-- Location: LCCOMB_X56_Y70_N10
\1Hz|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~3_cout\ = CARRY((!\1Hz|Add0~1_cout\) # (!\1kHz|s_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(2),
	datad => VCC,
	cin => \1Hz|Add0~1_cout\,
	cout => \1Hz|Add0~3_cout\);

-- Location: LCCOMB_X56_Y70_N12
\1Hz|Add0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~5_cout\ = CARRY((\1kHz|s_cnt\(3) & !\1Hz|Add0~3_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1kHz|s_cnt\(3),
	datad => VCC,
	cin => \1Hz|Add0~3_cout\,
	cout => \1Hz|Add0~5_cout\);

-- Location: LCCOMB_X56_Y70_N14
\1Hz|Add0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~7_cout\ = CARRY((!\1Hz|Add0~5_cout\) # (!\10Hz|s_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(4),
	datad => VCC,
	cin => \1Hz|Add0~5_cout\,
	cout => \1Hz|Add0~7_cout\);

-- Location: LCCOMB_X56_Y70_N16
\1Hz|Add0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~9_cout\ = CARRY((\10Hz|s_cnt\(5) & !\1Hz|Add0~7_cout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(5),
	datad => VCC,
	cin => \1Hz|Add0~7_cout\,
	cout => \1Hz|Add0~9_cout\);

-- Location: LCCOMB_X56_Y70_N18
\1Hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~10_combout\ = (\1Hz|s_cnt\(6) & (!\1Hz|Add0~9_cout\)) # (!\1Hz|s_cnt\(6) & ((\1Hz|Add0~9_cout\) # (GND)))
-- \1Hz|Add0~11\ = CARRY((!\1Hz|Add0~9_cout\) # (!\1Hz|s_cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(6),
	datad => VCC,
	cin => \1Hz|Add0~9_cout\,
	combout => \1Hz|Add0~10_combout\,
	cout => \1Hz|Add0~11\);

-- Location: FF_X56_Y70_N19
\1Hz|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(6));

-- Location: LCCOMB_X56_Y70_N20
\1Hz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~12_combout\ = (\1Hz|s_cnt\(7) & (\1Hz|Add0~11\ $ (GND))) # (!\1Hz|s_cnt\(7) & (!\1Hz|Add0~11\ & VCC))
-- \1Hz|Add0~13\ = CARRY((\1Hz|s_cnt\(7) & !\1Hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(7),
	datad => VCC,
	cin => \1Hz|Add0~11\,
	combout => \1Hz|Add0~12_combout\,
	cout => \1Hz|Add0~13\);

-- Location: LCCOMB_X56_Y70_N0
\1Hz|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~5_combout\ = (\1Hz|Add0~12_combout\ & !\1Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Add0~12_combout\,
	datad => \1Hz|Equal0~6_combout\,
	combout => \1Hz|s_cnt~5_combout\);

-- Location: FF_X56_Y70_N1
\1Hz|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(7));

-- Location: LCCOMB_X56_Y70_N22
\1Hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~14_combout\ = (\1Hz|s_cnt\(8) & (!\1Hz|Add0~13\)) # (!\1Hz|s_cnt\(8) & ((\1Hz|Add0~13\) # (GND)))
-- \1Hz|Add0~15\ = CARRY((!\1Hz|Add0~13\) # (!\1Hz|s_cnt\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(8),
	datad => VCC,
	cin => \1Hz|Add0~13\,
	combout => \1Hz|Add0~14_combout\,
	cout => \1Hz|Add0~15\);

-- Location: FF_X56_Y70_N23
\1Hz|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(8));

-- Location: LCCOMB_X56_Y70_N24
\1Hz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~16_combout\ = (\1Hz|s_cnt\(9) & (\1Hz|Add0~15\ $ (GND))) # (!\1Hz|s_cnt\(9) & (!\1Hz|Add0~15\ & VCC))
-- \1Hz|Add0~17\ = CARRY((\1Hz|s_cnt\(9) & !\1Hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(9),
	datad => VCC,
	cin => \1Hz|Add0~15\,
	combout => \1Hz|Add0~16_combout\,
	cout => \1Hz|Add0~17\);

-- Location: FF_X56_Y70_N25
\1Hz|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(9));

-- Location: LCCOMB_X56_Y70_N26
\1Hz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~18_combout\ = (\1Hz|s_cnt\(10) & (!\1Hz|Add0~17\)) # (!\1Hz|s_cnt\(10) & ((\1Hz|Add0~17\) # (GND)))
-- \1Hz|Add0~19\ = CARRY((!\1Hz|Add0~17\) # (!\1Hz|s_cnt\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(10),
	datad => VCC,
	cin => \1Hz|Add0~17\,
	combout => \1Hz|Add0~18_combout\,
	cout => \1Hz|Add0~19\);

-- Location: FF_X56_Y70_N27
\1Hz|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(10));

-- Location: LCCOMB_X56_Y70_N28
\1Hz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~20_combout\ = (\1Hz|s_cnt\(11) & (\1Hz|Add0~19\ $ (GND))) # (!\1Hz|s_cnt\(11) & (!\1Hz|Add0~19\ & VCC))
-- \1Hz|Add0~21\ = CARRY((\1Hz|s_cnt\(11) & !\1Hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(11),
	datad => VCC,
	cin => \1Hz|Add0~19\,
	combout => \1Hz|Add0~20_combout\,
	cout => \1Hz|Add0~21\);

-- Location: FF_X56_Y70_N29
\1Hz|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(11));

-- Location: LCCOMB_X56_Y70_N30
\1Hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~22_combout\ = (\1Hz|s_cnt\(12) & (!\1Hz|Add0~21\)) # (!\1Hz|s_cnt\(12) & ((\1Hz|Add0~21\) # (GND)))
-- \1Hz|Add0~23\ = CARRY((!\1Hz|Add0~21\) # (!\1Hz|s_cnt\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(12),
	datad => VCC,
	cin => \1Hz|Add0~21\,
	combout => \1Hz|Add0~22_combout\,
	cout => \1Hz|Add0~23\);

-- Location: LCCOMB_X56_Y70_N6
\1Hz|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~4_combout\ = (\1Hz|Add0~22_combout\ & !\1Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Add0~22_combout\,
	datad => \1Hz|Equal0~6_combout\,
	combout => \1Hz|s_cnt~4_combout\);

-- Location: FF_X56_Y70_N7
\1Hz|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(12));

-- Location: LCCOMB_X56_Y69_N0
\1Hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~24_combout\ = (\1Hz|s_cnt\(13) & (\1Hz|Add0~23\ $ (GND))) # (!\1Hz|s_cnt\(13) & (!\1Hz|Add0~23\ & VCC))
-- \1Hz|Add0~25\ = CARRY((\1Hz|s_cnt\(13) & !\1Hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(13),
	datad => VCC,
	cin => \1Hz|Add0~23\,
	combout => \1Hz|Add0~24_combout\,
	cout => \1Hz|Add0~25\);

-- Location: LCCOMB_X55_Y69_N12
\1Hz|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~3_combout\ = (\1Hz|Add0~24_combout\ & !\1Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Add0~24_combout\,
	datad => \1Hz|Equal0~6_combout\,
	combout => \1Hz|s_cnt~3_combout\);

-- Location: FF_X55_Y69_N13
\1Hz|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(13));

-- Location: LCCOMB_X56_Y69_N2
\1Hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~26_combout\ = (\1Hz|s_cnt\(14) & (!\1Hz|Add0~25\)) # (!\1Hz|s_cnt\(14) & ((\1Hz|Add0~25\) # (GND)))
-- \1Hz|Add0~27\ = CARRY((!\1Hz|Add0~25\) # (!\1Hz|s_cnt\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(14),
	datad => VCC,
	cin => \1Hz|Add0~25\,
	combout => \1Hz|Add0~26_combout\,
	cout => \1Hz|Add0~27\);

-- Location: LCCOMB_X55_Y69_N22
\1Hz|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~2_combout\ = (!\1Hz|Equal0~6_combout\ & \1Hz|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~6_combout\,
	datad => \1Hz|Add0~26_combout\,
	combout => \1Hz|s_cnt~2_combout\);

-- Location: FF_X55_Y69_N23
\1Hz|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(14));

-- Location: LCCOMB_X56_Y69_N4
\1Hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~28_combout\ = (\1Hz|s_cnt\(15) & (\1Hz|Add0~27\ $ (GND))) # (!\1Hz|s_cnt\(15) & (!\1Hz|Add0~27\ & VCC))
-- \1Hz|Add0~29\ = CARRY((\1Hz|s_cnt\(15) & !\1Hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(15),
	datad => VCC,
	cin => \1Hz|Add0~27\,
	combout => \1Hz|Add0~28_combout\,
	cout => \1Hz|Add0~29\);

-- Location: LCCOMB_X55_Y69_N20
\1Hz|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~1_combout\ = (!\1Hz|Equal0~6_combout\ & \1Hz|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~6_combout\,
	datad => \1Hz|Add0~28_combout\,
	combout => \1Hz|s_cnt~1_combout\);

-- Location: FF_X55_Y69_N21
\1Hz|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(15));

-- Location: LCCOMB_X56_Y69_N6
\1Hz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~30_combout\ = (\1Hz|s_cnt\(16) & (!\1Hz|Add0~29\)) # (!\1Hz|s_cnt\(16) & ((\1Hz|Add0~29\) # (GND)))
-- \1Hz|Add0~31\ = CARRY((!\1Hz|Add0~29\) # (!\1Hz|s_cnt\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(16),
	datad => VCC,
	cin => \1Hz|Add0~29\,
	combout => \1Hz|Add0~30_combout\,
	cout => \1Hz|Add0~31\);

-- Location: FF_X56_Y69_N7
\1Hz|s_cnt[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~30_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(16));

-- Location: LCCOMB_X56_Y69_N8
\1Hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~32_combout\ = (\1Hz|s_cnt\(17) & (\1Hz|Add0~31\ $ (GND))) # (!\1Hz|s_cnt\(17) & (!\1Hz|Add0~31\ & VCC))
-- \1Hz|Add0~33\ = CARRY((\1Hz|s_cnt\(17) & !\1Hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(17),
	datad => VCC,
	cin => \1Hz|Add0~31\,
	combout => \1Hz|Add0~32_combout\,
	cout => \1Hz|Add0~33\);

-- Location: LCCOMB_X55_Y69_N26
\1Hz|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~0_combout\ = (\1Hz|Add0~32_combout\ & !\1Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Add0~32_combout\,
	datad => \1Hz|Equal0~6_combout\,
	combout => \1Hz|s_cnt~0_combout\);

-- Location: FF_X55_Y69_N27
\1Hz|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(17));

-- Location: LCCOMB_X55_Y69_N8
\1Hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~0_combout\ = (\1Hz|s_cnt\(14) & (\1Hz|s_cnt\(15) & (\1Hz|s_cnt\(17) & !\1Hz|s_cnt\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(14),
	datab => \1Hz|s_cnt\(15),
	datac => \1Hz|s_cnt\(17),
	datad => \1Hz|s_cnt\(16),
	combout => \1Hz|Equal0~0_combout\);

-- Location: LCCOMB_X56_Y69_N10
\1Hz|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~34_combout\ = (\1Hz|s_cnt\(18) & (!\1Hz|Add0~33\)) # (!\1Hz|s_cnt\(18) & ((\1Hz|Add0~33\) # (GND)))
-- \1Hz|Add0~35\ = CARRY((!\1Hz|Add0~33\) # (!\1Hz|s_cnt\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(18),
	datad => VCC,
	cin => \1Hz|Add0~33\,
	combout => \1Hz|Add0~34_combout\,
	cout => \1Hz|Add0~35\);

-- Location: FF_X56_Y69_N11
\1Hz|s_cnt[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(18));

-- Location: LCCOMB_X56_Y69_N12
\1Hz|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~36_combout\ = (\1Hz|s_cnt\(19) & (\1Hz|Add0~35\ $ (GND))) # (!\1Hz|s_cnt\(19) & (!\1Hz|Add0~35\ & VCC))
-- \1Hz|Add0~37\ = CARRY((\1Hz|s_cnt\(19) & !\1Hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(19),
	datad => VCC,
	cin => \1Hz|Add0~35\,
	combout => \1Hz|Add0~36_combout\,
	cout => \1Hz|Add0~37\);

-- Location: LCCOMB_X56_Y69_N30
\1Hz|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~6_combout\ = (!\1Hz|Equal0~6_combout\ & \1Hz|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|Equal0~6_combout\,
	datad => \1Hz|Add0~36_combout\,
	combout => \1Hz|s_cnt~6_combout\);

-- Location: FF_X56_Y69_N31
\1Hz|s_cnt[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(19));

-- Location: LCCOMB_X56_Y69_N14
\1Hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~38_combout\ = (\1Hz|s_cnt\(20) & (!\1Hz|Add0~37\)) # (!\1Hz|s_cnt\(20) & ((\1Hz|Add0~37\) # (GND)))
-- \1Hz|Add0~39\ = CARRY((!\1Hz|Add0~37\) # (!\1Hz|s_cnt\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(20),
	datad => VCC,
	cin => \1Hz|Add0~37\,
	combout => \1Hz|Add0~38_combout\,
	cout => \1Hz|Add0~39\);

-- Location: LCCOMB_X55_Y69_N6
\1Hz|s_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~7_combout\ = (\1Hz|Add0~38_combout\ & !\1Hz|Equal0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Add0~38_combout\,
	datad => \1Hz|Equal0~6_combout\,
	combout => \1Hz|s_cnt~7_combout\);

-- Location: FF_X55_Y69_N7
\1Hz|s_cnt[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(20));

-- Location: LCCOMB_X56_Y69_N16
\1Hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~40_combout\ = (\1Hz|s_cnt\(21) & (\1Hz|Add0~39\ $ (GND))) # (!\1Hz|s_cnt\(21) & (!\1Hz|Add0~39\ & VCC))
-- \1Hz|Add0~41\ = CARRY((\1Hz|s_cnt\(21) & !\1Hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(21),
	datad => VCC,
	cin => \1Hz|Add0~39\,
	combout => \1Hz|Add0~40_combout\,
	cout => \1Hz|Add0~41\);

-- Location: LCCOMB_X56_Y69_N28
\1Hz|s_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~8_combout\ = (!\1Hz|Equal0~6_combout\ & \1Hz|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|Equal0~6_combout\,
	datad => \1Hz|Add0~40_combout\,
	combout => \1Hz|s_cnt~8_combout\);

-- Location: FF_X56_Y69_N29
\1Hz|s_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(21));

-- Location: LCCOMB_X56_Y69_N18
\1Hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~42_combout\ = (\1Hz|s_cnt\(22) & (!\1Hz|Add0~41\)) # (!\1Hz|s_cnt\(22) & ((\1Hz|Add0~41\) # (GND)))
-- \1Hz|Add0~43\ = CARRY((!\1Hz|Add0~41\) # (!\1Hz|s_cnt\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(22),
	datad => VCC,
	cin => \1Hz|Add0~41\,
	combout => \1Hz|Add0~42_combout\,
	cout => \1Hz|Add0~43\);

-- Location: LCCOMB_X56_Y69_N26
\1Hz|s_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~9_combout\ = (!\1Hz|Equal0~6_combout\ & \1Hz|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|Equal0~6_combout\,
	datad => \1Hz|Add0~42_combout\,
	combout => \1Hz|s_cnt~9_combout\);

-- Location: FF_X56_Y69_N27
\1Hz|s_cnt[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(22));

-- Location: LCCOMB_X55_Y69_N10
\1Hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~1_combout\ = (\1Hz|s_cnt\(13) & (\1Hz|s_cnt\(12) & (!\1Hz|s_cnt\(11) & !\1Hz|s_cnt\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(13),
	datab => \1Hz|s_cnt\(12),
	datac => \1Hz|s_cnt\(11),
	datad => \1Hz|s_cnt\(10),
	combout => \1Hz|Equal0~1_combout\);

-- Location: LCCOMB_X55_Y69_N18
\1Hz|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~7_combout\ = (\1Hz|Equal0~0_combout\ & (\10Hz|Equal0~0_combout\ & \1Hz|Equal0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~0_combout\,
	datac => \10Hz|Equal0~0_combout\,
	datad => \1Hz|Equal0~1_combout\,
	combout => \1Hz|Equal0~7_combout\);

-- Location: LCCOMB_X56_Y69_N20
\1Hz|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~44_combout\ = (\1Hz|s_cnt\(23) & (\1Hz|Add0~43\ $ (GND))) # (!\1Hz|s_cnt\(23) & (!\1Hz|Add0~43\ & VCC))
-- \1Hz|Add0~45\ = CARRY((\1Hz|s_cnt\(23) & !\1Hz|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(23),
	datad => VCC,
	cin => \1Hz|Add0~43\,
	combout => \1Hz|Add0~44_combout\,
	cout => \1Hz|Add0~45\);

-- Location: LCCOMB_X55_Y69_N30
\1Hz|s_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~10_combout\ = (\1Hz|Add0~44_combout\ & ((!\1Hz|Equal0~7_combout\) # (!\1Hz|Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~5_combout\,
	datac => \1Hz|Add0~44_combout\,
	datad => \1Hz|Equal0~7_combout\,
	combout => \1Hz|s_cnt~10_combout\);

-- Location: FF_X55_Y69_N31
\1Hz|s_cnt[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(23));

-- Location: LCCOMB_X56_Y69_N22
\1Hz|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~46_combout\ = (\1Hz|s_cnt\(24) & (!\1Hz|Add0~45\)) # (!\1Hz|s_cnt\(24) & ((\1Hz|Add0~45\) # (GND)))
-- \1Hz|Add0~47\ = CARRY((!\1Hz|Add0~45\) # (!\1Hz|s_cnt\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(24),
	datad => VCC,
	cin => \1Hz|Add0~45\,
	combout => \1Hz|Add0~46_combout\,
	cout => \1Hz|Add0~47\);

-- Location: FF_X56_Y69_N23
\1Hz|s_cnt[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~46_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(24));

-- Location: LCCOMB_X56_Y69_N24
\1Hz|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~48_combout\ = \1Hz|Add0~47\ $ (!\1Hz|s_cnt\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \1Hz|s_cnt\(25),
	cin => \1Hz|Add0~47\,
	combout => \1Hz|Add0~48_combout\);

-- Location: LCCOMB_X55_Y69_N14
\1Hz|s_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~11_combout\ = (\1Hz|Add0~48_combout\ & ((!\1Hz|Equal0~5_combout\) # (!\1Hz|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~7_combout\,
	datac => \1Hz|Equal0~5_combout\,
	datad => \1Hz|Add0~48_combout\,
	combout => \1Hz|s_cnt~11_combout\);

-- Location: FF_X55_Y69_N15
\1Hz|s_cnt[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|s_cnt~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(25));

-- Location: LCCOMB_X55_Y69_N28
\1Hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~4_combout\ = (\1Hz|s_cnt\(22) & (\1Hz|s_cnt\(25) & (\1Hz|s_cnt\(23) & !\1Hz|s_cnt\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(22),
	datab => \1Hz|s_cnt\(25),
	datac => \1Hz|s_cnt\(23),
	datad => \1Hz|s_cnt\(24),
	combout => \1Hz|Equal0~4_combout\);

-- Location: LCCOMB_X56_Y70_N2
\1Hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~2_combout\ = (!\1Hz|s_cnt\(8) & (!\1Hz|s_cnt\(9) & (\1Hz|s_cnt\(6) & !\1Hz|s_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(8),
	datab => \1Hz|s_cnt\(9),
	datac => \1Hz|s_cnt\(6),
	datad => \1Hz|s_cnt\(7),
	combout => \1Hz|Equal0~2_combout\);

-- Location: LCCOMB_X55_Y69_N16
\1Hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~3_combout\ = (\1Hz|s_cnt\(20) & (!\1Hz|s_cnt\(18) & (\1Hz|s_cnt\(19) & \1Hz|s_cnt\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(20),
	datab => \1Hz|s_cnt\(18),
	datac => \1Hz|s_cnt\(19),
	datad => \1Hz|s_cnt\(21),
	combout => \1Hz|Equal0~3_combout\);

-- Location: LCCOMB_X55_Y69_N4
\1Hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~5_combout\ = (\1Hz|Equal0~4_combout\ & (\1Hz|Equal0~2_combout\ & \1Hz|Equal0~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~4_combout\,
	datac => \1Hz|Equal0~2_combout\,
	datad => \1Hz|Equal0~3_combout\,
	combout => \1Hz|Equal0~5_combout\);

-- Location: LCCOMB_X55_Y69_N2
\1Hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~6_combout\ = (\10Hz|Equal0~0_combout\ & (\1Hz|Equal0~0_combout\ & (\1Hz|Equal0~5_combout\ & \1Hz|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|Equal0~0_combout\,
	datab => \1Hz|Equal0~0_combout\,
	datac => \1Hz|Equal0~5_combout\,
	datad => \1Hz|Equal0~1_combout\,
	combout => \1Hz|Equal0~6_combout\);

-- Location: LCCOMB_X55_Y69_N24
\1Hz|pulse~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|pulse~feeder_combout\ = \1Hz|Equal0~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \1Hz|Equal0~6_combout\,
	combout => \1Hz|pulse~feeder_combout\);

-- Location: FF_X55_Y69_N25
\1Hz|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|pulse~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|pulse~q\);

-- Location: CLKCTRL_G13
\1Hz|pulse~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \1Hz|pulse~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \1Hz|pulse~clkctrl_outclk\);

-- Location: LCCOMB_X102_Y33_N8
\inst11|s_blink~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst11|s_blink~0_combout\ = !\inst11|s_blink~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|s_blink~q\,
	combout => \inst11|s_blink~0_combout\);

-- Location: FF_X102_Y33_N9
\inst11|s_blink\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1Hz|pulse~clkctrl_outclk\,
	d => \inst11|s_blink~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst11|s_blink~q\);

-- Location: LCCOMB_X106_Y35_N24
\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \inst11|counter\(3) $ (GND)
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(!\inst11|counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|counter\(3),
	datad => VCC,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X106_Y35_N26
\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\inst11|counter\(4) & (\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\inst11|counter\(4) & 
-- (!\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\inst11|counter\(4) & !\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst11|counter\(4),
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X106_Y35_N28
\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\inst11|counter\(5) & (\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\inst11|counter\(5) & 
-- (!\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\inst11|counter\(5) & !\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X106_Y35_N30
\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X106_Y35_N10
\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & !\inst11|counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst11|counter\(3),
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X107_Y35_N10
\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X107_Y35_N4
\inst16|Mod1|auto_generated|divider|divider|StageOut[18]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\inst11|counter\(2) & \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(2),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X107_Y35_N22
\inst16|Mod1|auto_generated|divider|divider|StageOut[18]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ = (\inst11|counter\(2) & !\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(2),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X106_Y35_N14
\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst16|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\inst16|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\)))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst16|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\inst16|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datad => VCC,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X106_Y35_N16
\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- (!\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- !\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X106_Y35_N12
\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\inst11|counter\(5) & \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X107_Y35_N24
\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X106_Y35_N6
\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ = (\inst11|counter\(4) & \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|counter\(4),
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X106_Y35_N0
\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ = (!\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X106_Y35_N18
\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X106_Y35_N20
\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- (!\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\)))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- !\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X106_Y35_N22
\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X105_Y35_N24
\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X106_Y35_N8
\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((!\inst11|counter\(3)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst11|counter\(3),
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\);

-- Location: LCCOMB_X105_Y35_N22
\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ = (\inst11|counter\(2) & \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(2),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X105_Y35_N28
\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X105_Y35_N26
\inst16|Mod1|auto_generated|divider|divider|StageOut[24]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ = (!\inst11|counter\(1) & !\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(1),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X105_Y35_N0
\inst16|Mod1|auto_generated|divider|divider|StageOut[24]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ = (!\inst11|counter\(1) & \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(1),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X105_Y35_N6
\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\inst16|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\inst16|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\)))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\inst16|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\inst16|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datad => VCC,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X105_Y35_N8
\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- (!\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- !\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X105_Y35_N10
\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\)))))
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X106_Y35_N4
\inst16|Mod1|auto_generated|divider|divider|StageOut[28]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\inst11|counter\(5))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst11|counter\(5),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\);

-- Location: LCCOMB_X105_Y35_N4
\inst16|Mod1|auto_generated|divider|divider|StageOut[28]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X106_Y35_N2
\inst16|Mod1|auto_generated|divider|divider|StageOut[27]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\inst11|counter\(4))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst11|counter\(4),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\);

-- Location: LCCOMB_X105_Y35_N18
\inst16|Mod1|auto_generated|divider|divider|StageOut[27]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X105_Y35_N12
\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst16|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & 
-- !\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X105_Y35_N14
\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\inst16|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\) # ((\inst16|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (!\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datad => VCC,
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X105_Y35_N16
\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X105_Y35_N2
\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\);

-- Location: LCCOMB_X105_Y35_N30
\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((!\inst11|counter\(1)))) # 
-- (!\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	datac => \inst11|counter\(1),
	datad => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X105_Y35_N20
\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ = (\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- ((\inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	combout => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\);

-- Location: LCCOMB_X102_Y34_N24
\inst19|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst19|Mux0~0_combout\ = (\inst11|counter\(0) & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\) # (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ $ 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\inst11|counter\(0) & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	combout => \inst19|Mux0~0_combout\);

-- Location: LCCOMB_X102_Y34_N30
\inst60|Mux0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux0~9_combout\ = (\state|state.init~q\ & (((\state|state.gameINFO~q\)))) # (!\state|state.init~q\ & ((\inst11|s_blink~q\) # ((!\inst19|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst11|s_blink~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst19|Mux0~0_combout\,
	combout => \inst60|Mux0~9_combout\);

-- Location: LCCOMB_X106_Y34_N14
\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|MaxPoints\(3) $ (VCC)
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|MaxPoints\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|MaxPoints\(3),
	datad => VCC,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X106_Y34_N16
\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|MaxPoints\(4) & (\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|MaxPoints\(4) & 
-- (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|MaxPoints\(4) & !\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(4),
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X106_Y34_N18
\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|MaxPoints\(5) & (\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|MaxPoints\(5) & 
-- (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|MaxPoints\(5) & !\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|MaxPoints\(5),
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X106_Y34_N20
\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X106_Y32_N26
\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ = (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X106_Y32_N0
\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|MaxPoints\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(5),
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X106_Y32_N6
\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ = (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X106_Y32_N8
\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|MaxPoints\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(4),
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X106_Y32_N10
\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X106_Y32_N28
\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|MaxPoints\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(3),
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X106_Y32_N12
\inst50|Mod1|auto_generated|divider|divider|StageOut[18]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|MaxPoints\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(2),
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X106_Y32_N14
\inst50|Mod1|auto_generated|divider|divider|StageOut[18]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ = (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|MaxPoints\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(2),
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X106_Y32_N16
\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst50|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\inst50|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\)))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst50|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\) # (\inst50|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datad => VCC,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X106_Y32_N18
\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\)))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- !\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X106_Y32_N20
\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\)))))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X106_Y32_N22
\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- !\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X106_Y32_N24
\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X106_Y32_N30
\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|MaxPoints\(3))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(3),
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\);

-- Location: LCCOMB_X105_Y32_N0
\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X105_Y32_N10
\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ = (\MEF|MaxPoints\(2) & \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|MaxPoints\(2),
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X105_Y32_N4
\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X105_Y32_N12
\inst50|Mod1|auto_generated|divider|divider|StageOut[24]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ = (\MEF|MaxPoints\(1) & \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|MaxPoints\(1),
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X105_Y32_N14
\inst50|Mod1|auto_generated|divider|divider|StageOut[24]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ = (\MEF|MaxPoints\(1) & !\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|MaxPoints\(1),
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X105_Y32_N18
\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\inst50|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\) # (\inst50|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\)))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\inst50|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\) # (\inst50|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datad => VCC,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X105_Y32_N20
\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- !\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X105_Y32_N22
\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))))
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X106_Y32_N2
\inst50|Mod1|auto_generated|divider|divider|StageOut[28]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|MaxPoints\(5))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(5),
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\);

-- Location: LCCOMB_X105_Y32_N8
\inst50|Mod1|auto_generated|divider|divider|StageOut[28]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X106_Y32_N4
\inst50|Mod1|auto_generated|divider|divider|StageOut[27]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|MaxPoints\(4))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \MEF|MaxPoints\(4),
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\);

-- Location: LCCOMB_X105_Y32_N2
\inst50|Mod1|auto_generated|divider|divider|StageOut[27]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X105_Y32_N24
\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst50|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & 
-- !\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X105_Y32_N26
\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\inst50|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\) # ((\inst50|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (!\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datad => VCC,
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X105_Y32_N28
\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X105_Y32_N30
\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- ((\inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datac => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\);

-- Location: LCCOMB_X105_Y32_N16
\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- ((\inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \inst50|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\);

-- Location: LCCOMB_X105_Y32_N6
\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (\MEF|MaxPoints\(1))) # 
-- (!\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datac => \MEF|MaxPoints\(1),
	datad => \inst50|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X101_Y30_N16
\inst72|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst72|Mux0~0_combout\ = (\MEF|MaxPoints\(0) & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\MEF|MaxPoints\(0) & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\) # (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|MaxPoints\(0),
	datad => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst72|Mux0~0_combout\);

-- Location: LCCOMB_X101_Y30_N30
\inst60|Mux0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux0~8_combout\ = (\inst60|Mux0~9_combout\) # ((\inst63|Mux3~4_combout\) # ((\inst66|Mux0~2_combout\ & !\inst72|Mux0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst60|Mux0~9_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst72|Mux0~0_combout\,
	combout => \inst60|Mux0~8_combout\);

-- Location: LCCOMB_X102_Y34_N18
\inst19|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst19|Mux1~0_combout\ = (\inst11|counter\(0) & (\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ (((\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # 
-- (!\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))))) # (!\inst11|counter\(0) & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- !\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	combout => \inst19|Mux1~0_combout\);

-- Location: LCCOMB_X102_Y34_N28
\inst60|Mux1~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux1~9_combout\ = (\state|state.init~q\ & (((\state|state.gameINFO~q\)))) # (!\state|state.init~q\ & ((\inst11|s_blink~q\) # ((\inst19|Mux1~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst11|s_blink~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst19|Mux1~0_combout\,
	combout => \inst60|Mux1~9_combout\);

-- Location: LCCOMB_X101_Y30_N20
\inst72|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst72|Mux1~0_combout\ = (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\MEF|MaxPoints\(0) & (\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & 
-- ((\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (!\MEF|MaxPoints\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|MaxPoints\(0),
	datad => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst72|Mux1~0_combout\);

-- Location: LCCOMB_X101_Y30_N14
\inst60|Mux1~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux1~8_combout\ = (\inst63|Mux3~4_combout\) # ((\inst60|Mux1~9_combout\) # ((\inst66|Mux0~2_combout\ & \inst72|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|Mux3~4_combout\,
	datab => \inst60|Mux1~9_combout\,
	datac => \inst66|Mux0~2_combout\,
	datad => \inst72|Mux1~0_combout\,
	combout => \inst60|Mux1~8_combout\);

-- Location: LCCOMB_X101_Y30_N8
\inst72|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst72|Mux2~0_combout\ = (\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((!\MEF|MaxPoints\(0))))) # 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\)) # 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((!\MEF|MaxPoints\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010101000111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|MaxPoints\(0),
	datad => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst72|Mux2~0_combout\);

-- Location: LCCOMB_X102_Y34_N20
\inst19|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst19|Mux2~0_combout\ = (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (\inst11|counter\(0) & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\))) # 
-- (!\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((!\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\))) # 
-- (!\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst11|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	combout => \inst19|Mux2~0_combout\);

-- Location: LCCOMB_X102_Y34_N26
\inst60|Mux2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux2~9_combout\ = (\state|state.init~q\ & (((\state|state.gameINFO~q\)))) # (!\state|state.init~q\ & ((\inst11|s_blink~q\) # ((\inst19|Mux2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst11|s_blink~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst19|Mux2~0_combout\,
	combout => \inst60|Mux2~9_combout\);

-- Location: LCCOMB_X101_Y30_N18
\inst60|Mux2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux2~8_combout\ = (\inst63|Mux3~4_combout\) # ((\inst60|Mux2~9_combout\) # ((\inst66|Mux0~2_combout\ & \inst72|Mux2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|Mux3~4_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst72|Mux2~0_combout\,
	datad => \inst60|Mux2~9_combout\,
	combout => \inst60|Mux2~8_combout\);

-- Location: LCCOMB_X102_Y34_N10
\inst19|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst19|Mux3~0_combout\ = (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst11|counter\(0) & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))) # (!\inst11|counter\(0) & 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & !\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (!\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst11|counter\(0) $ (\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	combout => \inst19|Mux3~0_combout\);

-- Location: LCCOMB_X102_Y34_N8
\inst60|Mux3~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux3~9_combout\ = (\state|state.init~q\ & (((\state|state.gameINFO~q\)))) # (!\state|state.init~q\ & ((\inst11|s_blink~q\) # ((\inst19|Mux3~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst11|s_blink~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst19|Mux3~0_combout\,
	combout => \inst60|Mux3~9_combout\);

-- Location: LCCOMB_X101_Y30_N28
\inst72|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst72|Mux3~0_combout\ = (\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((!\MEF|MaxPoints\(0)))) # 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & \MEF|MaxPoints\(0))))) # (!\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (!\MEF|MaxPoints\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|MaxPoints\(0),
	datad => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst72|Mux3~0_combout\);

-- Location: LCCOMB_X101_Y30_N10
\inst60|Mux3~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux3~8_combout\ = (\inst60|Mux3~9_combout\) # ((\inst63|Mux3~4_combout\) # ((\inst66|Mux0~2_combout\ & \inst72|Mux3~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst60|Mux3~9_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst72|Mux3~0_combout\,
	combout => \inst60|Mux3~8_combout\);

-- Location: LCCOMB_X102_Y34_N16
\inst19|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst19|Mux4~0_combout\ = (\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # 
-- (!\inst11|counter\(0))))) # (!\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst11|counter\(0) & (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- !\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	combout => \inst19|Mux4~0_combout\);

-- Location: LCCOMB_X102_Y34_N6
\inst60|Mux4~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux4~9_combout\ = (\state|state.init~q\ & (((\state|state.gameINFO~q\)))) # (!\state|state.init~q\ & ((\inst11|s_blink~q\) # ((\inst19|Mux4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst11|s_blink~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst19|Mux4~0_combout\,
	combout => \inst60|Mux4~9_combout\);

-- Location: LCCOMB_X101_Y30_N24
\inst72|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst72|Mux4~0_combout\ = (\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\MEF|MaxPoints\(0)) # 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\MEF|MaxPoints\(0) & 
-- \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|MaxPoints\(0),
	datad => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst72|Mux4~0_combout\);

-- Location: LCCOMB_X101_Y30_N22
\inst60|Mux4~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux4~8_combout\ = (\inst60|Mux4~9_combout\) # ((\inst63|Mux3~4_combout\) # ((\inst66|Mux0~2_combout\ & \inst72|Mux4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst60|Mux4~9_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst72|Mux4~0_combout\,
	combout => \inst60|Mux4~8_combout\);

-- Location: LCCOMB_X101_Y30_N0
\inst72|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst72|Mux5~0_combout\ = (\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\MEF|MaxPoints\(0) & (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)) # (!\MEF|MaxPoints\(0) & 
-- ((\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))))) # (!\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\MEF|MaxPoints\(0) $ 
-- (!\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101010000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|MaxPoints\(0),
	datad => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst72|Mux5~0_combout\);

-- Location: LCCOMB_X102_Y34_N2
\inst19|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst19|Mux5~0_combout\ = (\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\inst11|counter\(0) & (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)) # (!\inst11|counter\(0) & 
-- ((\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))))) # (!\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst11|counter\(0) $ 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	combout => \inst19|Mux5~0_combout\);

-- Location: LCCOMB_X102_Y34_N4
\inst60|Mux5~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux5~9_combout\ = (\state|state.init~q\ & (((\state|state.gameINFO~q\)))) # (!\state|state.init~q\ & ((\inst11|s_blink~q\) # ((\inst19|Mux5~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst11|s_blink~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst19|Mux5~0_combout\,
	combout => \inst60|Mux5~9_combout\);

-- Location: LCCOMB_X101_Y30_N6
\inst60|Mux5~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux5~8_combout\ = (\inst63|Mux3~4_combout\) # ((\inst60|Mux5~9_combout\) # ((\inst72|Mux5~0_combout\ & \inst66|Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst63|Mux3~4_combout\,
	datab => \inst72|Mux5~0_combout\,
	datac => \inst66|Mux0~2_combout\,
	datad => \inst60|Mux5~9_combout\,
	combout => \inst60|Mux5~8_combout\);

-- Location: LCCOMB_X101_Y30_N12
\inst72|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst72|Mux6~0_combout\ = (\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\MEF|MaxPoints\(0) & (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (\inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (!\MEF|MaxPoints\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001001001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datab => \inst50|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datac => \MEF|MaxPoints\(0),
	datad => \inst50|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	combout => \inst72|Mux6~0_combout\);

-- Location: LCCOMB_X102_Y34_N12
\inst19|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst19|Mux6~0_combout\ = (\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst11|counter\(0) & (\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ $ 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (!\inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (\inst11|counter\(0) $ 
-- (\inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100110000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(0),
	datab => \inst16|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datac => \inst16|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datad => \inst16|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	combout => \inst19|Mux6~0_combout\);

-- Location: LCCOMB_X102_Y34_N22
\inst60|Mux6~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux6~9_combout\ = (\state|state.init~q\ & (((\state|state.gameINFO~q\)))) # (!\state|state.init~q\ & ((\inst11|s_blink~q\) # ((\inst19|Mux6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state|state.init~q\,
	datab => \inst11|s_blink~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst19|Mux6~0_combout\,
	combout => \inst60|Mux6~9_combout\);

-- Location: LCCOMB_X101_Y30_N2
\inst60|Mux6~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst60|Mux6~8_combout\ = (\inst63|Mux3~4_combout\) # ((\inst60|Mux6~9_combout\) # ((\inst72|Mux6~0_combout\ & \inst66|Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst72|Mux6~0_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \inst60|Mux6~9_combout\,
	combout => \inst60|Mux6~8_combout\);

-- Location: LCCOMB_X105_Y33_N16
\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \MEF|MaxPoints\(3) $ (VCC)
-- \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(\MEF|MaxPoints\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|MaxPoints\(3),
	datad => VCC,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X105_Y33_N18
\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\MEF|MaxPoints\(4) & (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\MEF|MaxPoints\(4) & 
-- (!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\MEF|MaxPoints\(4) & !\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \MEF|MaxPoints\(4),
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X105_Y33_N20
\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\MEF|MaxPoints\(5) & (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\MEF|MaxPoints\(5) & 
-- (!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\MEF|MaxPoints\(5) & !\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(5),
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X105_Y33_N22
\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X105_Y33_N26
\inst50|Div0|auto_generated|divider|divider|StageOut[18]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ = (\MEF|MaxPoints\(5) & \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(5),
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\);

-- Location: LCCOMB_X105_Y33_N28
\inst50|Div0|auto_generated|divider|divider|StageOut[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ = (!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\);

-- Location: LCCOMB_X105_Y33_N14
\inst50|Div0|auto_generated|divider|divider|StageOut[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ = (\MEF|MaxPoints\(4) & \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \MEF|MaxPoints\(4),
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\);

-- Location: LCCOMB_X106_Y33_N28
\inst50|Div0|auto_generated|divider|divider|StageOut[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ = (!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\);

-- Location: LCCOMB_X106_Y33_N22
\inst50|Div0|auto_generated|divider|divider|StageOut[16]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\);

-- Location: LCCOMB_X105_Y33_N24
\inst50|Div0|auto_generated|divider|divider|StageOut[16]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \MEF|MaxPoints\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \MEF|MaxPoints\(3),
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\);

-- Location: LCCOMB_X106_Y33_N26
\inst50|Div0|auto_generated|divider|divider|StageOut[15]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ = (\MEF|MaxPoints\(2) & \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|MaxPoints\(2),
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\);

-- Location: LCCOMB_X106_Y33_N20
\inst50|Div0|auto_generated|divider|divider|StageOut[15]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ = (\MEF|MaxPoints\(2) & !\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|MaxPoints\(2),
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\);

-- Location: LCCOMB_X106_Y33_N4
\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst50|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\) # (\inst50|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\)))
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst50|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\) # (\inst50|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\,
	datad => VCC,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X106_Y33_N6
\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst50|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\) # 
-- (\inst50|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\)))) # (!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst50|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & 
-- (!\inst50|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\)))
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst50|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & (!\inst50|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & 
-- !\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\,
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X106_Y33_N8
\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst50|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\) # 
-- (\inst50|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\)))) # (!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst50|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\) # 
-- (\inst50|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\)))))
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst50|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\) # 
-- (\inst50|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\,
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X106_Y33_N10
\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\inst50|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ & (!\inst50|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ & 
-- !\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\,
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X106_Y33_N12
\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X105_Y33_N12
\inst50|Div0|auto_generated|divider|divider|StageOut[23]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\MEF|MaxPoints\(4))) # (!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \MEF|MaxPoints\(4),
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\);

-- Location: LCCOMB_X105_Y33_N30
\inst50|Div0|auto_generated|divider|divider|StageOut[23]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ = (!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\);

-- Location: LCCOMB_X105_Y33_N10
\inst50|Div0|auto_generated|divider|divider|StageOut[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\MEF|MaxPoints\(3)))) # (!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \MEF|MaxPoints\(3),
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\);

-- Location: LCCOMB_X106_Y33_N18
\inst50|Div0|auto_generated|divider|divider|StageOut[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\);

-- Location: LCCOMB_X106_Y33_N30
\inst50|Div0|auto_generated|divider|divider|StageOut[21]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\);

-- Location: LCCOMB_X106_Y33_N0
\inst50|Div0|auto_generated|divider|divider|StageOut[21]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ = (\MEF|MaxPoints\(2) & \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \MEF|MaxPoints\(2),
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\);

-- Location: LCCOMB_X106_Y33_N2
\inst50|Div0|auto_generated|divider|divider|StageOut[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ = (\MEF|MaxPoints\(1) & !\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(1),
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\);

-- Location: LCCOMB_X106_Y33_N24
\inst50|Div0|auto_generated|divider|divider|StageOut[20]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ = (\MEF|MaxPoints\(1) & \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \MEF|MaxPoints\(1),
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst50|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\);

-- Location: LCCOMB_X105_Y33_N0
\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\inst50|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\) # (\inst50|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\,
	datad => VCC,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X105_Y33_N2
\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\inst50|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ & (!\inst50|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ & 
-- !\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\,
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X105_Y33_N4
\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & ((\inst50|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\) # 
-- (\inst50|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\,
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X105_Y33_N6
\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst50|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ & (!\inst50|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ & 
-- !\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\,
	datad => VCC,
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X105_Y33_N8
\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X105_Y30_N12
\5453|Mux0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux0~1_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # 
-- (!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\) # (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux0~1_combout\);

-- Location: LCCOMB_X106_Y30_N14
\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \inst11|counter\(3) $ (GND)
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(!\inst11|counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|counter\(3),
	datad => VCC,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X106_Y30_N16
\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\inst11|counter\(4) & (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\inst11|counter\(4) & 
-- (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\inst11|counter\(4) & !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(4),
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X106_Y30_N18
\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\inst11|counter\(5) & (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\inst11|counter\(5) & 
-- (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\inst11|counter\(5) & !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X106_Y30_N20
\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X106_Y30_N4
\inst16|Div0|auto_generated|divider|divider|StageOut[18]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ = (\inst11|counter\(5) & \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(5),
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\);

-- Location: LCCOMB_X106_Y30_N10
\inst16|Div0|auto_generated|divider|divider|StageOut[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ & !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\);

-- Location: LCCOMB_X106_Y30_N6
\inst16|Div0|auto_generated|divider|divider|StageOut[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\);

-- Location: LCCOMB_X106_Y30_N24
\inst16|Div0|auto_generated|divider|divider|StageOut[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ = (\inst11|counter\(4) & \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(4),
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\);

-- Location: LCCOMB_X106_Y30_N2
\inst16|Div0|auto_generated|divider|divider|StageOut[16]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\);

-- Location: LCCOMB_X106_Y30_N0
\inst16|Div0|auto_generated|divider|divider|StageOut[16]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ = (!\inst11|counter\(3) & \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|counter\(3),
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\);

-- Location: LCCOMB_X105_Y30_N6
\inst16|Div0|auto_generated|divider|divider|StageOut[15]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst11|counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst11|counter\(2),
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\);

-- Location: LCCOMB_X105_Y30_N4
\inst16|Div0|auto_generated|divider|divider|StageOut[15]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ = (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst11|counter\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datac => \inst11|counter\(2),
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\);

-- Location: LCCOMB_X105_Y30_N22
\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst16|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\) # (\inst16|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\)))
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst16|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\) # (\inst16|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\,
	datad => VCC,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X105_Y30_N24
\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst16|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\) # 
-- (\inst16|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\)))) # (!\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst16|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & 
-- (!\inst16|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\)))
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst16|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & (!\inst16|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & 
-- !\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\,
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X105_Y30_N26
\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst16|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst16|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))) # (!\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst16|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst16|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))))
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst16|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst16|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\,
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X105_Y30_N28
\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\inst16|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ & (!\inst16|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ & 
-- !\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\,
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X105_Y30_N30
\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X105_Y30_N2
\5453|Mux0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux0~2_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (((\state|state.gameINFO~q\) # (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # (!\state|state.init~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \state|state.init~q\,
	datac => \state|state.gameINFO~q\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux0~2_combout\);

-- Location: LCCOMB_X106_Y30_N12
\inst16|Div0|auto_generated|divider|divider|StageOut[23]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\);

-- Location: LCCOMB_X106_Y30_N30
\inst16|Div0|auto_generated|divider|divider|StageOut[23]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\inst11|counter\(4)))) # (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \inst11|counter\(4),
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\);

-- Location: LCCOMB_X106_Y30_N26
\inst16|Div0|auto_generated|divider|divider|StageOut[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ = (!\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\);

-- Location: LCCOMB_X106_Y30_N8
\inst16|Div0|auto_generated|divider|divider|StageOut[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (!\inst11|counter\(3))) # (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|counter\(3),
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\);

-- Location: LCCOMB_X107_Y30_N12
\inst16|Div0|auto_generated|divider|divider|StageOut[21]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ = (\inst11|counter\(2) & \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst11|counter\(2),
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\);

-- Location: LCCOMB_X106_Y30_N28
\inst16|Div0|auto_generated|divider|divider|StageOut[21]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ = (!\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\);

-- Location: LCCOMB_X107_Y30_N26
\inst16|Div0|auto_generated|divider|divider|StageOut[20]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ = (!\inst11|counter\(1) & \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|counter\(1),
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\);

-- Location: LCCOMB_X107_Y30_N28
\inst16|Div0|auto_generated|divider|divider|StageOut[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ = (!\inst11|counter\(1) & !\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst11|counter\(1),
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst16|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\);

-- Location: LCCOMB_X107_Y30_N16
\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\inst16|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\) # (\inst16|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\,
	datad => VCC,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X107_Y30_N18
\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\inst16|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ & (!\inst16|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ & 
-- !\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\,
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X107_Y30_N20
\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & ((\inst16|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\) # 
-- (\inst16|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\,
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X107_Y30_N22
\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst16|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ & (!\inst16|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ & 
-- !\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\,
	datad => VCC,
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X107_Y30_N24
\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X105_Y30_N20
\5453|Mux0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux0~3_combout\ = (\5453|Mux0~2_combout\ & ((\inst66|Mux0~2_combout\ $ (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))) # (!\5453|Mux0~2_combout\ & (!\inst66|Mux0~2_combout\ & 
-- ((\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\) # (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux0~2_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst66|Mux0~2_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux0~3_combout\);

-- Location: LCCOMB_X105_Y30_N10
\5453|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux0~0_combout\ = (\state|state.init~q\ & (((!\state|state.gameINFO~q\ & \state|state.game~q\)))) # (!\state|state.init~q\ & (!\inst11|s_blink~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst11|s_blink~q\,
	datab => \state|state.gameINFO~q\,
	datac => \state|state.game~q\,
	datad => \state|state.init~q\,
	combout => \5453|Mux0~0_combout\);

-- Location: LCCOMB_X105_Y30_N18
\5453|Mux0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux0~4_combout\ = ((\5453|Mux0~3_combout\ & ((\inst66|Mux0~2_combout\))) # (!\5453|Mux0~3_combout\ & ((!\inst66|Mux0~2_combout\) # (!\5453|Mux0~1_combout\)))) # (!\5453|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux0~1_combout\,
	datab => \5453|Mux0~3_combout\,
	datac => \inst66|Mux0~2_combout\,
	datad => \5453|Mux0~0_combout\,
	combout => \5453|Mux0~4_combout\);

-- Location: LCCOMB_X102_Y30_N6
\5453|Mux4~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux4~4_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\state|state.init~q\ & (!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\state|state.gameINFO~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datab => \state|state.init~q\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \state|state.gameINFO~q\,
	combout => \5453|Mux4~4_combout\);

-- Location: LCCOMB_X102_Y30_N24
\5453|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux1~0_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\) # (!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux1~0_combout\);

-- Location: LCCOMB_X102_Y30_N2
\5453|Mux1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux1~1_combout\ = (\inst63|Mux3~4_combout\) # ((\inst66|Mux0~2_combout\ & (!\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & \5453|Mux1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst66|Mux0~2_combout\,
	datab => \inst63|Mux3~4_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \5453|Mux1~0_combout\,
	combout => \5453|Mux1~1_combout\);

-- Location: LCCOMB_X105_Y30_N8
inst17 : cycloneive_lcell_comb
-- Equation(s):
-- \inst17~combout\ = (!\state|state.init~q\ & !\inst11|s_blink~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|state.init~q\,
	datad => \inst11|s_blink~q\,
	combout => \inst17~combout\);

-- Location: LCCOMB_X105_Y30_N16
\5453|Mux1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux1~2_combout\ = ((\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # (!\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\) # 
-- (!\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # (!\inst17~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst17~combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux1~2_combout\);

-- Location: LCCOMB_X102_Y30_N0
\5453|Mux1~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux1~3_combout\ = (\5453|Mux4~4_combout\) # ((\5453|Mux1~1_combout\) # ((!\inst66|Mux0~2_combout\ & \5453|Mux1~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux4~4_combout\,
	datab => \5453|Mux1~1_combout\,
	datac => \inst66|Mux0~2_combout\,
	datad => \5453|Mux1~2_combout\,
	combout => \5453|Mux1~3_combout\);

-- Location: LCCOMB_X105_Y30_N14
\5453|Mux2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux2~1_combout\ = (((\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # (!\inst17~combout\)) # 
-- (!\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst17~combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux2~1_combout\);

-- Location: LCCOMB_X102_Y30_N18
\5453|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux2~0_combout\ = (\inst66|Mux0~2_combout\ & (((\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # 
-- (!\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst66|Mux0~2_combout\,
	combout => \5453|Mux2~0_combout\);

-- Location: LCCOMB_X101_Y30_N4
\5453|Mux2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux2~2_combout\ = (\inst63|Mux3~4_combout\) # ((\5453|Mux2~0_combout\) # ((\5453|Mux2~1_combout\ & !\inst66|Mux0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux2~1_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst63|Mux3~4_combout\,
	datad => \5453|Mux2~0_combout\,
	combout => \5453|Mux2~2_combout\);

-- Location: LCCOMB_X102_Y30_N12
\5453|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux3~0_combout\ = (!\inst66|Mux0~2_combout\ & ((\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- !\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # (!\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ 
-- (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux3~0_combout\);

-- Location: LCCOMB_X102_Y30_N30
\5453|Mux3~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux3~1_combout\ = (\inst66|Mux0~2_combout\ & ((\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # (!\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- !\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst66|Mux0~2_combout\,
	combout => \5453|Mux3~1_combout\);

-- Location: LCCOMB_X102_Y30_N16
\5453|Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux3~2_combout\ = (\5453|Mux3~0_combout\) # ((\5453|Mux3~1_combout\) # (!\5453|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux3~0_combout\,
	datab => \5453|Mux0~0_combout\,
	datac => \5453|Mux3~1_combout\,
	combout => \5453|Mux3~2_combout\);

-- Location: LCCOMB_X102_Y30_N14
\5453|Mux4~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux4~2_combout\ = (\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & (!\inst66|Mux0~2_combout\ & (!\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & 
-- \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux4~2_combout\);

-- Location: LCCOMB_X102_Y30_N28
\5453|Mux4~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux4~3_combout\ = ((\5453|Mux4~2_combout\) # ((\5453|Mux4~4_combout\ & \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))) # (!\5453|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux4~4_combout\,
	datab => \5453|Mux0~0_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datad => \5453|Mux4~2_combout\,
	combout => \5453|Mux4~3_combout\);

-- Location: LCCOMB_X102_Y30_N10
\5453|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux5~0_combout\ = (!\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst66|Mux0~2_combout\ & (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ 
-- (\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000011000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst66|Mux0~2_combout\,
	combout => \5453|Mux5~0_combout\);

-- Location: LCCOMB_X102_Y30_N8
\5453|Mux5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux5~1_combout\ = (!\inst66|Mux0~2_combout\ & (!\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux5~1_combout\);

-- Location: LCCOMB_X102_Y30_N26
\5453|Mux5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux5~2_combout\ = (\5453|Mux5~0_combout\) # ((\5453|Mux5~1_combout\) # (!\5453|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux5~0_combout\,
	datab => \5453|Mux0~0_combout\,
	datac => \5453|Mux5~1_combout\,
	combout => \5453|Mux5~2_combout\);

-- Location: LCCOMB_X102_Y30_N22
\5453|Mux6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux6~1_combout\ = (\inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst66|Mux0~2_combout\ & (\inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \inst50|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst66|Mux0~2_combout\,
	combout => \5453|Mux6~1_combout\);

-- Location: LCCOMB_X102_Y30_N20
\5453|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux6~0_combout\ = (!\inst66|Mux0~2_combout\ & (\inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst16|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datab => \inst66|Mux0~2_combout\,
	datac => \inst16|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datad => \inst16|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \5453|Mux6~0_combout\);

-- Location: LCCOMB_X102_Y30_N4
\5453|Mux6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \5453|Mux6~2_combout\ = (\5453|Mux6~1_combout\) # ((\5453|Mux6~0_combout\) # (!\5453|Mux0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \5453|Mux6~1_combout\,
	datab => \5453|Mux6~0_combout\,
	datac => \5453|Mux0~0_combout\,
	combout => \5453|Mux6~2_combout\);

-- Location: LCCOMB_X110_Y35_N24
\PLAYER_A|light_active[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|light_active[0]~0_combout\ = (!\PLAYER_A|state\(0) & (\inst4|s_key_prev~q\ & (\inst25|enable_signal~q\ & \state|state.game~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|state\(0),
	datab => \inst4|s_key_prev~q\,
	datac => \inst25|enable_signal~q\,
	datad => \state|state.game~q\,
	combout => \PLAYER_A|light_active[0]~0_combout\);

-- Location: LCCOMB_X110_Y35_N4
\PLAYER_A|light_active[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_A|light_active[0]~1_combout\ = (\PLAYER_A|state\(1) & (((\PLAYER_A|light_active\(0) & !\PLAYER_A|reactTime[0]~0_combout\)))) # (!\PLAYER_A|state\(1) & ((\PLAYER_A|light_active[0]~0_combout\) # ((\PLAYER_A|light_active\(0) & 
-- !\PLAYER_A|reactTime[0]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_A|state\(1),
	datab => \PLAYER_A|light_active[0]~0_combout\,
	datac => \PLAYER_A|light_active\(0),
	datad => \PLAYER_A|reactTime[0]~0_combout\,
	combout => \PLAYER_A|light_active[0]~1_combout\);

-- Location: FF_X110_Y35_N5
\PLAYER_A|light_active[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_A|light_active[0]~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_A|light_active\(0));

-- Location: LCCOMB_X109_Y35_N4
\inst94|output4[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst94|output4\(3) = \inst25|state.penalty2~q\ $ (\PLAYER_A|light_active\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst25|state.penalty2~q\,
	datad => \PLAYER_A|light_active\(0),
	combout => \inst94|output4\(3));

-- Location: LCCOMB_X110_Y35_N18
\PLAYER_B|light_active[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|light_active[0]~0_combout\ = (\inst25|enable_signal~q\ & (!\PLAYER_B|state\(0) & (\inst|s_key_prev~q\ & \state|state.game~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst25|enable_signal~q\,
	datab => \PLAYER_B|state\(0),
	datac => \inst|s_key_prev~q\,
	datad => \state|state.game~q\,
	combout => \PLAYER_B|light_active[0]~0_combout\);

-- Location: LCCOMB_X110_Y35_N10
\PLAYER_B|light_active[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \PLAYER_B|light_active[0]~1_combout\ = (\PLAYER_B|light_active[0]~0_combout\ & (((!\PLAYER_B|reactTime[0]~0_combout\ & \PLAYER_B|light_active\(0))) # (!\PLAYER_B|state\(1)))) # (!\PLAYER_B|light_active[0]~0_combout\ & (!\PLAYER_B|reactTime[0]~0_combout\ & 
-- (\PLAYER_B|light_active\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \PLAYER_B|light_active[0]~0_combout\,
	datab => \PLAYER_B|reactTime[0]~0_combout\,
	datac => \PLAYER_B|light_active\(0),
	datad => \PLAYER_B|state\(1),
	combout => \PLAYER_B|light_active[0]~1_combout\);

-- Location: FF_X110_Y35_N11
\PLAYER_B|light_active[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1kHz|pulse~clkctrl_outclk\,
	d => \PLAYER_B|light_active[0]~1_combout\,
	clrn => \inst2|s_key_prev~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \PLAYER_B|light_active\(0));

-- Location: LCCOMB_X110_Y35_N8
\inst95|output4[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst95|output4\(3) = \inst25|state.penalty~q\ $ (\PLAYER_B|light_active\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst25|state.penalty~q\,
	datad => \PLAYER_B|light_active\(0),
	combout => \inst95|output4\(3));

-- Location: LCCOMB_X112_Y33_N0
\inst80|led_state[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst80|led_state[0]~0_combout\ = \inst80|led_state\(0) $ (((\state|state.win_state_A~q\) # (\state|state.win_state_B~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state|state.win_state_A~q\,
	datac => \inst80|led_state\(0),
	datad => \state|state.win_state_B~q\,
	combout => \inst80|led_state[0]~0_combout\);

-- Location: FF_X112_Y33_N1
\inst80|led_state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1Hz|pulse~clkctrl_outclk\,
	d => \inst80|led_state[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst80|led_state\(0));

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX1(6) <= \HEX1[6]~output_o\;

ww_HEX1(5) <= \HEX1[5]~output_o\;

ww_HEX1(4) <= \HEX1[4]~output_o\;

ww_HEX1(3) <= \HEX1[3]~output_o\;

ww_HEX1(2) <= \HEX1[2]~output_o\;

ww_HEX1(1) <= \HEX1[1]~output_o\;

ww_HEX1(0) <= \HEX1[0]~output_o\;

ww_HEX2(6) <= \HEX2[6]~output_o\;

ww_HEX2(5) <= \HEX2[5]~output_o\;

ww_HEX2(4) <= \HEX2[4]~output_o\;

ww_HEX2(3) <= \HEX2[3]~output_o\;

ww_HEX2(2) <= \HEX2[2]~output_o\;

ww_HEX2(1) <= \HEX2[1]~output_o\;

ww_HEX2(0) <= \HEX2[0]~output_o\;

ww_HEX3(6) <= \HEX3[6]~output_o\;

ww_HEX3(5) <= \HEX3[5]~output_o\;

ww_HEX3(4) <= \HEX3[4]~output_o\;

ww_HEX3(3) <= \HEX3[3]~output_o\;

ww_HEX3(2) <= \HEX3[2]~output_o\;

ww_HEX3(1) <= \HEX3[1]~output_o\;

ww_HEX3(0) <= \HEX3[0]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX5(6) <= \HEX5[6]~output_o\;

ww_HEX5(5) <= \HEX5[5]~output_o\;

ww_HEX5(4) <= \HEX5[4]~output_o\;

ww_HEX5(3) <= \HEX5[3]~output_o\;

ww_HEX5(2) <= \HEX5[2]~output_o\;

ww_HEX5(1) <= \HEX5[1]~output_o\;

ww_HEX5(0) <= \HEX5[0]~output_o\;

ww_HEX6(6) <= \HEX6[6]~output_o\;

ww_HEX6(5) <= \HEX6[5]~output_o\;

ww_HEX6(4) <= \HEX6[4]~output_o\;

ww_HEX6(3) <= \HEX6[3]~output_o\;

ww_HEX6(2) <= \HEX6[2]~output_o\;

ww_HEX6(1) <= \HEX6[1]~output_o\;

ww_HEX6(0) <= \HEX6[0]~output_o\;

ww_HEX7(6) <= \HEX7[6]~output_o\;

ww_HEX7(5) <= \HEX7[5]~output_o\;

ww_HEX7(4) <= \HEX7[4]~output_o\;

ww_HEX7(3) <= \HEX7[3]~output_o\;

ww_HEX7(2) <= \HEX7[2]~output_o\;

ww_HEX7(1) <= \HEX7[1]~output_o\;

ww_HEX7(0) <= \HEX7[0]~output_o\;

ww_LEDG(7) <= \LEDG[7]~output_o\;

ww_LEDG(6) <= \LEDG[6]~output_o\;

ww_LEDG(5) <= \LEDG[5]~output_o\;

ww_LEDG(4) <= \LEDG[4]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDR(17) <= \LEDR[17]~output_o\;

ww_LEDR(16) <= \LEDR[16]~output_o\;

ww_LEDR(15) <= \LEDR[15]~output_o\;

ww_LEDR(14) <= \LEDR[14]~output_o\;

ww_LEDR(13) <= \LEDR[13]~output_o\;

ww_LEDR(12) <= \LEDR[12]~output_o\;

ww_LEDR(11) <= \LEDR[11]~output_o\;

ww_LEDR(10) <= \LEDR[10]~output_o\;

ww_LEDR(9) <= \LEDR[9]~output_o\;

ww_LEDR(8) <= \LEDR[8]~output_o\;

ww_LEDR(7) <= \LEDR[7]~output_o\;

ww_LEDR(6) <= \LEDR[6]~output_o\;

ww_LEDR(5) <= \LEDR[5]~output_o\;

ww_LEDR(4) <= \LEDR[4]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


