-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_Real_Divide_HDL_Optimized.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_Real_Divide_HDL_Optimized
-- Source Path: HDLRxDemodulator/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimize
-- Hierarchy Level: 4
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_Real_Divide_HDL_Optimized IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        num                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        den                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        validIn                           :   IN    std_logic;
        y                                 :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En10
        );
END rx_demod_optimized_src_Real_Divide_HDL_Optimized;


ARCHITECTURE rtl OF rx_demod_optimized_src_Real_Divide_HDL_Optimized IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_Verify_divide_sizes
    PORT( denominator                     :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          numerator                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          den                             :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          num                             :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_ForEach_Real_Divide
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          den                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          num                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En10
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_Reshape_to_original_size
    PORT( y                               :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          z                               :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En10
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_Verify_divide_sizes
    USE ENTITY work.rx_demod_optimized_src_Verify_divide_sizes(rtl);

  FOR ALL : rx_demod_optimized_src_ForEach_Real_Divide
    USE ENTITY work.rx_demod_optimized_src_ForEach_Real_Divide(rtl);

  FOR ALL : rx_demod_optimized_src_Reshape_to_original_size
    USE ENTITY work.rx_demod_optimized_src_Reshape_to_original_size(rtl);

  -- Signals
  SIGNAL den_1                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL num_1                            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL ForEach_Real_Divide_out1         : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL z                                : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL z_signed                         : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay17_out1                     : signed(11 DOWNTO 0);  -- sfix12_En10

BEGIN
  u_Verify_divide_sizes : rx_demod_optimized_src_Verify_divide_sizes
    PORT MAP( denominator => den,  -- sfix16_En14
              numerator => num,  -- sfix16_En14
              den => den_1,  -- sfix16_En14
              num => num_1  -- sfix16_En14
              );

  u_ForEach_Real_Divide_instance1 : rx_demod_optimized_src_ForEach_Real_Divide
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              den => den_1,  -- sfix16_En14
              num => num_1,  -- sfix16_En14
              validIn => validIn,
              y => ForEach_Real_Divide_out1  -- sfix12_En10
              );

  u_Reshape_to_original_size : rx_demod_optimized_src_Reshape_to_original_size
    PORT MAP( y => ForEach_Real_Divide_out1,  -- sfix12_En10
              u => num,  -- sfix16_En14
              z => z  -- sfix12_En10
              );

  z_signed <= signed(z);

  Delay17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay17_out1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay17_out1 <= z_signed;
      END IF;
    END IF;
  END PROCESS Delay17_process;


  y <= std_logic_vector(Delay17_out1);

END rtl;
