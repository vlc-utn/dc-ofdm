-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_Compare_To_Constant_block.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_Compare_To_Constant_block
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_symbol_sync/find_peak/Compare To Constant
-- Hierarchy Level: 3
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_ip_src_Compare_To_Constant_block IS
  PORT( u                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        y                                 :   OUT   std_logic
        );
END rx_demod_ip_src_Compare_To_Constant_block;


ARCHITECTURE rtl OF rx_demod_ip_src_Compare_To_Constant_block IS

  -- Signals
  SIGNAL u_signed                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant_out1                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Compare_out1                     : std_logic;

BEGIN
  u_signed <= signed(u);

  Constant_out1 <= to_signed(16#299A#, 16);

  
  Compare_out1 <= '1' WHEN u_signed > Constant_out1 ELSE
      '0';

  y <= Compare_out1;

END rtl;
