-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_Cast_to_Union_of_Types_block1.vhd
-- Created: 2024-10-27 23:05:39
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_Cast_to_Union_of_Types_block1
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/ForEach - Real 
-- Divide/Shift and cast to output type/Cast to Union of Type
-- Hierarchy Level: 7
-- Model version: 1.138
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_Cast_to_Union_of_Types_block1 IS
  PORT( Xref                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        Cin                               :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
        Cout                              :   OUT   std_logic_vector(24 DOWNTO 0)  -- sfix25_En23
        );
END IEEE_8021513_RX_src_Cast_to_Union_of_Types_block1;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_Cast_to_Union_of_Types_block1 IS

  -- Signals
  SIGNAL Xref_signed                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Cin_signed                       : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Cout_tmp                         : signed(24 DOWNTO 0);  -- sfix25_En23

BEGIN
  Xref_signed <= signed(Xref);

  Cin_signed <= signed(Cin);

  --castToUnionType Cast second input to union of the two types
  Cout_tmp <= Cin_signed;

  Cout <= std_logic_vector(Cout_tmp);

END rtl;
