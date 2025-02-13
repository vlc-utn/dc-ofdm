-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_Quadrant_Mapper.vhd
-- Created: 2024-11-23 11:22:02
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_Quadrant_Mapper
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/phase_offset_calculator/HDL_CMA_core/Quadrant_Mapper
-- Hierarchy Level: 5
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_Quadrant_Mapper IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        xin                               :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En10
        yin                               :   IN    std_logic_vector(20 DOWNTO 0);  -- sfix21_En10
        xout                              :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En10
        yout                              :   OUT   std_logic_vector(20 DOWNTO 0);  -- sfix21_En10
        QA_Control                        :   OUT   std_logic_vector(4 DOWNTO 0)  -- ufix5
        );
END IEEE_8021513_RX_src_Quadrant_Mapper;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_Quadrant_Mapper IS

  -- Signals
  SIGNAL xin_signed                       : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL abs_rsvd_y                       : signed(21 DOWNTO 0);  -- sfix22_En10
  SIGNAL abs_rsvd_cast                    : signed(21 DOWNTO 0);  -- sfix22_En10
  SIGNAL xAbs                             : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL xAbsReg                          : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL yin_signed                       : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL abs_rsvd_y_1                     : signed(21 DOWNTO 0);  -- sfix22_En10
  SIGNAL abs_rsvd_cast_1                  : signed(21 DOWNTO 0);  -- sfix22_En10
  SIGNAL yAbs                             : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL yAbsReg                          : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL XGreaterThanY                    : std_logic;  -- ufix1
  SIGNAL xout_1                           : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL yout_1                           : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL in2reg                           : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL yZero                            : std_logic;  -- ufix1
  SIGNAL in1reg                           : signed(20 DOWNTO 0);  -- sfix21_En10
  SIGNAL xPositive                        : std_logic;  -- ufix1
  SIGNAL yZeroXPositive                   : std_logic;  -- ufix1
  SIGNAL xNegative                        : std_logic;  -- ufix1
  SIGNAL yZeroXNegative                   : std_logic;  -- ufix1
  SIGNAL yNegative                        : std_logic;  -- ufix1
  SIGNAL qcControl                        : unsigned(4 DOWNTO 0);  -- ufix5

BEGIN
  xin_signed <= signed(xin);

  abs_rsvd_cast <= resize(xin_signed, 22);
  
  abs_rsvd_y <=  - (abs_rsvd_cast) WHEN xin_signed < to_signed(16#000000#, 21) ELSE
      resize(xin_signed, 22);
  xAbs <= abs_rsvd_y(20 DOWNTO 0);

  DelayxAbs_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        xAbsReg <= to_signed(16#000000#, 21);
      ELSIF enb_1_2_0 = '1' THEN
        xAbsReg <= xAbs;
      END IF;
    END IF;
  END PROCESS DelayxAbs_process;


  yin_signed <= signed(yin);

  abs_rsvd_cast_1 <= resize(yin_signed, 22);
  
  abs_rsvd_y_1 <=  - (abs_rsvd_cast_1) WHEN yin_signed < to_signed(16#000000#, 21) ELSE
      resize(yin_signed, 22);
  yAbs <= abs_rsvd_y_1(20 DOWNTO 0);

  DelayyAbs_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        yAbsReg <= to_signed(16#000000#, 21);
      ELSIF enb_1_2_0 = '1' THEN
        yAbsReg <= yAbs;
      END IF;
    END IF;
  END PROCESS DelayyAbs_process;


  
  XGreaterThanY <= '1' WHEN xAbsReg > yAbsReg ELSE
      '0';

  
  xout_1 <= yAbsReg WHEN XGreaterThanY = '0' ELSE
      xAbsReg;

  xout <= std_logic_vector(xout_1);

  
  yout_1 <= xAbsReg WHEN XGreaterThanY = '0' ELSE
      yAbsReg;

  yout <= std_logic_vector(yout_1);

  Delayin2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        in2reg <= to_signed(16#000000#, 21);
      ELSIF enb_1_2_0 = '1' THEN
        in2reg <= yin_signed;
      END IF;
    END IF;
  END PROCESS Delayin2_process;


  
  yZero <= '1' WHEN in2reg = to_signed(16#000000#, 21) ELSE
      '0';

  Delayin1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        in1reg <= to_signed(16#000000#, 21);
      ELSIF enb_1_2_0 = '1' THEN
        in1reg <= xin_signed;
      END IF;
    END IF;
  END PROCESS Delayin1_process;


  
  xPositive <= '1' WHEN in1reg >= to_signed(16#000000#, 21) ELSE
      '0';

  yZeroXPositive <= yZero AND xPositive;

  
  xNegative <= '1' WHEN in1reg < to_signed(16#000000#, 21) ELSE
      '0';

  yZeroXNegative <= yZero AND xNegative;

  
  yNegative <= '1' WHEN in2reg < to_signed(16#000000#, 21) ELSE
      '0';

  qcControl <= unsigned'(yZeroXPositive & yZeroXNegative & XGreaterThanY & xNegative & yNegative);

  QA_Control <= std_logic_vector(qcControl);

END rtl;

