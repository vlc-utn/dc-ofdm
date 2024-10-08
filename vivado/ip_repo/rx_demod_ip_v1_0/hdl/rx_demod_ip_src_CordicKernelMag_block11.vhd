-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_CordicKernelMag_block11.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_CordicKernelMag_block11
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_symbol_sync/frequency_offset_calculator/HDL_CMA_core/CordicKernelMag
-- Hierarchy Level: 3
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_ip_src_CordicKernelMag_block11 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        yin                               :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17_En12
        zin                               :   IN    std_logic_vector(18 DOWNTO 0);  -- sfix19_En18
        lut_value                         :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En18
        zout                              :   OUT   std_logic_vector(18 DOWNTO 0)  -- sfix19_En18
        );
END rx_demod_ip_src_CordicKernelMag_block11;


ARCHITECTURE rtl OF rx_demod_ip_src_CordicKernelMag_block11 IS

  -- Signals
  SIGNAL yin_signed                       : signed(16 DOWNTO 0);  -- sfix17_En12
  SIGNAL yLessThanZero                    : std_logic;
  SIGNAL yLessThanZero_1                  : std_logic;
  SIGNAL zin_signed                       : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL lut_value_unsigned               : unsigned(15 DOWNTO 0);  -- ufix16_En18
  SIGNAL ZAdder_add_cast                  : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL zout2                            : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL zout2_1                          : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL ZSub_sub_cast                    : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL zout1                            : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL zout1_1                          : signed(18 DOWNTO 0);  -- sfix19_En18
  SIGNAL zout_tmp                         : signed(18 DOWNTO 0);  -- sfix19_En18

BEGIN
  yin_signed <= signed(yin);

  
  yLessThanZero <= '1' WHEN yin_signed < to_signed(16#00000#, 17) ELSE
      '0';

  rd_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        yLessThanZero_1 <= '0';
      ELSIF enb = '1' THEN
        yLessThanZero_1 <= yLessThanZero;
      END IF;
    END IF;
  END PROCESS rd_7_process;


  zin_signed <= signed(zin);

  lut_value_unsigned <= unsigned(lut_value);

  ZAdder_add_cast <= signed(resize(lut_value_unsigned, 19));
  zout2 <= zin_signed + ZAdder_add_cast;

  rd_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        zout2_1 <= to_signed(16#00000#, 19);
      ELSIF enb = '1' THEN
        zout2_1 <= zout2;
      END IF;
    END IF;
  END PROCESS rd_8_process;


  ZSub_sub_cast <= signed(resize(lut_value_unsigned, 19));
  zout1 <= zin_signed - ZSub_sub_cast;

  rd_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        zout1_1 <= to_signed(16#00000#, 19);
      ELSIF enb = '1' THEN
        zout1_1 <= zout1;
      END IF;
    END IF;
  END PROCESS rd_6_process;


  
  zout_tmp <= zout2_1 WHEN yLessThanZero_1 = '0' ELSE
      zout1_1;

  zout <= std_logic_vector(zout_tmp);

END rtl;

