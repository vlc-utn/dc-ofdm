-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_Cast_to_Union_of_Types_block.vhd
-- Created: 2024-11-23 11:22:01
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_Cast_to_Union_of_Types_block
-- Source Path: HDLRx/full_rx/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimized1/ForEach - Real Divide/Shift and cast to output type/Cast to Union of Type
-- Hierarchy Level: 8
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_Cast_to_Union_of_Types_block IS
  PORT( Xref                              :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En12
        Cin                               :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        Cout                              :   OUT   std_logic_vector(21 DOWNTO 0)  -- sfix22_En16
        );
END IEEE_8021513_RX_src_Cast_to_Union_of_Types_block;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_Cast_to_Union_of_Types_block IS

  -- Signals
  SIGNAL Xref_signed                      : signed(17 DOWNTO 0);  -- sfix18_En12
  SIGNAL Cin_signed                       : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL Cout_tmp                         : signed(21 DOWNTO 0);  -- sfix22_En16

BEGIN
  Xref_signed <= signed(Xref);

  Cin_signed <= signed(Cin);

  --castToUnionType Cast second input to union of the two types
  Cout_tmp <= resize(Cin_signed, 22);

  Cout <= std_logic_vector(Cout_tmp);

END rtl;

