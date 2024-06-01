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

-- DATE "06/01/2024 03:37:37"

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

ENTITY 	TesteElementar IS
    PORT (
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	SW : IN std_logic_vector(0 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	KEY : IN std_logic_vector(3 DOWNTO 0);
	HEX1 : OUT std_logic_vector(6 DOWNTO 0);
	HEX2 : OUT std_logic_vector(6 DOWNTO 0);
	HEX3 : OUT std_logic_vector(6 DOWNTO 0);
	HEX6 : OUT std_logic_vector(6 DOWNTO 0);
	HEX7 : OUT std_logic_vector(6 DOWNTO 0);
	LEDG : OUT std_logic_vector(7 DOWNTO 0)
	);
END TesteElementar;

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
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[0]	=>  Location: PIN_M23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[3]	=>  Location: PIN_R24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[2]	=>  Location: PIN_N21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- KEY[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF TesteElementar IS
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
SIGNAL ww_SW : std_logic_vector(0 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_KEY : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_HEX1 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX2 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX3 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_HEX7 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(7 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \pulse|pulse~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \10Hz|pulse~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \10Hz|Add0~0_combout\ : std_logic;
SIGNAL \10Hz|Add0~1\ : std_logic;
SIGNAL \10Hz|Add0~2_combout\ : std_logic;
SIGNAL \10Hz|Add0~3\ : std_logic;
SIGNAL \10Hz|Add0~4_combout\ : std_logic;
SIGNAL \10Hz|Add0~5\ : std_logic;
SIGNAL \10Hz|Add0~6_combout\ : std_logic;
SIGNAL \10Hz|Add0~7\ : std_logic;
SIGNAL \10Hz|Add0~8_combout\ : std_logic;
SIGNAL \10Hz|Add0~9\ : std_logic;
SIGNAL \10Hz|Add0~10_combout\ : std_logic;
SIGNAL \10Hz|Add0~11\ : std_logic;
SIGNAL \10Hz|Add0~12_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~3_combout\ : std_logic;
SIGNAL \10Hz|Add0~13\ : std_logic;
SIGNAL \10Hz|Add0~14_combout\ : std_logic;
SIGNAL \10Hz|Add0~15\ : std_logic;
SIGNAL \10Hz|Add0~16_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~2_combout\ : std_logic;
SIGNAL \10Hz|Add0~17\ : std_logic;
SIGNAL \10Hz|Add0~18_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~1_combout\ : std_logic;
SIGNAL \10Hz|Add0~19\ : std_logic;
SIGNAL \10Hz|Add0~20_combout\ : std_logic;
SIGNAL \10Hz|Add0~21\ : std_logic;
SIGNAL \10Hz|Add0~22_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~0_combout\ : std_logic;
SIGNAL \10Hz|Add0~23\ : std_logic;
SIGNAL \10Hz|Add0~24_combout\ : std_logic;
SIGNAL \10Hz|Add0~25\ : std_logic;
SIGNAL \10Hz|Add0~26_combout\ : std_logic;
SIGNAL \10Hz|Add0~27\ : std_logic;
SIGNAL \10Hz|Add0~28_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~4_combout\ : std_logic;
SIGNAL \10Hz|Add0~29\ : std_logic;
SIGNAL \10Hz|Add0~30_combout\ : std_logic;
SIGNAL \10Hz|Equal0~4_combout\ : std_logic;
SIGNAL \10Hz|Add0~31\ : std_logic;
SIGNAL \10Hz|Add0~32_combout\ : std_logic;
SIGNAL \10Hz|Add0~33\ : std_logic;
SIGNAL \10Hz|Add0~34_combout\ : std_logic;
SIGNAL \10Hz|Add0~35\ : std_logic;
SIGNAL \10Hz|Add0~36_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~5_combout\ : std_logic;
SIGNAL \10Hz|Add0~37\ : std_logic;
SIGNAL \10Hz|Add0~38_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~6_combout\ : std_logic;
SIGNAL \10Hz|Add0~39\ : std_logic;
SIGNAL \10Hz|Add0~40_combout\ : std_logic;
SIGNAL \10Hz|Add0~41\ : std_logic;
SIGNAL \10Hz|Add0~42_combout\ : std_logic;
SIGNAL \10Hz|Add0~43\ : std_logic;
SIGNAL \10Hz|Add0~44_combout\ : std_logic;
SIGNAL \10Hz|s_cnt~7_combout\ : std_logic;
SIGNAL \10Hz|Equal0~5_combout\ : std_logic;
SIGNAL \10Hz|Equal0~6_combout\ : std_logic;
SIGNAL \10Hz|Equal0~3_combout\ : std_logic;
SIGNAL \10Hz|Equal0~0_combout\ : std_logic;
SIGNAL \10Hz|Equal0~1_combout\ : std_logic;
SIGNAL \10Hz|Equal0~2_combout\ : std_logic;
SIGNAL \10Hz|Equal0~7_combout\ : std_logic;
SIGNAL \10Hz|pulse~feeder_combout\ : std_logic;
SIGNAL \10Hz|pulse~q\ : std_logic;
SIGNAL \10Hz|pulse~clkctrl_outclk\ : std_logic;
SIGNAL \KEY[0]~input_o\ : std_logic;
SIGNAL \DB1|s_key_prev~q\ : std_logic;
SIGNAL \KEY[3]~input_o\ : std_logic;
SIGNAL \inst10|s_key_prev~q\ : std_logic;
SIGNAL \inst50|btn_up_prev~0_combout\ : std_logic;
SIGNAL \inst50|btn_up_prev~q\ : std_logic;
SIGNAL \inst50|Add0~0_combout\ : std_logic;
SIGNAL \inst50|Add0~2_combout\ : std_logic;
SIGNAL \KEY[2]~input_o\ : std_logic;
SIGNAL \inst9|s_key_prev~feeder_combout\ : std_logic;
SIGNAL \inst9|s_key_prev~q\ : std_logic;
SIGNAL \inst50|btn_down_prev~0_combout\ : std_logic;
SIGNAL \inst50|btn_down_prev~q\ : std_logic;
SIGNAL \inst50|LessThan0~0_combout\ : std_logic;
SIGNAL \inst50|process_0~1_combout\ : std_logic;
SIGNAL \inst50|counter[0]~2_combout\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[0]~5_combout\ : std_logic;
SIGNAL \inst50|process_0~0_combout\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[0]~5_combout\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[0]~6\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[1]~7_combout\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[1]~8\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[2]~9_combout\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[2]~10\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[3]~11_combout\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[3]~12\ : std_logic;
SIGNAL \inst50|btn_up_hold_time[4]~13_combout\ : std_logic;
SIGNAL \inst50|LessThan2~0_combout\ : std_logic;
SIGNAL \inst50|counter[0]~0_combout\ : std_logic;
SIGNAL \inst50|counter[0]~1_combout\ : std_logic;
SIGNAL \inst50|counter[0]~3_combout\ : std_logic;
SIGNAL \inst50|Add0~1\ : std_logic;
SIGNAL \inst50|Add0~4_combout\ : std_logic;
SIGNAL \inst50|Add0~18_combout\ : std_logic;
SIGNAL \inst50|Add0~5\ : std_logic;
SIGNAL \inst50|Add0~6_combout\ : std_logic;
SIGNAL \inst50|Add0~17_combout\ : std_logic;
SIGNAL \inst50|Add0~7\ : std_logic;
SIGNAL \inst50|Add0~8_combout\ : std_logic;
SIGNAL \inst50|Add0~16_combout\ : std_logic;
SIGNAL \inst50|Add0~9\ : std_logic;
SIGNAL \inst50|Add0~10_combout\ : std_logic;
SIGNAL \inst50|Add0~15_combout\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[0]~6_combout\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[0]~7\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[1]~8_combout\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[1]~9\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[2]~10_combout\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[2]~11\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[3]~12_combout\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[3]~13\ : std_logic;
SIGNAL \inst50|btn_down_hold_time[4]~14_combout\ : std_logic;
SIGNAL \inst50|process_0~2_combout\ : std_logic;
SIGNAL \inst50|process_0~3_combout\ : std_logic;
SIGNAL \inst50|Add0~3_combout\ : std_logic;
SIGNAL \inst50|Add0~11\ : std_logic;
SIGNAL \inst50|Add0~12_combout\ : std_logic;
SIGNAL \inst50|Add0~14_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ : std_logic;
SIGNAL \inst42|Mux0~0_combout\ : std_logic;
SIGNAL \1Hz|Add0~1_cout\ : std_logic;
SIGNAL \1Hz|Add0~2_combout\ : std_logic;
SIGNAL \1Hz|Add0~3\ : std_logic;
SIGNAL \1Hz|Add0~4_combout\ : std_logic;
SIGNAL \1Hz|Add0~5\ : std_logic;
SIGNAL \1Hz|Add0~6_combout\ : std_logic;
SIGNAL \1Hz|Add0~7\ : std_logic;
SIGNAL \1Hz|Add0~8_combout\ : std_logic;
SIGNAL \1Hz|Add0~9\ : std_logic;
SIGNAL \1Hz|Add0~10_combout\ : std_logic;
SIGNAL \1Hz|Add0~11\ : std_logic;
SIGNAL \1Hz|Add0~12_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~5_combout\ : std_logic;
SIGNAL \1Hz|Equal0~3_combout\ : std_logic;
SIGNAL \1Hz|Add0~13\ : std_logic;
SIGNAL \1Hz|Add0~14_combout\ : std_logic;
SIGNAL \1Hz|Add0~15\ : std_logic;
SIGNAL \1Hz|Add0~16_combout\ : std_logic;
SIGNAL \1Hz|Add0~17\ : std_logic;
SIGNAL \1Hz|Add0~18_combout\ : std_logic;
SIGNAL \1Hz|Add0~19\ : std_logic;
SIGNAL \1Hz|Add0~20_combout\ : std_logic;
SIGNAL \1Hz|Equal0~2_combout\ : std_logic;
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
SIGNAL \1Hz|Add0~43\ : std_logic;
SIGNAL \1Hz|Add0~44_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~10_combout\ : std_logic;
SIGNAL \1Hz|Add0~45\ : std_logic;
SIGNAL \1Hz|Add0~46_combout\ : std_logic;
SIGNAL \1Hz|Add0~47\ : std_logic;
SIGNAL \1Hz|Add0~48_combout\ : std_logic;
SIGNAL \1Hz|s_cnt~11_combout\ : std_logic;
SIGNAL \1Hz|Equal0~4_combout\ : std_logic;
SIGNAL \1Hz|Equal0~5_combout\ : std_logic;
SIGNAL \1Hz|Equal0~6_combout\ : std_logic;
SIGNAL \1Hz|Equal0~0_combout\ : std_logic;
SIGNAL \1Hz|Equal0~1_combout\ : std_logic;
SIGNAL \1Hz|Equal0~7_combout\ : std_logic;
SIGNAL \1Hz|pulse~feeder_combout\ : std_logic;
SIGNAL \1Hz|pulse~q\ : std_logic;
SIGNAL \inst50|s_blink~0_combout\ : std_logic;
SIGNAL \inst50|s_blink~q\ : std_logic;
SIGNAL \inst42|decOut_n[6]~14_combout\ : std_logic;
SIGNAL \inst42|Mux1~0_combout\ : std_logic;
SIGNAL \inst42|decOut_n[5]~15_combout\ : std_logic;
SIGNAL \inst42|Mux2~0_combout\ : std_logic;
SIGNAL \inst42|decOut_n[4]~16_combout\ : std_logic;
SIGNAL \inst42|Mux3~0_combout\ : std_logic;
SIGNAL \inst42|decOut_n[3]~17_combout\ : std_logic;
SIGNAL \inst42|Mux4~0_combout\ : std_logic;
SIGNAL \inst42|decOut_n[2]~18_combout\ : std_logic;
SIGNAL \inst42|Mux5~0_combout\ : std_logic;
SIGNAL \inst42|decOut_n[1]~19_combout\ : std_logic;
SIGNAL \inst42|Mux6~0_combout\ : std_logic;
SIGNAL \inst42|decOut_n[0]~20_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ : std_logic;
SIGNAL \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ : std_logic;
SIGNAL \and~combout\ : std_logic;
SIGNAL \inst41|decOut_n[6]~0_combout\ : std_logic;
SIGNAL \inst41|decOut_n[5]~1_combout\ : std_logic;
SIGNAL \inst41|decOut_n[4]~2_combout\ : std_logic;
SIGNAL \inst41|decOut_n[3]~3_combout\ : std_logic;
SIGNAL \inst41|decOut_n[2]~4_combout\ : std_logic;
SIGNAL \inst41|decOut_n[1]~5_combout\ : std_logic;
SIGNAL \inst41|decOut_n[0]~6_combout\ : std_logic;
SIGNAL \pulse|s_cnt[0]~16_combout\ : std_logic;
SIGNAL \pulse|s_cnt[2]~18_combout\ : std_logic;
SIGNAL \pulse|s_cnt[0]~17\ : std_logic;
SIGNAL \pulse|s_cnt[1]~19_combout\ : std_logic;
SIGNAL \pulse|s_cnt[1]~20\ : std_logic;
SIGNAL \pulse|s_cnt[2]~21_combout\ : std_logic;
SIGNAL \pulse|s_cnt[2]~22\ : std_logic;
SIGNAL \pulse|s_cnt[3]~23_combout\ : std_logic;
SIGNAL \pulse|s_cnt[3]~24\ : std_logic;
SIGNAL \pulse|s_cnt[4]~25_combout\ : std_logic;
SIGNAL \pulse|s_cnt[4]~26\ : std_logic;
SIGNAL \pulse|s_cnt[5]~27_combout\ : std_logic;
SIGNAL \pulse|s_cnt[5]~28\ : std_logic;
SIGNAL \pulse|s_cnt[6]~29_combout\ : std_logic;
SIGNAL \pulse|s_cnt[6]~30\ : std_logic;
SIGNAL \pulse|s_cnt[7]~31_combout\ : std_logic;
SIGNAL \pulse|s_cnt[7]~32\ : std_logic;
SIGNAL \pulse|s_cnt[8]~33_combout\ : std_logic;
SIGNAL \pulse|s_cnt[8]~34\ : std_logic;
SIGNAL \pulse|s_cnt[9]~35_combout\ : std_logic;
SIGNAL \pulse|s_cnt[9]~36\ : std_logic;
SIGNAL \pulse|s_cnt[10]~37_combout\ : std_logic;
SIGNAL \pulse|s_cnt[10]~38\ : std_logic;
SIGNAL \pulse|s_cnt[11]~39_combout\ : std_logic;
SIGNAL \pulse|Equal0~2_combout\ : std_logic;
SIGNAL \pulse|Equal0~1_combout\ : std_logic;
SIGNAL \pulse|s_cnt[11]~40\ : std_logic;
SIGNAL \pulse|s_cnt[12]~41_combout\ : std_logic;
SIGNAL \pulse|s_cnt[12]~42\ : std_logic;
SIGNAL \pulse|s_cnt[13]~43_combout\ : std_logic;
SIGNAL \pulse|s_cnt[13]~44\ : std_logic;
SIGNAL \pulse|s_cnt[14]~45_combout\ : std_logic;
SIGNAL \pulse|s_cnt[14]~46\ : std_logic;
SIGNAL \pulse|s_cnt[15]~47_combout\ : std_logic;
SIGNAL \pulse|Equal0~3_combout\ : std_logic;
SIGNAL \pulse|Equal0~0_combout\ : std_logic;
SIGNAL \pulse|Equal0~4_combout\ : std_logic;
SIGNAL \pulse|pulse~0_combout\ : std_logic;
SIGNAL \pulse|pulse~q\ : std_logic;
SIGNAL \pulse|pulse~clkctrl_outclk\ : std_logic;
SIGNAL \KEY[1]~input_o\ : std_logic;
SIGNAL \inst14|s_key_prev~feeder_combout\ : std_logic;
SIGNAL \inst14|s_key_prev~q\ : std_logic;
SIGNAL \inst7|Add0~0_combout\ : std_logic;
SIGNAL \inst7|Equal0~9_combout\ : std_logic;
SIGNAL \inst7|Add0~11\ : std_logic;
SIGNAL \inst7|Add0~12_combout\ : std_logic;
SIGNAL \inst7|temp~2_combout\ : std_logic;
SIGNAL \inst7|Add0~13\ : std_logic;
SIGNAL \inst7|Add0~14_combout\ : std_logic;
SIGNAL \inst7|temp[7]~6_combout\ : std_logic;
SIGNAL \inst7|Add0~15\ : std_logic;
SIGNAL \inst7|Add0~16_combout\ : std_logic;
SIGNAL \inst7|temp[8]~8_combout\ : std_logic;
SIGNAL \inst7|Add0~17\ : std_logic;
SIGNAL \inst7|Add0~18_combout\ : std_logic;
SIGNAL \inst7|temp[9]~9_combout\ : std_logic;
SIGNAL \inst7|Add0~19\ : std_logic;
SIGNAL \inst7|Add0~20_combout\ : std_logic;
SIGNAL \inst7|Add0~21\ : std_logic;
SIGNAL \inst7|Add0~22_combout\ : std_logic;
SIGNAL \inst7|Add0~23\ : std_logic;
SIGNAL \inst7|Add0~24_combout\ : std_logic;
SIGNAL \inst7|temp~3_combout\ : std_logic;
SIGNAL \inst7|Equal0~6_combout\ : std_logic;
SIGNAL \inst7|Add0~25\ : std_logic;
SIGNAL \inst7|Add0~26_combout\ : std_logic;
SIGNAL \inst7|Add0~27\ : std_logic;
SIGNAL \inst7|Add0~28_combout\ : std_logic;
SIGNAL \inst7|Equal0~5_combout\ : std_logic;
SIGNAL \inst7|Add0~29\ : std_logic;
SIGNAL \inst7|Add0~30_combout\ : std_logic;
SIGNAL \inst7|Add0~31\ : std_logic;
SIGNAL \inst7|Add0~32_combout\ : std_logic;
SIGNAL \inst7|Equal0~7_combout\ : std_logic;
SIGNAL \inst7|Equal0~8_combout\ : std_logic;
SIGNAL \inst7|Add0~33\ : std_logic;
SIGNAL \inst7|Add0~34_combout\ : std_logic;
SIGNAL \inst7|Add0~35\ : std_logic;
SIGNAL \inst7|Add0~36_combout\ : std_logic;
SIGNAL \inst7|Add0~37\ : std_logic;
SIGNAL \inst7|Add0~38_combout\ : std_logic;
SIGNAL \inst7|Add0~39\ : std_logic;
SIGNAL \inst7|Add0~40_combout\ : std_logic;
SIGNAL \inst7|Add0~41\ : std_logic;
SIGNAL \inst7|Add0~42_combout\ : std_logic;
SIGNAL \inst7|Add0~43\ : std_logic;
SIGNAL \inst7|Add0~44_combout\ : std_logic;
SIGNAL \inst7|Add0~45\ : std_logic;
SIGNAL \inst7|Add0~46_combout\ : std_logic;
SIGNAL \inst7|Add0~47\ : std_logic;
SIGNAL \inst7|Add0~48_combout\ : std_logic;
SIGNAL \inst7|Add0~49\ : std_logic;
SIGNAL \inst7|Add0~50_combout\ : std_logic;
SIGNAL \inst7|Add0~51\ : std_logic;
SIGNAL \inst7|Add0~52_combout\ : std_logic;
SIGNAL \inst7|Add0~53\ : std_logic;
SIGNAL \inst7|Add0~54_combout\ : std_logic;
SIGNAL \inst7|Add0~55\ : std_logic;
SIGNAL \inst7|Add0~56_combout\ : std_logic;
SIGNAL \inst7|Add0~57\ : std_logic;
SIGNAL \inst7|Add0~58_combout\ : std_logic;
SIGNAL \inst7|Add0~59\ : std_logic;
SIGNAL \inst7|Add0~60_combout\ : std_logic;
SIGNAL \inst7|Add0~61\ : std_logic;
SIGNAL \inst7|Add0~62_combout\ : std_logic;
SIGNAL \inst7|Equal0~0_combout\ : std_logic;
SIGNAL \inst7|Equal0~3_combout\ : std_logic;
SIGNAL \inst7|Equal0~1_combout\ : std_logic;
SIGNAL \inst7|Equal0~2_combout\ : std_logic;
SIGNAL \inst7|Equal0~4_combout\ : std_logic;
SIGNAL \inst7|Equal0~10_combout\ : std_logic;
SIGNAL \inst7|temp~0_combout\ : std_logic;
SIGNAL \inst7|Add0~1\ : std_logic;
SIGNAL \inst7|Add0~2_combout\ : std_logic;
SIGNAL \inst7|Add0~3\ : std_logic;
SIGNAL \inst7|Add0~4_combout\ : std_logic;
SIGNAL \inst7|Add0~5\ : std_logic;
SIGNAL \inst7|Add0~6_combout\ : std_logic;
SIGNAL \inst7|temp[3]~4_combout\ : std_logic;
SIGNAL \inst7|Add0~7\ : std_logic;
SIGNAL \inst7|Add0~8_combout\ : std_logic;
SIGNAL \inst7|Add0~9\ : std_logic;
SIGNAL \inst7|Add0~10_combout\ : std_logic;
SIGNAL \inst7|temp~1_combout\ : std_logic;
SIGNAL \don|Don[5]~2_combout\ : std_logic;
SIGNAL \don|state.idle~0_combout\ : std_logic;
SIGNAL \don|state.idle~q\ : std_logic;
SIGNAL \don|Don[12]~0_combout\ : std_logic;
SIGNAL \don|timer[0]~13_combout\ : std_logic;
SIGNAL \~GND~combout\ : std_logic;
SIGNAL \don|Selector14~0_combout\ : std_logic;
SIGNAL \don|timer[5]~25\ : std_logic;
SIGNAL \don|timer[6]~26_combout\ : std_logic;
SIGNAL \don|Don[12]~1_combout\ : std_logic;
SIGNAL \don|timer[10]~17_combout\ : std_logic;
SIGNAL \don|timer[6]~27\ : std_logic;
SIGNAL \don|timer[7]~28_combout\ : std_logic;
SIGNAL \don|timer[7]~29\ : std_logic;
SIGNAL \don|timer[8]~30_combout\ : std_logic;
SIGNAL \don|timer[8]~31\ : std_logic;
SIGNAL \don|timer[9]~32_combout\ : std_logic;
SIGNAL \don|timer[9]~33\ : std_logic;
SIGNAL \don|timer[10]~34_combout\ : std_logic;
SIGNAL \don|timer[10]~35\ : std_logic;
SIGNAL \don|timer[11]~36_combout\ : std_logic;
SIGNAL \don|Equal0~6_combout\ : std_logic;
SIGNAL \don|timer[11]~37\ : std_logic;
SIGNAL \don|timer[12]~38_combout\ : std_logic;
SIGNAL \don|Don[12]~4_combout\ : std_logic;
SIGNAL \don|Equal0~5_combout\ : std_logic;
SIGNAL \don|Equal0~7_combout\ : std_logic;
SIGNAL \don|Selector14~1_combout\ : std_logic;
SIGNAL \don|state.running~q\ : std_logic;
SIGNAL \don|timer[0]~14\ : std_logic;
SIGNAL \don|timer[1]~15_combout\ : std_logic;
SIGNAL \don|timer[1]~16\ : std_logic;
SIGNAL \don|timer[2]~18_combout\ : std_logic;
SIGNAL \don|timer[2]~19\ : std_logic;
SIGNAL \don|timer[3]~20_combout\ : std_logic;
SIGNAL \don|timer[3]~21\ : std_logic;
SIGNAL \don|timer[4]~22_combout\ : std_logic;
SIGNAL \don|timer[4]~23\ : std_logic;
SIGNAL \don|timer[5]~24_combout\ : std_logic;
SIGNAL \don|Equal0~2_combout\ : std_logic;
SIGNAL \don|Equal0~0_combout\ : std_logic;
SIGNAL \don|Equal0~1_combout\ : std_logic;
SIGNAL \don|Don[6]~3_combout\ : std_logic;
SIGNAL \don|Equal0~3_combout\ : std_logic;
SIGNAL \don|Equal0~4_combout\ : std_logic;
SIGNAL \don|Selector15~0_combout\ : std_logic;
SIGNAL \don|Selector15~1_combout\ : std_logic;
SIGNAL \don|state.enable~q\ : std_logic;
SIGNAL \inst15|state[0]~1_combout\ : std_logic;
SIGNAL \inst15|state[1]~0_combout\ : std_logic;
SIGNAL \inst15|light_active[0]~0_combout\ : std_logic;
SIGNAL \inst15|light_active[0]~1_combout\ : std_logic;
SIGNAL \pulse|s_cnt\ : std_logic_vector(15 DOWNTO 0);
SIGNAL \inst50|btn_up_hold_time\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \10Hz|s_cnt\ : std_logic_vector(22 DOWNTO 0);
SIGNAL \inst50|btn_down_hold_time\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \don|timer\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \inst50|counter\ : std_logic_vector(5 DOWNTO 0);
SIGNAL \inst15|light_active\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst15|state\ : std_logic_vector(1 DOWNTO 0);
SIGNAL \1Hz|s_cnt\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \don|Don\ : std_logic_vector(12 DOWNTO 0);
SIGNAL \inst7|temp\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_SW[0]~input_o\ : std_logic;
SIGNAL \don|ALT_INV_state.running~q\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

HEX0 <= ww_HEX0;
ww_SW <= SW;
ww_CLOCK_50 <= CLOCK_50;
ww_KEY <= KEY;
HEX1 <= ww_HEX1;
HEX2 <= ww_HEX2;
HEX3 <= ww_HEX3;
HEX6 <= ww_HEX6;
HEX7 <= ww_HEX7;
LEDG <= ww_LEDG;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);

\pulse|pulse~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \pulse|pulse~q\);

\10Hz|pulse~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \10Hz|pulse~q\);
\ALT_INV_SW[0]~input_o\ <= NOT \SW[0]~input_o\;
\don|ALT_INV_state.running~q\ <= NOT \don|state.running~q\;
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => VCC,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => VCC,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => VCC,
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
	i => VCC,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => VCC,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => VCC,
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
	i => VCC,
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
	i => VCC,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => \ALT_INV_SW[0]~input_o\,
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
	i => VCC,
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
	i => VCC,
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
	i => \ALT_INV_SW[0]~input_o\,
	devoe => ww_devoe,
	o => \HEX3[0]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst42|decOut_n[6]~14_combout\,
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
	i => \inst42|decOut_n[5]~15_combout\,
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
	i => \inst42|decOut_n[4]~16_combout\,
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
	i => \inst42|decOut_n[3]~17_combout\,
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
	i => \inst42|decOut_n[2]~18_combout\,
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
	i => \inst42|decOut_n[1]~19_combout\,
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
	i => \inst42|decOut_n[0]~20_combout\,
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
	i => \inst41|decOut_n[6]~0_combout\,
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
	i => \inst41|decOut_n[5]~1_combout\,
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
	i => \inst41|decOut_n[4]~2_combout\,
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
	i => \inst41|decOut_n[3]~3_combout\,
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
	i => \inst41|decOut_n[2]~4_combout\,
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
	i => \inst41|decOut_n[1]~5_combout\,
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
	i => \inst41|decOut_n[0]~6_combout\,
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
	i => \inst15|light_active\(0),
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
	i => \inst15|light_active\(0),
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
	i => \inst15|light_active\(0),
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
	i => \inst15|light_active\(0),
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
	i => \inst15|light_active\(0),
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
	i => \inst15|light_active\(0),
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
	i => \inst15|light_active\(0),
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
	i => \inst15|light_active\(0),
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOIBUF_X115_Y17_N1
\SW[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(0),
	o => \SW[0]~input_o\);

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

-- Location: LCCOMB_X60_Y2_N10
\10Hz|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~0_combout\ = \10Hz|s_cnt\(0) $ (VCC)
-- \10Hz|Add0~1\ = CARRY(\10Hz|s_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(0),
	datad => VCC,
	combout => \10Hz|Add0~0_combout\,
	cout => \10Hz|Add0~1\);

-- Location: FF_X60_Y2_N11
\10Hz|s_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(0));

