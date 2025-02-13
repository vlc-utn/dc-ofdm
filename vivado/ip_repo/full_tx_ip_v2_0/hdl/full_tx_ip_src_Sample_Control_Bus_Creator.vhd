-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_src_Sample_Control_Bus_Creator.vhd
-- Created: 2024-09-01 16:46:29
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_src_Sample_Control_Bus_Creator
-- Source Path: HDLTx/full_tx/channel_gen/valid_to_ctrl/Sample Control Bus Creator
-- Hierarchy Level: 3
-- Model version: 4.102
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_ip_src_Sample_Control_Bus_Creator IS
  PORT( In2                               :   IN    std_logic;
        In3                               :   IN    std_logic;
        Out1_end                          :   OUT   std_logic;
        Out1_valid                        :   OUT   std_logic
        );
END full_tx_ip_src_Sample_Control_Bus_Creator;


ARCHITECTURE rtl OF full_tx_ip_src_Sample_Control_Bus_Creator IS

BEGIN
  Out1_end <= In2;

  Out1_valid <= In3;

END rtl;

