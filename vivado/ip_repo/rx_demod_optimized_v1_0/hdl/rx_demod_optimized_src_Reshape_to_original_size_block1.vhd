-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_Reshape_to_original_size_block1.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_Reshape_to_original_size_block1
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/Reshape to 
-- original siz
-- Hierarchy Level: 4
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_Reshape_to_original_size_block1 IS
  PORT( y                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        u                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En10
        z                                 :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END rx_demod_optimized_src_Reshape_to_original_size_block1;


ARCHITECTURE rtl OF rx_demod_optimized_src_Reshape_to_original_size_block1 IS

  -- Signals
  SIGNAL y_signed                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL u_unsigned                       : unsigned(15 DOWNTO 0);  -- ufix16_En10
  SIGNAL z_tmp                            : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  y_signed <= signed(y);

  u_unsigned <= unsigned(u);

  z_tmp <= y_signed;

  z <= std_logic_vector(z_tmp);

END rtl;