-- Location: LCCOMB_X60_Y2_N12
\10Hz|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~2_combout\ = (\10Hz|s_cnt\(1) & (!\10Hz|Add0~1\)) # (!\10Hz|s_cnt\(1) & ((\10Hz|Add0~1\) # (GND)))
-- \10Hz|Add0~3\ = CARRY((!\10Hz|Add0~1\) # (!\10Hz|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(1),
	datad => VCC,
	cin => \10Hz|Add0~1\,
	combout => \10Hz|Add0~2_combout\,
	cout => \10Hz|Add0~3\);

-- Location: FF_X60_Y2_N13
\10Hz|s_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(1));

-- Location: LCCOMB_X60_Y2_N14
\10Hz|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~4_combout\ = (\10Hz|s_cnt\(2) & (\10Hz|Add0~3\ $ (GND))) # (!\10Hz|s_cnt\(2) & (!\10Hz|Add0~3\ & VCC))
-- \10Hz|Add0~5\ = CARRY((\10Hz|s_cnt\(2) & !\10Hz|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(2),
	datad => VCC,
	cin => \10Hz|Add0~3\,
	combout => \10Hz|Add0~4_combout\,
	cout => \10Hz|Add0~5\);

-- Location: FF_X60_Y2_N15
\10Hz|s_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(2));

-- Location: LCCOMB_X60_Y2_N16
\10Hz|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~6_combout\ = (\10Hz|s_cnt\(3) & (!\10Hz|Add0~5\)) # (!\10Hz|s_cnt\(3) & ((\10Hz|Add0~5\) # (GND)))
-- \10Hz|Add0~7\ = CARRY((!\10Hz|Add0~5\) # (!\10Hz|s_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(3),
	datad => VCC,
	cin => \10Hz|Add0~5\,
	combout => \10Hz|Add0~6_combout\,
	cout => \10Hz|Add0~7\);

-- Location: FF_X60_Y2_N17
\10Hz|s_cnt[3]\ : dffeas
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
	q => \10Hz|s_cnt\(3));

-- Location: LCCOMB_X60_Y2_N18
\10Hz|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~8_combout\ = (\10Hz|s_cnt\(4) & (\10Hz|Add0~7\ $ (GND))) # (!\10Hz|s_cnt\(4) & (!\10Hz|Add0~7\ & VCC))
-- \10Hz|Add0~9\ = CARRY((\10Hz|s_cnt\(4) & !\10Hz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(4),
	datad => VCC,
	cin => \10Hz|Add0~7\,
	combout => \10Hz|Add0~8_combout\,
	cout => \10Hz|Add0~9\);

-- Location: FF_X60_Y2_N19
\10Hz|s_cnt[4]\ : dffeas
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
	q => \10Hz|s_cnt\(4));

-- Location: LCCOMB_X60_Y2_N20
\10Hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~10_combout\ = (\10Hz|s_cnt\(5) & (!\10Hz|Add0~9\)) # (!\10Hz|s_cnt\(5) & ((\10Hz|Add0~9\) # (GND)))
-- \10Hz|Add0~11\ = CARRY((!\10Hz|Add0~9\) # (!\10Hz|s_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(5),
	datad => VCC,
	cin => \10Hz|Add0~9\,
	combout => \10Hz|Add0~10_combout\,
	cout => \10Hz|Add0~11\);

-- Location: FF_X60_Y2_N21
\10Hz|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(5));

-- Location: LCCOMB_X60_Y2_N22
\10Hz|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~12_combout\ = (\10Hz|s_cnt\(6) & (\10Hz|Add0~11\ $ (GND))) # (!\10Hz|s_cnt\(6) & (!\10Hz|Add0~11\ & VCC))
-- \10Hz|Add0~13\ = CARRY((\10Hz|s_cnt\(6) & !\10Hz|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(6),
	datad => VCC,
	cin => \10Hz|Add0~11\,
	combout => \10Hz|Add0~12_combout\,
	cout => \10Hz|Add0~13\);

-- Location: LCCOMB_X60_Y2_N4
\10Hz|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~3_combout\ = (\10Hz|Add0~12_combout\ & !\10Hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Add0~12_combout\,
	datad => \10Hz|Equal0~7_combout\,
	combout => \10Hz|s_cnt~3_combout\);

-- Location: FF_X60_Y2_N5
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

-- Location: LCCOMB_X60_Y2_N24
\10Hz|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~14_combout\ = (\10Hz|s_cnt\(7) & (!\10Hz|Add0~13\)) # (!\10Hz|s_cnt\(7) & ((\10Hz|Add0~13\) # (GND)))
-- \10Hz|Add0~15\ = CARRY((!\10Hz|Add0~13\) # (!\10Hz|s_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(7),
	datad => VCC,
	cin => \10Hz|Add0~13\,
	combout => \10Hz|Add0~14_combout\,
	cout => \10Hz|Add0~15\);

-- Location: FF_X60_Y2_N25
\10Hz|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(7));

-- Location: LCCOMB_X60_Y2_N26
\10Hz|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~16_combout\ = (\10Hz|s_cnt\(8) & (\10Hz|Add0~15\ $ (GND))) # (!\10Hz|s_cnt\(8) & (!\10Hz|Add0~15\ & VCC))
-- \10Hz|Add0~17\ = CARRY((\10Hz|s_cnt\(8) & !\10Hz|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(8),
	datad => VCC,
	cin => \10Hz|Add0~15\,
	combout => \10Hz|Add0~16_combout\,
	cout => \10Hz|Add0~17\);

-- Location: LCCOMB_X60_Y2_N0
\10Hz|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~2_combout\ = (\10Hz|Add0~16_combout\ & !\10Hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Add0~16_combout\,
	datad => \10Hz|Equal0~7_combout\,
	combout => \10Hz|s_cnt~2_combout\);

-- Location: FF_X60_Y2_N1
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

-- Location: LCCOMB_X60_Y2_N28
\10Hz|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~18_combout\ = (\10Hz|s_cnt\(9) & (!\10Hz|Add0~17\)) # (!\10Hz|s_cnt\(9) & ((\10Hz|Add0~17\) # (GND)))
-- \10Hz|Add0~19\ = CARRY((!\10Hz|Add0~17\) # (!\10Hz|s_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(9),
	datad => VCC,
	cin => \10Hz|Add0~17\,
	combout => \10Hz|Add0~18_combout\,
	cout => \10Hz|Add0~19\);

-- Location: LCCOMB_X60_Y2_N2
\10Hz|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~1_combout\ = (\10Hz|Add0~18_combout\ & !\10Hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|Add0~18_combout\,
	datad => \10Hz|Equal0~7_combout\,
	combout => \10Hz|s_cnt~1_combout\);

-- Location: FF_X60_Y2_N3
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

-- Location: LCCOMB_X60_Y2_N30
\10Hz|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~20_combout\ = (\10Hz|s_cnt\(10) & (\10Hz|Add0~19\ $ (GND))) # (!\10Hz|s_cnt\(10) & (!\10Hz|Add0~19\ & VCC))
-- \10Hz|Add0~21\ = CARRY((\10Hz|s_cnt\(10) & !\10Hz|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(10),
	datad => VCC,
	cin => \10Hz|Add0~19\,
	combout => \10Hz|Add0~20_combout\,
	cout => \10Hz|Add0~21\);

-- Location: FF_X60_Y2_N31
\10Hz|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(10));

-- Location: LCCOMB_X60_Y1_N0
\10Hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~22_combout\ = (\10Hz|s_cnt\(11) & (!\10Hz|Add0~21\)) # (!\10Hz|s_cnt\(11) & ((\10Hz|Add0~21\) # (GND)))
-- \10Hz|Add0~23\ = CARRY((!\10Hz|Add0~21\) # (!\10Hz|s_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(11),
	datad => VCC,
	cin => \10Hz|Add0~21\,
	combout => \10Hz|Add0~22_combout\,
	cout => \10Hz|Add0~23\);

-- Location: LCCOMB_X60_Y1_N24
\10Hz|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~0_combout\ = (!\10Hz|Equal0~7_combout\ & \10Hz|Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~7_combout\,
	datad => \10Hz|Add0~22_combout\,
	combout => \10Hz|s_cnt~0_combout\);

-- Location: FF_X60_Y1_N25
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

-- Location: LCCOMB_X60_Y1_N2
\10Hz|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~24_combout\ = (\10Hz|s_cnt\(12) & (\10Hz|Add0~23\ $ (GND))) # (!\10Hz|s_cnt\(12) & (!\10Hz|Add0~23\ & VCC))
-- \10Hz|Add0~25\ = CARRY((\10Hz|s_cnt\(12) & !\10Hz|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(12),
	datad => VCC,
	cin => \10Hz|Add0~23\,
	combout => \10Hz|Add0~24_combout\,
	cout => \10Hz|Add0~25\);

-- Location: FF_X60_Y1_N3
\10Hz|s_cnt[12]\ : dffeas
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
	q => \10Hz|s_cnt\(12));

-- Location: LCCOMB_X60_Y1_N4
\10Hz|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~26_combout\ = (\10Hz|s_cnt\(13) & (!\10Hz|Add0~25\)) # (!\10Hz|s_cnt\(13) & ((\10Hz|Add0~25\) # (GND)))
-- \10Hz|Add0~27\ = CARRY((!\10Hz|Add0~25\) # (!\10Hz|s_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(13),
	datad => VCC,
	cin => \10Hz|Add0~25\,
	combout => \10Hz|Add0~26_combout\,
	cout => \10Hz|Add0~27\);

-- Location: FF_X60_Y1_N5
\10Hz|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~26_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(13));

-- Location: LCCOMB_X60_Y1_N6
\10Hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~28_combout\ = (\10Hz|s_cnt\(14) & (\10Hz|Add0~27\ $ (GND))) # (!\10Hz|s_cnt\(14) & (!\10Hz|Add0~27\ & VCC))
-- \10Hz|Add0~29\ = CARRY((\10Hz|s_cnt\(14) & !\10Hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(14),
	datad => VCC,
	cin => \10Hz|Add0~27\,
	combout => \10Hz|Add0~28_combout\,
	cout => \10Hz|Add0~29\);

-- Location: LCCOMB_X60_Y1_N30
\10Hz|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~4_combout\ = (!\10Hz|Equal0~7_combout\ & \10Hz|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~7_combout\,
	datad => \10Hz|Add0~28_combout\,
	combout => \10Hz|s_cnt~4_combout\);

-- Location: FF_X60_Y1_N31
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

-- Location: LCCOMB_X60_Y1_N8
\10Hz|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~30_combout\ = (\10Hz|s_cnt\(15) & (!\10Hz|Add0~29\)) # (!\10Hz|s_cnt\(15) & ((\10Hz|Add0~29\) # (GND)))
-- \10Hz|Add0~31\ = CARRY((!\10Hz|Add0~29\) # (!\10Hz|s_cnt\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(15),
	datad => VCC,
	cin => \10Hz|Add0~29\,
	combout => \10Hz|Add0~30_combout\,
	cout => \10Hz|Add0~31\);

-- Location: FF_X60_Y1_N9
\10Hz|s_cnt[15]\ : dffeas
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
	q => \10Hz|s_cnt\(15));

