-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_raw_src_rising_edge_detector_block.vhd
-- Created: 2024-08-31 20:20:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_raw_src_rising_edge_detector_block
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/rising_edge_detector
-- Hierarchy Level: 2
-- Model version: 4.99
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_raw_src_rising_edge_detector_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        In_rsvd                           :   IN    std_logic;
        Out_rsvd                          :   OUT   std_logic
        );
END full_tx_raw_src_rising_edge_detector_block;


ARCHITECTURE rtl OF full_tx_raw_src_rising_edge_detector_block IS

  -- Signals
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;

BEGIN
  stateControl_1 <= '1';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch_reg(0) <= stateControl_1;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  stateControl_2 <= delayMatch_reg(1);

  enb_gated <= stateControl_2 AND enb;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb_gated = '1' THEN
        Delay2_out1 <= In_rsvd;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Logical_Operator2_out1 <=  NOT Delay2_out1;

  Logical_Operator1_out1 <= In_rsvd AND Logical_Operator2_out1;

  Out_rsvd <= Logical_Operator1_out1;

END rtl;
