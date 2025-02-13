-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_qam_mod.vhd
-- Created: 2024-11-21 09:59:26
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_qam_mod
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/qam_mod
-- Hierarchy Level: 2
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_TX_src_full_tx_pac.ALL;

ENTITY IEEE_8021513_TX_src_qam_mod IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix2
        valid_in                          :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_out                         :   OUT   std_logic
        );
END IEEE_8021513_TX_src_qam_mod;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_qam_mod IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_BPSK_Modulator_Baseband
    PORT( in0                             :   IN    std_logic;  -- ufix1
          out0_re                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          out0_im                         :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_BPSK_Modulator_Baseband
    USE ENTITY work.IEEE_8021513_TX_src_BPSK_Modulator_Baseband(rtl);

  -- Constants
  CONSTANT alpha_table_data_re            : vector_of_signed16(0 TO 3) := 
    (to_signed(16#2D41#, 16), to_signed(16#2D41#, 16), to_signed(-16#2D41#, 16), to_signed(-16#2D41#, 16));  -- sfix16 [4]
  CONSTANT alpha_table_data_im            : vector_of_signed16(0 TO 3) := 
    (to_signed(-16#2D41#, 16), to_signed(16#2D41#, 16), to_signed(-16#2D41#, 16), to_signed(16#2D41#, 16));  -- sfix16 [4]

  -- Signals
  SIGNAL bits_per_subcarrier_unsigned     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Constant3_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant5_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_unsigned                 : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Bit_Slice_out1                   : std_logic;  -- ufix1
  SIGNAL BPSK_Modulator_Baseband_out1_re  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL BPSK_Modulator_Baseband_out1_im  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL BPSK_Modulator_Baseband_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL BPSK_Modulator_Baseband_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL batID_1_out1_re                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL batID_1_out1_im                  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant2_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Constant4_out1                   : signed(15 DOWNTO 0);  -- sfix16_En14
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
  u_BPSK_Modulator_Baseband : IEEE_8021513_TX_src_BPSK_Modulator_Baseband
    PORT MAP( in0 => Bit_Slice_out1,  -- ufix1
              out0_re => BPSK_Modulator_Baseband_out1_re,  -- sfix16_En14
              out0_im => BPSK_Modulator_Baseband_out1_im  -- sfix16_En14
              );

  bits_per_subcarrier_unsigned <= unsigned(bits_per_subcarrier);

  Constant3_out1 <= to_signed(16#0000#, 16);

  Constant5_out1 <= to_signed(16#0000#, 16);

  data_in_unsigned <= unsigned(data_in);

  Bit_Slice_out1 <= data_in_unsigned(0);

  BPSK_Modulator_Baseband_out1_re_signed <= signed(BPSK_Modulator_Baseband_out1_re);

  BPSK_Modulator_Baseband_out1_im_signed <= signed(BPSK_Modulator_Baseband_out1_im);

  batID_1_out1_re <= alpha_table_data_re(to_integer(data_in_unsigned));
  batID_1_out1_im <= alpha_table_data_im(to_integer(data_in_unsigned));

  Constant2_out1 <= to_signed(16#0000#, 16);

  Constant4_out1 <= to_signed(16#0000#, 16);

  
  Multiport_Switch_out1_re <= Constant3_out1 WHEN bits_per_subcarrier_unsigned = to_unsigned(16#0#, 4) ELSE
      BPSK_Modulator_Baseband_out1_re_signed WHEN bits_per_subcarrier_unsigned = to_unsigned(16#1#, 4) ELSE
      batID_1_out1_re WHEN bits_per_subcarrier_unsigned = to_unsigned(16#2#, 4) ELSE
      Constant2_out1;
  
  Multiport_Switch_out1_im <= Constant5_out1 WHEN bits_per_subcarrier_unsigned = to_unsigned(16#0#, 4) ELSE
      BPSK_Modulator_Baseband_out1_im_signed WHEN bits_per_subcarrier_unsigned = to_unsigned(16#1#, 4) ELSE
      batID_1_out1_im WHEN bits_per_subcarrier_unsigned = to_unsigned(16#2#, 4) ELSE
      Constant4_out1;

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

