-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_4QAM_demod.vhd
-- Created: 2024-10-04 10:51:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_4QAM_demod
-- Source Path: HDLRxDemodulator/rx_demodulator_full/4QAM_demod
-- Hierarchy Level: 1
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_4QAM_demod IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_in_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_in                          :   IN    std_logic;
        data_out                          :   OUT   vector_of_std_logic_vector16(0 TO 1);  -- sfix16_En10 [2]
        valid_out                         :   OUT   std_logic
        );
END rx_demod_optimized_src_4QAM_demod;


ARCHITECTURE rtl OF rx_demod_optimized_src_4QAM_demod IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_Symbol_Demodulator1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in0_re                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          in0_im                          :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          in1                             :   IN    std_logic;
          out0                            :   OUT   vector_of_std_logic_vector16(0 TO 1)  -- sfix16_En10 [2]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_Symbol_Demodulator1
    USE ENTITY work.rx_demod_optimized_src_Symbol_Demodulator1(rtl);

  -- Signals
  SIGNAL Symbol_Demodulator1_out1         : vector_of_std_logic_vector16(0 TO 1);  -- ufix16 [2]
  SIGNAL Symbol_Demodulator1_out1_signed  : vector_of_signed16(0 TO 1);  -- sfix16_En10 [2]
  SIGNAL Delay3_out1                      : vector_of_signed16(0 TO 1);  -- sfix16_En10 [2]
  SIGNAL Delay_out1                       : vector_of_signed16(0 TO 1);  -- sfix16_En10 [2]
  SIGNAL Delay5_reg                       : std_logic_vector(5 DOWNTO 0);  -- ufix1 [6]
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL Delay1_out1                      : std_logic;

BEGIN
  u_Symbol_Demodulator1 : rx_demod_optimized_src_Symbol_Demodulator1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in0_re => data_in_re,  -- sfix12_En10
              in0_im => data_in_im,  -- sfix12_En10
              in1 => valid_in,
              out0 => Symbol_Demodulator1_out1  -- sfix16_En10 [2]
              );

  outputgen1: FOR k IN 0 TO 1 GENERATE
    Symbol_Demodulator1_out1_signed(k) <= signed(Symbol_Demodulator1_out1(k));
  END GENERATE;

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= Symbol_Demodulator1_out1_signed;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        Delay_out1 <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  outputgen: FOR k IN 0 TO 1 GENERATE
    data_out(k) <= std_logic_vector(Delay_out1(k));
  END GENERATE;

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_reg(0) <= valid_in;
        Delay5_reg(5 DOWNTO 1) <= Delay5_reg(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay5_process;

  Delay5_out1 <= Delay5_reg(5);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Delay5_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  valid_out <= Delay1_out1;

END rtl;
