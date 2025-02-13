-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_Variable_Right_Shift_block1.vhd
-- Created: 2024-11-23 11:22:02
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_Variable_Right_Shift_block1
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/ForEach - Real 
-- Divide/Shift and cast to output type/Variable Right Shif
-- Hierarchy Level: 7
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_Variable_Right_Shift_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        x                                 :   IN    std_logic_vector(24 DOWNTO 0);  -- sfix25_En23
        rightShift                        :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
        y                                 :   OUT   std_logic_vector(24 DOWNTO 0)  -- sfix25_En23
        );
END IEEE_8021513_RX_src_Variable_Right_Shift_block1;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_Variable_Right_Shift_block1 IS

  -- Signals
  SIGNAL rightShift_signed                : signed(31 DOWNTO 0);  -- int32
  SIGNAL Bit_Slice8_out1                  : std_logic;  -- ufix1
  SIGNAL Delay4_out1                      : std_logic;  -- ufix1
  SIGNAL Bit_Slice7_out1                  : std_logic;  -- ufix1
  SIGNAL Delay3_out1                      : std_logic;  -- ufix1
  SIGNAL Bit_Slice6_out1                  : std_logic;  -- ufix1
  SIGNAL Delay2_out1                      : std_logic;  -- ufix1
  SIGNAL Bit_Slice5_out1                  : std_logic;  -- ufix1
  SIGNAL Delay1_out1                      : std_logic;  -- ufix1
  SIGNAL Bit_Slice4_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice3_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice2_out1                  : std_logic;  -- ufix1
  SIGNAL Bit_Slice1_out1                  : std_logic;  -- ufix1
  SIGNAL x_signed                         : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift_out1                   : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch1_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift1_out1                  : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch2_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift2_out1                  : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch3_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift3_out1                  : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch4_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Delay_out1                       : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift4_out1                  : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch5_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift5_out1                  : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch6_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift6_out1                  : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch7_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Bit_Shift7_out1                  : signed(24 DOWNTO 0);  -- sfix25_En23
  SIGNAL Switch8_out1                     : signed(24 DOWNTO 0);  -- sfix25_En23

BEGIN
  rightShift_signed <= signed(rightShift);

  Bit_Slice8_out1 <= rightShift_signed(7);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay4_out1 <= Bit_Slice8_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Bit_Slice7_out1 <= rightShift_signed(6);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= Bit_Slice7_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Bit_Slice6_out1 <= rightShift_signed(5);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_out1 <= Bit_Slice6_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Bit_Slice5_out1 <= rightShift_signed(4);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Bit_Slice5_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Bit_Slice4_out1 <= rightShift_signed(3);

  Bit_Slice3_out1 <= rightShift_signed(2);

  Bit_Slice2_out1 <= rightShift_signed(1);

  Bit_Slice1_out1 <= rightShift_signed(0);

  x_signed <= signed(x);

  Bit_Shift_out1 <= SHIFT_RIGHT(x_signed, 1);

  
  Switch1_out1 <= x_signed WHEN Bit_Slice1_out1 = '0' ELSE
      Bit_Shift_out1;

  Bit_Shift1_out1 <= SHIFT_RIGHT(Switch1_out1, 2);

  
  Switch2_out1 <= Switch1_out1 WHEN Bit_Slice2_out1 = '0' ELSE
      Bit_Shift1_out1;

  Bit_Shift2_out1 <= SHIFT_RIGHT(Switch2_out1, 4);

  
  Switch3_out1 <= Switch2_out1 WHEN Bit_Slice3_out1 = '0' ELSE
      Bit_Shift2_out1;

  Bit_Shift3_out1 <= SHIFT_RIGHT(Switch3_out1, 8);

  
  Switch4_out1 <= Switch3_out1 WHEN Bit_Slice4_out1 = '0' ELSE
      Bit_Shift3_out1;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= to_signed(16#0000000#, 25);
      ELSIF enb_1_2_0 = '1' THEN
        Delay_out1 <= Switch4_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Bit_Shift4_out1 <= SHIFT_RIGHT(Delay_out1, 16);

  
  Switch5_out1 <= Delay_out1 WHEN Delay1_out1 = '0' ELSE
      Bit_Shift4_out1;

  Bit_Shift5_out1 <= SHIFT_RIGHT(Switch5_out1, 24);

  
  Switch6_out1 <= Switch5_out1 WHEN Delay2_out1 = '0' ELSE
      Bit_Shift5_out1;

  Bit_Shift6_out1 <= SHIFT_RIGHT(Switch6_out1, 24);

  
  Switch7_out1 <= Switch6_out1 WHEN Delay3_out1 = '0' ELSE
      Bit_Shift6_out1;

  Bit_Shift7_out1 <= SHIFT_RIGHT(Switch7_out1, 24);

  
  Switch8_out1 <= Switch7_out1 WHEN Delay4_out1 = '0' ELSE
      Bit_Shift7_out1;

  y <= std_logic_vector(Switch8_out1);

END rtl;

