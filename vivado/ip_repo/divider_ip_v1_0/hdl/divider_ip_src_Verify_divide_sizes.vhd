-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/test/divider_ip_src_Verify_divide_sizes.vhd
-- Created: 2024-10-03 19:36:10
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: divider_ip_src_Verify_divide_sizes
-- Source Path: test/divider/Complex Divide HDL Optimized/Verify divide sizes
-- Hierarchy Level: 2
-- Model version: 1.59
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY divider_ip_src_Verify_divide_sizes IS
  PORT( denominator_re                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        denominator_im                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        numerator_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        numerator_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        den_re                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        den_im                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        num_re                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        num_im                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
        );
END divider_ip_src_Verify_divide_sizes;


ARCHITECTURE rtl OF divider_ip_src_Verify_divide_sizes IS

  -- Signals
  SIGNAL denominator_re_signed            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL denominator_im_signed            : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL numerator_re_signed              : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL numerator_im_signed              : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL den_re_tmp                       : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL den_im_tmp                       : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL num_re_tmp                       : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL num_im_tmp                       : signed(15 DOWNTO 0);  -- sfix16_En10

BEGIN
  denominator_re_signed <= signed(denominator_re);

  denominator_im_signed <= signed(denominator_im);

  numerator_re_signed <= signed(numerator_re);

  numerator_im_signed <= signed(numerator_im);

  -- Verify that the dimensions of the input arrays match, and then reshape
  -- them.
  den_re_tmp <= denominator_re_signed;
  den_im_tmp <= denominator_im_signed;
  num_re_tmp <= numerator_re_signed;
  num_im_tmp <= numerator_im_signed;

  den_re <= std_logic_vector(den_re_tmp);

  den_im <= std_logic_vector(den_im_tmp);

  num_re <= std_logic_vector(num_re_tmp);

  num_im <= std_logic_vector(num_im_tmp);

END rtl;
