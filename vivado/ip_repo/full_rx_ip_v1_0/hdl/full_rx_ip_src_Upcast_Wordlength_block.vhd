-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_Upcast_Wordlength_block.vhd
-- Created: 2024-08-10 11:14:30
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_Upcast_Wordlength_block
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/ForEach - Real 
-- Divide/Upcast Wordlengt
-- Hierarchy Level: 6
-- Model version: 1.14
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_Upcast_Wordlength_block IS
  PORT( x                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        y                                 :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        u                                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        v                                 :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En24
        );
END full_rx_ip_src_Upcast_Wordlength_block;


ARCHITECTURE rtl OF full_rx_ip_src_Upcast_Wordlength_block IS

  -- Signals
  SIGNAL x_signed                         : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL y_signed                         : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL u_tmp                            : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL v_tmp                            : signed(31 DOWNTO 0);  -- sfix32_En24

BEGIN
  x_signed <= signed(x);

  y_signed <= signed(y);

  -- Copyright 2019 The MathWorks, Inc.
  u_tmp <= x_signed;
  v_tmp <= y_signed;

  u <= std_logic_vector(u_tmp);

  v <= std_logic_vector(v_tmp);

END rtl;
