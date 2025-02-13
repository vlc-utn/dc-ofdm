-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_rotate.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_rotate
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/constellation_scrambler/rotate
-- Hierarchy Level: 3
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_rotate IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_in                          :   IN    std_logic;
        s1                                :   IN    std_logic;
        s2                                :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_out                         :   OUT   std_logic
        );
END IEEE_8021513_TX_src_rotate;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_rotate IS

  -- Signals
  SIGNAL Bit_Concat_out1                  : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL data_in_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Unary_Minus1_cast                : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus1_cast_1              : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus1_out1                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Unary_Minus_cast                 : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus_cast_1               : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus_out1                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Unary_Minus3_cast                : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus3_cast_1              : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus3_out1                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Unary_Minus2_cast                : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus2_cast_1              : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Unary_Minus2_out1                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Multiport_Switch_out1_re         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Multiport_Switch_out1_im         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL Delay_out1_re                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay_out1_im                    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL stateControl_3                   : std_logic;
  SIGNAL stateControl_4                   : std_logic;
  SIGNAL enb_1_2_0_gated_1                : std_logic;
  SIGNAL Delay1_out1                      : std_logic;

BEGIN
  Bit_Concat_out1 <= unsigned'(s2 & s1);

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  Unary_Minus1_cast <= resize(data_in_im_signed, 17);
  Unary_Minus1_cast_1 <=  - (Unary_Minus1_cast);
  Unary_Minus1_out1 <= Unary_Minus1_cast_1(15 DOWNTO 0);

  Unary_Minus_cast <= resize(data_in_re_signed, 17);
  Unary_Minus_cast_1 <=  - (Unary_Minus_cast);
  Unary_Minus_out1 <= Unary_Minus_cast_1(15 DOWNTO 0);

  Unary_Minus3_cast <= resize(data_in_im_signed, 17);
  Unary_Minus3_cast_1 <=  - (Unary_Minus3_cast);
  Unary_Minus3_out1 <= Unary_Minus3_cast_1(15 DOWNTO 0);

  Unary_Minus2_cast <= resize(data_in_re_signed, 17);
  Unary_Minus2_cast_1 <=  - (Unary_Minus2_cast);
  Unary_Minus2_out1 <= Unary_Minus2_cast_1(15 DOWNTO 0);

  
  Multiport_Switch_out1_re <= data_in_re_signed WHEN Bit_Concat_out1 = to_unsigned(16#0#, 2) ELSE
      Unary_Minus1_out1 WHEN Bit_Concat_out1 = to_unsigned(16#1#, 2) ELSE
      Unary_Minus_out1 WHEN Bit_Concat_out1 = to_unsigned(16#2#, 2) ELSE
      data_in_im_signed;
  
  Multiport_Switch_out1_im <= data_in_im_signed WHEN Bit_Concat_out1 = to_unsigned(16#0#, 2) ELSE
      data_in_re_signed WHEN Bit_Concat_out1 = to_unsigned(16#1#, 2) ELSE
      Unary_Minus3_out1 WHEN Bit_Concat_out1 = to_unsigned(16#2#, 2) ELSE
      Unary_Minus2_out1;

  stateControl_1 <= '1';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stateControl_2 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        stateControl_2 <= stateControl_1;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  enb_1_2_0_gated <= stateControl_2 AND enb_1_2_0;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_re <= to_signed(16#0000#, 16);
        Delay_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay_out1_re <= Multiport_Switch_out1_re;
        Delay_out1_im <= Multiport_Switch_out1_im;
      END IF;
    END IF;
  END PROCESS Delay_process;


  data_out_re <= std_logic_vector(Delay_out1_re);

  data_out_im <= std_logic_vector(Delay_out1_im);

  stateControl_3 <= '1';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stateControl_4 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        stateControl_4 <= stateControl_3;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  enb_1_2_0_gated_1 <= stateControl_4 AND enb_1_2_0;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_2_0_gated_1 = '1' THEN
        Delay1_out1 <= valid_in;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  valid_out <= Delay1_out1;

END rtl;

