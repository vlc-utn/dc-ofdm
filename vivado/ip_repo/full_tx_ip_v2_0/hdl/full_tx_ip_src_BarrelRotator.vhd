-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_src_BarrelRotator.vhd
-- Created: 2024-08-11 18:37:15
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_src_BarrelRotator
-- Source Path: HDLTx/full_tx/header_full/header_fec/Hc_12H_B14/Calculate Alpha/BarrelRotator
-- Hierarchy Level: 5
-- Model version: 4.91
-- 
-- Barrel Rotator Unit
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_ip_src_BarrelRotator IS
  PORT( data                              :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix1 [14]
        shift                             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        shiftData                         :   OUT   std_logic_vector(13 DOWNTO 0)  -- ufix1 [14]
        );
END full_tx_ip_src_BarrelRotator;


ARCHITECTURE rtl OF full_tx_ip_src_BarrelRotator IS

  -- Signals
  SIGNAL shift_unsigned                   : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL vShift_4                         : std_logic;  -- ufix1
  SIGNAL vShift_3                         : std_logic;  -- ufix1
  SIGNAL vShift_2                         : std_logic;  -- ufix1
  SIGNAL vShift_1                         : std_logic;  -- ufix1
  SIGNAL data_0                           : std_logic;  -- ufix1
  SIGNAL data_1                           : std_logic;  -- ufix1
  SIGNAL dout_stage1_1                    : std_logic;  -- ufix1
  SIGNAL data_2                           : std_logic;  -- ufix1
  SIGNAL data_3                           : std_logic;  -- ufix1
  SIGNAL dout_stage1_3                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_1                    : std_logic;  -- ufix1
  SIGNAL data_4                           : std_logic;  -- ufix1
  SIGNAL data_5                           : std_logic;  -- ufix1
  SIGNAL dout_stage1_5                    : std_logic;  -- ufix1
  SIGNAL data_6                           : std_logic;  -- ufix1
  SIGNAL data_7                           : std_logic;  -- ufix1
  SIGNAL dout_stage1_7                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_5                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_1                    : std_logic;  -- ufix1
  SIGNAL data_8                           : std_logic;  -- ufix1
  SIGNAL data_9                           : std_logic;  -- ufix1
  SIGNAL dout_stage1_9                    : std_logic;  -- ufix1
  SIGNAL data_10                          : std_logic;  -- ufix1
  SIGNAL data_11                          : std_logic;  -- ufix1
  SIGNAL dout_stage1_11                   : std_logic;  -- ufix1
  SIGNAL dout_stage2_9                    : std_logic;  -- ufix1
  SIGNAL data_12                          : std_logic;  -- ufix1
  SIGNAL data_13                          : std_logic;  -- ufix1
  SIGNAL dout_stage1_13                   : std_logic;  -- ufix1
  SIGNAL dout_stage2_13                   : std_logic;  -- ufix1
  SIGNAL dout_stage3_9                    : std_logic;  -- ufix1
  SIGNAL dout_stage4_1                    : std_logic;  -- ufix1
  SIGNAL dout_stage1_2                    : std_logic;  -- ufix1
  SIGNAL dout_stage1_4                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_2                    : std_logic;  -- ufix1
  SIGNAL dout_stage1_6                    : std_logic;  -- ufix1
  SIGNAL dout_stage1_8                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_6                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_2                    : std_logic;  -- ufix1
  SIGNAL dout_stage1_10                   : std_logic;  -- ufix1
  SIGNAL dout_stage1_12                   : std_logic;  -- ufix1
  SIGNAL dout_stage2_10                   : std_logic;  -- ufix1
  SIGNAL dout_stage1_14                   : std_logic;  -- ufix1
  SIGNAL dout_stage2_14                   : std_logic;  -- ufix1
  SIGNAL dout_stage3_10                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_2                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_3                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_7                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_3                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_11                   : std_logic;  -- ufix1
  SIGNAL dout_stage3_11                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_3                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_4                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_8                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_4                    : std_logic;  -- ufix1
  SIGNAL dout_stage2_12                   : std_logic;  -- ufix1
  SIGNAL dout_stage3_12                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_4                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_5                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_13                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_5                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_6                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_14                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_6                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_7                    : std_logic;  -- ufix1
  SIGNAL dout_stage4_7                    : std_logic;  -- ufix1
  SIGNAL dout_stage3_8                    : std_logic;  -- ufix1
  SIGNAL dout_stage4_8                    : std_logic;  -- ufix1
  SIGNAL dout_stage4_9                    : std_logic;  -- ufix1
  SIGNAL dout_stage4_10                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_11                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_12                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_13                   : std_logic;  -- ufix1
  SIGNAL dout_stage4_14                   : std_logic;  -- ufix1

