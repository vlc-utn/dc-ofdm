-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_Symbol_Demodulator1.vhd
-- Created: 2024-10-04 10:51:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_Symbol_Demodulator1
-- Source Path: HDLRxDemodulator/rx_demodulator_full/4QAM_demod/Symbol Demodulator1
-- Hierarchy Level: 2
-- Model version: 1.70
-- 
-- Generalized Symbol Demodulator
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_Symbol_Demodulator1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        in0_re                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        in0_im                            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        in1                               :   IN    std_logic;
        out0                              :   OUT   vector_of_std_logic_vector16(0 TO 1)  -- sfix16_En10 [2]
        );
END rx_demod_optimized_src_Symbol_Demodulator1;


ARCHITECTURE rtl OF rx_demod_optimized_src_Symbol_Demodulator1 IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_symDemodQPSKVector
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dataIn_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          validIn                         :   IN    std_logic;  -- ufix1
          dataOut                         :   OUT   vector_of_std_logic_vector16(0 TO 1)  -- sfix16_En10 [2]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_symDemodQPSKVector
    USE ENTITY work.rx_demod_optimized_src_symDemodQPSKVector(rtl);

  -- Signals
  SIGNAL qpskDataOut                      : vector_of_std_logic_vector16(0 TO 1);  -- ufix16 [2]

BEGIN
  u_symbQPSKDemodNet_inst : rx_demod_optimized_src_symDemodQPSKVector
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              dataIn_re => in0_re,  -- sfix12_En10
              dataIn_im => in0_im,  -- sfix12_En10
              validIn => in1,  -- ufix1
              dataOut => qpskDataOut  -- sfix16_En10 [2]
              );

  out0 <= qpskDataOut;

END rtl;
