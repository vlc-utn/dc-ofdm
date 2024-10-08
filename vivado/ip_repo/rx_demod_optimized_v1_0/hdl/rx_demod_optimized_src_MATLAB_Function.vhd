-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_MATLAB_Function.vhd
-- Created: 2024-10-04 10:51:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_MATLAB_Function
-- Source Path: HDLRxDemodulator/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimized/ForEach - Real Divide/MATLAB Functio
-- Hierarchy Level: 6
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_MATLAB_Function IS
  PORT( num                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        t_num                             :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
        num_out                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        t_num_out                         :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33
        );
END rx_demod_optimized_src_MATLAB_Function;


ARCHITECTURE rtl OF rx_demod_optimized_src_MATLAB_Function IS

  -- Signals
  SIGNAL num_signed                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL t_num_signed                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL num_out_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL t_num_out_tmp                    : signed(32 DOWNTO 0);  -- sfix33

BEGIN
  num_signed <= signed(num);

  t_num_signed <= signed(t_num);

  num_out_tmp <= SHIFT_RIGHT(num_signed, 1);
  t_num_out_tmp <= resize(t_num_signed, 33) - to_signed(1, 33);

  num_out <= std_logic_vector(num_out_tmp);

  t_num_out <= std_logic_vector(t_num_out_tmp);

END rtl;