BEGIN
  shift_unsigned <= unsigned(shift);

  vShift_4 <= shift_unsigned(3);

  vShift_3 <= shift_unsigned(2);

  vShift_2 <= shift_unsigned(1);

  vShift_1 <= shift_unsigned(0);

  data_0 <= data(0);

  data_1 <= data(1);

  
  dout_stage1_1 <= data_0 WHEN vShift_1 = '0' ELSE
      data_1;

  data_2 <= data(2);

  data_3 <= data(3);

  
  dout_stage1_3 <= data_2 WHEN vShift_1 = '0' ELSE
      data_3;

  
  dout_stage2_1 <= dout_stage1_1 WHEN vShift_2 = '0' ELSE
      dout_stage1_3;

  data_4 <= data(4);

  data_5 <= data(5);

  
  dout_stage1_5 <= data_4 WHEN vShift_1 = '0' ELSE
      data_5;

  data_6 <= data(6);

  data_7 <= data(7);

  
  dout_stage1_7 <= data_6 WHEN vShift_1 = '0' ELSE
      data_7;

  
  dout_stage2_5 <= dout_stage1_5 WHEN vShift_2 = '0' ELSE
      dout_stage1_7;

  
  dout_stage3_1 <= dout_stage2_1 WHEN vShift_3 = '0' ELSE
      dout_stage2_5;

  data_8 <= data(8);

  data_9 <= data(9);

  
  dout_stage1_9 <= data_8 WHEN vShift_1 = '0' ELSE
      data_9;

  data_10 <= data(10);

  data_11 <= data(11);

  
  dout_stage1_11 <= data_10 WHEN vShift_1 = '0' ELSE
      data_11;

  
  dout_stage2_9 <= dout_stage1_9 WHEN vShift_2 = '0' ELSE
      dout_stage1_11;

  data_12 <= data(12);

  data_13 <= data(13);

  
  dout_stage1_13 <= data_12 WHEN vShift_1 = '0' ELSE
      data_13;

  
  dout_stage2_13 <= dout_stage1_13 WHEN vShift_2 = '0' ELSE
      dout_stage1_1;

  
  dout_stage3_9 <= dout_stage2_9 WHEN vShift_3 = '0' ELSE
      dout_stage2_13;

  
  dout_stage4_1 <= dout_stage3_1 WHEN vShift_4 = '0' ELSE
      dout_stage3_9;

  
  dout_stage1_2 <= data_1 WHEN vShift_1 = '0' ELSE
      data_2;

  
  dout_stage1_4 <= data_3 WHEN vShift_1 = '0' ELSE
      data_4;

  
  dout_stage2_2 <= dout_stage1_2 WHEN vShift_2 = '0' ELSE
      dout_stage1_4;

  
  dout_stage1_6 <= data_5 WHEN vShift_1 = '0' ELSE
      data_6;

  
  dout_stage1_8 <= data_7 WHEN vShift_1 = '0' ELSE
      data_8;

  
  dout_stage2_6 <= dout_stage1_6 WHEN vShift_2 = '0' ELSE
      dout_stage1_8;

  
  dout_stage3_2 <= dout_stage2_2 WHEN vShift_3 = '0' ELSE
      dout_stage2_6;

  
  dout_stage1_10 <= data_9 WHEN vShift_1 = '0' ELSE
      data_10;

  
  dout_stage1_12 <= data_11 WHEN vShift_1 = '0' ELSE
      data_12;

  
  dout_stage2_10 <= dout_stage1_10 WHEN vShift_2 = '0' ELSE
      dout_stage1_12;

  
  dout_stage1_14 <= data_13 WHEN vShift_1 = '0' ELSE
      data_0;

  
  dout_stage2_14 <= dout_stage1_14 WHEN vShift_2 = '0' ELSE
      dout_stage1_2;

  
  dout_stage3_10 <= dout_stage2_10 WHEN vShift_3 = '0' ELSE
      dout_stage2_14;

  
  dout_stage4_2 <= dout_stage3_2 WHEN vShift_4 = '0' ELSE
      dout_stage3_10;

  
  dout_stage2_3 <= dout_stage1_3 WHEN vShift_2 = '0' ELSE
      dout_stage1_5;

  
  dout_stage2_7 <= dout_stage1_7 WHEN vShift_2 = '0' ELSE
      dout_stage1_9;

  
  dout_stage3_3 <= dout_stage2_3 WHEN vShift_3 = '0' ELSE
      dout_stage2_7;

  
  dout_stage2_11 <= dout_stage1_11 WHEN vShift_2 = '0' ELSE
      dout_stage1_13;

  
  dout_stage3_11 <= dout_stage2_11 WHEN vShift_3 = '0' ELSE
      dout_stage2_1;

  
  dout_stage4_3 <= dout_stage3_3 WHEN vShift_4 = '0' ELSE
      dout_stage3_11;

  
  dout_stage2_4 <= dout_stage1_4 WHEN vShift_2 = '0' ELSE
      dout_stage1_6;

  
  dout_stage2_8 <= dout_stage1_8 WHEN vShift_2 = '0' ELSE
      dout_stage1_10;

  
  dout_stage3_4 <= dout_stage2_4 WHEN vShift_3 = '0' ELSE
      dout_stage2_8;

  
  dout_stage2_12 <= dout_stage1_12 WHEN vShift_2 = '0' ELSE
      dout_stage1_14;

  
  dout_stage3_12 <= dout_stage2_12 WHEN vShift_3 = '0' ELSE
      dout_stage2_2;

  
  dout_stage4_4 <= dout_stage3_4 WHEN vShift_4 = '0' ELSE
      dout_stage3_12;

  
  dout_stage3_5 <= dout_stage2_5 WHEN vShift_3 = '0' ELSE
      dout_stage2_9;

  
  dout_stage3_13 <= dout_stage2_13 WHEN vShift_3 = '0' ELSE
      dout_stage2_3;

  
  dout_stage4_5 <= dout_stage3_5 WHEN vShift_4 = '0' ELSE
      dout_stage3_13;

  
  dout_stage3_6 <= dout_stage2_6 WHEN vShift_3 = '0' ELSE
      dout_stage2_10;

  
  dout_stage3_14 <= dout_stage2_14 WHEN vShift_3 = '0' ELSE
      dout_stage2_4;

  
  dout_stage4_6 <= dout_stage3_6 WHEN vShift_4 = '0' ELSE
      dout_stage3_14;

  
  dout_stage3_7 <= dout_stage2_7 WHEN vShift_3 = '0' ELSE
      dout_stage2_11;

  
  dout_stage4_7 <= dout_stage3_7 WHEN vShift_4 = '0' ELSE
      dout_stage3_1;

  
  dout_stage3_8 <= dout_stage2_8 WHEN vShift_3 = '0' ELSE
      dout_stage2_12;

  
  dout_stage4_8 <= dout_stage3_8 WHEN vShift_4 = '0' ELSE
      dout_stage3_2;

  
  dout_stage4_9 <= dout_stage3_9 WHEN vShift_4 = '0' ELSE
      dout_stage3_3;

  
  dout_stage4_10 <= dout_stage3_10 WHEN vShift_4 = '0' ELSE
      dout_stage3_4;

  
  dout_stage4_11 <= dout_stage3_11 WHEN vShift_4 = '0' ELSE
      dout_stage3_5;

  
  dout_stage4_12 <= dout_stage3_12 WHEN vShift_4 = '0' ELSE
      dout_stage3_6;

  
  dout_stage4_13 <= dout_stage3_13 WHEN vShift_4 = '0' ELSE
      dout_stage3_7;

  
  dout_stage4_14 <= dout_stage3_14 WHEN vShift_4 = '0' ELSE
      dout_stage3_8;

  shiftData(0) <= dout_stage4_1;
  shiftData(1) <= dout_stage4_2;
  shiftData(2) <= dout_stage4_3;
  shiftData(3) <= dout_stage4_4;
  shiftData(4) <= dout_stage4_5;
  shiftData(5) <= dout_stage4_6;
  shiftData(6) <= dout_stage4_7;
  shiftData(7) <= dout_stage4_8;
  shiftData(8) <= dout_stage4_9;
  shiftData(9) <= dout_stage4_10;
  shiftData(10) <= dout_stage4_11;
  shiftData(11) <= dout_stage4_12;
  shiftData(12) <= dout_stage4_13;
  shiftData(13) <= dout_stage4_14;

END rtl;
