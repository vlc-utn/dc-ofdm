-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLOFDMSS/ofdm_ss_ip_src_Reshape_to_original_size.vhd
-- Created: 2024-10-01 22:57:03
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_ss_ip_src_Reshape_to_original_size
-- Source Path: HDLOFDMSS/hdl_wrapper/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/Reshape to original size
-- Hierarchy Level: 4
-- Model version: 1.113
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY ofdm_ss_ip_src_Reshape_to_original_size IS
  PORT( y                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        u                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        z                                 :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_ss_ip_src_Reshape_to_original_size;


ARCHITECTURE rtl OF ofdm_ss_ip_src_Reshape_to_original_size IS

  -- Signals
  SIGNAL y_signed                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL u_signed                         : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL z_tmp                            : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  y_signed <= signed(y);

  u_signed <= signed(u);

  --MATLAB Function 'Real Divide HDL Optimized/Reshape to original size'
  z_tmp <= y_signed;

  z <= std_logic_vector(z_tmp);

END rtl;
