-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block.vhd
-- Created: 2024-10-27 23:05:38
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block
-- Source Path: HDLRx/full_rx/h_rx_full/h_crc_rx/Sample Control Bus Creator
-- Hierarchy Level: 3
-- Model version: 1.138
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block IS
  PORT( In1                               :   IN    std_logic;
        In3                               :   IN    std_logic;
        Out1_start                        :   OUT   std_logic;
        Out1_valid                        :   OUT   std_logic
        );
END IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block IS

BEGIN
  Out1_start <= In1;

  Out1_valid <= In3;

END rtl;
