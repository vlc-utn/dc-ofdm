-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/test/ldpc_deco_23_ip_src_VariableNodeUnit.vhd
-- Created: 2024-10-03 14:23:14
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ldpc_deco_23_ip_src_VariableNodeUnit
-- Source Path: test/ldpc_deco_23/LDPC Decoder/DecoderCore/FunctionalUnit/VariableNodeUnit
-- Hierarchy Level: 4
-- Model version: 1.55
-- 
-- Variable Node Unit
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ldpc_deco_23_ip_src_ldpc_deco_23_pac.ALL;

ENTITY ldpc_deco_23_ip_src_VariableNodeUnit IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data                              :   IN    vector_of_std_logic_vector6(0 TO 47);  -- sfix6 [48]
        beta                              :   IN    vector_of_std_logic_vector4(0 TO 47);  -- sfix4 [48]
        valid                             :   IN    std_logic;  -- ufix1
        valid_beta                        :   IN    std_logic;  -- ufix1
        reset                             :   IN    std_logic;  -- ufix1
        alpha                             :   OUT   vector_of_std_logic_vector6(0 TO 47);  -- sfix6 [48]
        valid_1                           :   OUT   std_logic  -- ufix1
        );
END ldpc_deco_23_ip_src_VariableNodeUnit;


ARCHITECTURE rtl OF ldpc_deco_23_ip_src_VariableNodeUnit IS

  -- Signals
  SIGNAL data_signed                      : vector_of_signed6(0 TO 47);  -- sfix6 [48]
  SIGNAL alpha_switch_delay               : vector_of_signed6(0 TO 47);  -- sfix6 [48]
  SIGNAL dataD                            : vector_of_signed6(0 TO 47);  -- sfix6 [48]
  SIGNAL beta_signed                      : vector_of_signed4(0 TO 47);  -- sfix4 [48]
  SIGNAL sub_Comp_sub_temp                : vector_of_signed7(0 TO 47);  -- sfix7 [48]
  SIGNAL sub                              : vector_of_signed6(0 TO 47);  -- sfix6 [48]
  SIGNAL dataD1                           : vector_of_signed6(0 TO 47);  -- sfix6 [48]
  SIGNAL valid_2                          : std_logic;  -- ufix1

BEGIN
  outputgen2: FOR k IN 0 TO 47 GENERATE
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

  outputgen1: FOR k IN 0 TO 47 GENERATE
    beta_signed(k) <= signed(beta(k));
  END GENERATE;


  sub_gen: FOR t_0 IN 0 TO 47 GENERATE
    sub_Comp_sub_temp(t_0) <= resize(dataD(t_0), 7) - resize(beta_signed(t_0), 7);
    
    sub(t_0) <= "011111" WHEN (sub_Comp_sub_temp(t_0)(6) = '0') AND (sub_Comp_sub_temp(t_0)(5) /= '0') ELSE
        "100000" WHEN (sub_Comp_sub_temp(t_0)(6) = '1') AND (sub_Comp_sub_temp(t_0)(5) /= '1') ELSE
        sub_Comp_sub_temp(t_0)(5 DOWNTO 0);
  END GENERATE sub_gen;


  
  dataD1 <= dataD WHEN valid_beta = '0' ELSE
      sub;

  outputgen: FOR k IN 0 TO 47 GENERATE
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
