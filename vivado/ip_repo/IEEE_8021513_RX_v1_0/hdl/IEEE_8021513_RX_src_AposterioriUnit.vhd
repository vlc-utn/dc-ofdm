-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_AposterioriUnit.vhd
-- Created: 2024-10-27 23:05:38
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_AposterioriUnit
-- Source Path: HDLRx/full_rx/LDPC_shared/LDPC Decoder/DecoderCore/FunctionalUnit/AposterioriUnit
-- Hierarchy Level: 5
-- Model version: 1.138
-- 
-- Aposteriori Node Unit
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_AposterioriUnit IS
  PORT( alpha                             :   IN    vector_of_std_logic_vector6(0 TO 13);  -- sfix6_En1 [14]
        beta                              :   IN    vector_of_std_logic_vector4(0 TO 13);  -- sfix4_En1 [14]
        valid                             :   IN    std_logic;  -- ufix1
        gamma                             :   OUT   vector_of_std_logic_vector6(0 TO 13);  -- sfix6_En1 [14]
        valid_1                           :   OUT   std_logic  -- ufix1
        );
END IEEE_8021513_RX_src_AposterioriUnit;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_AposterioriUnit IS

  -- Signals
  SIGNAL alpha_signed                     : vector_of_signed6(0 TO 13);  -- sfix6_En1 [14]
  SIGNAL beta_signed                      : vector_of_signed4(0 TO 13);  -- sfix4_En1 [14]
  SIGNAL add_Comp_add_cast                : vector_of_signed7(0 TO 13);  -- sfix7_En1 [14]
  SIGNAL add_Comp_add_cast_1              : vector_of_signed6(0 TO 13);  -- sfix6_En1 [14]
  SIGNAL add_Comp_add_cast_2              : vector_of_signed7(0 TO 13);  -- sfix7_En1 [14]
  SIGNAL add_Comp_add_temp                : vector_of_signed7(0 TO 13);  -- sfix7_En1 [14]
  SIGNAL add                              : vector_of_signed6(0 TO 13);  -- sfix6_En1 [14]

BEGIN
  outputgen2: FOR k IN 0 TO 13 GENERATE
    alpha_signed(k) <= signed(alpha(k));
  END GENERATE;

  outputgen1: FOR k IN 0 TO 13 GENERATE
    beta_signed(k) <= signed(beta(k));
  END GENERATE;


  add_gen: FOR t_0 IN 0 TO 13 GENERATE
    add_Comp_add_cast(t_0) <= resize(alpha_signed(t_0), 7);
    add_Comp_add_cast_1(t_0) <= resize(beta_signed(t_0), 6);
    add_Comp_add_cast_2(t_0) <= resize(add_Comp_add_cast_1(t_0), 7);
    add_Comp_add_temp(t_0) <= add_Comp_add_cast(t_0) + add_Comp_add_cast_2(t_0);
    
    add(t_0) <= "011111" WHEN (add_Comp_add_temp(t_0)(6) = '0') AND (add_Comp_add_temp(t_0)(5) /= '0') ELSE
        "100000" WHEN (add_Comp_add_temp(t_0)(6) = '1') AND (add_Comp_add_temp(t_0)(5) /= '1') ELSE
        add_Comp_add_temp(t_0)(5 DOWNTO 0);
  END GENERATE add_gen;


  outputgen: FOR k IN 0 TO 13 GENERATE
    gamma(k) <= std_logic_vector(add(k));
  END GENERATE;

  valid_1 <= valid;

END rtl;
