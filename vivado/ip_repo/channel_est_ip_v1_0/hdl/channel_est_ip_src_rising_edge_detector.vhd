-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLChannelEstimator/channel_est_ip_src_rising_edge_detector.vhd
-- Created: 2024-10-02 11:31:35
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: channel_est_ip_src_rising_edge_detector
-- Source Path: HDLChannelEstimator/hdl_wrapper/channel_estimation_and_equalization/Channel Equalization/rising_edge_detector
-- Hierarchy Level: 3
-- Model version: 1.24
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY channel_est_ip_src_rising_edge_detector IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        In_rsvd                           :   IN    std_logic;
        Out_rsvd                          :   OUT   std_logic
        );
END channel_est_ip_src_rising_edge_detector;


ARCHITECTURE rtl OF channel_est_ip_src_rising_edge_detector IS

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

