-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_FilterTapSystolicWvldin.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_FilterTapSystolicWvldin
-- Source Path: HDLRxDemodulator/rx_demodulator_full/decimator/FIR Decimator/FilterBank/subFilter/FilterTapSystolicWvldin
-- Hierarchy Level: 5
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_FilterTapSystolicWvldin IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dinReg2_0_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        coefIn_0                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En14
        addin                             :   IN    std_logic_vector(47 DOWNTO 0);  -- sfix48_En28
        dinRegVld                         :   IN    std_logic;
        softReset                         :   IN    std_logic;
        dinDly2                           :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        tapout                            :   OUT   std_logic_vector(47 DOWNTO 0)  -- sfix48_En28
        );
END rx_demod_optimized_src_FilterTapSystolicWvldin;


ARCHITECTURE rtl OF rx_demod_optimized_src_FilterTapSystolicWvldin IS

  -- Signals
  SIGNAL dinReg2_0_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL coefIn_0_signed                  : signed(13 DOWNTO 0);  -- sfix14_En14
  SIGNAL addin_signed                     : signed(47 DOWNTO 0);  -- sfix48_En28
  SIGNAL fTap_din_reg1                    : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL fTap_coef_reg1                   : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL fTap_din_reg2                    : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL fTap_coef_reg2                   : signed(13 DOWNTO 0);  -- sfix14
  SIGNAL fTap_mult_reg                    : signed(29 DOWNTO 0);  -- sfix30
  SIGNAL fTap_addout_reg                  : signed(47 DOWNTO 0);  -- sfix48
  SIGNAL fTap_din_reg1_next               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL fTap_coef_reg1_next              : signed(13 DOWNTO 0);  -- sfix14_En14
  SIGNAL fTap_din_reg2_next               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL fTap_coef_reg2_next              : signed(13 DOWNTO 0);  -- sfix14_En14
  SIGNAL fTap_mult_reg_next               : signed(29 DOWNTO 0);  -- sfix30_En28
  SIGNAL fTap_addout_reg_next             : signed(47 DOWNTO 0);  -- sfix48_En28
  SIGNAL dinDly2_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL tapout_tmp                       : signed(47 DOWNTO 0);  -- sfix48_En28

BEGIN
  dinReg2_0_re_signed <= signed(dinReg2_0_re);

  coefIn_0_signed <= signed(coefIn_0);

  addin_signed <= signed(addin);

  -- FilterTapSystlicWvldIn
  fTap_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        fTap_din_reg1 <= to_signed(16#0000#, 16);
        fTap_coef_reg1 <= to_signed(16#0000#, 14);
        fTap_din_reg2 <= to_signed(16#0000#, 16);
        fTap_coef_reg2 <= to_signed(16#0000#, 14);
        fTap_mult_reg <= to_signed(16#00000000#, 30);
        fTap_addout_reg <= to_signed(0, 48);
      ELSIF enb = '1' THEN
        IF softReset = '1' THEN
          fTap_din_reg1 <= to_signed(16#0000#, 16);
          fTap_coef_reg1 <= to_signed(16#0000#, 14);
          fTap_din_reg2 <= to_signed(16#0000#, 16);
          fTap_coef_reg2 <= to_signed(16#0000#, 14);
          fTap_mult_reg <= to_signed(16#00000000#, 30);
          fTap_addout_reg <= to_signed(0, 48);
        ELSE 
          fTap_din_reg1 <= fTap_din_reg1_next;
          fTap_coef_reg1 <= fTap_coef_reg1_next;
          fTap_din_reg2 <= fTap_din_reg2_next;
          fTap_coef_reg2 <= fTap_coef_reg2_next;
          fTap_mult_reg <= fTap_mult_reg_next;
          fTap_addout_reg <= fTap_addout_reg_next;
        END IF;
      END IF;
    END IF;
  END PROCESS fTap_process;

  fTap_output : PROCESS (addin_signed, coefIn_0_signed, dinReg2_0_re_signed, dinRegVld, fTap_addout_reg,
       fTap_coef_reg1, fTap_coef_reg2, fTap_din_reg1, fTap_din_reg2,
       fTap_mult_reg)
    VARIABLE add_cast : signed(47 DOWNTO 0);
  BEGIN
    add_cast := to_signed(0, 48);
    fTap_din_reg1_next <= fTap_din_reg1;
    fTap_coef_reg1_next <= fTap_coef_reg1;
    fTap_din_reg2_next <= fTap_din_reg2;
    fTap_coef_reg2_next <= fTap_coef_reg2;
    fTap_mult_reg_next <= fTap_mult_reg;
    fTap_addout_reg_next <= fTap_addout_reg;
    IF dinRegVld = '1' THEN 
      add_cast := resize(fTap_mult_reg, 48);
      fTap_addout_reg_next <= add_cast + addin_signed;
      fTap_mult_reg_next <= fTap_din_reg2 * fTap_coef_reg2;
      fTap_din_reg2_next <= fTap_din_reg1;
      fTap_coef_reg2_next <= fTap_coef_reg1;
      fTap_din_reg1_next <= dinReg2_0_re_signed;
      fTap_coef_reg1_next <= coefIn_0_signed;
    END IF;
    dinDly2_tmp <= fTap_din_reg2;
    tapout_tmp <= fTap_addout_reg;
  END PROCESS fTap_output;


  dinDly2 <= std_logic_vector(dinDly2_tmp);

  tapout <= std_logic_vector(tapout_tmp);

END rtl;

