-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_Compare_To_Zero.vhd
-- Created: 2024-08-10 11:14:30
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_Compare_To_Zero
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_separator/Real Divide HDL Optimized/ForEach - Real Divide/Divide 
-- by zero handler/Compare To Zer
-- Hierarchy Level: 6
-- Model version: 1.14
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_Compare_To_Zero IS
  PORT( u                                 :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
        y                                 :   OUT   std_logic
        );
END full_rx_ip_src_Compare_To_Zero;


ARCHITECTURE rtl OF full_rx_ip_src_Compare_To_Zero IS

  -- Signals
  SIGNAL u_signed                         : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Constant_out1                    : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Compare_out1                     : std_logic;

BEGIN
  u_signed <= signed(u);

  Constant_out1 <= to_signed(16#0000000#, 25);

  
  Compare_out1 <= '1' WHEN u_signed >= Constant_out1 ELSE
      '0';

  y <= Compare_out1;

END rtl;
