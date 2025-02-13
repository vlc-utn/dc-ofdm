-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_rising_edge_detector_block2.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_rising_edge_detector_block2
-- Source Path: HDLTx/full_tx/rising_edge_detector
-- Hierarchy Level: 1
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_rising_edge_detector_block2 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        In_rsvd                           :   IN    std_logic;
        Out_rsvd                          :   OUT   std_logic
        );
END IEEE_8021513_TX_src_rising_edge_detector_block2;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_rising_edge_detector_block2 IS

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
      ELSIF enb = '1' THEN
        Delay2_out1 <= In_rsvd;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Logical_Operator2_out1 <=  NOT Delay2_out1;

  Logical_Operator1_out1 <= In_rsvd AND Logical_Operator2_out1;

  Out_rsvd <= Logical_Operator1_out1;

END rtl;

