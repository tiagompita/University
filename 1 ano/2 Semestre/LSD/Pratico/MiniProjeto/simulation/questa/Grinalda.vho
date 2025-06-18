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
-- VERSION "Version 22.1std.2 Build 922 07/20/2023 SC Lite Edition"

-- DATE "05/09/2024 08:45:02"

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

ENTITY 	Grinalda IS
    PORT (
	HEX0 : OUT std_logic_vector(6 DOWNTO 0);
	SW : IN std_logic_vector(1 DOWNTO 0);
	HEX4 : OUT std_logic_vector(6 DOWNTO 0);
	CLOCK_50 : IN std_logic;
	HEX6 : OUT std_logic_vector(6 DOWNTO 0);
	LEDG : OUT std_logic_vector(3 DOWNTO 0);
	LEDR : OUT std_logic_vector(3 DOWNTO 0)
	);
END Grinalda;

-- Design Ports Information
-- HEX0[6]	=>  Location: PIN_H22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[5]	=>  Location: PIN_J22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[4]	=>  Location: PIN_L25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[3]	=>  Location: PIN_L26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[2]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[1]	=>  Location: PIN_F22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX0[0]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[6]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[5]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[4]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[3]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[2]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[1]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX4[0]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[6]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[5]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[4]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[3]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[2]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[1]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- HEX6[0]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[3]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[2]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[1]	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDG[0]	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[3]	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[2]	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[1]	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- LEDR[0]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[1]	=>  Location: PIN_AC28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- SW[0]	=>  Location: PIN_AB28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CLOCK_50	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Grinalda IS
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
SIGNAL ww_SW : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_HEX4 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_CLOCK_50 : std_logic;
SIGNAL ww_HEX6 : std_logic_vector(6 DOWNTO 0);
SIGNAL ww_LEDG : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_LEDR : std_logic_vector(3 DOWNTO 0);
SIGNAL \CLOCK_50~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \HEX0[6]~output_o\ : std_logic;
SIGNAL \HEX0[5]~output_o\ : std_logic;
SIGNAL \HEX0[4]~output_o\ : std_logic;
SIGNAL \HEX0[3]~output_o\ : std_logic;
SIGNAL \HEX0[2]~output_o\ : std_logic;
SIGNAL \HEX0[1]~output_o\ : std_logic;
SIGNAL \HEX0[0]~output_o\ : std_logic;
SIGNAL \HEX4[6]~output_o\ : std_logic;
SIGNAL \HEX4[5]~output_o\ : std_logic;
SIGNAL \HEX4[4]~output_o\ : std_logic;
SIGNAL \HEX4[3]~output_o\ : std_logic;
SIGNAL \HEX4[2]~output_o\ : std_logic;
SIGNAL \HEX4[1]~output_o\ : std_logic;
SIGNAL \HEX4[0]~output_o\ : std_logic;
SIGNAL \HEX6[6]~output_o\ : std_logic;
SIGNAL \HEX6[5]~output_o\ : std_logic;
SIGNAL \HEX6[4]~output_o\ : std_logic;
SIGNAL \HEX6[3]~output_o\ : std_logic;
SIGNAL \HEX6[2]~output_o\ : std_logic;
SIGNAL \HEX6[1]~output_o\ : std_logic;
SIGNAL \HEX6[0]~output_o\ : std_logic;
SIGNAL \LEDG[3]~output_o\ : std_logic;
SIGNAL \LEDG[2]~output_o\ : std_logic;
SIGNAL \LEDG[1]~output_o\ : std_logic;
SIGNAL \LEDG[0]~output_o\ : std_logic;
SIGNAL \LEDR[3]~output_o\ : std_logic;
SIGNAL \LEDR[2]~output_o\ : std_logic;
SIGNAL \LEDR[1]~output_o\ : std_logic;
SIGNAL \LEDR[0]~output_o\ : std_logic;
SIGNAL \SW[1]~input_o\ : std_logic;
SIGNAL \SW[0]~input_o\ : std_logic;
SIGNAL \inst2|Mux0~0_combout\ : std_logic;
SIGNAL \inst10|counter2~0_combout\ : std_logic;
SIGNAL \inst2|Mux2~0_combout\ : std_logic;
SIGNAL \inst2|Mux3~0_combout\ : std_logic;
SIGNAL \inst2|Mux1~0_combout\ : std_logic;
SIGNAL \CLOCK_50~input_o\ : std_logic;
SIGNAL \CLOCK_50~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst10|Add2~0_combout\ : std_logic;
SIGNAL \inst10|Add0~0_combout\ : std_logic;
SIGNAL \inst10|counter[0]~22_combout\ : std_logic;
SIGNAL \inst10|Add0~1\ : std_logic;
SIGNAL \inst10|Add0~2_combout\ : std_logic;
SIGNAL \inst10|Add0~3\ : std_logic;
SIGNAL \inst10|Add0~4_combout\ : std_logic;
SIGNAL \inst10|Add0~5\ : std_logic;
SIGNAL \inst10|Add0~6_combout\ : std_logic;
SIGNAL \inst10|Add0~7\ : std_logic;
SIGNAL \inst10|Add0~8_combout\ : std_logic;
SIGNAL \inst10|Add0~9\ : std_logic;
SIGNAL \inst10|Add0~10_combout\ : std_logic;
SIGNAL \inst10|Add0~11\ : std_logic;
SIGNAL \inst10|Add0~12_combout\ : std_logic;
SIGNAL \inst10|Add0~13\ : std_logic;
SIGNAL \inst10|Add0~14_combout\ : std_logic;
SIGNAL \inst10|counter~12_combout\ : std_logic;
SIGNAL \inst10|Add0~15\ : std_logic;
SIGNAL \inst10|Add0~16_combout\ : std_logic;
SIGNAL \inst10|Add0~17\ : std_logic;
SIGNAL \inst10|Add0~18_combout\ : std_logic;
SIGNAL \inst10|Add0~19\ : std_logic;
SIGNAL \inst10|Add0~20_combout\ : std_logic;
SIGNAL \inst10|Add0~21\ : std_logic;
SIGNAL \inst10|Add0~22_combout\ : std_logic;
SIGNAL \inst10|Add0~23\ : std_logic;
SIGNAL \inst10|Add0~24_combout\ : std_logic;
SIGNAL \inst10|counter~13_combout\ : std_logic;
SIGNAL \inst10|Add0~25\ : std_logic;
SIGNAL \inst10|Add0~26_combout\ : std_logic;
SIGNAL \inst10|counter~14_combout\ : std_logic;
SIGNAL \inst10|Add0~27\ : std_logic;
SIGNAL \inst10|Add0~29\ : std_logic;
SIGNAL \inst10|Add0~30_combout\ : std_logic;
SIGNAL \inst10|counter~10_combout\ : std_logic;
SIGNAL \inst10|Add0~31\ : std_logic;
SIGNAL \inst10|Add0~32_combout\ : std_logic;
SIGNAL \inst10|Add0~33\ : std_logic;
SIGNAL \inst10|Add0~34_combout\ : std_logic;
SIGNAL \inst10|counter~11_combout\ : std_logic;
SIGNAL \inst10|Add0~35\ : std_logic;
SIGNAL \inst10|Add0~36_combout\ : std_logic;
SIGNAL \inst10|Add0~37\ : std_logic;
SIGNAL \inst10|Add0~38_combout\ : std_logic;
SIGNAL \inst10|counter~15_combout\ : std_logic;
SIGNAL \inst10|Add0~39\ : std_logic;
SIGNAL \inst10|Add0~40_combout\ : std_logic;
SIGNAL \inst10|counter~19_combout\ : std_logic;
SIGNAL \inst10|Add0~41\ : std_logic;
SIGNAL \inst10|Add0~42_combout\ : std_logic;
SIGNAL \inst10|counter~20_combout\ : std_logic;
SIGNAL \inst10|Add0~43\ : std_logic;
SIGNAL \inst10|Add0~44_combout\ : std_logic;
SIGNAL \inst10|counter~21_combout\ : std_logic;
SIGNAL \inst10|Add0~45\ : std_logic;
SIGNAL \inst10|Add0~46_combout\ : std_logic;
SIGNAL \inst10|counter~18_combout\ : std_logic;
SIGNAL \inst10|Add0~47\ : std_logic;
SIGNAL \inst10|Add0~48_combout\ : std_logic;
SIGNAL \inst10|Add0~49\ : std_logic;
SIGNAL \inst10|Add0~50_combout\ : std_logic;
SIGNAL \inst10|counter~17_combout\ : std_logic;
SIGNAL \inst10|Equal5~0_combout\ : std_logic;
SIGNAL \inst10|process_0~0_combout\ : std_logic;
SIGNAL \inst10|Equal5~1_combout\ : std_logic;
SIGNAL \inst10|Add0~28_combout\ : std_logic;
SIGNAL \inst10|counter~16_combout\ : std_logic;
SIGNAL \inst10|Equal6~6_combout\ : std_logic;
SIGNAL \inst10|Equal6~3_combout\ : std_logic;
SIGNAL \inst10|Equal6~5_combout\ : std_logic;
SIGNAL \inst10|Equal6~4_combout\ : std_logic;
SIGNAL \inst10|Equal6~7_combout\ : std_logic;
SIGNAL \inst10|Equal5~2_combout\ : std_logic;
SIGNAL \inst10|counter2~5_combout\ : std_logic;
SIGNAL \inst10|counter2[3]~2_combout\ : std_logic;
SIGNAL \inst10|counter2[1]~6_combout\ : std_logic;
SIGNAL \inst10|Add1~0_combout\ : std_logic;
SIGNAL \inst10|counter2[2]~3_combout\ : std_logic;
SIGNAL \inst10|Equal1~0_combout\ : std_logic;
SIGNAL \inst10|counter2[1]~1_combout\ : std_logic;
SIGNAL \inst10|Add1~1_combout\ : std_logic;
SIGNAL \inst10|counter2[3]~4_combout\ : std_logic;
SIGNAL \inst10|stateG~0_combout\ : std_logic;
SIGNAL \inst10|Equal6~1_combout\ : std_logic;
SIGNAL \inst10|Equal6~0_combout\ : std_logic;
SIGNAL \inst10|Equal6~2_combout\ : std_logic;
SIGNAL \inst10|process_0~1_combout\ : std_logic;
SIGNAL \inst10|stateG~1_combout\ : std_logic;
SIGNAL \inst10|stateG~q\ : std_logic;
SIGNAL \inst10|count_blinkG[0]~0_combout\ : std_logic;
SIGNAL \inst10|Add2~1\ : std_logic;
SIGNAL \inst10|Add2~2_combout\ : std_logic;
SIGNAL \inst10|Add2~3\ : std_logic;
SIGNAL \inst10|Add2~4_combout\ : std_logic;
SIGNAL \inst10|Add2~5\ : std_logic;
SIGNAL \inst10|Add2~6_combout\ : std_logic;
SIGNAL \inst1|Mux0~0_combout\ : std_logic;
SIGNAL \inst1|Mux1~0_combout\ : std_logic;
SIGNAL \inst1|Mux2~0_combout\ : std_logic;
SIGNAL \inst1|Mux3~0_combout\ : std_logic;
SIGNAL \inst1|Mux4~0_combout\ : std_logic;
SIGNAL \inst1|Mux5~0_combout\ : std_logic;
SIGNAL \inst1|Mux6~0_combout\ : std_logic;
SIGNAL \inst10|Add3~0_combout\ : std_logic;
SIGNAL \inst10|stateR~0_combout\ : std_logic;
SIGNAL \inst10|process_0~3_combout\ : std_logic;
SIGNAL \inst10|process_0~2_combout\ : std_logic;
SIGNAL \inst10|process_0~4_combout\ : std_logic;
SIGNAL \inst10|process_0~5_combout\ : std_logic;
SIGNAL \inst10|process_0~6_combout\ : std_logic;
SIGNAL \inst10|stateR~1_combout\ : std_logic;
SIGNAL \inst10|stateR~q\ : std_logic;
SIGNAL \inst10|count_blinkR[0]~0_combout\ : std_logic;
SIGNAL \inst10|Add3~1\ : std_logic;
SIGNAL \inst10|Add3~2_combout\ : std_logic;
SIGNAL \inst10|Add3~3\ : std_logic;
SIGNAL \inst10|Add3~4_combout\ : std_logic;
SIGNAL \inst10|Add3~5\ : std_logic;
SIGNAL \inst10|Add3~6_combout\ : std_logic;
SIGNAL \inst|Mux0~0_combout\ : std_logic;
SIGNAL \inst|Mux1~0_combout\ : std_logic;
SIGNAL \inst|Mux2~0_combout\ : std_logic;
SIGNAL \inst|Mux3~0_combout\ : std_logic;
SIGNAL \inst|Mux4~0_combout\ : std_logic;
SIGNAL \inst|Mux5~0_combout\ : std_logic;
SIGNAL \inst|Mux6~0_combout\ : std_logic;
SIGNAL \inst10|Mux7~2_combout\ : std_logic;
SIGNAL \inst10|Mux3~2_combout\ : std_logic;
SIGNAL \inst10|count_blinkG\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst10|count_blinkR\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst10|LEDG\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst10|LEDR\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst10|counter\ : std_logic_vector(25 DOWNTO 0);
SIGNAL \inst10|counter2\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst1|ALT_INV_Mux0~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Mux3~0_combout\ : std_logic;
SIGNAL \inst10|ALT_INV_counter2~0_combout\ : std_logic;
SIGNAL \inst2|ALT_INV_Mux0~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