-- Location: LCCOMB_X61_Y1_N12
\10Hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~4_combout\ = (!\10Hz|s_cnt\(15) & (\10Hz|s_cnt\(2) & (!\10Hz|s_cnt\(13) & \10Hz|s_cnt\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(15),
	datab => \10Hz|s_cnt\(2),
	datac => \10Hz|s_cnt\(13),
	datad => \10Hz|s_cnt\(14),
	combout => \10Hz|Equal0~4_combout\);

-- Location: LCCOMB_X60_Y1_N10
\10Hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~32_combout\ = (\10Hz|s_cnt\(16) & (\10Hz|Add0~31\ $ (GND))) # (!\10Hz|s_cnt\(16) & (!\10Hz|Add0~31\ & VCC))
-- \10Hz|Add0~33\ = CARRY((\10Hz|s_cnt\(16) & !\10Hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(16),
	datad => VCC,
	cin => \10Hz|Add0~31\,
	combout => \10Hz|Add0~32_combout\,
	cout => \10Hz|Add0~33\);

-- Location: FF_X60_Y1_N11
\10Hz|s_cnt[16]\ : dffeas
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
	q => \10Hz|s_cnt\(16));

-- Location: LCCOMB_X60_Y1_N12
\10Hz|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~34_combout\ = (\10Hz|s_cnt\(17) & (!\10Hz|Add0~33\)) # (!\10Hz|s_cnt\(17) & ((\10Hz|Add0~33\) # (GND)))
-- \10Hz|Add0~35\ = CARRY((!\10Hz|Add0~33\) # (!\10Hz|s_cnt\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(17),
	datad => VCC,
	cin => \10Hz|Add0~33\,
	combout => \10Hz|Add0~34_combout\,
	cout => \10Hz|Add0~35\);

-- Location: FF_X60_Y1_N13
\10Hz|s_cnt[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(17));

-- Location: LCCOMB_X60_Y1_N14
\10Hz|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~36_combout\ = (\10Hz|s_cnt\(18) & (\10Hz|Add0~35\ $ (GND))) # (!\10Hz|s_cnt\(18) & (!\10Hz|Add0~35\ & VCC))
-- \10Hz|Add0~37\ = CARRY((\10Hz|s_cnt\(18) & !\10Hz|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(18),
	datad => VCC,
	cin => \10Hz|Add0~35\,
	combout => \10Hz|Add0~36_combout\,
	cout => \10Hz|Add0~37\);

-- Location: LCCOMB_X61_Y1_N2
\10Hz|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~5_combout\ = (!\10Hz|Equal0~7_combout\ & \10Hz|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|Equal0~7_combout\,
	datad => \10Hz|Add0~36_combout\,
	combout => \10Hz|s_cnt~5_combout\);

-- Location: FF_X61_Y1_N3
\10Hz|s_cnt[18]\ : dffeas
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
	q => \10Hz|s_cnt\(18));

-- Location: LCCOMB_X60_Y1_N16
\10Hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~38_combout\ = (\10Hz|s_cnt\(19) & (!\10Hz|Add0~37\)) # (!\10Hz|s_cnt\(19) & ((\10Hz|Add0~37\) # (GND)))
-- \10Hz|Add0~39\ = CARRY((!\10Hz|Add0~37\) # (!\10Hz|s_cnt\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(19),
	datad => VCC,
	cin => \10Hz|Add0~37\,
	combout => \10Hz|Add0~38_combout\,
	cout => \10Hz|Add0~39\);

-- Location: LCCOMB_X60_Y1_N28
\10Hz|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~6_combout\ = (!\10Hz|Equal0~7_combout\ & \10Hz|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \10Hz|Equal0~7_combout\,
	datad => \10Hz|Add0~38_combout\,
	combout => \10Hz|s_cnt~6_combout\);

-- Location: FF_X60_Y1_N29
\10Hz|s_cnt[19]\ : dffeas
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
	q => \10Hz|s_cnt\(19));

-- Location: LCCOMB_X60_Y1_N18
\10Hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~40_combout\ = (\10Hz|s_cnt\(20) & (\10Hz|Add0~39\ $ (GND))) # (!\10Hz|s_cnt\(20) & (!\10Hz|Add0~39\ & VCC))
-- \10Hz|Add0~41\ = CARRY((\10Hz|s_cnt\(20) & !\10Hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(20),
	datad => VCC,
	cin => \10Hz|Add0~39\,
	combout => \10Hz|Add0~40_combout\,
	cout => \10Hz|Add0~41\);

-- Location: FF_X60_Y1_N19
\10Hz|s_cnt[20]\ : dffeas
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
	q => \10Hz|s_cnt\(20));

-- Location: LCCOMB_X60_Y1_N20
\10Hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~42_combout\ = (\10Hz|s_cnt\(21) & (!\10Hz|Add0~41\)) # (!\10Hz|s_cnt\(21) & ((\10Hz|Add0~41\) # (GND)))
-- \10Hz|Add0~43\ = CARRY((!\10Hz|Add0~41\) # (!\10Hz|s_cnt\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|s_cnt\(21),
	datad => VCC,
	cin => \10Hz|Add0~41\,
	combout => \10Hz|Add0~42_combout\,
	cout => \10Hz|Add0~43\);

-- Location: FF_X60_Y1_N21
\10Hz|s_cnt[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \10Hz|Add0~42_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \10Hz|s_cnt\(21));

-- Location: LCCOMB_X60_Y1_N22
\10Hz|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Add0~44_combout\ = \10Hz|Add0~43\ $ (!\10Hz|s_cnt\(22))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \10Hz|s_cnt\(22),
	cin => \10Hz|Add0~43\,
	combout => \10Hz|Add0~44_combout\);

-- Location: LCCOMB_X60_Y1_N26
\10Hz|s_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|s_cnt~7_combout\ = (!\10Hz|Equal0~7_combout\ & \10Hz|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \10Hz|Equal0~7_combout\,
	datac => \10Hz|Add0~44_combout\,
	combout => \10Hz|s_cnt~7_combout\);

-- Location: FF_X60_Y1_N27
\10Hz|s_cnt[22]\ : dffeas
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
	q => \10Hz|s_cnt\(22));

