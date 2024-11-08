-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_Symbol_Demodulator.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_Symbol_Demodulator
-- Source Path: HDLRxDemodulator/rx_demodulator_full/qam_demod/Symbol Demodulator
-- Hierarchy Level: 2
-- Model version: 1.58
-- 
-- Generalized Symbol Demodulator
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_ip_src_Symbol_Demodulator IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        in0_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        in0_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        in1                               :   IN    std_logic;
        out0                              :   OUT   std_logic_vector(19 DOWNTO 0)  -- sfix20_En14
        );
END rx_demod_ip_src_Symbol_Demodulator;


ARCHITECTURE rtl OF rx_demod_ip_src_Symbol_Demodulator IS

  -- Component Declarations
  COMPONENT rx_demod_ip_src_symDemodBPSKVector
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validIn                         :   IN    std_logic;  -- ufix1
          dataOut                         :   OUT   std_logic_vector(19 DOWNTO 0)  -- sfix20_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_ip_src_symDemodBPSKVector
    USE ENTITY work.rx_demod_ip_src_symDemodBPSKVector(rtl);

  -- Signals
  SIGNAL bpskDataOut                      : std_logic_vector(19 DOWNTO 0);  -- ufix20

BEGIN
  u_symbBPSKDemodNet_inst : rx_demod_ip_src_symDemodBPSKVector
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              dataIn_re => in0_re,  -- sfix16_En14
              dataIn_im => in0_im,  -- sfix16_En14
              validIn => in1,  -- ufix1
              dataOut => bpskDataOut  -- sfix20_En14
              );

  out0 <= bpskDataOut;

END rtl;