HEX0 <= ww_HEX0;
ww_SW <= SW;
HEX4 <= ww_HEX4;
ww_CLOCK_50 <= CLOCK_50;
HEX6 <= ww_HEX6;
LEDG <= ww_LEDG;
LEDR <= ww_LEDR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\CLOCK_50~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CLOCK_50~input_o\);
\inst|ALT_INV_Mux0~0_combout\ <= NOT \inst|Mux0~0_combout\;
\inst1|ALT_INV_Mux0~0_combout\ <= NOT \inst1|Mux0~0_combout\;
\inst2|ALT_INV_Mux3~0_combout\ <= NOT \inst2|Mux3~0_combout\;
\inst10|ALT_INV_counter2~0_combout\ <= NOT \inst10|counter2~0_combout\;
\inst2|ALT_INV_Mux0~0_combout\ <= NOT \inst2|Mux0~0_combout\;
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
	i => \inst2|ALT_INV_Mux0~0_combout\,
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
	i => \inst10|ALT_INV_counter2~0_combout\,
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
	i => \inst2|Mux2~0_combout\,
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
	i => \inst2|ALT_INV_Mux3~0_combout\,
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
	i => \inst2|Mux1~0_combout\,
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
	i => GND,
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
	i => \inst2|ALT_INV_Mux3~0_combout\,
	devoe => ww_devoe,
	o => \HEX0[0]~output_o\);

-- Location: IOOBUF_X79_Y0_N23
\HEX4[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst1|ALT_INV_Mux0~0_combout\,
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
	i => \inst1|Mux1~0_combout\,
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
	i => \inst1|Mux2~0_combout\,
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
	i => \inst1|Mux3~0_combout\,
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
	i => \inst1|Mux4~0_combout\,
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
	i => \inst1|Mux5~0_combout\,
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
	i => \inst1|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX4[0]~output_o\);

