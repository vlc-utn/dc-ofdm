-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/test/divider_ip_src_Normalize_denominator_block.vhd
-- Created: 2024-10-03 19:36:10
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: divider_ip_src_Normalize_denominator_block
-- Source Path: test/divider/in_16_out_16/ForEach - Real Divide/Normalize denominator
-- Hierarchy Level: 3
-- Model version: 1.59
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY divider_ip_src_Normalize_denominator_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        u                                 :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        validIn                           :   IN    std_logic;
        x                                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        e                                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
        isNegative                        :   OUT   std_logic;
        validOut                          :   OUT   std_logic
        );
END divider_ip_src_Normalize_denominator_block;


ARCHITECTURE rtl OF divider_ip_src_Normalize_denominator_block IS

  -- Component Declarations
  COMPONENT divider_ip_src_positiveRealNormalizer
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : divider_ip_src_positiveRealNormalizer
    USE ENTITY work.divider_ip_src_positiveRealNormalizer(rtl);

  -- Signals
  SIGNAL positiveRealNormalizer_out1      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL positiveRealNormalizer_out2      : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL positiveRealNormalizer_out3      : std_logic;
  SIGNAL positiveRealNormalizer_out4      : std_logic;

BEGIN
  u_positiveRealNormalizer : divider_ip_src_positiveRealNormalizer
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              u => u,  -- sfix16_En10
              validIn => validIn,
              x => positiveRealNormalizer_out1,  -- sfix16_En14
              e => positiveRealNormalizer_out2,  -- int32
              isNegative => positiveRealNormalizer_out3,
              validOut => positiveRealNormalizer_out4
              );

  x <= positiveRealNormalizer_out1;

  e <= positiveRealNormalizer_out2;

  isNegative <= positiveRealNormalizer_out3;

  validOut <= positiveRealNormalizer_out4;

END rtl;

