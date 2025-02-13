-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_header_clock_x2.vhd
-- Created: 2024-11-23 11:22:01
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_header_clock_x2
-- Source Path: HDLRx/full_rx/header_clock_x2
-- Hierarchy Level: 1
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_header_clock_x2 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    vector_of_std_logic_vector4(0 TO 1);  -- sfix4_En1 [2]
        valid_header                      :   IN    std_logic;
        data_out                          :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        start                             :   OUT   std_logic
        );
END IEEE_8021513_RX_src_header_clock_x2;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_header_clock_x2 IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_rising_edge_detector_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_rising_edge_detector_block
    USE ENTITY work.IEEE_8021513_RX_src_rising_edge_detector_block(rtl);

  -- Signals
  SIGNAL control_in_2                     : std_logic;
  SIGNAL Serializer1D_contl_cnt           : std_logic;  -- ufix1
  SIGNAL Serializer1D_contl_cnt_next      : std_logic;  -- ufix1
  SIGNAL Serializer1D_contl_add_cast      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Serializer1D_contl_add_temp      : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Serializer1D_invldSignal         : std_logic;
  SIGNAL Serializer1D_out2                : std_logic;
  SIGNAL data_in_signed                   : vector_of_signed4(0 TO 1);  -- sfix4_En1 [2]
  SIGNAL serial_in_1                      : vector_of_signed4(0 TO 1);  -- sfix4_En1 [2]
  SIGNAL Serializer1D_data                : signed(3 DOWNTO 0);  -- sfix4
  SIGNAL serializer_PostProcessed         : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL rising_edge_detector_out1        : std_logic;

BEGIN
  u_rising_edge_detector : IEEE_8021513_RX_src_rising_edge_detector_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => Serializer1D_out2,
              Out_rsvd => rising_edge_detector_out1
              );

  control_in_2 <= valid_header;

  Serializer1D_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Serializer1D_contl_cnt <= '0';
      ELSIF enb = '1' THEN
        Serializer1D_contl_cnt <= Serializer1D_contl_cnt_next;
      END IF;
    END IF;
  END PROCESS Serializer1D_contl_process;

  Serializer1D_out2 <= control_in_2;
  Serializer1D_contl_add_cast <= '0' & Serializer1D_contl_cnt;
  Serializer1D_contl_add_temp <= Serializer1D_contl_add_cast + to_unsigned(16#1#, 2);
  
  Serializer1D_contl_cnt_next <= '0' WHEN Serializer1D_contl_cnt = '1' ELSE
      Serializer1D_contl_add_temp(0);
  
  Serializer1D_invldSignal <= '1' WHEN Serializer1D_contl_cnt = '0' ELSE
      '0';

  outputgen: FOR k IN 0 TO 1 GENERATE
    data_in_signed(k) <= signed(data_in(k));
  END GENERATE;

  serial_in_1 <= data_in_signed;

  Serializer1D_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Serializer1D_data <= to_signed(16#0#, 4);
      ELSIF enb = '1' THEN
        IF Serializer1D_invldSignal /= '0' THEN 
          Serializer1D_data <= serial_in_1(1);
        ELSE 
          Serializer1D_data <= serial_in_1(1);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D_process;

  
  serializer_PostProcessed <= serial_in_1(0) WHEN Serializer1D_invldSignal /= '0' ELSE
      Serializer1D_data;

  data_out <= std_logic_vector(serializer_PostProcessed);

  start <= rising_edge_detector_out1;

END rtl;

