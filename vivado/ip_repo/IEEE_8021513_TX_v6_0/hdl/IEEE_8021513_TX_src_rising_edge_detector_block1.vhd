-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_rising_edge_detector_block1.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_rising_edge_detector_block1
-- Source Path: HDLTx/full_tx/payload_full/next_frame_to_ready/rising_edge_detector
-- Hierarchy Level: 3
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_rising_edge_detector_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_8_0                         :   IN    std_logic;
        In_rsvd                           :   IN    std_logic;
        Out_rsvd                          :   OUT   std_logic
        );
END IEEE_8021513_TX_src_rising_edge_detector_block1;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_rising_edge_detector_block1 IS

  -- Signals
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;

BEGIN
  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Delay2_out1 <= In_rsvd;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Logical_Operator2_out1 <=  NOT Delay2_out1;

  Logical_Operator1_out1 <= In_rsvd AND Logical_Operator2_out1;

  Out_rsvd <= Logical_Operator1_out1;

END rtl;

