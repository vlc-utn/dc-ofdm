-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_MATLAB_Function_block.vhd
-- Created: 2024-11-23 11:22:01
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_MATLAB_Function_block
-- Source Path: HDLRx/full_rx/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimized1/ForEach - Real Divide/MATLAB Functio
-- Hierarchy Level: 7
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_MATLAB_Function_block IS
  PORT( num                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        t_num                             :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
        num_out                           :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        t_num_out                         :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33
        );
END IEEE_8021513_RX_src_MATLAB_Function_block;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_MATLAB_Function_block IS

  -- Signals
  SIGNAL num_signed                       : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL t_num_signed                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL num_out_tmp                      : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL t_num_out_tmp                    : signed(32 DOWNTO 0);  -- sfix33

BEGIN
  num_signed <= signed(num);

  t_num_signed <= signed(t_num);

  num_out_tmp <= SHIFT_RIGHT(num_signed, 1);
  t_num_out_tmp <= resize(t_num_signed, 33) - to_signed(1, 33);

  num_out <= std_logic_vector(num_out_tmp);

  t_num_out <= std_logic_vector(t_num_out_tmp);

END rtl;

