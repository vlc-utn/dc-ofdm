-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_src_Addressable_Delay_Line_block4.vhd
-- Created: 2024-08-11 18:37:15
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_src_Addressable_Delay_Line_block4
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/interpolator/FIR Interpolator/HDLTx/full_tx/full_ofdm_modulator/interpolator/FIR 
-- Interpolator/FIRFilter1/Addressable_Delay_Lin
-- Hierarchy Level: 5
-- Model version: 4.91
-- 
-- Addressable Delay Line
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_ip_src_Addressable_Delay_Line_block4 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        wrEn                              :   IN    std_logic;
        rdAddr                            :   IN    std_logic;  -- ufix1
        delayLineEnd                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dataOut                           :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END full_tx_ip_src_Addressable_Delay_Line_block4;


ARCHITECTURE rtl OF full_tx_ip_src_Addressable_Delay_Line_block4 IS

  -- Signals
  SIGNAL dataIn_signed                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL delayedSignals0                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL ZEROCONST                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL switchDataOut                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dataOut_tmp                      : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  dataIn_signed <= signed(dataIn);

  delay0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayedSignals0 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' AND wrEn = '1' THEN
        delayedSignals0 <= dataIn_signed;
      END IF;
    END IF;
  END PROCESS delay0_process;


  delayLineEnd <= std_logic_vector(delayedSignals0);

  ZEROCONST <= to_signed(16#0000#, 16);

  
  switchDataOut <= delayedSignals0 WHEN rdAddr = '0' ELSE
      ZEROCONST;

  dataOutReg_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dataOut_tmp <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        dataOut_tmp <= switchDataOut;
      END IF;
    END IF;
  END PROCESS dataOutReg_process;


  dataOut <= std_logic_vector(dataOut_tmp);

END rtl;
