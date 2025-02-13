-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_VariableNodeUnit.vhd
-- Created: 2024-11-23 11:22:01
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_VariableNodeUnit
-- Source Path: HDLRx/full_rx/LDPC_shared/LDPC Decoder/DecoderCore/FunctionalUnit/VariableNodeUnit
-- Hierarchy Level: 5
-- Model version: 1.147
-- 
-- Variable Node Unit
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_VariableNodeUnit IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data                              :   IN    vector_of_std_logic_vector6(0 TO 13);  -- sfix6_En1 [14]
        beta                              :   IN    vector_of_std_logic_vector4(0 TO 13);  -- sfix4_En1 [14]
        valid                             :   IN    std_logic;  -- ufix1
        valid_beta                        :   IN    std_logic;  -- ufix1
        reset                             :   IN    std_logic;  -- ufix1
        alpha                             :   OUT   vector_of_std_logic_vector6(0 TO 13);  -- sfix6_En1 [14]
        valid_1                           :   OUT   std_logic  -- ufix1
        );
END IEEE_8021513_RX_src_VariableNodeUnit;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_VariableNodeUnit IS

  -- Signals
  SIGNAL data_signed                      : vector_of_signed6(0 TO 13);  -- sfix6_En1 [14]
  SIGNAL alpha_switch_delay               : vector_of_signed6(0 TO 13);  -- sfix6 [14]
  SIGNAL dataD                            : vector_of_signed6(0 TO 13);  -- sfix6_En1 [14]
  SIGNAL beta_signed                      : vector_of_signed4(0 TO 13);  -- sfix4_En1 [14]
  SIGNAL sub_Comp_sub_cast                : vector_of_signed7(0 TO 13);  -- sfix7_En1 [14]
  SIGNAL sub_Comp_sub_cast_1              : vector_of_signed7(0 TO 13);  -- sfix7_En1 [14]
  SIGNAL sub_Comp_sub_temp                : vector_of_signed7(0 TO 13);  -- sfix7_En1 [14]
  SIGNAL sub                              : vector_of_signed6(0 TO 13);  -- sfix6_En1 [14]
  SIGNAL dataD1                           : vector_of_signed6(0 TO 13);  -- sfix6_En1 [14]
  SIGNAL valid_2                          : std_logic;  -- ufix1

BEGIN
  outputgen2: FOR k IN 0 TO 13 GENERATE
    data_signed(k) <= signed(data(k));
  END GENERATE;

  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alpha_switch_delay <= (OTHERS => to_signed(16#00#, 6));
      ELSIF enb = '1' THEN
        IF reset = '1' THEN
          alpha_switch_delay <= (OTHERS => to_signed(16#00#, 6));
        ELSIF valid = '1' THEN
          alpha_switch_delay <= data_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS c_process;

  
  dataD <= (OTHERS => to_signed(16#00#, 6)) WHEN reset = '1' ELSE
      alpha_switch_delay;

  outputgen1: FOR k IN 0 TO 13 GENERATE
    beta_signed(k) <= signed(beta(k));
  END GENERATE;


  sub_gen: FOR t_0 IN 0 TO 13 GENERATE
    sub_Comp_sub_cast(t_0) <= resize(dataD(t_0), 7);
    sub_Comp_sub_cast_1(t_0) <= resize(beta_signed(t_0), 7);
    sub_Comp_sub_temp(t_0) <= sub_Comp_sub_cast(t_0) - sub_Comp_sub_cast_1(t_0);
    
    sub(t_0) <= "011111" WHEN (sub_Comp_sub_temp(t_0)(6) = '0') AND (sub_Comp_sub_temp(t_0)(5) /= '0') ELSE
        "100000" WHEN (sub_Comp_sub_temp(t_0)(6) = '1') AND (sub_Comp_sub_temp(t_0)(5) /= '1') ELSE
        sub_Comp_sub_temp(t_0)(5 DOWNTO 0);
  END GENERATE sub_gen;


  
  dataD1 <= dataD WHEN valid_beta = '0' ELSE
      sub;

  outputgen: FOR k IN 0 TO 13 GENERATE
    alpha(k) <= std_logic_vector(dataD1(k));
  END GENERATE;

  c_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        valid_2 <= '0';
      ELSIF enb = '1' THEN
        valid_2 <= valid;
      END IF;
    END IF;
  END PROCESS c_1_process;


  valid_1 <= valid_2;

END rtl;