-- Location: LCCOMB_X61_Y1_N4
\10Hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~5_combout\ = (!\10Hz|s_cnt\(16) & (\10Hz|s_cnt\(18) & (\10Hz|s_cnt\(19) & !\10Hz|s_cnt\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(16),
	datab => \10Hz|s_cnt\(18),
	datac => \10Hz|s_cnt\(19),
	datad => \10Hz|s_cnt\(17),
	combout => \10Hz|Equal0~5_combout\);

-- Location: LCCOMB_X61_Y1_N24
\10Hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~6_combout\ = (\10Hz|s_cnt\(22) & (!\10Hz|s_cnt\(21) & (\10Hz|Equal0~5_combout\ & !\10Hz|s_cnt\(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(22),
	datab => \10Hz|s_cnt\(21),
	datac => \10Hz|Equal0~5_combout\,
	datad => \10Hz|s_cnt\(20),
	combout => \10Hz|Equal0~6_combout\);

-- Location: LCCOMB_X61_Y2_N28
\10Hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~3_combout\ = (\10Hz|s_cnt\(3) & (\10Hz|s_cnt\(5) & (!\10Hz|s_cnt\(6) & \10Hz|s_cnt\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(3),
	datab => \10Hz|s_cnt\(5),
	datac => \10Hz|s_cnt\(6),
	datad => \10Hz|s_cnt\(4),
	combout => \10Hz|Equal0~3_combout\);

-- Location: LCCOMB_X60_Y2_N8
\10Hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~0_combout\ = (\10Hz|s_cnt\(0) & \10Hz|s_cnt\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(0),
	datad => \10Hz|s_cnt\(1),
	combout => \10Hz|Equal0~0_combout\);

-- Location: LCCOMB_X60_Y2_N6
\10Hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~1_combout\ = (!\10Hz|s_cnt\(7) & (\10Hz|s_cnt\(8) & (!\10Hz|s_cnt\(10) & \10Hz|s_cnt\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(7),
	datab => \10Hz|s_cnt\(8),
	datac => \10Hz|s_cnt\(10),
	datad => \10Hz|s_cnt\(9),
	combout => \10Hz|Equal0~1_combout\);

-- Location: LCCOMB_X61_Y1_N18
\10Hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~2_combout\ = (!\10Hz|s_cnt\(12) & (\10Hz|s_cnt\(11) & (\10Hz|Equal0~0_combout\ & \10Hz|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(12),
	datab => \10Hz|s_cnt\(11),
	datac => \10Hz|Equal0~0_combout\,
	datad => \10Hz|Equal0~1_combout\,
	combout => \10Hz|Equal0~2_combout\);

-- Location: LCCOMB_X61_Y1_N0
\10Hz|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|Equal0~7_combout\ = (\10Hz|Equal0~4_combout\ & (\10Hz|Equal0~6_combout\ & (\10Hz|Equal0~3_combout\ & \10Hz|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|Equal0~4_combout\,
	datab => \10Hz|Equal0~6_combout\,
	datac => \10Hz|Equal0~3_combout\,
	datad => \10Hz|Equal0~2_combout\,
	combout => \10Hz|Equal0~7_combout\);

-- Location: LCCOMB_X61_Y1_N6
\10Hz|pulse~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \10Hz|pulse~feeder_combout\ = \10Hz|Equal0~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \10Hz|Equal0~7_combout\,
	combout => \10Hz|pulse~feeder_combout\);

-- Location: FF_X61_Y1_N7
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

-- Location: CLKCTRL_G19
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

-- Location: FF_X83_Y63_N11
\DB1|s_key_prev\ : dffeas
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
	q => \DB1|s_key_prev~q\);

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

-- Location: FF_X89_Y29_N23
\inst10|s_key_prev\ : dffeas
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
	q => \inst10|s_key_prev~q\);

-- Location: LCCOMB_X89_Y29_N20
\inst50|btn_up_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_up_prev~0_combout\ = !\inst10|s_key_prev~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst10|s_key_prev~q\,
	combout => \inst50|btn_up_prev~0_combout\);

-- Location: FF_X89_Y29_N21
\inst50|btn_up_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_up_prev~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_up_prev~q\);

-- Location: LCCOMB_X88_Y29_N14
\inst50|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~0_combout\ = \inst50|counter\(0) $ (VCC)
-- \inst50|Add0~1\ = CARRY(\inst50|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(0),
	datad => VCC,
	combout => \inst50|Add0~0_combout\,
	cout => \inst50|Add0~1\);

-- Location: LCCOMB_X87_Y29_N28
\inst50|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~2_combout\ = (\inst50|Add0~0_combout\ & \DB1|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Add0~0_combout\,
	datad => \DB1|s_key_prev~q\,
	combout => \inst50|Add0~2_combout\);

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

-- Location: LCCOMB_X86_Y29_N18
\inst9|s_key_prev~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst9|s_key_prev~feeder_combout\ = \KEY[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[2]~input_o\,
	combout => \inst9|s_key_prev~feeder_combout\);

-- Location: FF_X86_Y29_N19
\inst9|s_key_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst9|s_key_prev~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst9|s_key_prev~q\);

-- Location: LCCOMB_X86_Y29_N24
\inst50|btn_down_prev~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_down_prev~0_combout\ = !\inst9|s_key_prev~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst9|s_key_prev~q\,
	combout => \inst50|btn_down_prev~0_combout\);

-- Location: FF_X86_Y29_N25
\inst50|btn_down_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_down_prev~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_down_prev~q\);

-- Location: LCCOMB_X87_Y29_N24
\inst50|LessThan0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|LessThan0~0_combout\ = (!\inst50|counter\(2) & (\inst50|counter\(1) & \inst50|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(2),
	datac => \inst50|counter\(1),
	datad => \inst50|counter\(3),
	combout => \inst50|LessThan0~0_combout\);

-- Location: LCCOMB_X86_Y29_N28
\inst50|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|process_0~1_combout\ = (\inst9|s_key_prev~q\) # ((!\inst50|counter\(4) & (!\inst50|counter\(5) & \inst50|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(4),
	datab => \inst50|counter\(5),
	datac => \inst9|s_key_prev~q\,
	datad => \inst50|LessThan0~0_combout\,
	combout => \inst50|process_0~1_combout\);

-- Location: LCCOMB_X87_Y29_N30
\inst50|counter[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|counter[0]~2_combout\ = (!\inst50|process_0~3_combout\ & ((\inst50|btn_down_prev~q\) # (\inst50|process_0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|btn_down_prev~q\,
	datac => \inst50|process_0~3_combout\,
	datad => \inst50|process_0~1_combout\,
	combout => \inst50|counter[0]~2_combout\);

-- Location: LCCOMB_X87_Y29_N10
\inst50|btn_up_hold_time[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_up_hold_time[0]~5_combout\ = \inst50|btn_up_hold_time\(0) $ (VCC)
-- \inst50|btn_up_hold_time[0]~6\ = CARRY(\inst50|btn_up_hold_time\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|btn_up_hold_time\(0),
	datad => VCC,
	combout => \inst50|btn_up_hold_time[0]~5_combout\,
	cout => \inst50|btn_up_hold_time[0]~6\);

-- Location: LCCOMB_X89_Y29_N28
\inst50|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|process_0~0_combout\ = (\inst10|s_key_prev~q\) # ((\inst50|counter\(4) & (\inst50|counter\(5) & !\inst50|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(4),
	datab => \inst50|counter\(5),
	datac => \inst10|s_key_prev~q\,
	datad => \inst50|LessThan0~0_combout\,
	combout => \inst50|process_0~0_combout\);

-- Location: LCCOMB_X87_Y29_N6
\inst50|btn_down_hold_time[0]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_down_hold_time[0]~5_combout\ = (\SW[0]~input_o\ & \DB1|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \SW[0]~input_o\,
	datad => \DB1|s_key_prev~q\,
	combout => \inst50|btn_down_hold_time[0]~5_combout\);

-- Location: FF_X87_Y29_N11
\inst50|btn_up_hold_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_up_hold_time[0]~5_combout\,
	sclr => \inst50|process_0~0_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_up_hold_time\(0));

-- Location: LCCOMB_X87_Y29_N12
\inst50|btn_up_hold_time[1]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_up_hold_time[1]~7_combout\ = (\inst50|btn_up_hold_time\(1) & (!\inst50|btn_up_hold_time[0]~6\)) # (!\inst50|btn_up_hold_time\(1) & ((\inst50|btn_up_hold_time[0]~6\) # (GND)))
-- \inst50|btn_up_hold_time[1]~8\ = CARRY((!\inst50|btn_up_hold_time[0]~6\) # (!\inst50|btn_up_hold_time\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|btn_up_hold_time\(1),
	datad => VCC,
	cin => \inst50|btn_up_hold_time[0]~6\,
	combout => \inst50|btn_up_hold_time[1]~7_combout\,
	cout => \inst50|btn_up_hold_time[1]~8\);

-- Location: FF_X87_Y29_N13
\inst50|btn_up_hold_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_up_hold_time[1]~7_combout\,
	sclr => \inst50|process_0~0_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_up_hold_time\(1));

-- Location: LCCOMB_X87_Y29_N14
\inst50|btn_up_hold_time[2]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_up_hold_time[2]~9_combout\ = (\inst50|btn_up_hold_time\(2) & (\inst50|btn_up_hold_time[1]~8\ $ (GND))) # (!\inst50|btn_up_hold_time\(2) & (!\inst50|btn_up_hold_time[1]~8\ & VCC))
-- \inst50|btn_up_hold_time[2]~10\ = CARRY((\inst50|btn_up_hold_time\(2) & !\inst50|btn_up_hold_time[1]~8\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst50|btn_up_hold_time\(2),
	datad => VCC,
	cin => \inst50|btn_up_hold_time[1]~8\,
	combout => \inst50|btn_up_hold_time[2]~9_combout\,
	cout => \inst50|btn_up_hold_time[2]~10\);

-- Location: FF_X87_Y29_N15
\inst50|btn_up_hold_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_up_hold_time[2]~9_combout\,
	sclr => \inst50|process_0~0_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_up_hold_time\(2));

-- Location: LCCOMB_X87_Y29_N16
\inst50|btn_up_hold_time[3]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_up_hold_time[3]~11_combout\ = (\inst50|btn_up_hold_time\(3) & (!\inst50|btn_up_hold_time[2]~10\)) # (!\inst50|btn_up_hold_time\(3) & ((\inst50|btn_up_hold_time[2]~10\) # (GND)))
-- \inst50|btn_up_hold_time[3]~12\ = CARRY((!\inst50|btn_up_hold_time[2]~10\) # (!\inst50|btn_up_hold_time\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst50|btn_up_hold_time\(3),
	datad => VCC,
	cin => \inst50|btn_up_hold_time[2]~10\,
	combout => \inst50|btn_up_hold_time[3]~11_combout\,
	cout => \inst50|btn_up_hold_time[3]~12\);

-- Location: FF_X87_Y29_N17
\inst50|btn_up_hold_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_up_hold_time[3]~11_combout\,
	sclr => \inst50|process_0~0_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_up_hold_time\(3));

-- Location: LCCOMB_X87_Y29_N18
\inst50|btn_up_hold_time[4]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_up_hold_time[4]~13_combout\ = \inst50|btn_up_hold_time[3]~12\ $ (!\inst50|btn_up_hold_time\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst50|btn_up_hold_time\(4),
	cin => \inst50|btn_up_hold_time[3]~12\,
	combout => \inst50|btn_up_hold_time[4]~13_combout\);

-- Location: FF_X87_Y29_N19
\inst50|btn_up_hold_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_up_hold_time[4]~13_combout\,
	sclr => \inst50|process_0~0_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_up_hold_time\(4));

-- Location: LCCOMB_X87_Y29_N0
\inst50|LessThan2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|LessThan2~0_combout\ = (!\inst50|btn_up_hold_time\(4) & (((!\inst50|btn_up_hold_time\(1) & !\inst50|btn_up_hold_time\(2))) # (!\inst50|btn_up_hold_time\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|btn_up_hold_time\(1),
	datab => \inst50|btn_up_hold_time\(3),
	datac => \inst50|btn_up_hold_time\(2),
	datad => \inst50|btn_up_hold_time\(4),
	combout => \inst50|LessThan2~0_combout\);

-- Location: LCCOMB_X87_Y29_N26
\inst50|counter[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|counter[0]~0_combout\ = (\inst50|LessThan2~0_combout\) # ((\inst50|counter\(4) & (\inst50|counter\(5) & !\inst50|LessThan0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(4),
	datab => \inst50|counter\(5),
	datac => \inst50|LessThan2~0_combout\,
	datad => \inst50|LessThan0~0_combout\,
	combout => \inst50|counter[0]~0_combout\);

-- Location: LCCOMB_X87_Y29_N4
\inst50|counter[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|counter[0]~1_combout\ = (\inst50|counter[0]~0_combout\ & ((\inst50|btn_up_prev~q\) # (\inst50|process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter[0]~0_combout\,
	datac => \inst50|btn_up_prev~q\,
	datad => \inst50|process_0~0_combout\,
	combout => \inst50|counter[0]~1_combout\);

-- Location: LCCOMB_X87_Y29_N20
\inst50|counter[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|counter[0]~3_combout\ = ((\SW[0]~input_o\ & ((!\inst50|counter[0]~1_combout\) # (!\inst50|counter[0]~2_combout\)))) # (!\DB1|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter[0]~2_combout\,
	datab => \SW[0]~input_o\,
	datac => \inst50|counter[0]~1_combout\,
	datad => \DB1|s_key_prev~q\,
	combout => \inst50|counter[0]~3_combout\);

-- Location: FF_X87_Y29_N29
\inst50|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|Add0~2_combout\,
	ena => \inst50|counter[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|counter\(0));

-- Location: LCCOMB_X88_Y29_N16
\inst50|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~4_combout\ = (\inst50|Add0~3_combout\ & ((\inst50|counter\(1) & (!\inst50|Add0~1\)) # (!\inst50|counter\(1) & (\inst50|Add0~1\ & VCC)))) # (!\inst50|Add0~3_combout\ & ((\inst50|counter\(1) & ((\inst50|Add0~1\) # (GND))) # 
-- (!\inst50|counter\(1) & (!\inst50|Add0~1\))))
-- \inst50|Add0~5\ = CARRY((\inst50|Add0~3_combout\ & (\inst50|counter\(1) & !\inst50|Add0~1\)) # (!\inst50|Add0~3_combout\ & ((\inst50|counter\(1)) # (!\inst50|Add0~1\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Add0~3_combout\,
	datab => \inst50|counter\(1),
	datad => VCC,
	cin => \inst50|Add0~1\,
	combout => \inst50|Add0~4_combout\,
	cout => \inst50|Add0~5\);

-- Location: LCCOMB_X87_Y29_N22
\inst50|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~18_combout\ = (\DB1|s_key_prev~q\ & !\inst50|Add0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DB1|s_key_prev~q\,
	datad => \inst50|Add0~4_combout\,
	combout => \inst50|Add0~18_combout\);

-- Location: FF_X87_Y29_N23
\inst50|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|Add0~18_combout\,
	ena => \inst50|counter[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|counter\(1));

-- Location: LCCOMB_X88_Y29_N18
\inst50|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~6_combout\ = ((\inst50|Add0~3_combout\ $ (\inst50|counter\(2) $ (!\inst50|Add0~5\)))) # (GND)
-- \inst50|Add0~7\ = CARRY((\inst50|Add0~3_combout\ & ((\inst50|counter\(2)) # (!\inst50|Add0~5\))) # (!\inst50|Add0~3_combout\ & (\inst50|counter\(2) & !\inst50|Add0~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Add0~3_combout\,
	datab => \inst50|counter\(2),
	datad => VCC,
	cin => \inst50|Add0~5\,
	combout => \inst50|Add0~6_combout\,
	cout => \inst50|Add0~7\);

-- Location: LCCOMB_X87_Y29_N8
\inst50|Add0~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~17_combout\ = (\DB1|s_key_prev~q\ & \inst50|Add0~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DB1|s_key_prev~q\,
	datad => \inst50|Add0~6_combout\,
	combout => \inst50|Add0~17_combout\);

-- Location: FF_X87_Y29_N9
\inst50|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|Add0~17_combout\,
	ena => \inst50|counter[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|counter\(2));

-- Location: LCCOMB_X88_Y29_N20
\inst50|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~8_combout\ = (\inst50|Add0~3_combout\ & ((\inst50|counter\(3) & (!\inst50|Add0~7\)) # (!\inst50|counter\(3) & (\inst50|Add0~7\ & VCC)))) # (!\inst50|Add0~3_combout\ & ((\inst50|counter\(3) & ((\inst50|Add0~7\) # (GND))) # 
-- (!\inst50|counter\(3) & (!\inst50|Add0~7\))))
-- \inst50|Add0~9\ = CARRY((\inst50|Add0~3_combout\ & (\inst50|counter\(3) & !\inst50|Add0~7\)) # (!\inst50|Add0~3_combout\ & ((\inst50|counter\(3)) # (!\inst50|Add0~7\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Add0~3_combout\,
	datab => \inst50|counter\(3),
	datad => VCC,
	cin => \inst50|Add0~7\,
	combout => \inst50|Add0~8_combout\,
	cout => \inst50|Add0~9\);

-- Location: LCCOMB_X87_Y29_N2
\inst50|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~16_combout\ = (!\inst50|Add0~8_combout\ & \DB1|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|Add0~8_combout\,
	datad => \DB1|s_key_prev~q\,
	combout => \inst50|Add0~16_combout\);

-- Location: FF_X87_Y29_N3
\inst50|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|Add0~16_combout\,
	ena => \inst50|counter[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|counter\(3));

-- Location: LCCOMB_X88_Y29_N22
\inst50|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~10_combout\ = ((\inst50|Add0~3_combout\ $ (\inst50|counter\(4) $ (!\inst50|Add0~9\)))) # (GND)
-- \inst50|Add0~11\ = CARRY((\inst50|Add0~3_combout\ & ((\inst50|counter\(4)) # (!\inst50|Add0~9\))) # (!\inst50|Add0~3_combout\ & (\inst50|counter\(4) & !\inst50|Add0~9\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Add0~3_combout\,
	datab => \inst50|counter\(4),
	datad => VCC,
	cin => \inst50|Add0~9\,
	combout => \inst50|Add0~10_combout\,
	cout => \inst50|Add0~11\);

-- Location: LCCOMB_X88_Y29_N2
\inst50|Add0~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~15_combout\ = (\DB1|s_key_prev~q\ & \inst50|Add0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DB1|s_key_prev~q\,
	datac => \inst50|Add0~10_combout\,
	combout => \inst50|Add0~15_combout\);

-- Location: FF_X88_Y29_N3
\inst50|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|Add0~15_combout\,
	ena => \inst50|counter[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|counter\(4));

-- Location: LCCOMB_X88_Y29_N4
\inst50|btn_down_hold_time[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_down_hold_time[0]~6_combout\ = \inst50|btn_down_hold_time\(0) $ (VCC)
-- \inst50|btn_down_hold_time[0]~7\ = CARRY(\inst50|btn_down_hold_time\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|btn_down_hold_time\(0),
	datad => VCC,
	combout => \inst50|btn_down_hold_time[0]~6_combout\,
	cout => \inst50|btn_down_hold_time[0]~7\);

-- Location: FF_X88_Y29_N5
\inst50|btn_down_hold_time[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_down_hold_time[0]~6_combout\,
	sclr => \inst50|process_0~1_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_down_hold_time\(0));

-- Location: LCCOMB_X88_Y29_N6
\inst50|btn_down_hold_time[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_down_hold_time[1]~8_combout\ = (\inst50|btn_down_hold_time\(1) & (!\inst50|btn_down_hold_time[0]~7\)) # (!\inst50|btn_down_hold_time\(1) & ((\inst50|btn_down_hold_time[0]~7\) # (GND)))
-- \inst50|btn_down_hold_time[1]~9\ = CARRY((!\inst50|btn_down_hold_time[0]~7\) # (!\inst50|btn_down_hold_time\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|btn_down_hold_time\(1),
	datad => VCC,
	cin => \inst50|btn_down_hold_time[0]~7\,
	combout => \inst50|btn_down_hold_time[1]~8_combout\,
	cout => \inst50|btn_down_hold_time[1]~9\);

-- Location: FF_X88_Y29_N7
\inst50|btn_down_hold_time[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_down_hold_time[1]~8_combout\,
	sclr => \inst50|process_0~1_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_down_hold_time\(1));

-- Location: LCCOMB_X88_Y29_N8
\inst50|btn_down_hold_time[2]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_down_hold_time[2]~10_combout\ = (\inst50|btn_down_hold_time\(2) & (\inst50|btn_down_hold_time[1]~9\ $ (GND))) # (!\inst50|btn_down_hold_time\(2) & (!\inst50|btn_down_hold_time[1]~9\ & VCC))
-- \inst50|btn_down_hold_time[2]~11\ = CARRY((\inst50|btn_down_hold_time\(2) & !\inst50|btn_down_hold_time[1]~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst50|btn_down_hold_time\(2),
	datad => VCC,
	cin => \inst50|btn_down_hold_time[1]~9\,
	combout => \inst50|btn_down_hold_time[2]~10_combout\,
	cout => \inst50|btn_down_hold_time[2]~11\);

-- Location: FF_X88_Y29_N9
\inst50|btn_down_hold_time[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_down_hold_time[2]~10_combout\,
	sclr => \inst50|process_0~1_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_down_hold_time\(2));

-- Location: LCCOMB_X88_Y29_N10
\inst50|btn_down_hold_time[3]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_down_hold_time[3]~12_combout\ = (\inst50|btn_down_hold_time\(3) & (!\inst50|btn_down_hold_time[2]~11\)) # (!\inst50|btn_down_hold_time\(3) & ((\inst50|btn_down_hold_time[2]~11\) # (GND)))
-- \inst50|btn_down_hold_time[3]~13\ = CARRY((!\inst50|btn_down_hold_time[2]~11\) # (!\inst50|btn_down_hold_time\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst50|btn_down_hold_time\(3),
	datad => VCC,
	cin => \inst50|btn_down_hold_time[2]~11\,
	combout => \inst50|btn_down_hold_time[3]~12_combout\,
	cout => \inst50|btn_down_hold_time[3]~13\);

-- Location: FF_X88_Y29_N11
\inst50|btn_down_hold_time[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_down_hold_time[3]~12_combout\,
	sclr => \inst50|process_0~1_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_down_hold_time\(3));

-- Location: LCCOMB_X88_Y29_N12
\inst50|btn_down_hold_time[4]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|btn_down_hold_time[4]~14_combout\ = \inst50|btn_down_hold_time[3]~13\ $ (!\inst50|btn_down_hold_time\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst50|btn_down_hold_time\(4),
	cin => \inst50|btn_down_hold_time[3]~13\,
	combout => \inst50|btn_down_hold_time[4]~14_combout\);

-- Location: FF_X88_Y29_N13
\inst50|btn_down_hold_time[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|btn_down_hold_time[4]~14_combout\,
	sclr => \inst50|process_0~1_combout\,
	ena => \inst50|btn_down_hold_time[0]~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|btn_down_hold_time\(4));

-- Location: LCCOMB_X88_Y29_N30
\inst50|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|process_0~2_combout\ = (\inst50|btn_down_hold_time\(4)) # ((\inst50|btn_down_hold_time\(3) & ((\inst50|btn_down_hold_time\(1)) # (\inst50|btn_down_hold_time\(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|btn_down_hold_time\(1),
	datab => \inst50|btn_down_hold_time\(2),
	datac => \inst50|btn_down_hold_time\(3),
	datad => \inst50|btn_down_hold_time\(4),
	combout => \inst50|process_0~2_combout\);

-- Location: LCCOMB_X88_Y29_N0
\inst50|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|process_0~3_combout\ = (\inst50|process_0~2_combout\ & ((\inst50|counter\(5)) # ((\inst50|counter\(4)) # (!\inst50|LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(5),
	datab => \inst50|counter\(4),
	datac => \inst50|process_0~2_combout\,
	datad => \inst50|LessThan0~0_combout\,
	combout => \inst50|process_0~3_combout\);

-- Location: LCCOMB_X88_Y29_N26
\inst50|Add0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~3_combout\ = (\inst50|process_0~3_combout\) # ((\inst50|counter[0]~0_combout\ & ((\inst50|btn_up_prev~q\) # (\inst50|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|btn_up_prev~q\,
	datab => \inst50|process_0~3_combout\,
	datac => \inst50|counter[0]~0_combout\,
	datad => \inst50|process_0~0_combout\,
	combout => \inst50|Add0~3_combout\);

-- Location: LCCOMB_X88_Y29_N24
\inst50|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~12_combout\ = \inst50|Add0~3_combout\ $ (\inst50|counter\(5) $ (\inst50|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|Add0~3_combout\,
	datab => \inst50|counter\(5),
	cin => \inst50|Add0~11\,
	combout => \inst50|Add0~12_combout\);

-- Location: LCCOMB_X88_Y29_N28
\inst50|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|Add0~14_combout\ = (\DB1|s_key_prev~q\ & \inst50|Add0~12_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DB1|s_key_prev~q\,
	datad => \inst50|Add0~12_combout\,
	combout => \inst50|Add0~14_combout\);

-- Location: FF_X88_Y29_N29
\inst50|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \10Hz|pulse~clkctrl_outclk\,
	d => \inst50|Add0~14_combout\,
	ena => \inst50|counter[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|counter\(5));

-- Location: LCCOMB_X83_Y25_N12
\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \inst50|counter\(3) $ (GND)
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(!\inst50|counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(3),
	datad => VCC,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X83_Y25_N14
\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\inst50|counter\(4) & (\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\inst50|counter\(4) & 
-- (!\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\inst50|counter\(4) & !\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(4),
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X83_Y25_N16
\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\inst50|counter\(5) & (\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\inst50|counter\(5) & 
-- (!\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\inst50|counter\(5) & !\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(5),
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X83_Y25_N18
\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X83_Y25_N4
\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ = (!\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\);

-- Location: LCCOMB_X82_Y25_N28
\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ = (\inst50|counter\(5) & \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(5),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\);

-- Location: LCCOMB_X82_Y25_N30
\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\ = (\inst50|counter\(4) & \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(4),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\);

-- Location: LCCOMB_X82_Y25_N0
\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ & !\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\);

-- Location: LCCOMB_X82_Y25_N22
\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ = (!\inst50|counter\(3) & \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(3),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\);

-- Location: LCCOMB_X82_Y25_N4
\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ & !\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\);

-- Location: LCCOMB_X82_Y25_N26
\inst39|Mod1|auto_generated|divider|divider|StageOut[18]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\ = (\inst50|counter\(2) & !\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(2),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\);

-- Location: LCCOMB_X82_Y25_N20
\inst39|Mod1|auto_generated|divider|divider|StageOut[18]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\ = (\inst50|counter\(2) & \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(2),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\);

-- Location: LCCOMB_X82_Y25_N10
\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst39|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\) # (\inst39|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\)))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst39|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\) # (\inst39|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~31_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[18]~30_combout\,
	datad => VCC,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X82_Y25_N12
\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\)))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\ & 
-- !\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~28_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[19]~29_combout\,
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X82_Y25_N14
\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\)))))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~26_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[20]~27_combout\,
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X82_Y25_N16
\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (((\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\)))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ = CARRY((!\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\ & 
-- !\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~25_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[21]~24_combout\,
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\);

-- Location: LCCOMB_X82_Y25_N18
\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~7\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X82_Y25_N2
\inst39|Mod1|auto_generated|divider|divider|StageOut[28]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\inst50|counter\(5))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(5),
	datab => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\);

-- Location: LCCOMB_X81_Y25_N8
\inst39|Mod1|auto_generated|divider|divider|StageOut[28]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\ & !\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[4]~6_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\);

-- Location: LCCOMB_X81_Y25_N6
\inst39|Mod1|auto_generated|divider|divider|StageOut[27]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\);

-- Location: LCCOMB_X82_Y25_N8
\inst39|Mod1|auto_generated|divider|divider|StageOut[27]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (\inst50|counter\(4))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(4),
	datab => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\);

-- Location: LCCOMB_X82_Y25_N6
\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((!\inst50|counter\(3)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	datac => \inst50|counter\(3),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\);

-- Location: LCCOMB_X81_Y25_N24
\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\);

-- Location: LCCOMB_X81_Y25_N10
\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\);

-- Location: LCCOMB_X82_Y25_N24
\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ = (\inst50|counter\(2) & \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(2),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\);

-- Location: LCCOMB_X81_Y25_N26
\inst39|Mod1|auto_generated|divider|divider|StageOut[24]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\ = (!\inst50|counter\(1) & !\inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(1),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\);

-- Location: LCCOMB_X81_Y25_N0
\inst39|Mod1|auto_generated|divider|divider|StageOut[24]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\ = (!\inst50|counter\(1) & \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(1),
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\);

-- Location: LCCOMB_X81_Y25_N12
\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\ = (((\inst39|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\inst39|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\)))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ = CARRY((\inst39|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\) # (\inst39|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~33_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[24]~32_combout\,
	datad => VCC,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\);

-- Location: LCCOMB_X81_Y25_N14
\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (((\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\)))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ = CARRY((!\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\ & 
-- !\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~1\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\);

-- Location: LCCOMB_X81_Y25_N16
\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & (((\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((((\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))))
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ = CARRY((!\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~3\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\);

-- Location: LCCOMB_X81_Y25_N18
\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst39|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\ & 
-- !\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~35_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[27]~43_combout\,
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~5\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X81_Y25_N20
\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\ = CARRY((\inst39|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\) # ((\inst39|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\) # 
-- (!\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~42_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[28]~34_combout\,
	datad => VCC,
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	cout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\);

-- Location: LCCOMB_X81_Y25_N22
\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ = !\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[5]~9_cout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\);

-- Location: LCCOMB_X81_Y25_N2
\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\) # 
-- ((\inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~37_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[2]~2_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|StageOut[25]~38_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\);

-- Location: LCCOMB_X81_Y25_N4
\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (!\inst50|counter\(1))) # 
-- (!\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(1),
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[1]~0_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\);

-- Location: LCCOMB_X81_Y25_N28
\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ = (\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\) # 
-- ((\inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\ & (((\inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~44_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[26]~36_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[6]~10_combout\,
	datad => \inst39|Mod1|auto_generated|divider|divider|add_sub_5_result_int[3]~4_combout\,
	combout => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\);

-- Location: LCCOMB_X70_Y1_N18
\inst42|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|Mux0~0_combout\ = (\inst50|counter\(0) & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\) # (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\)))) # (!\inst50|counter\(0) & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datad => \inst50|counter\(0),
	combout => \inst42|Mux0~0_combout\);

-- Location: LCCOMB_X59_Y2_N8
\1Hz|Add0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~1_cout\ = CARRY((\10Hz|s_cnt\(1) & \10Hz|s_cnt\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \10Hz|s_cnt\(1),
	datab => \10Hz|s_cnt\(0),
	datad => VCC,
	cout => \1Hz|Add0~1_cout\);

-- Location: LCCOMB_X59_Y2_N10
\1Hz|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~2_combout\ = (\1Hz|s_cnt\(2) & (!\1Hz|Add0~1_cout\)) # (!\1Hz|s_cnt\(2) & ((\1Hz|Add0~1_cout\) # (GND)))
-- \1Hz|Add0~3\ = CARRY((!\1Hz|Add0~1_cout\) # (!\1Hz|s_cnt\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(2),
	datad => VCC,
	cin => \1Hz|Add0~1_cout\,
	combout => \1Hz|Add0~2_combout\,
	cout => \1Hz|Add0~3\);

-- Location: FF_X59_Y2_N11
\1Hz|s_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(2));

-- Location: LCCOMB_X59_Y2_N12
\1Hz|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~4_combout\ = (\1Hz|s_cnt\(3) & (\1Hz|Add0~3\ $ (GND))) # (!\1Hz|s_cnt\(3) & (!\1Hz|Add0~3\ & VCC))
-- \1Hz|Add0~5\ = CARRY((\1Hz|s_cnt\(3) & !\1Hz|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(3),
	datad => VCC,
	cin => \1Hz|Add0~3\,
	combout => \1Hz|Add0~4_combout\,
	cout => \1Hz|Add0~5\);

-- Location: FF_X59_Y2_N13
\1Hz|s_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(3));

-- Location: LCCOMB_X59_Y2_N14
\1Hz|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~6_combout\ = (\1Hz|s_cnt\(4) & (!\1Hz|Add0~5\)) # (!\1Hz|s_cnt\(4) & ((\1Hz|Add0~5\) # (GND)))
-- \1Hz|Add0~7\ = CARRY((!\1Hz|Add0~5\) # (!\1Hz|s_cnt\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(4),
	datad => VCC,
	cin => \1Hz|Add0~5\,
	combout => \1Hz|Add0~6_combout\,
	cout => \1Hz|Add0~7\);

-- Location: FF_X59_Y2_N15
\1Hz|s_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(4));

-- Location: LCCOMB_X59_Y2_N16
\1Hz|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~8_combout\ = (\1Hz|s_cnt\(5) & (\1Hz|Add0~7\ $ (GND))) # (!\1Hz|s_cnt\(5) & (!\1Hz|Add0~7\ & VCC))
-- \1Hz|Add0~9\ = CARRY((\1Hz|s_cnt\(5) & !\1Hz|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(5),
	datad => VCC,
	cin => \1Hz|Add0~7\,
	combout => \1Hz|Add0~8_combout\,
	cout => \1Hz|Add0~9\);

-- Location: FF_X59_Y2_N17
\1Hz|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \1Hz|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \1Hz|s_cnt\(5));

-- Location: LCCOMB_X59_Y2_N18
\1Hz|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~10_combout\ = (\1Hz|s_cnt\(6) & (!\1Hz|Add0~9\)) # (!\1Hz|s_cnt\(6) & ((\1Hz|Add0~9\) # (GND)))
-- \1Hz|Add0~11\ = CARRY((!\1Hz|Add0~9\) # (!\1Hz|s_cnt\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(6),
	datad => VCC,
	cin => \1Hz|Add0~9\,
	combout => \1Hz|Add0~10_combout\,
	cout => \1Hz|Add0~11\);

-- Location: FF_X59_Y2_N19
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

-- Location: LCCOMB_X59_Y2_N20
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

-- Location: LCCOMB_X59_Y2_N0
\1Hz|s_cnt~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~5_combout\ = (\1Hz|Add0~12_combout\ & !\1Hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Add0~12_combout\,
	datad => \1Hz|Equal0~7_combout\,
	combout => \1Hz|s_cnt~5_combout\);

-- Location: FF_X59_Y2_N1
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

-- Location: LCCOMB_X59_Y2_N6
\1Hz|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~3_combout\ = (\1Hz|s_cnt\(5) & (\1Hz|s_cnt\(6) & (\1Hz|s_cnt\(4) & !\1Hz|s_cnt\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(5),
	datab => \1Hz|s_cnt\(6),
	datac => \1Hz|s_cnt\(4),
	datad => \1Hz|s_cnt\(7),
	combout => \1Hz|Equal0~3_combout\);

-- Location: LCCOMB_X59_Y2_N22
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

-- Location: FF_X59_Y2_N23
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

-- Location: LCCOMB_X59_Y2_N24
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

-- Location: FF_X59_Y2_N25
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

-- Location: LCCOMB_X59_Y2_N26
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

-- Location: FF_X59_Y2_N27
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

-- Location: LCCOMB_X59_Y2_N28
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

-- Location: FF_X59_Y2_N29
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

-- Location: LCCOMB_X59_Y2_N2
\1Hz|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~2_combout\ = (!\1Hz|s_cnt\(10) & (!\1Hz|s_cnt\(9) & (!\1Hz|s_cnt\(8) & !\1Hz|s_cnt\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(10),
	datab => \1Hz|s_cnt\(9),
	datac => \1Hz|s_cnt\(8),
	datad => \1Hz|s_cnt\(11),
	combout => \1Hz|Equal0~2_combout\);

-- Location: LCCOMB_X59_Y2_N30
\1Hz|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~22_combout\ = (\1Hz|s_cnt\(12) & (!\1Hz|Add0~21\)) # (!\1Hz|s_cnt\(12) & ((\1Hz|Add0~21\) # (GND)))
-- \1Hz|Add0~23\ = CARRY((!\1Hz|Add0~21\) # (!\1Hz|s_cnt\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(12),
	datad => VCC,
	cin => \1Hz|Add0~21\,
	combout => \1Hz|Add0~22_combout\,
	cout => \1Hz|Add0~23\);

-- Location: LCCOMB_X59_Y2_N4
\1Hz|s_cnt~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~4_combout\ = (\1Hz|Add0~22_combout\ & !\1Hz|Equal0~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Add0~22_combout\,
	datad => \1Hz|Equal0~7_combout\,
	combout => \1Hz|s_cnt~4_combout\);

-- Location: FF_X59_Y2_N5
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

-- Location: LCCOMB_X59_Y1_N0
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

-- Location: LCCOMB_X58_Y1_N26
\1Hz|s_cnt~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~3_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~7_combout\,
	datac => \1Hz|Add0~24_combout\,
	combout => \1Hz|s_cnt~3_combout\);

-- Location: FF_X58_Y1_N27
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

-- Location: LCCOMB_X59_Y1_N2
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

-- Location: LCCOMB_X58_Y1_N6
\1Hz|s_cnt~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~2_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~26_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	datad => \1Hz|Add0~26_combout\,
	combout => \1Hz|s_cnt~2_combout\);

-- Location: FF_X58_Y1_N7
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

-- Location: LCCOMB_X59_Y1_N4
\1Hz|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~28_combout\ = (\1Hz|s_cnt\(15) & (\1Hz|Add0~27\ $ (GND))) # (!\1Hz|s_cnt\(15) & (!\1Hz|Add0~27\ & VCC))
-- \1Hz|Add0~29\ = CARRY((\1Hz|s_cnt\(15) & !\1Hz|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(15),
	datad => VCC,
	cin => \1Hz|Add0~27\,
	combout => \1Hz|Add0~28_combout\,
	cout => \1Hz|Add0~29\);

-- Location: LCCOMB_X58_Y1_N14
\1Hz|s_cnt~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~1_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~28_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	datad => \1Hz|Add0~28_combout\,
	combout => \1Hz|s_cnt~1_combout\);

-- Location: FF_X58_Y1_N15
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

-- Location: LCCOMB_X59_Y1_N6
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

-- Location: FF_X59_Y1_N7
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

-- Location: LCCOMB_X59_Y1_N8
\1Hz|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~32_combout\ = (\1Hz|s_cnt\(17) & (\1Hz|Add0~31\ $ (GND))) # (!\1Hz|s_cnt\(17) & (!\1Hz|Add0~31\ & VCC))
-- \1Hz|Add0~33\ = CARRY((\1Hz|s_cnt\(17) & !\1Hz|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(17),
	datad => VCC,
	cin => \1Hz|Add0~31\,
	combout => \1Hz|Add0~32_combout\,
	cout => \1Hz|Add0~33\);

-- Location: LCCOMB_X58_Y1_N18
\1Hz|s_cnt~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~0_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~32_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~7_combout\,
	datac => \1Hz|Add0~32_combout\,
	combout => \1Hz|s_cnt~0_combout\);

-- Location: FF_X58_Y1_N19
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

-- Location: LCCOMB_X59_Y1_N10
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

-- Location: FF_X59_Y1_N11
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

-- Location: LCCOMB_X59_Y1_N12
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

-- Location: LCCOMB_X59_Y1_N26
\1Hz|s_cnt~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~6_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~36_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	datad => \1Hz|Add0~36_combout\,
	combout => \1Hz|s_cnt~6_combout\);

-- Location: FF_X59_Y1_N27
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

-- Location: LCCOMB_X59_Y1_N14
\1Hz|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~38_combout\ = (\1Hz|s_cnt\(20) & (!\1Hz|Add0~37\)) # (!\1Hz|s_cnt\(20) & ((\1Hz|Add0~37\) # (GND)))
-- \1Hz|Add0~39\ = CARRY((!\1Hz|Add0~37\) # (!\1Hz|s_cnt\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(20),
	datad => VCC,
	cin => \1Hz|Add0~37\,
	combout => \1Hz|Add0~38_combout\,
	cout => \1Hz|Add0~39\);

-- Location: LCCOMB_X58_Y1_N12
\1Hz|s_cnt~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~7_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~38_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|Equal0~7_combout\,
	datac => \1Hz|Add0~38_combout\,
	combout => \1Hz|s_cnt~7_combout\);

-- Location: FF_X58_Y1_N13
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

-- Location: LCCOMB_X59_Y1_N16
\1Hz|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~40_combout\ = (\1Hz|s_cnt\(21) & (\1Hz|Add0~39\ $ (GND))) # (!\1Hz|s_cnt\(21) & (!\1Hz|Add0~39\ & VCC))
-- \1Hz|Add0~41\ = CARRY((\1Hz|s_cnt\(21) & !\1Hz|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(21),
	datad => VCC,
	cin => \1Hz|Add0~39\,
	combout => \1Hz|Add0~40_combout\,
	cout => \1Hz|Add0~41\);

-- Location: LCCOMB_X58_Y1_N16
\1Hz|s_cnt~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~8_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~40_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	datad => \1Hz|Add0~40_combout\,
	combout => \1Hz|s_cnt~8_combout\);

-- Location: FF_X58_Y1_N17
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

-- Location: LCCOMB_X59_Y1_N18
\1Hz|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~42_combout\ = (\1Hz|s_cnt\(22) & (!\1Hz|Add0~41\)) # (!\1Hz|s_cnt\(22) & ((\1Hz|Add0~41\) # (GND)))
-- \1Hz|Add0~43\ = CARRY((!\1Hz|Add0~41\) # (!\1Hz|s_cnt\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \1Hz|s_cnt\(22),
	datad => VCC,
	cin => \1Hz|Add0~41\,
	combout => \1Hz|Add0~42_combout\,
	cout => \1Hz|Add0~43\);

-- Location: LCCOMB_X58_Y1_N22
\1Hz|s_cnt~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~9_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~42_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	datad => \1Hz|Add0~42_combout\,
	combout => \1Hz|s_cnt~9_combout\);

-- Location: FF_X58_Y1_N23
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

-- Location: LCCOMB_X59_Y1_N20
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

-- Location: LCCOMB_X59_Y1_N28
\1Hz|s_cnt~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~10_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~44_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	datad => \1Hz|Add0~44_combout\,
	combout => \1Hz|s_cnt~10_combout\);

-- Location: FF_X59_Y1_N29
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

-- Location: LCCOMB_X59_Y1_N22
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

-- Location: FF_X59_Y1_N23
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

-- Location: LCCOMB_X59_Y1_N24
\1Hz|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Add0~48_combout\ = \1Hz|s_cnt\(25) $ (!\1Hz|Add0~47\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(25),
	cin => \1Hz|Add0~47\,
	combout => \1Hz|Add0~48_combout\);

-- Location: LCCOMB_X59_Y1_N30
\1Hz|s_cnt~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|s_cnt~11_combout\ = (!\1Hz|Equal0~7_combout\ & \1Hz|Add0~48_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	datad => \1Hz|Add0~48_combout\,
	combout => \1Hz|s_cnt~11_combout\);

-- Location: FF_X59_Y1_N31
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

-- Location: LCCOMB_X58_Y1_N30
\1Hz|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~4_combout\ = (\1Hz|s_cnt\(3) & (!\1Hz|s_cnt\(18) & (\1Hz|s_cnt\(2) & \1Hz|s_cnt\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(3),
	datab => \1Hz|s_cnt\(18),
	datac => \1Hz|s_cnt\(2),
	datad => \1Hz|s_cnt\(19),
	combout => \1Hz|Equal0~4_combout\);

-- Location: LCCOMB_X58_Y1_N10
\1Hz|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~5_combout\ = (\1Hz|s_cnt\(20) & (\1Hz|s_cnt\(21) & (\1Hz|s_cnt\(22) & \1Hz|s_cnt\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(20),
	datab => \1Hz|s_cnt\(21),
	datac => \1Hz|s_cnt\(22),
	datad => \1Hz|s_cnt\(23),
	combout => \1Hz|Equal0~5_combout\);

-- Location: LCCOMB_X58_Y1_N8
\1Hz|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~6_combout\ = (\1Hz|s_cnt\(25) & (!\1Hz|s_cnt\(24) & (\1Hz|Equal0~4_combout\ & \1Hz|Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(25),
	datab => \1Hz|s_cnt\(24),
	datac => \1Hz|Equal0~4_combout\,
	datad => \1Hz|Equal0~5_combout\,
	combout => \1Hz|Equal0~6_combout\);

-- Location: LCCOMB_X58_Y1_N2
\1Hz|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~0_combout\ = (\1Hz|s_cnt\(14) & (\1Hz|s_cnt\(15) & (\1Hz|s_cnt\(13) & \1Hz|s_cnt\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(14),
	datab => \1Hz|s_cnt\(15),
	datac => \1Hz|s_cnt\(13),
	datad => \1Hz|s_cnt\(12),
	combout => \1Hz|Equal0~0_combout\);

-- Location: LCCOMB_X58_Y1_N24
\1Hz|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~1_combout\ = (!\1Hz|s_cnt\(16) & (\1Hz|s_cnt\(17) & (\10Hz|Equal0~0_combout\ & \1Hz|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|s_cnt\(16),
	datab => \1Hz|s_cnt\(17),
	datac => \10Hz|Equal0~0_combout\,
	datad => \1Hz|Equal0~0_combout\,
	combout => \1Hz|Equal0~1_combout\);

-- Location: LCCOMB_X58_Y1_N4
\1Hz|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|Equal0~7_combout\ = (\1Hz|Equal0~3_combout\ & (\1Hz|Equal0~2_combout\ & (\1Hz|Equal0~6_combout\ & \1Hz|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \1Hz|Equal0~3_combout\,
	datab => \1Hz|Equal0~2_combout\,
	datac => \1Hz|Equal0~6_combout\,
	datad => \1Hz|Equal0~1_combout\,
	combout => \1Hz|Equal0~7_combout\);

-- Location: LCCOMB_X58_Y1_N20
\1Hz|pulse~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \1Hz|pulse~feeder_combout\ = \1Hz|Equal0~7_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \1Hz|Equal0~7_combout\,
	combout => \1Hz|pulse~feeder_combout\);

-- Location: FF_X58_Y1_N21
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

-- Location: LCCOMB_X58_Y1_N28
\inst50|s_blink~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst50|s_blink~0_combout\ = !\inst50|s_blink~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|s_blink~q\,
	combout => \inst50|s_blink~0_combout\);

-- Location: FF_X58_Y1_N29
\inst50|s_blink\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \1Hz|pulse~q\,
	d => \inst50|s_blink~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst50|s_blink~q\);

-- Location: LCCOMB_X70_Y1_N24
\inst42|decOut_n[6]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|decOut_n[6]~14_combout\ = ((\inst50|s_blink~q\) # (!\SW[0]~input_o\)) # (!\inst42|Mux0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst42|Mux0~0_combout\,
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \inst42|decOut_n[6]~14_combout\);

-- Location: LCCOMB_X70_Y1_N16
\inst42|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|Mux1~0_combout\ = (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst50|counter\(0) & (\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ $ 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & 
-- ((\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # (\inst50|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010110100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datad => \inst50|counter\(0),
	combout => \inst42|Mux1~0_combout\);

-- Location: LCCOMB_X70_Y1_N14
\inst42|decOut_n[5]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|decOut_n[5]~15_combout\ = (\inst42|Mux1~0_combout\) # ((\inst50|s_blink~q\) # (!\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst42|Mux1~0_combout\,
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \inst42|decOut_n[5]~15_combout\);

-- Location: LCCOMB_X70_Y1_N2
\inst42|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|Mux2~0_combout\ = (\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (((!\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & \inst50|counter\(0))))) # 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\)) # 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\inst50|counter\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datad => \inst50|counter\(0),
	combout => \inst42|Mux2~0_combout\);

-- Location: LCCOMB_X70_Y1_N8
\inst42|decOut_n[4]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|decOut_n[4]~16_combout\ = (\inst42|Mux2~0_combout\) # ((\inst50|s_blink~q\) # (!\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst42|Mux2~0_combout\,
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \inst42|decOut_n[4]~16_combout\);

-- Location: LCCOMB_X70_Y1_N20
\inst42|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|Mux3~0_combout\ = (\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & ((\inst50|counter\(0)))) # 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & !\inst50|counter\(0))))) # (!\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ $ (\inst50|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datad => \inst50|counter\(0),
	combout => \inst42|Mux3~0_combout\);

-- Location: LCCOMB_X70_Y1_N6
\inst42|decOut_n[3]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|decOut_n[3]~17_combout\ = (\inst42|Mux3~0_combout\) # ((\inst50|s_blink~q\) # (!\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst42|Mux3~0_combout\,
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \inst42|decOut_n[3]~17_combout\);

-- Location: LCCOMB_X70_Y1_N30
\inst42|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|Mux4~0_combout\ = (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\) # 
-- (!\inst50|counter\(0))))) # (!\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ & 
-- !\inst50|counter\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datad => \inst50|counter\(0),
	combout => \inst42|Mux4~0_combout\);

-- Location: LCCOMB_X70_Y1_N4
\inst42|decOut_n[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|decOut_n[2]~18_combout\ = (\inst42|Mux4~0_combout\) # ((\inst50|s_blink~q\) # (!\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst42|Mux4~0_combout\,
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \inst42|decOut_n[2]~18_combout\);

-- Location: LCCOMB_X70_Y1_N12
\inst42|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|Mux5~0_combout\ = (\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & ((\inst50|counter\(0) & ((\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\))) # (!\inst50|counter\(0) & 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\)))) # (!\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & 
-- (\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ (\inst50|counter\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datad => \inst50|counter\(0),
	combout => \inst42|Mux5~0_combout\);

-- Location: LCCOMB_X70_Y1_N26
\inst42|decOut_n[1]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|decOut_n[1]~19_combout\ = (\inst42|Mux5~0_combout\) # ((\inst50|s_blink~q\) # (!\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst42|Mux5~0_combout\,
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \inst42|decOut_n[1]~19_combout\);

-- Location: LCCOMB_X70_Y1_N22
\inst42|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|Mux6~0_combout\ = (\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (!\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ & (\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\ $ 
-- (!\inst50|counter\(0))))) # (!\inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\ & (\inst50|counter\(0) & (\inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\ $ 
-- (!\inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Mod1|auto_generated|divider|divider|StageOut[32]~40_combout\,
	datab => \inst39|Mod1|auto_generated|divider|divider|StageOut[31]~39_combout\,
	datac => \inst39|Mod1|auto_generated|divider|divider|StageOut[33]~41_combout\,
	datad => \inst50|counter\(0),
	combout => \inst42|Mux6~0_combout\);

-- Location: LCCOMB_X70_Y1_N0
\inst42|decOut_n[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst42|decOut_n[0]~20_combout\ = (\inst42|Mux6~0_combout\) # ((\inst50|s_blink~q\) # (!\SW[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst42|Mux6~0_combout\,
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \inst42|decOut_n[0]~20_combout\);

-- Location: LCCOMB_X82_Y26_N24
\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\ = \inst50|counter\(3) $ (GND)
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ = CARRY(!\inst50|counter\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(3),
	datad => VCC,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\);

-- Location: LCCOMB_X82_Y26_N26
\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\ = (\inst50|counter\(4) & (\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\ & VCC)) # (!\inst50|counter\(4) & 
-- (!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ = CARRY((!\inst50|counter\(4) & !\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst50|counter\(4),
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~1\,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\);

-- Location: LCCOMB_X82_Y26_N28
\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\ = (\inst50|counter\(5) & (\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ $ (GND))) # (!\inst50|counter\(5) & 
-- (!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\ & VCC))
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\ = CARRY((\inst50|counter\(5) & !\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(5),
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~3\,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\);

-- Location: LCCOMB_X82_Y26_N30
\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ = !\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~5\,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\);

-- Location: LCCOMB_X82_Y26_N12
\inst39|Div0|auto_generated|divider|divider|StageOut[18]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst50|counter\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst50|counter\(5),
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\);

-- Location: LCCOMB_X82_Y26_N2
\inst39|Div0|auto_generated|divider|divider|StageOut[18]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ = (!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[3]~4_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\);

-- Location: LCCOMB_X81_Y26_N16
\inst39|Div0|auto_generated|divider|divider|StageOut[17]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\ = (!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\);

-- Location: LCCOMB_X82_Y26_N8
\inst39|Div0|auto_generated|divider|divider|StageOut[17]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst50|counter\(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst50|counter\(4),
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\);

-- Location: LCCOMB_X82_Y26_N10
\inst39|Div0|auto_generated|divider|divider|StageOut[16]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ = (!\inst50|counter\(3) & \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(3),
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\);

-- Location: LCCOMB_X82_Y26_N0
\inst39|Div0|auto_generated|divider|divider|StageOut[16]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ = (!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\);

-- Location: LCCOMB_X81_Y26_N26
\inst39|Div0|auto_generated|divider|divider|StageOut[15]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\ = (\inst50|counter\(2) & !\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(2),
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\);

-- Location: LCCOMB_X81_Y26_N18
\inst39|Div0|auto_generated|divider|divider|StageOut[15]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\ = (\inst50|counter\(2) & \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst50|counter\(2),
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\);

-- Location: LCCOMB_X82_Y26_N14
\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ = (((\inst39|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\) # (\inst39|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\)))
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ = CARRY((\inst39|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\) # (\inst39|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[15]~23_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[15]~22_combout\,
	datad => VCC,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\);

-- Location: LCCOMB_X82_Y26_N16
\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (((\inst39|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\) # 
-- (\inst39|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\)))) # (!\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\ & (!\inst39|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & 
-- (!\inst39|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\)))
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ = CARRY((!\inst39|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\ & (!\inst39|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\ & 
-- !\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[16]~20_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[16]~21_combout\,
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~1\,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\);

-- Location: LCCOMB_X82_Y26_N18
\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & (((\inst39|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst39|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))) # (!\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((((\inst39|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst39|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\)))))
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\ = CARRY((!\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\ & ((\inst39|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\) # 
-- (\inst39|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000100001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[17]~19_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[17]~18_combout\,
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~3\,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\);

-- Location: LCCOMB_X82_Y26_N20
\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\ = CARRY((!\inst39|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\ & (!\inst39|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\ & 
-- !\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[18]~16_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[18]~17_combout\,
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~5\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\);

-- Location: LCCOMB_X82_Y26_N22
\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ = \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[4]~7_cout\,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\);

-- Location: LCCOMB_X82_Y26_N6
\inst39|Div0|auto_generated|divider|divider|StageOut[23]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- ((\inst50|counter\(4)))) # (!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[2]~2_combout\,
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst50|counter\(4),
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\);

-- Location: LCCOMB_X81_Y26_N20
\inst39|Div0|auto_generated|divider|divider|StageOut[23]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\ & !\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[3]~4_combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\);

-- Location: LCCOMB_X82_Y26_N4
\inst39|Div0|auto_generated|divider|divider|StageOut[22]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & 
-- (!\inst50|counter\(3))) # (!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & ((\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst50|counter\(3),
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[1]~0_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\);

-- Location: LCCOMB_X81_Y26_N14
\inst39|Div0|auto_generated|divider|divider|StageOut[22]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\ & !\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[2]~2_combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\);

-- Location: LCCOMB_X81_Y26_N30
\inst39|Div0|auto_generated|divider|divider|StageOut[21]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ = (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\ & !\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[1]~0_combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\);

-- Location: LCCOMB_X81_Y26_N28
\inst39|Div0|auto_generated|divider|divider|StageOut[21]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ = (\inst50|counter\(2) & \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(2),
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\);

-- Location: LCCOMB_X81_Y26_N22
\inst39|Div0|auto_generated|divider|divider|StageOut[20]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\ = (!\inst50|counter\(1) & !\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(1),
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\);

-- Location: LCCOMB_X81_Y26_N24
\inst39|Div0|auto_generated|divider|divider|StageOut[20]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\ = (!\inst50|counter\(1) & \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|counter\(1),
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	combout => \inst39|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\);

-- Location: LCCOMB_X81_Y26_N4
\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\ = CARRY((\inst39|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\) # (\inst39|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[20]~29_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[20]~28_combout\,
	datad => VCC,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\);

-- Location: LCCOMB_X81_Y26_N6
\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ = CARRY((!\inst39|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\ & (!\inst39|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\ & 
-- !\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[21]~27_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[21]~26_combout\,
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[1]~1_cout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\);

-- Location: LCCOMB_X81_Y26_N8
\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\ = CARRY((!\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\ & ((\inst39|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\) # 
-- (\inst39|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[22]~31_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[22]~25_combout\,
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[2]~3_cout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\);

-- Location: LCCOMB_X81_Y26_N10
\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\ = CARRY((!\inst39|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\ & (!\inst39|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\ & 
-- !\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|StageOut[23]~30_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|StageOut[23]~24_combout\,
	datad => VCC,
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[3]~5_cout\,
	cout => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\);

-- Location: LCCOMB_X81_Y26_N12
\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ = \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[4]~7_cout\,
	combout => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\);

-- Location: LCCOMB_X70_Y1_N28
\and\ : cycloneive_lcell_comb
-- Equation(s):
-- \and~combout\ = (!\inst50|s_blink~q\ & \SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst50|s_blink~q\,
	datad => \SW[0]~input_o\,
	combout => \and~combout\);

-- Location: LCCOMB_X74_Y22_N0
\inst41|decOut_n[6]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|decOut_n[6]~0_combout\ = ((\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # 
-- (!\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & !\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # 
-- (!\and~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \and~combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|decOut_n[6]~0_combout\);

-- Location: LCCOMB_X74_Y22_N26
\inst41|decOut_n[5]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|decOut_n[5]~1_combout\ = ((\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # (!\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & ((\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\) # 
-- (!\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # (!\and~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \and~combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|decOut_n[5]~1_combout\);

-- Location: LCCOMB_X74_Y22_N12
\inst41|decOut_n[4]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|decOut_n[4]~2_combout\ = (((\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & !\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)) # (!\and~combout\)) # 
-- (!\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \and~combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|decOut_n[4]~2_combout\);

-- Location: LCCOMB_X74_Y22_N22
\inst41|decOut_n[3]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|decOut_n[3]~3_combout\ = ((\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # (!\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (!\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- !\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # (!\and~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111110011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \and~combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|decOut_n[3]~3_combout\);

-- Location: LCCOMB_X74_Y22_N4
\inst41|decOut_n[2]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|decOut_n[2]~4_combout\ = ((!\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ & 
-- \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\))) # (!\and~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \and~combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|decOut_n[2]~4_combout\);

-- Location: LCCOMB_X74_Y22_N2
\inst41|decOut_n[1]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|decOut_n[1]~5_combout\ = ((!\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\ & (\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ $ 
-- (\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\)))) # (!\and~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111101101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \and~combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|decOut_n[1]~5_combout\);

-- Location: LCCOMB_X74_Y22_N24
\inst41|decOut_n[0]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst41|decOut_n[0]~6_combout\ = ((\inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\ & (\inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\ $ 
-- (\inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\)))) # (!\and~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst39|Div0|auto_generated|divider|divider|add_sub_4_result_int[5]~8_combout\,
	datab => \inst39|Div0|auto_generated|divider|divider|add_sub_5_result_int[5]~8_combout\,
	datac => \and~combout\,
	datad => \inst39|Div0|auto_generated|divider|divider|add_sub_3_result_int[4]~6_combout\,
	combout => \inst41|decOut_n[0]~6_combout\);

-- Location: LCCOMB_X76_Y69_N0
\pulse|s_cnt[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[0]~16_combout\ = \pulse|s_cnt\(0) $ (VCC)
-- \pulse|s_cnt[0]~17\ = CARRY(\pulse|s_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(0),
	datad => VCC,
	combout => \pulse|s_cnt[0]~16_combout\,
	cout => \pulse|s_cnt[0]~17\);

-- Location: LCCOMB_X77_Y69_N18
\pulse|s_cnt[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[2]~18_combout\ = (!\pulse|Equal0~4_combout\) # (!\DB1|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DB1|s_key_prev~q\,
	datad => \pulse|Equal0~4_combout\,
	combout => \pulse|s_cnt[2]~18_combout\);

-- Location: FF_X76_Y69_N1
\pulse|s_cnt[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[0]~16_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(0));

-- Location: LCCOMB_X76_Y69_N2
\pulse|s_cnt[1]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[1]~19_combout\ = (\pulse|s_cnt\(1) & (!\pulse|s_cnt[0]~17\)) # (!\pulse|s_cnt\(1) & ((\pulse|s_cnt[0]~17\) # (GND)))
-- \pulse|s_cnt[1]~20\ = CARRY((!\pulse|s_cnt[0]~17\) # (!\pulse|s_cnt\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(1),
	datad => VCC,
	cin => \pulse|s_cnt[0]~17\,
	combout => \pulse|s_cnt[1]~19_combout\,
	cout => \pulse|s_cnt[1]~20\);

-- Location: FF_X76_Y69_N3
\pulse|s_cnt[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[1]~19_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(1));

-- Location: LCCOMB_X76_Y69_N4
\pulse|s_cnt[2]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[2]~21_combout\ = (\pulse|s_cnt\(2) & (\pulse|s_cnt[1]~20\ $ (GND))) # (!\pulse|s_cnt\(2) & (!\pulse|s_cnt[1]~20\ & VCC))
-- \pulse|s_cnt[2]~22\ = CARRY((\pulse|s_cnt\(2) & !\pulse|s_cnt[1]~20\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(2),
	datad => VCC,
	cin => \pulse|s_cnt[1]~20\,
	combout => \pulse|s_cnt[2]~21_combout\,
	cout => \pulse|s_cnt[2]~22\);

-- Location: FF_X76_Y69_N5
\pulse|s_cnt[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[2]~21_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(2));

-- Location: LCCOMB_X76_Y69_N6
\pulse|s_cnt[3]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[3]~23_combout\ = (\pulse|s_cnt\(3) & (!\pulse|s_cnt[2]~22\)) # (!\pulse|s_cnt\(3) & ((\pulse|s_cnt[2]~22\) # (GND)))
-- \pulse|s_cnt[3]~24\ = CARRY((!\pulse|s_cnt[2]~22\) # (!\pulse|s_cnt\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(3),
	datad => VCC,
	cin => \pulse|s_cnt[2]~22\,
	combout => \pulse|s_cnt[3]~23_combout\,
	cout => \pulse|s_cnt[3]~24\);

-- Location: FF_X76_Y69_N7
\pulse|s_cnt[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[3]~23_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(3));

-- Location: LCCOMB_X76_Y69_N8
\pulse|s_cnt[4]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[4]~25_combout\ = (\pulse|s_cnt\(4) & (\pulse|s_cnt[3]~24\ $ (GND))) # (!\pulse|s_cnt\(4) & (!\pulse|s_cnt[3]~24\ & VCC))
-- \pulse|s_cnt[4]~26\ = CARRY((\pulse|s_cnt\(4) & !\pulse|s_cnt[3]~24\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(4),
	datad => VCC,
	cin => \pulse|s_cnt[3]~24\,
	combout => \pulse|s_cnt[4]~25_combout\,
	cout => \pulse|s_cnt[4]~26\);

-- Location: FF_X76_Y69_N9
\pulse|s_cnt[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[4]~25_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(4));

-- Location: LCCOMB_X76_Y69_N10
\pulse|s_cnt[5]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[5]~27_combout\ = (\pulse|s_cnt\(5) & (!\pulse|s_cnt[4]~26\)) # (!\pulse|s_cnt\(5) & ((\pulse|s_cnt[4]~26\) # (GND)))
-- \pulse|s_cnt[5]~28\ = CARRY((!\pulse|s_cnt[4]~26\) # (!\pulse|s_cnt\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(5),
	datad => VCC,
	cin => \pulse|s_cnt[4]~26\,
	combout => \pulse|s_cnt[5]~27_combout\,
	cout => \pulse|s_cnt[5]~28\);

-- Location: FF_X76_Y69_N11
\pulse|s_cnt[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[5]~27_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(5));

-- Location: LCCOMB_X76_Y69_N12
\pulse|s_cnt[6]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[6]~29_combout\ = (\pulse|s_cnt\(6) & (\pulse|s_cnt[5]~28\ $ (GND))) # (!\pulse|s_cnt\(6) & (!\pulse|s_cnt[5]~28\ & VCC))
-- \pulse|s_cnt[6]~30\ = CARRY((\pulse|s_cnt\(6) & !\pulse|s_cnt[5]~28\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(6),
	datad => VCC,
	cin => \pulse|s_cnt[5]~28\,
	combout => \pulse|s_cnt[6]~29_combout\,
	cout => \pulse|s_cnt[6]~30\);

-- Location: FF_X76_Y69_N13
\pulse|s_cnt[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[6]~29_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(6));

-- Location: LCCOMB_X76_Y69_N14
\pulse|s_cnt[7]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[7]~31_combout\ = (\pulse|s_cnt\(7) & (!\pulse|s_cnt[6]~30\)) # (!\pulse|s_cnt\(7) & ((\pulse|s_cnt[6]~30\) # (GND)))
-- \pulse|s_cnt[7]~32\ = CARRY((!\pulse|s_cnt[6]~30\) # (!\pulse|s_cnt\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(7),
	datad => VCC,
	cin => \pulse|s_cnt[6]~30\,
	combout => \pulse|s_cnt[7]~31_combout\,
	cout => \pulse|s_cnt[7]~32\);

-- Location: FF_X77_Y69_N29
\pulse|s_cnt[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \pulse|s_cnt[7]~31_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(7));

-- Location: LCCOMB_X76_Y69_N16
\pulse|s_cnt[8]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[8]~33_combout\ = (\pulse|s_cnt\(8) & (\pulse|s_cnt[7]~32\ $ (GND))) # (!\pulse|s_cnt\(8) & (!\pulse|s_cnt[7]~32\ & VCC))
-- \pulse|s_cnt[8]~34\ = CARRY((\pulse|s_cnt\(8) & !\pulse|s_cnt[7]~32\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(8),
	datad => VCC,
	cin => \pulse|s_cnt[7]~32\,
	combout => \pulse|s_cnt[8]~33_combout\,
	cout => \pulse|s_cnt[8]~34\);

-- Location: FF_X77_Y69_N15
\pulse|s_cnt[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	asdata => \pulse|s_cnt[8]~33_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(8));

-- Location: LCCOMB_X76_Y69_N18
\pulse|s_cnt[9]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[9]~35_combout\ = (\pulse|s_cnt\(9) & (!\pulse|s_cnt[8]~34\)) # (!\pulse|s_cnt\(9) & ((\pulse|s_cnt[8]~34\) # (GND)))
-- \pulse|s_cnt[9]~36\ = CARRY((!\pulse|s_cnt[8]~34\) # (!\pulse|s_cnt\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(9),
	datad => VCC,
	cin => \pulse|s_cnt[8]~34\,
	combout => \pulse|s_cnt[9]~35_combout\,
	cout => \pulse|s_cnt[9]~36\);

-- Location: FF_X76_Y69_N19
\pulse|s_cnt[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[9]~35_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(9));

-- Location: LCCOMB_X76_Y69_N20
\pulse|s_cnt[10]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[10]~37_combout\ = (\pulse|s_cnt\(10) & (\pulse|s_cnt[9]~36\ $ (GND))) # (!\pulse|s_cnt\(10) & (!\pulse|s_cnt[9]~36\ & VCC))
-- \pulse|s_cnt[10]~38\ = CARRY((\pulse|s_cnt\(10) & !\pulse|s_cnt[9]~36\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(10),
	datad => VCC,
	cin => \pulse|s_cnt[9]~36\,
	combout => \pulse|s_cnt[10]~37_combout\,
	cout => \pulse|s_cnt[10]~38\);

-- Location: FF_X76_Y69_N21
\pulse|s_cnt[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[10]~37_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(10));

-- Location: LCCOMB_X76_Y69_N22
\pulse|s_cnt[11]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[11]~39_combout\ = (\pulse|s_cnt\(11) & (!\pulse|s_cnt[10]~38\)) # (!\pulse|s_cnt\(11) & ((\pulse|s_cnt[10]~38\) # (GND)))
-- \pulse|s_cnt[11]~40\ = CARRY((!\pulse|s_cnt[10]~38\) # (!\pulse|s_cnt\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(11),
	datad => VCC,
	cin => \pulse|s_cnt[10]~38\,
	combout => \pulse|s_cnt[11]~39_combout\,
	cout => \pulse|s_cnt[11]~40\);

-- Location: FF_X76_Y69_N23
\pulse|s_cnt[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[11]~39_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(11));

-- Location: LCCOMB_X77_Y69_N26
\pulse|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~2_combout\ = (\pulse|s_cnt\(10)) # ((\pulse|s_cnt\(11)) # ((!\pulse|s_cnt\(9)) # (!\pulse|s_cnt\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(10),
	datab => \pulse|s_cnt\(11),
	datac => \pulse|s_cnt\(8),
	datad => \pulse|s_cnt\(9),
	combout => \pulse|Equal0~2_combout\);

-- Location: LCCOMB_X77_Y69_N24
\pulse|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~1_combout\ = ((\pulse|s_cnt\(7)) # ((\pulse|s_cnt\(5)) # (\pulse|s_cnt\(4)))) # (!\pulse|s_cnt\(6))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(6),
	datab => \pulse|s_cnt\(7),
	datac => \pulse|s_cnt\(5),
	datad => \pulse|s_cnt\(4),
	combout => \pulse|Equal0~1_combout\);

-- Location: LCCOMB_X76_Y69_N24
\pulse|s_cnt[12]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[12]~41_combout\ = (\pulse|s_cnt\(12) & (\pulse|s_cnt[11]~40\ $ (GND))) # (!\pulse|s_cnt\(12) & (!\pulse|s_cnt[11]~40\ & VCC))
-- \pulse|s_cnt[12]~42\ = CARRY((\pulse|s_cnt\(12) & !\pulse|s_cnt[11]~40\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(12),
	datad => VCC,
	cin => \pulse|s_cnt[11]~40\,
	combout => \pulse|s_cnt[12]~41_combout\,
	cout => \pulse|s_cnt[12]~42\);

-- Location: FF_X76_Y69_N25
\pulse|s_cnt[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[12]~41_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(12));

-- Location: LCCOMB_X76_Y69_N26
\pulse|s_cnt[13]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[13]~43_combout\ = (\pulse|s_cnt\(13) & (!\pulse|s_cnt[12]~42\)) # (!\pulse|s_cnt\(13) & ((\pulse|s_cnt[12]~42\) # (GND)))
-- \pulse|s_cnt[13]~44\ = CARRY((!\pulse|s_cnt[12]~42\) # (!\pulse|s_cnt\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(13),
	datad => VCC,
	cin => \pulse|s_cnt[12]~42\,
	combout => \pulse|s_cnt[13]~43_combout\,
	cout => \pulse|s_cnt[13]~44\);

-- Location: FF_X76_Y69_N27
\pulse|s_cnt[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[13]~43_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(13));

-- Location: LCCOMB_X76_Y69_N28
\pulse|s_cnt[14]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[14]~45_combout\ = (\pulse|s_cnt\(14) & (\pulse|s_cnt[13]~44\ $ (GND))) # (!\pulse|s_cnt\(14) & (!\pulse|s_cnt[13]~44\ & VCC))
-- \pulse|s_cnt[14]~46\ = CARRY((\pulse|s_cnt\(14) & !\pulse|s_cnt[13]~44\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \pulse|s_cnt\(14),
	datad => VCC,
	cin => \pulse|s_cnt[13]~44\,
	combout => \pulse|s_cnt[14]~45_combout\,
	cout => \pulse|s_cnt[14]~46\);

-- Location: FF_X76_Y69_N29
\pulse|s_cnt[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[14]~45_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(14));

-- Location: LCCOMB_X76_Y69_N30
\pulse|s_cnt[15]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|s_cnt[15]~47_combout\ = \pulse|s_cnt\(15) $ (\pulse|s_cnt[14]~46\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(15),
	cin => \pulse|s_cnt[14]~46\,
	combout => \pulse|s_cnt[15]~47_combout\);

-- Location: FF_X76_Y69_N31
\pulse|s_cnt[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|s_cnt[15]~47_combout\,
	sclr => \pulse|s_cnt[2]~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|s_cnt\(15));

-- Location: LCCOMB_X77_Y69_N8
\pulse|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~3_combout\ = (\pulse|s_cnt\(13)) # ((\pulse|s_cnt\(12)) # ((!\pulse|s_cnt\(15)) # (!\pulse|s_cnt\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(13),
	datab => \pulse|s_cnt\(12),
	datac => \pulse|s_cnt\(14),
	datad => \pulse|s_cnt\(15),
	combout => \pulse|Equal0~3_combout\);

-- Location: LCCOMB_X77_Y69_N12
\pulse|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~0_combout\ = (((!\pulse|s_cnt\(1)) # (!\pulse|s_cnt\(2))) # (!\pulse|s_cnt\(3))) # (!\pulse|s_cnt\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|s_cnt\(0),
	datab => \pulse|s_cnt\(3),
	datac => \pulse|s_cnt\(2),
	datad => \pulse|s_cnt\(1),
	combout => \pulse|Equal0~0_combout\);

-- Location: LCCOMB_X77_Y69_N10
\pulse|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|Equal0~4_combout\ = (\pulse|Equal0~2_combout\) # ((\pulse|Equal0~1_combout\) # ((\pulse|Equal0~3_combout\) # (\pulse|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \pulse|Equal0~2_combout\,
	datab => \pulse|Equal0~1_combout\,
	datac => \pulse|Equal0~3_combout\,
	datad => \pulse|Equal0~0_combout\,
	combout => \pulse|Equal0~4_combout\);

-- Location: LCCOMB_X77_Y69_N22
\pulse|pulse~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \pulse|pulse~0_combout\ = (\DB1|s_key_prev~q\ & !\pulse|Equal0~4_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DB1|s_key_prev~q\,
	datad => \pulse|Equal0~4_combout\,
	combout => \pulse|pulse~0_combout\);

-- Location: FF_X77_Y69_N23
\pulse|pulse\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \pulse|pulse~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \pulse|pulse~q\);

-- Location: CLKCTRL_G10
\pulse|pulse~clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \pulse|pulse~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \pulse|pulse~clkctrl_outclk\);

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

-- Location: LCCOMB_X84_Y63_N0
\inst14|s_key_prev~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst14|s_key_prev~feeder_combout\ = \KEY[1]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \KEY[1]~input_o\,
	combout => \inst14|s_key_prev~feeder_combout\);

-- Location: FF_X84_Y63_N1
\inst14|s_key_prev\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst14|s_key_prev~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst14|s_key_prev~q\);

-- Location: LCCOMB_X82_Y63_N0
\inst7|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~0_combout\ = \inst7|temp\(0) $ (VCC)
-- \inst7|Add0~1\ = CARRY(\inst7|temp\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(0),
	datad => VCC,
	combout => \inst7|Add0~0_combout\,
	cout => \inst7|Add0~1\);

-- Location: LCCOMB_X81_Y63_N6
\inst7|Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~9_combout\ = (!\inst7|temp\(4) & (!\inst7|temp\(3) & (!\inst7|temp\(1) & !\inst7|temp\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(4),
	datab => \inst7|temp\(3),
	datac => \inst7|temp\(1),
	datad => \inst7|temp\(2),
	combout => \inst7|Equal0~9_combout\);

-- Location: LCCOMB_X82_Y63_N10
\inst7|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~10_combout\ = (\inst7|temp\(5) & ((\inst7|Add0~9\) # (GND))) # (!\inst7|temp\(5) & (!\inst7|Add0~9\))
-- \inst7|Add0~11\ = CARRY((\inst7|temp\(5)) # (!\inst7|Add0~9\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(5),
	datad => VCC,
	cin => \inst7|Add0~9\,
	combout => \inst7|Add0~10_combout\,
	cout => \inst7|Add0~11\);

-- Location: LCCOMB_X82_Y63_N12
\inst7|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~12_combout\ = (\inst7|temp\(6) & (!\inst7|Add0~11\ & VCC)) # (!\inst7|temp\(6) & (\inst7|Add0~11\ $ (GND)))
-- \inst7|Add0~13\ = CARRY((!\inst7|temp\(6) & !\inst7|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(6),
	datad => VCC,
	cin => \inst7|Add0~11\,
	combout => \inst7|Add0~12_combout\,
	cout => \inst7|Add0~13\);

-- Location: LCCOMB_X83_Y63_N6
\inst7|temp~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp~2_combout\ = \inst7|Add0~12_combout\ $ (!\inst7|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~12_combout\,
	datad => \inst7|Equal0~10_combout\,
	combout => \inst7|temp~2_combout\);

-- Location: FF_X83_Y63_N7
\inst7|temp[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp~2_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(6));

-- Location: LCCOMB_X82_Y63_N14
\inst7|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~14_combout\ = (\inst7|temp\(7) & ((\inst7|Add0~13\) # (GND))) # (!\inst7|temp\(7) & (!\inst7|Add0~13\))
-- \inst7|Add0~15\ = CARRY((\inst7|temp\(7)) # (!\inst7|Add0~13\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(7),
	datad => VCC,
	cin => \inst7|Add0~13\,
	combout => \inst7|Add0~14_combout\,
	cout => \inst7|Add0~15\);

-- Location: LCCOMB_X83_Y63_N28
\inst7|temp[7]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp[7]~6_combout\ = !\inst7|Add0~14_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst7|Add0~14_combout\,
	combout => \inst7|temp[7]~6_combout\);

-- Location: FF_X83_Y63_N29
\inst7|temp[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp[7]~6_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(7));

-- Location: LCCOMB_X82_Y63_N16
\inst7|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~16_combout\ = (\inst7|temp\(8) & (!\inst7|Add0~15\ & VCC)) # (!\inst7|temp\(8) & (\inst7|Add0~15\ $ (GND)))
-- \inst7|Add0~17\ = CARRY((!\inst7|temp\(8) & !\inst7|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101000000101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(8),
	datad => VCC,
	cin => \inst7|Add0~15\,
	combout => \inst7|Add0~16_combout\,
	cout => \inst7|Add0~17\);

-- Location: LCCOMB_X83_Y63_N20
\inst7|temp[8]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp[8]~8_combout\ = !\inst7|Add0~16_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst7|Add0~16_combout\,
	combout => \inst7|temp[8]~8_combout\);

-- Location: FF_X83_Y63_N21
\inst7|temp[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp[8]~8_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(8));

-- Location: LCCOMB_X82_Y63_N18
\inst7|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~18_combout\ = (\inst7|temp\(9) & ((\inst7|Add0~17\) # (GND))) # (!\inst7|temp\(9) & (!\inst7|Add0~17\))
-- \inst7|Add0~19\ = CARRY((\inst7|temp\(9)) # (!\inst7|Add0~17\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(9),
	datad => VCC,
	cin => \inst7|Add0~17\,
	combout => \inst7|Add0~18_combout\,
	cout => \inst7|Add0~19\);

-- Location: LCCOMB_X83_Y63_N30
\inst7|temp[9]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp[9]~9_combout\ = !\inst7|Add0~18_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst7|Add0~18_combout\,
	combout => \inst7|temp[9]~9_combout\);

-- Location: FF_X83_Y63_N31
\inst7|temp[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp[9]~9_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(9));

-- Location: LCCOMB_X82_Y63_N20
\inst7|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~20_combout\ = (\inst7|temp\(10) & (\inst7|Add0~19\ $ (GND))) # (!\inst7|temp\(10) & (!\inst7|Add0~19\ & VCC))
-- \inst7|Add0~21\ = CARRY((\inst7|temp\(10) & !\inst7|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(10),
	datad => VCC,
	cin => \inst7|Add0~19\,
	combout => \inst7|Add0~20_combout\,
	cout => \inst7|Add0~21\);

-- Location: FF_X82_Y63_N21
\inst7|temp[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~20_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(10));

-- Location: LCCOMB_X82_Y63_N22
\inst7|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~22_combout\ = (\inst7|temp\(11) & (!\inst7|Add0~21\)) # (!\inst7|temp\(11) & ((\inst7|Add0~21\) # (GND)))
-- \inst7|Add0~23\ = CARRY((!\inst7|Add0~21\) # (!\inst7|temp\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(11),
	datad => VCC,
	cin => \inst7|Add0~21\,
	combout => \inst7|Add0~22_combout\,
	cout => \inst7|Add0~23\);

-- Location: FF_X82_Y63_N23
\inst7|temp[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~22_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(11));

-- Location: LCCOMB_X82_Y63_N24
\inst7|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~24_combout\ = (\inst7|temp\(12) & (\inst7|Add0~23\ $ (GND))) # (!\inst7|temp\(12) & (!\inst7|Add0~23\ & VCC))
-- \inst7|Add0~25\ = CARRY((\inst7|temp\(12) & !\inst7|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(12),
	datad => VCC,
	cin => \inst7|Add0~23\,
	combout => \inst7|Add0~24_combout\,
	cout => \inst7|Add0~25\);

-- Location: LCCOMB_X83_Y63_N4
\inst7|temp~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp~3_combout\ = (!\inst7|Equal0~10_combout\ & \inst7|Add0~24_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7|Equal0~10_combout\,
	datad => \inst7|Add0~24_combout\,
	combout => \inst7|temp~3_combout\);

-- Location: FF_X83_Y63_N5
\inst7|temp[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp~3_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(12));

-- Location: LCCOMB_X81_Y63_N30
\inst7|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~6_combout\ = (!\inst7|temp\(10) & (!\inst7|temp\(9) & (\inst7|temp\(12) & !\inst7|temp\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(10),
	datab => \inst7|temp\(9),
	datac => \inst7|temp\(12),
	datad => \inst7|temp\(11),
	combout => \inst7|Equal0~6_combout\);

-- Location: LCCOMB_X82_Y63_N26
\inst7|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~26_combout\ = (\inst7|temp\(13) & (!\inst7|Add0~25\)) # (!\inst7|temp\(13) & ((\inst7|Add0~25\) # (GND)))
-- \inst7|Add0~27\ = CARRY((!\inst7|Add0~25\) # (!\inst7|temp\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(13),
	datad => VCC,
	cin => \inst7|Add0~25\,
	combout => \inst7|Add0~26_combout\,
	cout => \inst7|Add0~27\);

-- Location: FF_X82_Y63_N27
\inst7|temp[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~26_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(13));

-- Location: LCCOMB_X82_Y63_N28
\inst7|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~28_combout\ = (\inst7|temp\(14) & (\inst7|Add0~27\ $ (GND))) # (!\inst7|temp\(14) & (!\inst7|Add0~27\ & VCC))
-- \inst7|Add0~29\ = CARRY((\inst7|temp\(14) & !\inst7|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(14),
	datad => VCC,
	cin => \inst7|Add0~27\,
	combout => \inst7|Add0~28_combout\,
	cout => \inst7|Add0~29\);

-- Location: FF_X82_Y63_N29
\inst7|temp[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~28_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(14));

-- Location: LCCOMB_X81_Y63_N8
\inst7|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~5_combout\ = (!\inst7|temp\(14) & !\inst7|temp\(13))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(14),
	datad => \inst7|temp\(13),
	combout => \inst7|Equal0~5_combout\);

-- Location: LCCOMB_X82_Y63_N30
\inst7|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~30_combout\ = (\inst7|temp\(15) & (!\inst7|Add0~29\)) # (!\inst7|temp\(15) & ((\inst7|Add0~29\) # (GND)))
-- \inst7|Add0~31\ = CARRY((!\inst7|Add0~29\) # (!\inst7|temp\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(15),
	datad => VCC,
	cin => \inst7|Add0~29\,
	combout => \inst7|Add0~30_combout\,
	cout => \inst7|Add0~31\);

-- Location: FF_X82_Y63_N31
\inst7|temp[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~30_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(15));

-- Location: LCCOMB_X82_Y62_N0
\inst7|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~32_combout\ = (\inst7|temp\(16) & (\inst7|Add0~31\ $ (GND))) # (!\inst7|temp\(16) & (!\inst7|Add0~31\ & VCC))
-- \inst7|Add0~33\ = CARRY((\inst7|temp\(16) & !\inst7|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(16),
	datad => VCC,
	cin => \inst7|Add0~31\,
	combout => \inst7|Add0~32_combout\,
	cout => \inst7|Add0~33\);

-- Location: FF_X82_Y62_N1
\inst7|temp[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~32_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(16));

-- Location: LCCOMB_X81_Y63_N28
\inst7|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~7_combout\ = (\inst7|Equal0~6_combout\ & (\inst7|Equal0~5_combout\ & (!\inst7|temp\(15) & !\inst7|temp\(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Equal0~6_combout\,
	datab => \inst7|Equal0~5_combout\,
	datac => \inst7|temp\(15),
	datad => \inst7|temp\(16),
	combout => \inst7|Equal0~7_combout\);

-- Location: LCCOMB_X83_Y63_N26
\inst7|Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~8_combout\ = (!\inst7|temp\(8) & (\inst7|temp\(5) & (\inst7|temp\(6) & !\inst7|temp\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(8),
	datab => \inst7|temp\(5),
	datac => \inst7|temp\(6),
	datad => \inst7|temp\(7),
	combout => \inst7|Equal0~8_combout\);

-- Location: LCCOMB_X82_Y62_N2
\inst7|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~34_combout\ = (\inst7|temp\(17) & (!\inst7|Add0~33\)) # (!\inst7|temp\(17) & ((\inst7|Add0~33\) # (GND)))
-- \inst7|Add0~35\ = CARRY((!\inst7|Add0~33\) # (!\inst7|temp\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(17),
	datad => VCC,
	cin => \inst7|Add0~33\,
	combout => \inst7|Add0~34_combout\,
	cout => \inst7|Add0~35\);

-- Location: FF_X82_Y62_N3
\inst7|temp[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~34_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(17));

-- Location: LCCOMB_X82_Y62_N4
\inst7|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~36_combout\ = (\inst7|temp\(18) & (\inst7|Add0~35\ $ (GND))) # (!\inst7|temp\(18) & (!\inst7|Add0~35\ & VCC))
-- \inst7|Add0~37\ = CARRY((\inst7|temp\(18) & !\inst7|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(18),
	datad => VCC,
	cin => \inst7|Add0~35\,
	combout => \inst7|Add0~36_combout\,
	cout => \inst7|Add0~37\);

-- Location: FF_X82_Y62_N5
\inst7|temp[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~36_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(18));

-- Location: LCCOMB_X82_Y62_N6
\inst7|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~38_combout\ = (\inst7|temp\(19) & (!\inst7|Add0~37\)) # (!\inst7|temp\(19) & ((\inst7|Add0~37\) # (GND)))
-- \inst7|Add0~39\ = CARRY((!\inst7|Add0~37\) # (!\inst7|temp\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(19),
	datad => VCC,
	cin => \inst7|Add0~37\,
	combout => \inst7|Add0~38_combout\,
	cout => \inst7|Add0~39\);

-- Location: FF_X82_Y62_N7
\inst7|temp[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~38_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(19));

-- Location: LCCOMB_X82_Y62_N8
\inst7|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~40_combout\ = (\inst7|temp\(20) & (\inst7|Add0~39\ $ (GND))) # (!\inst7|temp\(20) & (!\inst7|Add0~39\ & VCC))
-- \inst7|Add0~41\ = CARRY((\inst7|temp\(20) & !\inst7|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(20),
	datad => VCC,
	cin => \inst7|Add0~39\,
	combout => \inst7|Add0~40_combout\,
	cout => \inst7|Add0~41\);

-- Location: FF_X82_Y62_N9
\inst7|temp[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~40_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(20));

-- Location: LCCOMB_X82_Y62_N10
\inst7|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~42_combout\ = (\inst7|temp\(21) & (!\inst7|Add0~41\)) # (!\inst7|temp\(21) & ((\inst7|Add0~41\) # (GND)))
-- \inst7|Add0~43\ = CARRY((!\inst7|Add0~41\) # (!\inst7|temp\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(21),
	datad => VCC,
	cin => \inst7|Add0~41\,
	combout => \inst7|Add0~42_combout\,
	cout => \inst7|Add0~43\);

-- Location: FF_X82_Y62_N11
\inst7|temp[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~42_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(21));

-- Location: LCCOMB_X82_Y62_N12
\inst7|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~44_combout\ = (\inst7|temp\(22) & (\inst7|Add0~43\ $ (GND))) # (!\inst7|temp\(22) & (!\inst7|Add0~43\ & VCC))
-- \inst7|Add0~45\ = CARRY((\inst7|temp\(22) & !\inst7|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(22),
	datad => VCC,
	cin => \inst7|Add0~43\,
	combout => \inst7|Add0~44_combout\,
	cout => \inst7|Add0~45\);

-- Location: FF_X82_Y62_N13
\inst7|temp[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~44_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(22));

-- Location: LCCOMB_X82_Y62_N14
\inst7|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~46_combout\ = (\inst7|temp\(23) & (!\inst7|Add0~45\)) # (!\inst7|temp\(23) & ((\inst7|Add0~45\) # (GND)))
-- \inst7|Add0~47\ = CARRY((!\inst7|Add0~45\) # (!\inst7|temp\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(23),
	datad => VCC,
	cin => \inst7|Add0~45\,
	combout => \inst7|Add0~46_combout\,
	cout => \inst7|Add0~47\);

-- Location: FF_X82_Y62_N15
\inst7|temp[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~46_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(23));

-- Location: LCCOMB_X82_Y62_N16
\inst7|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~48_combout\ = (\inst7|temp\(24) & (\inst7|Add0~47\ $ (GND))) # (!\inst7|temp\(24) & (!\inst7|Add0~47\ & VCC))
-- \inst7|Add0~49\ = CARRY((\inst7|temp\(24) & !\inst7|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(24),
	datad => VCC,
	cin => \inst7|Add0~47\,
	combout => \inst7|Add0~48_combout\,
	cout => \inst7|Add0~49\);

-- Location: FF_X82_Y62_N17
\inst7|temp[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~48_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(24));

-- Location: LCCOMB_X82_Y62_N18
\inst7|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~50_combout\ = (\inst7|temp\(25) & (!\inst7|Add0~49\)) # (!\inst7|temp\(25) & ((\inst7|Add0~49\) # (GND)))
-- \inst7|Add0~51\ = CARRY((!\inst7|Add0~49\) # (!\inst7|temp\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(25),
	datad => VCC,
	cin => \inst7|Add0~49\,
	combout => \inst7|Add0~50_combout\,
	cout => \inst7|Add0~51\);

-- Location: FF_X82_Y62_N19
\inst7|temp[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~50_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(25));

-- Location: LCCOMB_X82_Y62_N20
\inst7|Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~52_combout\ = (\inst7|temp\(26) & (\inst7|Add0~51\ $ (GND))) # (!\inst7|temp\(26) & (!\inst7|Add0~51\ & VCC))
-- \inst7|Add0~53\ = CARRY((\inst7|temp\(26) & !\inst7|Add0~51\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(26),
	datad => VCC,
	cin => \inst7|Add0~51\,
	combout => \inst7|Add0~52_combout\,
	cout => \inst7|Add0~53\);

-- Location: FF_X82_Y62_N21
\inst7|temp[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~52_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(26));

-- Location: LCCOMB_X82_Y62_N22
\inst7|Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~54_combout\ = (\inst7|temp\(27) & (!\inst7|Add0~53\)) # (!\inst7|temp\(27) & ((\inst7|Add0~53\) # (GND)))
-- \inst7|Add0~55\ = CARRY((!\inst7|Add0~53\) # (!\inst7|temp\(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(27),
	datad => VCC,
	cin => \inst7|Add0~53\,
	combout => \inst7|Add0~54_combout\,
	cout => \inst7|Add0~55\);

-- Location: FF_X82_Y62_N23
\inst7|temp[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~54_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(27));

-- Location: LCCOMB_X82_Y62_N24
\inst7|Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~56_combout\ = (\inst7|temp\(28) & (\inst7|Add0~55\ $ (GND))) # (!\inst7|temp\(28) & (!\inst7|Add0~55\ & VCC))
-- \inst7|Add0~57\ = CARRY((\inst7|temp\(28) & !\inst7|Add0~55\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(28),
	datad => VCC,
	cin => \inst7|Add0~55\,
	combout => \inst7|Add0~56_combout\,
	cout => \inst7|Add0~57\);

-- Location: FF_X82_Y62_N25
\inst7|temp[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~56_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(28));

-- Location: LCCOMB_X82_Y62_N26
\inst7|Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~58_combout\ = (\inst7|temp\(29) & (!\inst7|Add0~57\)) # (!\inst7|temp\(29) & ((\inst7|Add0~57\) # (GND)))
-- \inst7|Add0~59\ = CARRY((!\inst7|Add0~57\) # (!\inst7|temp\(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(29),
	datad => VCC,
	cin => \inst7|Add0~57\,
	combout => \inst7|Add0~58_combout\,
	cout => \inst7|Add0~59\);

-- Location: FF_X82_Y62_N27
\inst7|temp[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~58_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(29));

-- Location: LCCOMB_X82_Y62_N28
\inst7|Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~60_combout\ = (\inst7|temp\(30) & (\inst7|Add0~59\ $ (GND))) # (!\inst7|temp\(30) & (!\inst7|Add0~59\ & VCC))
-- \inst7|Add0~61\ = CARRY((\inst7|temp\(30) & !\inst7|Add0~59\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(30),
	datad => VCC,
	cin => \inst7|Add0~59\,
	combout => \inst7|Add0~60_combout\,
	cout => \inst7|Add0~61\);

-- Location: FF_X82_Y62_N29
\inst7|temp[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~60_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(30));

-- Location: LCCOMB_X82_Y62_N30
\inst7|Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~62_combout\ = \inst7|temp\(31) $ (\inst7|Add0~61\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(31),
	cin => \inst7|Add0~61\,
	combout => \inst7|Add0~62_combout\);

-- Location: FF_X82_Y62_N31
\inst7|temp[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~62_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(31));

-- Location: LCCOMB_X81_Y63_N12
\inst7|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~0_combout\ = (!\inst7|temp\(30) & (!\inst7|temp\(31) & (!\inst7|temp\(29) & !\inst7|temp\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(30),
	datab => \inst7|temp\(31),
	datac => \inst7|temp\(29),
	datad => \inst7|temp\(0),
	combout => \inst7|Equal0~0_combout\);

-- Location: LCCOMB_X81_Y62_N0
\inst7|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~3_combout\ = (!\inst7|temp\(18) & (!\inst7|temp\(20) & (!\inst7|temp\(19) & !\inst7|temp\(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(18),
	datab => \inst7|temp\(20),
	datac => \inst7|temp\(19),
	datad => \inst7|temp\(17),
	combout => \inst7|Equal0~3_combout\);

-- Location: LCCOMB_X81_Y62_N4
\inst7|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~1_combout\ = (!\inst7|temp\(26) & (!\inst7|temp\(27) & (!\inst7|temp\(28) & !\inst7|temp\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(26),
	datab => \inst7|temp\(27),
	datac => \inst7|temp\(28),
	datad => \inst7|temp\(25),
	combout => \inst7|Equal0~1_combout\);

-- Location: LCCOMB_X81_Y62_N18
\inst7|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~2_combout\ = (!\inst7|temp\(21) & (!\inst7|temp\(22) & (!\inst7|temp\(23) & !\inst7|temp\(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|temp\(21),
	datab => \inst7|temp\(22),
	datac => \inst7|temp\(23),
	datad => \inst7|temp\(24),
	combout => \inst7|Equal0~2_combout\);

-- Location: LCCOMB_X81_Y63_N2
\inst7|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~4_combout\ = (\inst7|Equal0~0_combout\ & (\inst7|Equal0~3_combout\ & (\inst7|Equal0~1_combout\ & \inst7|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Equal0~0_combout\,
	datab => \inst7|Equal0~3_combout\,
	datac => \inst7|Equal0~1_combout\,
	datad => \inst7|Equal0~2_combout\,
	combout => \inst7|Equal0~4_combout\);

-- Location: LCCOMB_X81_Y63_N4
\inst7|Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Equal0~10_combout\ = (\inst7|Equal0~9_combout\ & (\inst7|Equal0~7_combout\ & (\inst7|Equal0~8_combout\ & \inst7|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Equal0~9_combout\,
	datab => \inst7|Equal0~7_combout\,
	datac => \inst7|Equal0~8_combout\,
	datad => \inst7|Equal0~4_combout\,
	combout => \inst7|Equal0~10_combout\);

-- Location: LCCOMB_X83_Y63_N2
\inst7|temp~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp~0_combout\ = (\inst7|Add0~0_combout\ & !\inst7|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7|Add0~0_combout\,
	datad => \inst7|Equal0~10_combout\,
	combout => \inst7|temp~0_combout\);

-- Location: FF_X83_Y63_N3
\inst7|temp[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp~0_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(0));

-- Location: LCCOMB_X82_Y63_N2
\inst7|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~2_combout\ = (\inst7|temp\(1) & (!\inst7|Add0~1\)) # (!\inst7|temp\(1) & ((\inst7|Add0~1\) # (GND)))
-- \inst7|Add0~3\ = CARRY((!\inst7|Add0~1\) # (!\inst7|temp\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(1),
	datad => VCC,
	cin => \inst7|Add0~1\,
	combout => \inst7|Add0~2_combout\,
	cout => \inst7|Add0~3\);

-- Location: FF_X82_Y63_N3
\inst7|temp[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~2_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(1));

-- Location: LCCOMB_X82_Y63_N4
\inst7|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~4_combout\ = (\inst7|temp\(2) & (\inst7|Add0~3\ $ (GND))) # (!\inst7|temp\(2) & (!\inst7|Add0~3\ & VCC))
-- \inst7|Add0~5\ = CARRY((\inst7|temp\(2) & !\inst7|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(2),
	datad => VCC,
	cin => \inst7|Add0~3\,
	combout => \inst7|Add0~4_combout\,
	cout => \inst7|Add0~5\);

-- Location: FF_X82_Y63_N5
\inst7|temp[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~4_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(2));

-- Location: LCCOMB_X82_Y63_N6
\inst7|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~6_combout\ = (\inst7|temp\(3) & ((\inst7|Add0~5\) # (GND))) # (!\inst7|temp\(3) & (!\inst7|Add0~5\))
-- \inst7|Add0~7\ = CARRY((\inst7|temp\(3)) # (!\inst7|Add0~5\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(3),
	datad => VCC,
	cin => \inst7|Add0~5\,
	combout => \inst7|Add0~6_combout\,
	cout => \inst7|Add0~7\);

-- Location: LCCOMB_X83_Y63_N8
\inst7|temp[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp[3]~4_combout\ = !\inst7|Add0~6_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst7|Add0~6_combout\,
	combout => \inst7|temp[3]~4_combout\);

-- Location: FF_X83_Y63_N9
\inst7|temp[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp[3]~4_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(3));

-- Location: LCCOMB_X82_Y63_N8
\inst7|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|Add0~8_combout\ = (\inst7|temp\(4) & (\inst7|Add0~7\ $ (GND))) # (!\inst7|temp\(4) & (!\inst7|Add0~7\ & VCC))
-- \inst7|Add0~9\ = CARRY((\inst7|temp\(4) & !\inst7|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(4),
	datad => VCC,
	cin => \inst7|Add0~7\,
	combout => \inst7|Add0~8_combout\,
	cout => \inst7|Add0~9\);

-- Location: FF_X82_Y63_N9
\inst7|temp[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|Add0~8_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(4));

-- Location: LCCOMB_X83_Y63_N14
\inst7|temp~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst7|temp~1_combout\ = \inst7|Add0~10_combout\ $ (!\inst7|Equal0~10_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|Add0~10_combout\,
	datad => \inst7|Equal0~10_combout\,
	combout => \inst7|temp~1_combout\);

-- Location: FF_X83_Y63_N15
\inst7|temp[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst7|temp~1_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|temp\(5));

-- Location: LCCOMB_X83_Y63_N10
\don|Don[5]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Don[5]~2_combout\ = !\inst7|temp\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst7|temp\(5),
	combout => \don|Don[5]~2_combout\);

-- Location: LCCOMB_X84_Y63_N6
\don|state.idle~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|state.idle~0_combout\ = (\inst14|s_key_prev~q\ & (\don|state.idle~q\)) # (!\inst14|s_key_prev~q\ & ((!\don|state.enable~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|state.idle~q\,
	datab => \inst14|s_key_prev~q\,
	datad => \don|state.enable~q\,
	combout => \don|state.idle~0_combout\);

-- Location: FF_X83_Y63_N13
\don|state.idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \don|state.idle~0_combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|state.idle~q\);

-- Location: LCCOMB_X84_Y63_N2
\don|Don[12]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Don[12]~0_combout\ = (!\don|state.idle~q\ & (!\inst14|s_key_prev~q\ & \DB1|s_key_prev~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|state.idle~q\,
	datab => \inst14|s_key_prev~q\,
	datad => \DB1|s_key_prev~q\,
	combout => \don|Don[12]~0_combout\);

-- Location: FF_X84_Y63_N11
\don|Don[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \don|Don[5]~2_combout\,
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(5));

-- Location: LCCOMB_X85_Y63_N2
\don|timer[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[0]~13_combout\ = \don|timer\(0) $ (VCC)
-- \don|timer[0]~14\ = CARRY(\don|timer\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(0),
	datad => VCC,
	combout => \don|timer[0]~13_combout\,
	cout => \don|timer[0]~14\);

-- Location: LCCOMB_X85_Y63_N0
\~GND\ : cycloneive_lcell_comb
-- Equation(s):
-- \~GND~combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~GND~combout\);

-- Location: LCCOMB_X84_Y63_N18
\don|Selector14~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Selector14~0_combout\ = (\inst14|s_key_prev~q\ & (((\don|state.running~q\)))) # (!\inst14|s_key_prev~q\ & (!\don|state.enable~q\ & ((\don|state.running~q\) # (!\don|state.idle~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|state.idle~q\,
	datab => \inst14|s_key_prev~q\,
	datac => \don|state.running~q\,
	datad => \don|state.enable~q\,
	combout => \don|Selector14~0_combout\);

-- Location: FF_X84_Y63_N7
\don|Don[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(11),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(11));

-- Location: LCCOMB_X85_Y63_N12
\don|timer[5]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[5]~24_combout\ = (\don|timer\(5) & ((GND) # (!\don|timer[4]~23\))) # (!\don|timer\(5) & (\don|timer[4]~23\ $ (GND)))
-- \don|timer[5]~25\ = CARRY((\don|timer\(5)) # (!\don|timer[4]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010101111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(5),
	datad => VCC,
	cin => \don|timer[4]~23\,
	combout => \don|timer[5]~24_combout\,
	cout => \don|timer[5]~25\);

-- Location: LCCOMB_X85_Y63_N14
\don|timer[6]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[6]~26_combout\ = (\don|timer\(6) & (\don|timer[5]~25\ & VCC)) # (!\don|timer\(6) & (!\don|timer[5]~25\))
-- \don|timer[6]~27\ = CARRY((!\don|timer\(6) & !\don|timer[5]~25\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(6),
	datad => VCC,
	cin => \don|timer[5]~25\,
	combout => \don|timer[6]~26_combout\,
	cout => \don|timer[6]~27\);

-- Location: LCCOMB_X84_Y63_N14
\don|Don[12]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Don[12]~1_combout\ = (!\don|state.idle~q\ & !\inst14|s_key_prev~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|state.idle~q\,
	datad => \inst14|s_key_prev~q\,
	combout => \don|Don[12]~1_combout\);

-- Location: LCCOMB_X85_Y63_N28
\don|timer[10]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[10]~17_combout\ = (\don|Don[12]~1_combout\) # ((\don|state.running~q\ & ((!\don|Equal0~4_combout\) # (!\don|Equal0~7_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|state.running~q\,
	datab => \don|Equal0~7_combout\,
	datac => \don|Equal0~4_combout\,
	datad => \don|Don[12]~1_combout\,
	combout => \don|timer[10]~17_combout\);

-- Location: FF_X85_Y63_N15
\don|timer[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[6]~26_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(6));

-- Location: LCCOMB_X85_Y63_N16
\don|timer[7]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[7]~28_combout\ = (\don|timer\(7) & ((GND) # (!\don|timer[6]~27\))) # (!\don|timer\(7) & (\don|timer[6]~27\ $ (GND)))
-- \don|timer[7]~29\ = CARRY((\don|timer\(7)) # (!\don|timer[6]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(7),
	datad => VCC,
	cin => \don|timer[6]~27\,
	combout => \don|timer[7]~28_combout\,
	cout => \don|timer[7]~29\);

-- Location: FF_X85_Y63_N17
\don|timer[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[7]~28_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(7));

-- Location: LCCOMB_X85_Y63_N18
\don|timer[8]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[8]~30_combout\ = (\don|timer\(8) & (\don|timer[7]~29\ & VCC)) # (!\don|timer\(8) & (!\don|timer[7]~29\))
-- \don|timer[8]~31\ = CARRY((!\don|timer\(8) & !\don|timer[7]~29\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100000011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(8),
	datad => VCC,
	cin => \don|timer[7]~29\,
	combout => \don|timer[8]~30_combout\,
	cout => \don|timer[8]~31\);

-- Location: FF_X85_Y63_N19
\don|timer[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[8]~30_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(8));

-- Location: LCCOMB_X85_Y63_N20
\don|timer[9]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[9]~32_combout\ = (\don|timer\(9) & ((GND) # (!\don|timer[8]~31\))) # (!\don|timer\(9) & (\don|timer[8]~31\ $ (GND)))
-- \don|timer[9]~33\ = CARRY((\don|timer\(9)) # (!\don|timer[8]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(9),
	datad => VCC,
	cin => \don|timer[8]~31\,
	combout => \don|timer[9]~32_combout\,
	cout => \don|timer[9]~33\);

-- Location: FF_X85_Y63_N21
\don|timer[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[9]~32_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(9));

-- Location: LCCOMB_X85_Y63_N22
\don|timer[10]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[10]~34_combout\ = (\don|timer\(10) & (\don|timer[9]~33\ $ (GND))) # (!\don|timer\(10) & (!\don|timer[9]~33\ & VCC))
-- \don|timer[10]~35\ = CARRY((\don|timer\(10) & !\don|timer[9]~33\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(10),
	datad => VCC,
	cin => \don|timer[9]~33\,
	combout => \don|timer[10]~34_combout\,
	cout => \don|timer[10]~35\);

-- Location: FF_X85_Y63_N23
\don|timer[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[10]~34_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(10));

-- Location: LCCOMB_X85_Y63_N24
\don|timer[11]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[11]~36_combout\ = (\don|timer\(11) & (!\don|timer[10]~35\)) # (!\don|timer\(11) & ((\don|timer[10]~35\) # (GND)))
-- \don|timer[11]~37\ = CARRY((!\don|timer[10]~35\) # (!\don|timer\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(11),
	datad => VCC,
	cin => \don|timer[10]~35\,
	combout => \don|timer[11]~36_combout\,
	cout => \don|timer[11]~37\);

-- Location: FF_X85_Y63_N25
\don|timer[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[11]~36_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(11));

-- Location: FF_X84_Y63_N13
\don|Don[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(10),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(10));

-- Location: LCCOMB_X84_Y63_N12
\don|Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~6_combout\ = (\don|Don\(11) & (\don|timer\(11) & (\don|Don\(10) $ (!\don|timer\(10))))) # (!\don|Don\(11) & (!\don|timer\(11) & (\don|Don\(10) $ (!\don|timer\(10)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|Don\(11),
	datab => \don|timer\(11),
	datac => \don|Don\(10),
	datad => \don|timer\(10),
	combout => \don|Equal0~6_combout\);

-- Location: LCCOMB_X85_Y63_N26
\don|timer[12]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[12]~38_combout\ = \don|timer\(12) $ (!\don|timer[11]~37\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(12),
	cin => \don|timer[11]~37\,
	combout => \don|timer[12]~38_combout\);

-- Location: FF_X85_Y63_N27
\don|timer[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[12]~38_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(12));

-- Location: LCCOMB_X83_Y63_N16
\don|Don[12]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Don[12]~4_combout\ = !\inst7|temp\(12)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst7|temp\(12),
	combout => \don|Don[12]~4_combout\);

-- Location: FF_X84_Y63_N29
\don|Don[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \don|Don[12]~4_combout\,
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(12));

-- Location: FF_X84_Y63_N3
\don|Don[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(9),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(9));

-- Location: FF_X84_Y63_N21
\don|Don[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(8),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(8));

-- Location: LCCOMB_X84_Y63_N20
\don|Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~5_combout\ = (\don|timer\(9) & (\don|Don\(9) & (\don|Don\(8) $ (!\don|timer\(8))))) # (!\don|timer\(9) & (!\don|Don\(9) & (\don|Don\(8) $ (!\don|timer\(8)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(9),
	datab => \don|Don\(9),
	datac => \don|Don\(8),
	datad => \don|timer\(8),
	combout => \don|Equal0~5_combout\);

-- Location: LCCOMB_X84_Y63_N28
\don|Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~7_combout\ = (\don|Equal0~6_combout\ & (\don|Equal0~5_combout\ & (\don|timer\(12) $ (\don|Don\(12)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|Equal0~6_combout\,
	datab => \don|timer\(12),
	datac => \don|Don\(12),
	datad => \don|Equal0~5_combout\,
	combout => \don|Equal0~7_combout\);

-- Location: LCCOMB_X83_Y63_N22
\don|Selector14~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Selector14~1_combout\ = (\don|Selector14~0_combout\ & (((!\don|Equal0~4_combout\) # (!\don|state.running~q\)) # (!\don|Equal0~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|Selector14~0_combout\,
	datab => \don|Equal0~7_combout\,
	datac => \don|state.running~q\,
	datad => \don|Equal0~4_combout\,
	combout => \don|Selector14~1_combout\);

-- Location: FF_X83_Y63_N23
\don|state.running\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|Selector14~1_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|state.running~q\);

-- Location: FF_X85_Y63_N3
\don|timer[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[0]~13_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(0));

-- Location: LCCOMB_X85_Y63_N4
\don|timer[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[1]~15_combout\ = (\don|timer\(1) & (!\don|timer[0]~14\)) # (!\don|timer\(1) & ((\don|timer[0]~14\) # (GND)))
-- \don|timer[1]~16\ = CARRY((!\don|timer[0]~14\) # (!\don|timer\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(1),
	datad => VCC,
	cin => \don|timer[0]~14\,
	combout => \don|timer[1]~15_combout\,
	cout => \don|timer[1]~16\);

-- Location: FF_X85_Y63_N5
\don|timer[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[1]~15_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(1));

-- Location: LCCOMB_X85_Y63_N6
\don|timer[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[2]~18_combout\ = (\don|timer\(2) & (\don|timer[1]~16\ $ (GND))) # (!\don|timer\(2) & (!\don|timer[1]~16\ & VCC))
-- \don|timer[2]~19\ = CARRY((\don|timer\(2) & !\don|timer[1]~16\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(2),
	datad => VCC,
	cin => \don|timer[1]~16\,
	combout => \don|timer[2]~18_combout\,
	cout => \don|timer[2]~19\);

-- Location: FF_X85_Y63_N7
\don|timer[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[2]~18_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(2));

-- Location: LCCOMB_X85_Y63_N8
\don|timer[3]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[3]~20_combout\ = (\don|timer\(3) & ((GND) # (!\don|timer[2]~19\))) # (!\don|timer\(3) & (\don|timer[2]~19\ $ (GND)))
-- \don|timer[3]~21\ = CARRY((\don|timer\(3)) # (!\don|timer[2]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \don|timer\(3),
	datad => VCC,
	cin => \don|timer[2]~19\,
	combout => \don|timer[3]~20_combout\,
	cout => \don|timer[3]~21\);

-- Location: FF_X85_Y63_N9
\don|timer[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[3]~20_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(3));

-- Location: LCCOMB_X85_Y63_N10
\don|timer[4]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|timer[4]~22_combout\ = (\don|timer\(4) & (\don|timer[3]~21\ $ (GND))) # (!\don|timer\(4) & (!\don|timer[3]~21\ & VCC))
-- \don|timer[4]~23\ = CARRY((\don|timer\(4) & !\don|timer[3]~21\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(4),
	datad => VCC,
	cin => \don|timer[3]~21\,
	combout => \don|timer[4]~22_combout\,
	cout => \don|timer[4]~23\);

-- Location: FF_X85_Y63_N11
\don|timer[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[4]~22_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(4));

-- Location: FF_X85_Y63_N13
\don|timer[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|timer[5]~24_combout\,
	asdata => \~GND~combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => \don|ALT_INV_state.running~q\,
	ena => \don|timer[10]~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|timer\(5));

-- Location: FF_X84_Y63_N31
\don|Don[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(4),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(4));

-- Location: LCCOMB_X84_Y63_N30
\don|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~2_combout\ = (\don|Don\(5) & (!\don|timer\(5) & (\don|Don\(4) $ (!\don|timer\(4))))) # (!\don|Don\(5) & (\don|timer\(5) & (\don|Don\(4) $ (!\don|timer\(4)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|Don\(5),
	datab => \don|timer\(5),
	datac => \don|Don\(4),
	datad => \don|timer\(4),
	combout => \don|Equal0~2_combout\);

-- Location: FF_X84_Y63_N15
\don|Don[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(1),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(1));

-- Location: FF_X84_Y63_N5
\don|Don[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(0),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(0));

-- Location: LCCOMB_X84_Y63_N4
\don|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~0_combout\ = (\don|timer\(1) & (\don|Don\(1) & (\don|Don\(0) $ (!\don|timer\(0))))) # (!\don|timer\(1) & (!\don|Don\(1) & (\don|Don\(0) $ (!\don|timer\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(1),
	datab => \don|Don\(1),
	datac => \don|Don\(0),
	datad => \don|timer\(0),
	combout => \don|Equal0~0_combout\);

-- Location: FF_X84_Y63_N9
\don|Don[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(2),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(2));

-- Location: FF_X84_Y63_N25
\don|Don[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(3),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(3));

-- Location: LCCOMB_X84_Y63_N8
\don|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~1_combout\ = (\don|timer\(2) & (\don|Don\(2) & (\don|timer\(3) $ (!\don|Don\(3))))) # (!\don|timer\(2) & (!\don|Don\(2) & (\don|timer\(3) $ (!\don|Don\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|timer\(2),
	datab => \don|timer\(3),
	datac => \don|Don\(2),
	datad => \don|Don\(3),
	combout => \don|Equal0~1_combout\);

-- Location: LCCOMB_X83_Y63_N12
\don|Don[6]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Don[6]~3_combout\ = !\inst7|temp\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst7|temp\(6),
	combout => \don|Don[6]~3_combout\);

-- Location: FF_X84_Y63_N23
\don|Don[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \don|Don[6]~3_combout\,
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(6));

-- Location: FF_X84_Y63_N17
\don|Don[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst7|temp\(7),
	sload => VCC,
	ena => \don|Don[12]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|Don\(7));

-- Location: LCCOMB_X84_Y63_N16
\don|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~3_combout\ = (\don|Don\(6) & (!\don|timer\(6) & (\don|Don\(7) $ (!\don|timer\(7))))) # (!\don|Don\(6) & (\don|timer\(6) & (\don|Don\(7) $ (!\don|timer\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|Don\(6),
	datab => \don|timer\(6),
	datac => \don|Don\(7),
	datad => \don|timer\(7),
	combout => \don|Equal0~3_combout\);

-- Location: LCCOMB_X84_Y63_N26
\don|Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Equal0~4_combout\ = (\don|Equal0~2_combout\ & (\don|Equal0~0_combout\ & (\don|Equal0~1_combout\ & \don|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|Equal0~2_combout\,
	datab => \don|Equal0~0_combout\,
	datac => \don|Equal0~1_combout\,
	datad => \don|Equal0~3_combout\,
	combout => \don|Equal0~4_combout\);

-- Location: LCCOMB_X84_Y63_N10
\don|Selector15~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Selector15~0_combout\ = (!\don|state.running~q\ & (\inst14|s_key_prev~q\ & \don|state.enable~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|state.running~q\,
	datab => \inst14|s_key_prev~q\,
	datad => \don|state.enable~q\,
	combout => \don|Selector15~0_combout\);

-- Location: LCCOMB_X83_Y63_N18
\don|Selector15~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \don|Selector15~1_combout\ = (\don|Selector15~0_combout\) # ((\don|Equal0~4_combout\ & (\don|Equal0~7_combout\ & \don|state.running~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \don|Equal0~4_combout\,
	datab => \don|Selector15~0_combout\,
	datac => \don|Equal0~7_combout\,
	datad => \don|state.running~q\,
	combout => \don|Selector15~1_combout\);

-- Location: FF_X83_Y63_N19
\don|state.enable\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \don|Selector15~1_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \don|state.enable~q\);

-- Location: LCCOMB_X83_Y63_N24
\inst15|state[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst15|state[0]~1_combout\ = (!\inst15|state\(1) & ((\inst14|s_key_prev~q\ & (\don|state.enable~q\ & !\inst15|state\(0))) # (!\inst14|s_key_prev~q\ & ((\inst15|state\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|s_key_prev~q\,
	datab => \don|state.enable~q\,
	datac => \inst15|state\(0),
	datad => \inst15|state\(1),
	combout => \inst15|state[0]~1_combout\);

-- Location: FF_X83_Y63_N25
\inst15|state[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst15|state[0]~1_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst15|state\(0));

-- Location: LCCOMB_X84_Y63_N24
\inst15|state[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst15|state[1]~0_combout\ = (\inst14|s_key_prev~q\ & (\inst15|state\(1) $ (\inst15|state\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|state\(1),
	datab => \inst14|s_key_prev~q\,
	datad => \inst15|state\(0),
	combout => \inst15|state[1]~0_combout\);

-- Location: FF_X83_Y63_N17
\inst15|state[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	asdata => \inst15|state[1]~0_combout\,
	clrn => \DB1|s_key_prev~q\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst15|state\(1));

-- Location: LCCOMB_X84_Y63_N22
\inst15|light_active[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst15|light_active[0]~0_combout\ = (\inst15|state\(1) & (\inst15|state\(0))) # (!\inst15|state\(1) & (!\inst15|state\(0) & \don|state.enable~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst15|state\(1),
	datab => \inst15|state\(0),
	datad => \don|state.enable~q\,
	combout => \inst15|light_active[0]~0_combout\);

-- Location: LCCOMB_X83_Y63_N0
\inst15|light_active[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst15|light_active[0]~1_combout\ = (\inst14|s_key_prev~q\ & ((\inst15|light_active\(0)) # ((!\inst15|state\(1) & \inst15|light_active[0]~0_combout\)))) # (!\inst14|s_key_prev~q\ & (\inst15|light_active\(0) & ((\inst15|light_active[0]~0_combout\) # 
-- (!\inst15|state\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst14|s_key_prev~q\,
	datab => \inst15|state\(1),
	datac => \inst15|light_active\(0),
	datad => \inst15|light_active[0]~0_combout\,
	combout => \inst15|light_active[0]~1_combout\);

-- Location: FF_X83_Y63_N1
\inst15|light_active[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \pulse|pulse~clkctrl_outclk\,
	d => \inst15|light_active[0]~1_combout\,
	clrn => \DB1|s_key_prev~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst15|light_active\(0));

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
END structure;