-- Location: IOOBUF_X74_Y0_N23
\HEX6[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_Mux0~0_combout\,
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
	i => \inst|Mux1~0_combout\,
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
	i => \inst|Mux2~0_combout\,
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
	i => \inst|Mux3~0_combout\,
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
	i => \inst|Mux4~0_combout\,
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
	i => \inst|Mux5~0_combout\,
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
	i => \inst|Mux6~0_combout\,
	devoe => ww_devoe,
	o => \HEX6[0]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\LEDG[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|LEDG\(0),
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
	i => \inst10|LEDG\(0),
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
	i => \inst10|LEDG\(0),
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
	i => \inst10|LEDG\(0),
	devoe => ww_devoe,
	o => \LEDG[0]~output_o\);

-- Location: IOOBUF_X107_Y73_N16
\LEDR[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|LEDR\(0),
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
	i => \inst10|LEDR\(0),
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
	i => \inst10|LEDR\(0),
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
	i => \inst10|LEDR\(0),
	devoe => ww_devoe,
	o => \LEDR[0]~output_o\);

-- Location: IOIBUF_X115_Y14_N1
\SW[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_SW(1),
	o => \SW[1]~input_o\);

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

-- Location: LCCOMB_X114_Y14_N28
\inst2|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Mux0~0_combout\ = (\SW[1]~input_o\) # (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst2|Mux0~0_combout\);

-- Location: LCCOMB_X82_Y7_N12
\inst10|counter2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter2~0_combout\ = (\SW[1]~input_o\ & \SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst10|counter2~0_combout\);

-- Location: LCCOMB_X114_Y14_N2
\inst2|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Mux2~0_combout\ = (\SW[1]~input_o\) # (!\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst2|Mux2~0_combout\);

-- Location: LCCOMB_X114_Y14_N4
\inst2|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Mux3~0_combout\ = \SW[1]~input_o\ $ (\SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst2|Mux3~0_combout\);

-- Location: LCCOMB_X82_Y7_N18
\inst2|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst2|Mux1~0_combout\ = (!\SW[1]~input_o\ & \SW[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst2|Mux1~0_combout\);

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

-- Location: LCCOMB_X83_Y7_N6
\inst10|Add2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add2~0_combout\ = \inst10|count_blinkG\(0) $ (VCC)
-- \inst10|Add2~1\ = CARRY(\inst10|count_blinkG\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(0),
	datad => VCC,
	combout => \inst10|Add2~0_combout\,
	cout => \inst10|Add2~1\);

-- Location: LCCOMB_X86_Y8_N6
\inst10|Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~0_combout\ = \inst10|counter\(0) $ (GND)
-- \inst10|Add0~1\ = CARRY(!\inst10|counter\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(0),
	datad => VCC,
	combout => \inst10|Add0~0_combout\,
	cout => \inst10|Add0~1\);

-- Location: LCCOMB_X86_Y8_N0
\inst10|counter[0]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter[0]~22_combout\ = !\inst10|Add0~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst10|Add0~0_combout\,
	combout => \inst10|counter[0]~22_combout\);

-- Location: FF_X86_Y8_N1
\inst10|counter[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter[0]~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(0));

-- Location: LCCOMB_X86_Y8_N8
\inst10|Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~2_combout\ = (\inst10|counter\(1) & (!\inst10|Add0~1\)) # (!\inst10|counter\(1) & ((\inst10|Add0~1\) # (GND)))
-- \inst10|Add0~3\ = CARRY((!\inst10|Add0~1\) # (!\inst10|counter\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(1),
	datad => VCC,
	cin => \inst10|Add0~1\,
	combout => \inst10|Add0~2_combout\,
	cout => \inst10|Add0~3\);

-- Location: FF_X86_Y8_N9
\inst10|counter[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(1));

-- Location: LCCOMB_X86_Y8_N10
\inst10|Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~4_combout\ = (\inst10|counter\(2) & (\inst10|Add0~3\ $ (GND))) # (!\inst10|counter\(2) & (!\inst10|Add0~3\ & VCC))
-- \inst10|Add0~5\ = CARRY((\inst10|counter\(2) & !\inst10|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(2),
	datad => VCC,
	cin => \inst10|Add0~3\,
	combout => \inst10|Add0~4_combout\,
	cout => \inst10|Add0~5\);

-- Location: FF_X86_Y8_N11
\inst10|counter[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(2));

-- Location: LCCOMB_X86_Y8_N12
\inst10|Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~6_combout\ = (\inst10|counter\(3) & (!\inst10|Add0~5\)) # (!\inst10|counter\(3) & ((\inst10|Add0~5\) # (GND)))
-- \inst10|Add0~7\ = CARRY((!\inst10|Add0~5\) # (!\inst10|counter\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(3),
	datad => VCC,
	cin => \inst10|Add0~5\,
	combout => \inst10|Add0~6_combout\,
	cout => \inst10|Add0~7\);

-- Location: FF_X86_Y8_N13
\inst10|counter[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(3));

-- Location: LCCOMB_X86_Y8_N14
\inst10|Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~8_combout\ = (\inst10|counter\(4) & (\inst10|Add0~7\ $ (GND))) # (!\inst10|counter\(4) & (!\inst10|Add0~7\ & VCC))
-- \inst10|Add0~9\ = CARRY((\inst10|counter\(4) & !\inst10|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(4),
	datad => VCC,
	cin => \inst10|Add0~7\,
	combout => \inst10|Add0~8_combout\,
	cout => \inst10|Add0~9\);

-- Location: FF_X86_Y8_N15
\inst10|counter[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(4));

-- Location: LCCOMB_X86_Y8_N16
\inst10|Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~10_combout\ = (\inst10|counter\(5) & (!\inst10|Add0~9\)) # (!\inst10|counter\(5) & ((\inst10|Add0~9\) # (GND)))
-- \inst10|Add0~11\ = CARRY((!\inst10|Add0~9\) # (!\inst10|counter\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(5),
	datad => VCC,
	cin => \inst10|Add0~9\,
	combout => \inst10|Add0~10_combout\,
	cout => \inst10|Add0~11\);

-- Location: FF_X86_Y8_N17
\inst10|counter[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(5));

-- Location: LCCOMB_X86_Y8_N18
\inst10|Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~12_combout\ = (\inst10|counter\(6) & (\inst10|Add0~11\ $ (GND))) # (!\inst10|counter\(6) & (!\inst10|Add0~11\ & VCC))
-- \inst10|Add0~13\ = CARRY((\inst10|counter\(6) & !\inst10|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(6),
	datad => VCC,
	cin => \inst10|Add0~11\,
	combout => \inst10|Add0~12_combout\,
	cout => \inst10|Add0~13\);

-- Location: FF_X86_Y8_N19
\inst10|counter[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(6));

-- Location: LCCOMB_X86_Y8_N20
\inst10|Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~14_combout\ = (\inst10|counter\(7) & (!\inst10|Add0~13\)) # (!\inst10|counter\(7) & ((\inst10|Add0~13\) # (GND)))
-- \inst10|Add0~15\ = CARRY((!\inst10|Add0~13\) # (!\inst10|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(7),
	datad => VCC,
	cin => \inst10|Add0~13\,
	combout => \inst10|Add0~14_combout\,
	cout => \inst10|Add0~15\);

-- Location: LCCOMB_X85_Y7_N0
\inst10|counter~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~12_combout\ = (\inst10|Add0~14_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datac => \inst10|Add0~14_combout\,
	datad => \inst10|Equal6~7_combout\,
	combout => \inst10|counter~12_combout\);

-- Location: FF_X85_Y7_N1
\inst10|counter[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(7));

-- Location: LCCOMB_X86_Y8_N22
\inst10|Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~16_combout\ = (\inst10|counter\(8) & (\inst10|Add0~15\ $ (GND))) # (!\inst10|counter\(8) & (!\inst10|Add0~15\ & VCC))
-- \inst10|Add0~17\ = CARRY((\inst10|counter\(8) & !\inst10|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(8),
	datad => VCC,
	cin => \inst10|Add0~15\,
	combout => \inst10|Add0~16_combout\,
	cout => \inst10|Add0~17\);

-- Location: FF_X86_Y8_N23
\inst10|counter[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(8));

-- Location: LCCOMB_X86_Y8_N24
\inst10|Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~18_combout\ = (\inst10|counter\(9) & (!\inst10|Add0~17\)) # (!\inst10|counter\(9) & ((\inst10|Add0~17\) # (GND)))
-- \inst10|Add0~19\ = CARRY((!\inst10|Add0~17\) # (!\inst10|counter\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(9),
	datad => VCC,
	cin => \inst10|Add0~17\,
	combout => \inst10|Add0~18_combout\,
	cout => \inst10|Add0~19\);

-- Location: FF_X86_Y8_N25
\inst10|counter[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(9));

-- Location: LCCOMB_X86_Y8_N26
\inst10|Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~20_combout\ = (\inst10|counter\(10) & (\inst10|Add0~19\ $ (GND))) # (!\inst10|counter\(10) & (!\inst10|Add0~19\ & VCC))
-- \inst10|Add0~21\ = CARRY((\inst10|counter\(10) & !\inst10|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(10),
	datad => VCC,
	cin => \inst10|Add0~19\,
	combout => \inst10|Add0~20_combout\,
	cout => \inst10|Add0~21\);

-- Location: FF_X86_Y8_N27
\inst10|counter[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(10));

-- Location: LCCOMB_X86_Y8_N28
\inst10|Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~22_combout\ = (\inst10|counter\(11) & (!\inst10|Add0~21\)) # (!\inst10|counter\(11) & ((\inst10|Add0~21\) # (GND)))
-- \inst10|Add0~23\ = CARRY((!\inst10|Add0~21\) # (!\inst10|counter\(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(11),
	datad => VCC,
	cin => \inst10|Add0~21\,
	combout => \inst10|Add0~22_combout\,
	cout => \inst10|Add0~23\);

-- Location: FF_X86_Y8_N29
\inst10|counter[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~22_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(11));

-- Location: LCCOMB_X86_Y8_N30
\inst10|Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~24_combout\ = (\inst10|counter\(12) & (\inst10|Add0~23\ $ (GND))) # (!\inst10|counter\(12) & (!\inst10|Add0~23\ & VCC))
-- \inst10|Add0~25\ = CARRY((\inst10|counter\(12) & !\inst10|Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(12),
	datad => VCC,
	cin => \inst10|Add0~23\,
	combout => \inst10|Add0~24_combout\,
	cout => \inst10|Add0~25\);

-- Location: LCCOMB_X86_Y8_N4
\inst10|counter~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~13_combout\ = (\inst10|Add0~24_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|Equal5~1_combout\,
	datac => \inst10|Add0~24_combout\,
	datad => \inst10|Equal6~7_combout\,
	combout => \inst10|counter~13_combout\);

-- Location: FF_X86_Y8_N5
\inst10|counter[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(12));

-- Location: LCCOMB_X86_Y7_N0
\inst10|Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~26_combout\ = (\inst10|counter\(13) & (!\inst10|Add0~25\)) # (!\inst10|counter\(13) & ((\inst10|Add0~25\) # (GND)))
-- \inst10|Add0~27\ = CARRY((!\inst10|Add0~25\) # (!\inst10|counter\(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(13),
	datad => VCC,
	cin => \inst10|Add0~25\,
	combout => \inst10|Add0~26_combout\,
	cout => \inst10|Add0~27\);

-- Location: LCCOMB_X84_Y7_N0
\inst10|counter~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~14_combout\ = (\inst10|Add0~26_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datac => \inst10|Add0~26_combout\,
	datad => \inst10|Equal6~7_combout\,
	combout => \inst10|counter~14_combout\);

-- Location: FF_X84_Y7_N1
\inst10|counter[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(13));

-- Location: LCCOMB_X86_Y7_N2
\inst10|Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~28_combout\ = (\inst10|counter\(14) & (\inst10|Add0~27\ $ (GND))) # (!\inst10|counter\(14) & (!\inst10|Add0~27\ & VCC))
-- \inst10|Add0~29\ = CARRY((\inst10|counter\(14) & !\inst10|Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(14),
	datad => VCC,
	cin => \inst10|Add0~27\,
	combout => \inst10|Add0~28_combout\,
	cout => \inst10|Add0~29\);

-- Location: LCCOMB_X86_Y7_N4
\inst10|Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~30_combout\ = (\inst10|counter\(15) & (!\inst10|Add0~29\)) # (!\inst10|counter\(15) & ((\inst10|Add0~29\) # (GND)))
-- \inst10|Add0~31\ = CARRY((!\inst10|Add0~29\) # (!\inst10|counter\(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(15),
	datad => VCC,
	cin => \inst10|Add0~29\,
	combout => \inst10|Add0~30_combout\,
	cout => \inst10|Add0~31\);

-- Location: LCCOMB_X85_Y7_N8
\inst10|counter~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~10_combout\ = (\inst10|Add0~30_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datab => \inst10|Equal6~7_combout\,
	datad => \inst10|Add0~30_combout\,
	combout => \inst10|counter~10_combout\);

-- Location: FF_X85_Y7_N9
\inst10|counter[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(15));

-- Location: LCCOMB_X86_Y7_N6
\inst10|Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~32_combout\ = (\inst10|counter\(16) & (\inst10|Add0~31\ $ (GND))) # (!\inst10|counter\(16) & (!\inst10|Add0~31\ & VCC))
-- \inst10|Add0~33\ = CARRY((\inst10|counter\(16) & !\inst10|Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(16),
	datad => VCC,
	cin => \inst10|Add0~31\,
	combout => \inst10|Add0~32_combout\,
	cout => \inst10|Add0~33\);

-- Location: FF_X86_Y7_N7
\inst10|counter[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~32_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(16));

-- Location: LCCOMB_X86_Y7_N8
\inst10|Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~34_combout\ = (\inst10|counter\(17) & (!\inst10|Add0~33\)) # (!\inst10|counter\(17) & ((\inst10|Add0~33\) # (GND)))
-- \inst10|Add0~35\ = CARRY((!\inst10|Add0~33\) # (!\inst10|counter\(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(17),
	datad => VCC,
	cin => \inst10|Add0~33\,
	combout => \inst10|Add0~34_combout\,
	cout => \inst10|Add0~35\);

-- Location: LCCOMB_X86_Y7_N30
\inst10|counter~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~11_combout\ = (\inst10|Add0~34_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal6~7_combout\,
	datab => \inst10|Equal5~1_combout\,
	datac => \inst10|Add0~34_combout\,
	combout => \inst10|counter~11_combout\);

-- Location: FF_X86_Y7_N31
\inst10|counter[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(17));

-- Location: LCCOMB_X86_Y7_N10
\inst10|Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~36_combout\ = (\inst10|counter\(18) & (\inst10|Add0~35\ $ (GND))) # (!\inst10|counter\(18) & (!\inst10|Add0~35\ & VCC))
-- \inst10|Add0~37\ = CARRY((\inst10|counter\(18) & !\inst10|Add0~35\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(18),
	datad => VCC,
	cin => \inst10|Add0~35\,
	combout => \inst10|Add0~36_combout\,
	cout => \inst10|Add0~37\);

-- Location: FF_X86_Y7_N11
\inst10|counter[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~36_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(18));

-- Location: LCCOMB_X86_Y7_N12
\inst10|Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~38_combout\ = (\inst10|counter\(19) & (!\inst10|Add0~37\)) # (!\inst10|counter\(19) & ((\inst10|Add0~37\) # (GND)))
-- \inst10|Add0~39\ = CARRY((!\inst10|Add0~37\) # (!\inst10|counter\(19)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(19),
	datad => VCC,
	cin => \inst10|Add0~37\,
	combout => \inst10|Add0~38_combout\,
	cout => \inst10|Add0~39\);

-- Location: LCCOMB_X84_Y7_N10
\inst10|counter~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~15_combout\ = (\inst10|Add0~38_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datab => \inst10|Equal6~7_combout\,
	datad => \inst10|Add0~38_combout\,
	combout => \inst10|counter~15_combout\);

-- Location: FF_X84_Y7_N11
\inst10|counter[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(19));

-- Location: LCCOMB_X86_Y7_N14
\inst10|Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~40_combout\ = (\inst10|counter\(20) & (\inst10|Add0~39\ $ (GND))) # (!\inst10|counter\(20) & (!\inst10|Add0~39\ & VCC))
-- \inst10|Add0~41\ = CARRY((\inst10|counter\(20) & !\inst10|Add0~39\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(20),
	datad => VCC,
	cin => \inst10|Add0~39\,
	combout => \inst10|Add0~40_combout\,
	cout => \inst10|Add0~41\);

-- Location: LCCOMB_X84_Y7_N4
\inst10|counter~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~19_combout\ = (\inst10|Add0~40_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datab => \inst10|Equal6~7_combout\,
	datad => \inst10|Add0~40_combout\,
	combout => \inst10|counter~19_combout\);

-- Location: FF_X84_Y7_N5
\inst10|counter[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~19_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(20));

-- Location: LCCOMB_X86_Y7_N16
\inst10|Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~42_combout\ = (\inst10|counter\(21) & (!\inst10|Add0~41\)) # (!\inst10|counter\(21) & ((\inst10|Add0~41\) # (GND)))
-- \inst10|Add0~43\ = CARRY((!\inst10|Add0~41\) # (!\inst10|counter\(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(21),
	datad => VCC,
	cin => \inst10|Add0~41\,
	combout => \inst10|Add0~42_combout\,
	cout => \inst10|Add0~43\);

-- Location: LCCOMB_X86_Y7_N26
\inst10|counter~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~20_combout\ = (\inst10|Add0~42_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|Equal5~1_combout\,
	datac => \inst10|Equal6~7_combout\,
	datad => \inst10|Add0~42_combout\,
	combout => \inst10|counter~20_combout\);

-- Location: FF_X86_Y7_N27
\inst10|counter[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~20_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(21));

-- Location: LCCOMB_X86_Y7_N18
\inst10|Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~44_combout\ = (\inst10|counter\(22) & (\inst10|Add0~43\ $ (GND))) # (!\inst10|counter\(22) & (!\inst10|Add0~43\ & VCC))
-- \inst10|Add0~45\ = CARRY((\inst10|counter\(22) & !\inst10|Add0~43\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(22),
	datad => VCC,
	cin => \inst10|Add0~43\,
	combout => \inst10|Add0~44_combout\,
	cout => \inst10|Add0~45\);

-- Location: LCCOMB_X85_Y7_N4
\inst10|counter~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~21_combout\ = (\inst10|Add0~44_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datab => \inst10|Equal6~7_combout\,
	datad => \inst10|Add0~44_combout\,
	combout => \inst10|counter~21_combout\);

-- Location: FF_X85_Y7_N5
\inst10|counter[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~21_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(22));

-- Location: LCCOMB_X86_Y7_N20
\inst10|Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~46_combout\ = (\inst10|counter\(23) & (!\inst10|Add0~45\)) # (!\inst10|counter\(23) & ((\inst10|Add0~45\) # (GND)))
-- \inst10|Add0~47\ = CARRY((!\inst10|Add0~45\) # (!\inst10|counter\(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter\(23),
	datad => VCC,
	cin => \inst10|Add0~45\,
	combout => \inst10|Add0~46_combout\,
	cout => \inst10|Add0~47\);

-- Location: LCCOMB_X86_Y7_N28
\inst10|counter~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~18_combout\ = (\inst10|Add0~46_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|Equal5~1_combout\,
	datac => \inst10|Equal6~7_combout\,
	datad => \inst10|Add0~46_combout\,
	combout => \inst10|counter~18_combout\);

-- Location: FF_X86_Y7_N29
\inst10|counter[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(23));

-- Location: LCCOMB_X86_Y7_N22
\inst10|Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~48_combout\ = (\inst10|counter\(24) & (\inst10|Add0~47\ $ (GND))) # (!\inst10|counter\(24) & (!\inst10|Add0~47\ & VCC))
-- \inst10|Add0~49\ = CARRY((\inst10|counter\(24) & !\inst10|Add0~47\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(24),
	datad => VCC,
	cin => \inst10|Add0~47\,
	combout => \inst10|Add0~48_combout\,
	cout => \inst10|Add0~49\);

-- Location: FF_X86_Y7_N23
\inst10|counter[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add0~48_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(24));

-- Location: LCCOMB_X86_Y7_N24
\inst10|Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add0~50_combout\ = \inst10|Add0~49\ $ (\inst10|counter\(25))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst10|counter\(25),
	cin => \inst10|Add0~49\,
	combout => \inst10|Add0~50_combout\);

-- Location: LCCOMB_X85_Y7_N24
\inst10|counter~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~17_combout\ = (\inst10|Add0~50_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datab => \inst10|Equal6~7_combout\,
	datad => \inst10|Add0~50_combout\,
	combout => \inst10|counter~17_combout\);

-- Location: FF_X85_Y7_N25
\inst10|counter[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(25));

-- Location: LCCOMB_X85_Y7_N22
\inst10|Equal5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal5~0_combout\ = (\inst10|counter\(16)) # (((\inst10|counter\(24)) # (\inst10|counter\(11))) # (!\inst10|counter\(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(16),
	datab => \inst10|counter\(25),
	datac => \inst10|counter\(24),
	datad => \inst10|counter\(11),
	combout => \inst10|Equal5~0_combout\);

-- Location: LCCOMB_X85_Y7_N10
\inst10|process_0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|process_0~0_combout\ = (\inst10|counter\(17) & (\inst10|counter\(15) & (!\inst10|counter\(6) & \inst10|counter\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(17),
	datab => \inst10|counter\(15),
	datac => \inst10|counter\(6),
	datad => \inst10|counter\(23),
	combout => \inst10|process_0~0_combout\);

-- Location: LCCOMB_X85_Y7_N6
\inst10|Equal5~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal5~1_combout\ = (\inst10|counter\(18)) # (((\inst10|Equal5~0_combout\) # (!\inst10|process_0~0_combout\)) # (!\inst10|counter\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(18),
	datab => \inst10|counter\(7),
	datac => \inst10|Equal5~0_combout\,
	datad => \inst10|process_0~0_combout\,
	combout => \inst10|Equal5~1_combout\);

-- Location: LCCOMB_X85_Y7_N18
\inst10|counter~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter~16_combout\ = (\inst10|Add0~28_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datab => \inst10|Equal6~7_combout\,
	datac => \inst10|Add0~28_combout\,
	combout => \inst10|counter~16_combout\);

-- Location: FF_X85_Y7_N19
\inst10|counter[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter\(14));

-- Location: LCCOMB_X85_Y7_N30
\inst10|Equal6~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~6_combout\ = (!\inst10|counter\(5) & (\inst10|counter\(14) & (\inst10|counter\(22) & !\inst10|counter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(5),
	datab => \inst10|counter\(14),
	datac => \inst10|counter\(22),
	datad => \inst10|counter\(10),
	combout => \inst10|Equal6~6_combout\);

-- Location: LCCOMB_X86_Y8_N2
\inst10|Equal6~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~3_combout\ = (!\inst10|counter\(2) & (\inst10|counter\(0) & (!\inst10|counter\(1) & !\inst10|counter\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(2),
	datab => \inst10|counter\(0),
	datac => \inst10|counter\(1),
	datad => \inst10|counter\(3),
	combout => \inst10|Equal6~3_combout\);

-- Location: LCCOMB_X84_Y7_N6
\inst10|Equal6~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~5_combout\ = (\inst10|counter\(19) & (\inst10|counter\(13) & (\inst10|counter\(20) & \inst10|counter\(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(19),
	datab => \inst10|counter\(13),
	datac => \inst10|counter\(20),
	datad => \inst10|counter\(21),
	combout => \inst10|Equal6~5_combout\);

-- Location: LCCOMB_X85_Y8_N28
\inst10|Equal6~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~4_combout\ = (\inst10|counter\(12) & (!\inst10|counter\(8) & (!\inst10|counter\(4) & !\inst10|counter\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(12),
	datab => \inst10|counter\(8),
	datac => \inst10|counter\(4),
	datad => \inst10|counter\(9),
	combout => \inst10|Equal6~4_combout\);

-- Location: LCCOMB_X85_Y7_N16
\inst10|Equal6~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~7_combout\ = (\inst10|Equal6~6_combout\ & (\inst10|Equal6~3_combout\ & (\inst10|Equal6~5_combout\ & \inst10|Equal6~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal6~6_combout\,
	datab => \inst10|Equal6~3_combout\,
	datac => \inst10|Equal6~5_combout\,
	datad => \inst10|Equal6~4_combout\,
	combout => \inst10|Equal6~7_combout\);

-- Location: LCCOMB_X82_Y7_N20
\inst10|Equal5~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal5~2_combout\ = (\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst10|Equal6~7_combout\,
	datad => \inst10|Equal5~1_combout\,
	combout => \inst10|Equal5~2_combout\);

-- Location: LCCOMB_X82_Y7_N26
\inst10|counter2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter2~5_combout\ = (!\inst10|Equal1~0_combout\ & ((\inst10|counter2\(0) & ((\inst10|Equal5~2_combout\))) # (!\inst10|counter2\(0) & (\inst10|counter2~0_combout\ & !\inst10|Equal5~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2~0_combout\,
	datab => \inst10|Equal1~0_combout\,
	datac => \inst10|counter2\(0),
	datad => \inst10|Equal5~2_combout\,
	combout => \inst10|counter2~5_combout\);

-- Location: FF_X82_Y7_N27
\inst10|counter2[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter2~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter2\(0));

-- Location: LCCOMB_X82_Y7_N24
\inst10|counter2[3]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter2[3]~2_combout\ = (!\inst10|Equal1~0_combout\ & ((\inst10|Equal5~1_combout\) # (!\inst10|Equal6~7_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|Equal1~0_combout\,
	datac => \inst10|Equal6~7_combout\,
	datad => \inst10|Equal5~1_combout\,
	combout => \inst10|counter2[3]~2_combout\);

-- Location: LCCOMB_X82_Y7_N28
\inst10|counter2[1]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter2[1]~6_combout\ = (\inst10|counter2\(1) & ((\inst10|counter2[3]~2_combout\) # ((\inst10|counter2\(0) & \inst10|counter2[1]~1_combout\)))) # (!\inst10|counter2\(1) & (!\inst10|counter2\(0) & ((\inst10|counter2[1]~1_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2\(0),
	datab => \inst10|counter2[3]~2_combout\,
	datac => \inst10|counter2\(1),
	datad => \inst10|counter2[1]~1_combout\,
	combout => \inst10|counter2[1]~6_combout\);

-- Location: FF_X82_Y7_N29
\inst10|counter2[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter2[1]~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter2\(1));

-- Location: LCCOMB_X82_Y7_N22
\inst10|Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add1~0_combout\ = \inst10|counter2\(2) $ (((!\inst10|counter2\(0) & \inst10|counter2\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|counter2\(2),
	datac => \inst10|counter2\(0),
	datad => \inst10|counter2\(1),
	combout => \inst10|Add1~0_combout\);

-- Location: LCCOMB_X82_Y7_N4
\inst10|counter2[2]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter2[2]~3_combout\ = (\inst10|Add1~0_combout\ & ((\inst10|counter2[1]~1_combout\) # ((\inst10|counter2[3]~2_combout\ & \inst10|counter2\(2))))) # (!\inst10|Add1~0_combout\ & (\inst10|counter2[3]~2_combout\ & (\inst10|counter2\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Add1~0_combout\,
	datab => \inst10|counter2[3]~2_combout\,
	datac => \inst10|counter2\(2),
	datad => \inst10|counter2[1]~1_combout\,
	combout => \inst10|counter2[2]~3_combout\);

-- Location: FF_X82_Y7_N5
\inst10|counter2[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter2[2]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter2\(2));

-- Location: LCCOMB_X82_Y7_N0
\inst10|Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal1~0_combout\ = (\inst10|counter2\(3) & (!\inst10|counter2\(2) & (\inst10|counter2\(0) & !\inst10|counter2\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2\(3),
	datab => \inst10|counter2\(2),
	datac => \inst10|counter2\(0),
	datad => \inst10|counter2\(1),
	combout => \inst10|Equal1~0_combout\);

-- Location: LCCOMB_X82_Y7_N10
\inst10|counter2[1]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter2[1]~1_combout\ = (\inst10|counter2~0_combout\ & (!\inst10|Equal1~0_combout\ & (\inst10|Equal6~7_combout\ & !\inst10|Equal5~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2~0_combout\,
	datab => \inst10|Equal1~0_combout\,
	datac => \inst10|Equal6~7_combout\,
	datad => \inst10|Equal5~1_combout\,
	combout => \inst10|counter2[1]~1_combout\);

-- Location: LCCOMB_X82_Y7_N2
\inst10|Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add1~1_combout\ = \inst10|counter2\(3) $ (((\inst10|counter2\(2) & (!\inst10|counter2\(0) & \inst10|counter2\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010011010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2\(3),
	datab => \inst10|counter2\(2),
	datac => \inst10|counter2\(0),
	datad => \inst10|counter2\(1),
	combout => \inst10|Add1~1_combout\);

-- Location: LCCOMB_X82_Y7_N30
\inst10|counter2[3]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|counter2[3]~4_combout\ = (\inst10|counter2[1]~1_combout\ & ((\inst10|Add1~1_combout\) # ((\inst10|counter2\(3) & \inst10|counter2[3]~2_combout\)))) # (!\inst10|counter2[1]~1_combout\ & (((\inst10|counter2\(3) & \inst10|counter2[3]~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2[1]~1_combout\,
	datab => \inst10|Add1~1_combout\,
	datac => \inst10|counter2\(3),
	datad => \inst10|counter2[3]~2_combout\,
	combout => \inst10|counter2[3]~4_combout\);

-- Location: FF_X82_Y7_N31
\inst10|counter2[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|counter2[3]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|counter2\(3));

-- Location: LCCOMB_X82_Y7_N16
\inst10|stateG~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|stateG~0_combout\ = (\SW[1]~input_o\ & (((!\inst10|counter2\(3) & !\inst10|counter2\(2))) # (!\SW[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2\(3),
	datab => \SW[1]~input_o\,
	datac => \inst10|counter2\(2),
	datad => \SW[0]~input_o\,
	combout => \inst10|stateG~0_combout\);

-- Location: LCCOMB_X85_Y7_N26
\inst10|Equal6~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~1_combout\ = (!\inst10|counter\(25) & (!\inst10|counter\(7) & (\inst10|counter\(18) & \inst10|counter\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(25),
	datab => \inst10|counter\(7),
	datac => \inst10|counter\(18),
	datad => \inst10|counter\(11),
	combout => \inst10|Equal6~1_combout\);

-- Location: LCCOMB_X85_Y7_N28
\inst10|Equal6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~0_combout\ = (!\inst10|counter\(17) & (!\inst10|counter\(15) & (\inst10|counter\(6) & !\inst10|counter\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(17),
	datab => \inst10|counter\(15),
	datac => \inst10|counter\(6),
	datad => \inst10|counter\(23),
	combout => \inst10|Equal6~0_combout\);

-- Location: LCCOMB_X85_Y7_N12
\inst10|Equal6~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Equal6~2_combout\ = (\inst10|counter\(16) & (\inst10|counter\(24) & (\inst10|Equal6~1_combout\ & \inst10|Equal6~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(16),
	datab => \inst10|counter\(24),
	datac => \inst10|Equal6~1_combout\,
	datad => \inst10|Equal6~0_combout\,
	combout => \inst10|Equal6~2_combout\);

-- Location: LCCOMB_X84_Y7_N28
\inst10|process_0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|process_0~1_combout\ = ((\inst10|Equal5~1_combout\ & !\inst10|Equal6~2_combout\)) # (!\inst10|Equal6~7_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|Equal5~1_combout\,
	datac => \inst10|Equal6~2_combout\,
	datad => \inst10|Equal6~7_combout\,
	combout => \inst10|process_0~1_combout\);

-- Location: LCCOMB_X84_Y7_N2
\inst10|stateG~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|stateG~1_combout\ = \inst10|stateG~q\ $ (((\inst10|stateG~0_combout\ & !\inst10|process_0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|stateG~0_combout\,
	datac => \inst10|stateG~q\,
	datad => \inst10|process_0~1_combout\,
	combout => \inst10|stateG~1_combout\);

-- Location: FF_X84_Y7_N3
\inst10|stateG\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|stateG~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|stateG~q\);

-- Location: LCCOMB_X83_Y7_N14
\inst10|count_blinkG[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|count_blinkG[0]~0_combout\ = (!\inst10|stateG~q\ & (\inst10|stateG~0_combout\ & !\inst10|process_0~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|stateG~q\,
	datac => \inst10|stateG~0_combout\,
	datad => \inst10|process_0~1_combout\,
	combout => \inst10|count_blinkG[0]~0_combout\);

-- Location: FF_X83_Y7_N7
\inst10|count_blinkG[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add2~0_combout\,
	ena => \inst10|count_blinkG[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkG\(0));

-- Location: LCCOMB_X83_Y7_N8
\inst10|Add2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add2~2_combout\ = (\inst10|count_blinkG\(1) & (!\inst10|Add2~1\)) # (!\inst10|count_blinkG\(1) & ((\inst10|Add2~1\) # (GND)))
-- \inst10|Add2~3\ = CARRY((!\inst10|Add2~1\) # (!\inst10|count_blinkG\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|count_blinkG\(1),
	datad => VCC,
	cin => \inst10|Add2~1\,
	combout => \inst10|Add2~2_combout\,
	cout => \inst10|Add2~3\);

-- Location: FF_X83_Y7_N9
\inst10|count_blinkG[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add2~2_combout\,
	ena => \inst10|count_blinkG[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkG\(1));

-- Location: LCCOMB_X83_Y7_N10
\inst10|Add2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add2~4_combout\ = (\inst10|count_blinkG\(2) & (\inst10|Add2~3\ $ (GND))) # (!\inst10|count_blinkG\(2) & (!\inst10|Add2~3\ & VCC))
-- \inst10|Add2~5\ = CARRY((\inst10|count_blinkG\(2) & !\inst10|Add2~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datad => VCC,
	cin => \inst10|Add2~3\,
	combout => \inst10|Add2~4_combout\,
	cout => \inst10|Add2~5\);

-- Location: FF_X83_Y7_N11
\inst10|count_blinkG[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add2~4_combout\,
	ena => \inst10|count_blinkG[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkG\(2));

-- Location: LCCOMB_X83_Y7_N12
\inst10|Add2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add2~6_combout\ = \inst10|Add2~5\ $ (\inst10|count_blinkG\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst10|count_blinkG\(3),
	cin => \inst10|Add2~5\,
	combout => \inst10|Add2~6_combout\);

-- Location: FF_X83_Y7_N13
\inst10|count_blinkG[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add2~6_combout\,
	ena => \inst10|count_blinkG[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkG\(3));

-- Location: LCCOMB_X83_Y7_N4
\inst1|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux0~0_combout\ = (\inst10|count_blinkG\(0) & ((\inst10|count_blinkG\(3)) # (\inst10|count_blinkG\(2) $ (\inst10|count_blinkG\(1))))) # (!\inst10|count_blinkG\(0) & ((\inst10|count_blinkG\(1)) # (\inst10|count_blinkG\(2) $ 
-- (\inst10|count_blinkG\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111011110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datab => \inst10|count_blinkG\(3),
	datac => \inst10|count_blinkG\(1),
	datad => \inst10|count_blinkG\(0),
	combout => \inst1|Mux0~0_combout\);

-- Location: LCCOMB_X83_Y7_N22
\inst1|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux1~0_combout\ = (\inst10|count_blinkG\(2) & (\inst10|count_blinkG\(0) & (\inst10|count_blinkG\(3) $ (\inst10|count_blinkG\(1))))) # (!\inst10|count_blinkG\(2) & (!\inst10|count_blinkG\(3) & ((\inst10|count_blinkG\(1)) # 
-- (\inst10|count_blinkG\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011100100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datab => \inst10|count_blinkG\(3),
	datac => \inst10|count_blinkG\(1),
	datad => \inst10|count_blinkG\(0),
	combout => \inst1|Mux1~0_combout\);

-- Location: LCCOMB_X83_Y7_N28
\inst1|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux2~0_combout\ = (\inst10|count_blinkG\(1) & (((!\inst10|count_blinkG\(3) & \inst10|count_blinkG\(0))))) # (!\inst10|count_blinkG\(1) & ((\inst10|count_blinkG\(2) & (!\inst10|count_blinkG\(3))) # (!\inst10|count_blinkG\(2) & 
-- ((\inst10|count_blinkG\(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datab => \inst10|count_blinkG\(3),
	datac => \inst10|count_blinkG\(1),
	datad => \inst10|count_blinkG\(0),
	combout => \inst1|Mux2~0_combout\);

-- Location: LCCOMB_X83_Y7_N2
\inst1|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux3~0_combout\ = (\inst10|count_blinkG\(1) & ((\inst10|count_blinkG\(2) & ((\inst10|count_blinkG\(0)))) # (!\inst10|count_blinkG\(2) & (\inst10|count_blinkG\(3) & !\inst10|count_blinkG\(0))))) # (!\inst10|count_blinkG\(1) & 
-- (!\inst10|count_blinkG\(3) & (\inst10|count_blinkG\(2) $ (\inst10|count_blinkG\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000101000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datab => \inst10|count_blinkG\(3),
	datac => \inst10|count_blinkG\(1),
	datad => \inst10|count_blinkG\(0),
	combout => \inst1|Mux3~0_combout\);

-- Location: LCCOMB_X83_Y7_N24
\inst1|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux4~0_combout\ = (\inst10|count_blinkG\(2) & (\inst10|count_blinkG\(3) & ((\inst10|count_blinkG\(1)) # (!\inst10|count_blinkG\(0))))) # (!\inst10|count_blinkG\(2) & (!\inst10|count_blinkG\(3) & (\inst10|count_blinkG\(1) & 
-- !\inst10|count_blinkG\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datab => \inst10|count_blinkG\(3),
	datac => \inst10|count_blinkG\(1),
	datad => \inst10|count_blinkG\(0),
	combout => \inst1|Mux4~0_combout\);

-- Location: LCCOMB_X83_Y7_N26
\inst1|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux5~0_combout\ = (\inst10|count_blinkG\(3) & ((\inst10|count_blinkG\(0) & ((\inst10|count_blinkG\(1)))) # (!\inst10|count_blinkG\(0) & (\inst10|count_blinkG\(2))))) # (!\inst10|count_blinkG\(3) & (\inst10|count_blinkG\(2) & 
-- (\inst10|count_blinkG\(1) $ (\inst10|count_blinkG\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datab => \inst10|count_blinkG\(3),
	datac => \inst10|count_blinkG\(1),
	datad => \inst10|count_blinkG\(0),
	combout => \inst1|Mux5~0_combout\);

-- Location: LCCOMB_X83_Y7_N16
\inst1|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst1|Mux6~0_combout\ = (\inst10|count_blinkG\(2) & (!\inst10|count_blinkG\(1) & (\inst10|count_blinkG\(3) $ (!\inst10|count_blinkG\(0))))) # (!\inst10|count_blinkG\(2) & (\inst10|count_blinkG\(0) & (\inst10|count_blinkG\(3) $ 
-- (!\inst10|count_blinkG\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkG\(2),
	datab => \inst10|count_blinkG\(3),
	datac => \inst10|count_blinkG\(1),
	datad => \inst10|count_blinkG\(0),
	combout => \inst1|Mux6~0_combout\);

-- Location: LCCOMB_X84_Y7_N18
\inst10|Add3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add3~0_combout\ = \inst10|count_blinkR\(0) $ (VCC)
-- \inst10|Add3~1\ = CARRY(\inst10|count_blinkR\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|count_blinkR\(0),
	datad => VCC,
	combout => \inst10|Add3~0_combout\,
	cout => \inst10|Add3~1\);

-- Location: LCCOMB_X82_Y7_N6
\inst10|stateR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|stateR~0_combout\ = (\SW[0]~input_o\ & ((\inst10|counter2\(3)) # ((\inst10|counter2\(2)) # (!\SW[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter2\(3),
	datab => \SW[1]~input_o\,
	datac => \inst10|counter2\(2),
	datad => \SW[0]~input_o\,
	combout => \inst10|stateR~0_combout\);

-- Location: LCCOMB_X85_Y7_N2
\inst10|process_0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|process_0~3_combout\ = (\inst10|counter\(5) & (!\inst10|counter\(14) & (!\inst10|counter\(22) & \inst10|counter\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(5),
	datab => \inst10|counter\(14),
	datac => \inst10|counter\(22),
	datad => \inst10|counter\(10),
	combout => \inst10|process_0~3_combout\);

-- Location: LCCOMB_X84_Y7_N8
\inst10|process_0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|process_0~2_combout\ = (\inst10|counter\(11) & (!\inst10|counter\(25) & (\inst10|process_0~0_combout\))) # (!\inst10|counter\(11) & (\inst10|counter\(25) & ((\inst10|Equal6~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110010000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(11),
	datab => \inst10|counter\(25),
	datac => \inst10|process_0~0_combout\,
	datad => \inst10|Equal6~0_combout\,
	combout => \inst10|process_0~2_combout\);

-- Location: LCCOMB_X85_Y7_N20
\inst10|process_0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|process_0~4_combout\ = (!\inst10|counter\(16) & (\inst10|counter\(18) & (!\inst10|counter\(24) & !\inst10|counter\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|counter\(16),
	datab => \inst10|counter\(18),
	datac => \inst10|counter\(24),
	datad => \inst10|counter\(7),
	combout => \inst10|process_0~4_combout\);

-- Location: LCCOMB_X84_Y7_N26
\inst10|process_0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|process_0~5_combout\ = (\inst10|process_0~4_combout\ & (\inst10|Equal6~5_combout\ & (\inst10|Equal6~3_combout\ & \inst10|Equal6~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|process_0~4_combout\,
	datab => \inst10|Equal6~5_combout\,
	datac => \inst10|Equal6~3_combout\,
	datad => \inst10|Equal6~4_combout\,
	combout => \inst10|process_0~5_combout\);

-- Location: LCCOMB_X84_Y7_N12
\inst10|process_0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|process_0~6_combout\ = ((\inst10|process_0~3_combout\ & (\inst10|process_0~2_combout\ & \inst10|process_0~5_combout\))) # (!\inst10|process_0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|process_0~3_combout\,
	datab => \inst10|process_0~2_combout\,
	datac => \inst10|process_0~5_combout\,
	datad => \inst10|process_0~1_combout\,
	combout => \inst10|process_0~6_combout\);

-- Location: LCCOMB_X84_Y7_N30
\inst10|stateR~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|stateR~1_combout\ = \inst10|stateR~q\ $ (((\inst10|stateR~0_combout\ & \inst10|process_0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst10|stateR~0_combout\,
	datac => \inst10|stateR~q\,
	datad => \inst10|process_0~6_combout\,
	combout => \inst10|stateR~1_combout\);

-- Location: FF_X84_Y7_N31
\inst10|stateR\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|stateR~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|stateR~q\);

-- Location: LCCOMB_X84_Y7_N14
\inst10|count_blinkR[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|count_blinkR[0]~0_combout\ = (!\inst10|stateR~q\ & (\inst10|stateR~0_combout\ & \inst10|process_0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|stateR~q\,
	datac => \inst10|stateR~0_combout\,
	datad => \inst10|process_0~6_combout\,
	combout => \inst10|count_blinkR[0]~0_combout\);

-- Location: FF_X84_Y7_N19
\inst10|count_blinkR[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add3~0_combout\,
	ena => \inst10|count_blinkR[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkR\(0));

-- Location: LCCOMB_X84_Y7_N20
\inst10|Add3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add3~2_combout\ = (\inst10|count_blinkR\(1) & (!\inst10|Add3~1\)) # (!\inst10|count_blinkR\(1) & ((\inst10|Add3~1\) # (GND)))
-- \inst10|Add3~3\ = CARRY((!\inst10|Add3~1\) # (!\inst10|count_blinkR\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|count_blinkR\(1),
	datad => VCC,
	cin => \inst10|Add3~1\,
	combout => \inst10|Add3~2_combout\,
	cout => \inst10|Add3~3\);

-- Location: FF_X84_Y7_N21
\inst10|count_blinkR[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add3~2_combout\,
	ena => \inst10|count_blinkR[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkR\(1));

-- Location: LCCOMB_X84_Y7_N22
\inst10|Add3~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add3~4_combout\ = (\inst10|count_blinkR\(2) & (\inst10|Add3~3\ $ (GND))) # (!\inst10|count_blinkR\(2) & (!\inst10|Add3~3\ & VCC))
-- \inst10|Add3~5\ = CARRY((\inst10|count_blinkR\(2) & !\inst10|Add3~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst10|count_blinkR\(2),
	datad => VCC,
	cin => \inst10|Add3~3\,
	combout => \inst10|Add3~4_combout\,
	cout => \inst10|Add3~5\);

-- Location: FF_X84_Y7_N23
\inst10|count_blinkR[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add3~4_combout\,
	ena => \inst10|count_blinkR[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkR\(2));

-- Location: LCCOMB_X84_Y7_N24
\inst10|Add3~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Add3~6_combout\ = \inst10|Add3~5\ $ (\inst10|count_blinkR\(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst10|count_blinkR\(3),
	cin => \inst10|Add3~5\,
	combout => \inst10|Add3~6_combout\);

-- Location: FF_X84_Y7_N25
\inst10|count_blinkR[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Add3~6_combout\,
	ena => \inst10|count_blinkR[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|count_blinkR\(3));

-- Location: LCCOMB_X77_Y4_N0
\inst|Mux0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mux0~0_combout\ = (\inst10|count_blinkR\(0) & ((\inst10|count_blinkR\(3)) # (\inst10|count_blinkR\(2) $ (\inst10|count_blinkR\(1))))) # (!\inst10|count_blinkR\(0) & ((\inst10|count_blinkR\(1)) # (\inst10|count_blinkR\(2) $ 
-- (\inst10|count_blinkR\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkR\(2),
	datab => \inst10|count_blinkR\(0),
	datac => \inst10|count_blinkR\(1),
	datad => \inst10|count_blinkR\(3),
	combout => \inst|Mux0~0_combout\);

-- Location: LCCOMB_X77_Y4_N22
\inst|Mux1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mux1~0_combout\ = (\inst10|count_blinkR\(2) & (\inst10|count_blinkR\(0) & (\inst10|count_blinkR\(1) $ (\inst10|count_blinkR\(3))))) # (!\inst10|count_blinkR\(2) & (!\inst10|count_blinkR\(3) & ((\inst10|count_blinkR\(0)) # 
-- (\inst10|count_blinkR\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkR\(2),
	datab => \inst10|count_blinkR\(0),
	datac => \inst10|count_blinkR\(1),
	datad => \inst10|count_blinkR\(3),
	combout => \inst|Mux1~0_combout\);

-- Location: LCCOMB_X77_Y4_N24
\inst|Mux2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mux2~0_combout\ = (\inst10|count_blinkR\(1) & (((\inst10|count_blinkR\(0) & !\inst10|count_blinkR\(3))))) # (!\inst10|count_blinkR\(1) & ((\inst10|count_blinkR\(2) & ((!\inst10|count_blinkR\(3)))) # (!\inst10|count_blinkR\(2) & 
-- (\inst10|count_blinkR\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkR\(2),
	datab => \inst10|count_blinkR\(0),
	datac => \inst10|count_blinkR\(1),
	datad => \inst10|count_blinkR\(3),
	combout => \inst|Mux2~0_combout\);

-- Location: LCCOMB_X84_Y7_N16
\inst|Mux3~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mux3~0_combout\ = (\inst10|count_blinkR\(1) & ((\inst10|count_blinkR\(2) & ((\inst10|count_blinkR\(0)))) # (!\inst10|count_blinkR\(2) & (\inst10|count_blinkR\(3) & !\inst10|count_blinkR\(0))))) # (!\inst10|count_blinkR\(1) & 
-- (!\inst10|count_blinkR\(3) & (\inst10|count_blinkR\(2) $ (\inst10|count_blinkR\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000100011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkR\(3),
	datab => \inst10|count_blinkR\(1),
	datac => \inst10|count_blinkR\(2),
	datad => \inst10|count_blinkR\(0),
	combout => \inst|Mux3~0_combout\);

-- Location: LCCOMB_X77_Y4_N18
\inst|Mux4~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mux4~0_combout\ = (\inst10|count_blinkR\(2) & (\inst10|count_blinkR\(3) & ((\inst10|count_blinkR\(1)) # (!\inst10|count_blinkR\(0))))) # (!\inst10|count_blinkR\(2) & (!\inst10|count_blinkR\(0) & (\inst10|count_blinkR\(1) & 
-- !\inst10|count_blinkR\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkR\(2),
	datab => \inst10|count_blinkR\(0),
	datac => \inst10|count_blinkR\(1),
	datad => \inst10|count_blinkR\(3),
	combout => \inst|Mux4~0_combout\);

-- Location: LCCOMB_X77_Y4_N12
\inst|Mux5~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mux5~0_combout\ = (\inst10|count_blinkR\(1) & ((\inst10|count_blinkR\(0) & ((\inst10|count_blinkR\(3)))) # (!\inst10|count_blinkR\(0) & (\inst10|count_blinkR\(2))))) # (!\inst10|count_blinkR\(1) & (\inst10|count_blinkR\(2) & 
-- (\inst10|count_blinkR\(0) $ (\inst10|count_blinkR\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkR\(2),
	datab => \inst10|count_blinkR\(0),
	datac => \inst10|count_blinkR\(1),
	datad => \inst10|count_blinkR\(3),
	combout => \inst|Mux5~0_combout\);

-- Location: LCCOMB_X77_Y4_N2
\inst|Mux6~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst|Mux6~0_combout\ = (\inst10|count_blinkR\(2) & (!\inst10|count_blinkR\(1) & (\inst10|count_blinkR\(0) $ (!\inst10|count_blinkR\(3))))) # (!\inst10|count_blinkR\(2) & (\inst10|count_blinkR\(0) & (\inst10|count_blinkR\(1) $ 
-- (!\inst10|count_blinkR\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100100000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|count_blinkR\(2),
	datab => \inst10|count_blinkR\(0),
	datac => \inst10|count_blinkR\(1),
	datad => \inst10|count_blinkR\(3),
	combout => \inst|Mux6~0_combout\);

-- Location: LCCOMB_X82_Y7_N8
\inst10|Mux7~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Mux7~2_combout\ = (\inst10|stateG~q\ & (((!\SW[1]~input_o\ & !\SW[0]~input_o\)))) # (!\inst10|stateG~q\ & ((\inst10|stateG~0_combout\) # ((!\SW[1]~input_o\ & !\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|stateG~q\,
	datab => \inst10|stateG~0_combout\,
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst10|Mux7~2_combout\);

-- Location: FF_X82_Y7_N9
\inst10|LEDG[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Mux7~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|LEDG\(0));

-- Location: LCCOMB_X82_Y7_N14
\inst10|Mux3~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \inst10|Mux3~2_combout\ = (\inst10|stateR~0_combout\ & (((!\SW[1]~input_o\ & !\SW[0]~input_o\)) # (!\inst10|stateR~q\))) # (!\inst10|stateR~0_combout\ & (((!\SW[1]~input_o\ & !\SW[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|stateR~0_combout\,
	datab => \inst10|stateR~q\,
	datac => \SW[1]~input_o\,
	datad => \SW[0]~input_o\,
	combout => \inst10|Mux3~2_combout\);

-- Location: FF_X82_Y7_N15
\inst10|LEDR[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CLOCK_50~inputclkctrl_outclk\,
	d => \inst10|Mux3~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|LEDR\(0));

ww_HEX0(6) <= \HEX0[6]~output_o\;

ww_HEX0(5) <= \HEX0[5]~output_o\;

ww_HEX0(4) <= \HEX0[4]~output_o\;

ww_HEX0(3) <= \HEX0[3]~output_o\;

ww_HEX0(2) <= \HEX0[2]~output_o\;

ww_HEX0(1) <= \HEX0[1]~output_o\;

ww_HEX0(0) <= \HEX0[0]~output_o\;

ww_HEX4(6) <= \HEX4[6]~output_o\;

ww_HEX4(5) <= \HEX4[5]~output_o\;

ww_HEX4(4) <= \HEX4[4]~output_o\;

ww_HEX4(3) <= \HEX4[3]~output_o\;

ww_HEX4(2) <= \HEX4[2]~output_o\;

ww_HEX4(1) <= \HEX4[1]~output_o\;

ww_HEX4(0) <= \HEX4[0]~output_o\;

ww_HEX6(6) <= \HEX6[6]~output_o\;

ww_HEX6(5) <= \HEX6[5]~output_o\;

ww_HEX6(4) <= \HEX6[4]~output_o\;

ww_HEX6(3) <= \HEX6[3]~output_o\;

ww_HEX6(2) <= \HEX6[2]~output_o\;

ww_HEX6(1) <= \HEX6[1]~output_o\;

ww_HEX6(0) <= \HEX6[0]~output_o\;

ww_LEDG(3) <= \LEDG[3]~output_o\;

ww_LEDG(2) <= \LEDG[2]~output_o\;

ww_LEDG(1) <= \LEDG[1]~output_o\;

ww_LEDG(0) <= \LEDG[0]~output_o\;

ww_LEDR(3) <= \LEDR[3]~output_o\;

ww_LEDR(2) <= \LEDR[2]~output_o\;

ww_LEDR(1) <= \LEDR[1]~output_o\;

ww_LEDR(0) <= \LEDR[0]~output_o\;
END structure;


