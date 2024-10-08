-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_rx_demodulator_full.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 8e-09
-- Target subsystem base rate: 8e-09
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1.6e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- data_out_0                    ce_out        1.6e-08
-- data_out_1                    ce_out        1.6e-08
-- valid_header                  ce_out        1.6e-08
-- valid_payload                 ce_out        1.6e-08
-- last_frame                    ce_out        1.6e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_rx_demodulator_full
-- Source Path: HDLRxDemodulator/rx_demodulator_full
-- Hierarchy Level: 0
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_rx_demodulator_full IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En13
        payload_cp_len                    :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        payload_bits_per_subcarrier       :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        psdu_size_0                       :   IN    std_logic;  -- boolean
        psdu_size_1                       :   IN    std_logic;  -- boolean
        psdu_size_2                       :   IN    std_logic;  -- boolean
        psdu_size_3                       :   IN    std_logic;  -- boolean
        psdu_size_4                       :   IN    std_logic;  -- boolean
        psdu_size_5                       :   IN    std_logic;  -- boolean
        psdu_size_6                       :   IN    std_logic;  -- boolean
        psdu_size_7                       :   IN    std_logic;  -- boolean
        psdu_size_8                       :   IN    std_logic;  -- boolean
        psdu_size_9                       :   IN    std_logic;  -- boolean
        psdu_size_10                      :   IN    std_logic;  -- boolean
        psdu_size_11                      :   IN    std_logic;  -- boolean
        psdu_size_12                      :   IN    std_logic;  -- boolean
        psdu_size_13                      :   IN    std_logic;  -- boolean
        psdu_size_14                      :   IN    std_logic;  -- boolean
        psdu_size_15                      :   IN    std_logic;  -- boolean
        psdu_size_16                      :   IN    std_logic;  -- boolean
        psdu_size_17                      :   IN    std_logic;  -- boolean
        psdu_size_18                      :   IN    std_logic;  -- boolean
        psdu_size_19                      :   IN    std_logic;  -- boolean
        psdu_size_20                      :   IN    std_logic;  -- boolean
        psdu_size_21                      :   IN    std_logic;  -- boolean
        psdu_size_22                      :   IN    std_logic;  -- boolean
        psdu_size_23                      :   IN    std_logic;  -- boolean
        header_ready                      :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        data_out_0                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        data_out_1                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        valid_header                      :   OUT   std_logic;
        valid_payload                     :   OUT   std_logic;
        last_frame                        :   OUT   std_logic
        );
END rx_demod_optimized_src_rx_demodulator_full;


ARCHITECTURE rtl OF rx_demod_optimized_src_rx_demodulator_full IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_rx_demodulator_full_tc
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_2_0                       :   OUT   std_logic;
          enb_1_2_1                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_downshifter
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En13
          valid_in                        :   IN    std_logic;
          phase_offset                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          data_out_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_out_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_decimator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_in                        :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_out_im                     :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En12
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_ofdm_symbol_sync
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_in_im                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_out_re                     :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_out_im                     :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          peak_sync                       :   OUT   std_logic;
          phase_offset                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          reset_ofdm                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_ofdm_separator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_in_im                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          peak                            :   IN    std_logic;
          psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
          payload_bits_per_subcarrier     :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          payload_cp_len                  :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          header_ready                    :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_out_im                     :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          valid_channel                   :   OUT   std_logic;
          valid_header                    :   OUT   std_logic;
          valid_payload                   :   OUT   std_logic;
          payload_num_ofdm_symbols        :   OUT   std_logic_vector(15 DOWNTO 0)  -- uint16
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_get_cp
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          valid_header                    :   IN    std_logic;
          valid_payload                   :   IN    std_logic;
          cp_payload                      :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          ofdm_cp_len                     :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_ofdm_demod
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          data_in_im                      :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          valid_in                        :   IN    std_logic;
          cp_len                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          reset                           :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_out_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_out                       :   OUT   std_logic;
          ready                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_ofdm_rx_counter
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          valid                           :   IN    std_logic;
          rst                             :   IN    std_logic;
          payload_num_ofdm_symbols        :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          is_channel                      :   OUT   std_logic;
          is_header                       :   OUT   std_logic;
          is_payload                      :   OUT   std_logic;
          last_frame                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_get_init
    PORT( valid_header                    :   IN    std_logic;
          valid_payload                   :   IN    std_logic;
          descrambler_init                :   OUT   std_logic_vector(12 DOWNTO 0)  -- boolean [13]
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_constellation_descrambler
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_in_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_in                        :   IN    std_logic;
          init                            :   IN    std_logic_vector(12 DOWNTO 0);  -- boolean [13]
          data_out_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_out_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_channel_estimation_and_equalization
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_in_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_data                      :   IN    std_logic;
          valid_channel                   :   IN    std_logic;
          reset                           :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_out_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_4QAM_demod
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_in_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_in                        :   IN    std_logic;
          data_out                        :   OUT   vector_of_std_logic_vector16(0 TO 1);  -- sfix16_En10 [2]
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_rx_demodulator_full_tc
    USE ENTITY work.rx_demod_optimized_src_rx_demodulator_full_tc(rtl);

  FOR ALL : rx_demod_optimized_src_downshifter
    USE ENTITY work.rx_demod_optimized_src_downshifter(rtl);

  FOR ALL : rx_demod_optimized_src_decimator
    USE ENTITY work.rx_demod_optimized_src_decimator(rtl);

  FOR ALL : rx_demod_optimized_src_ofdm_symbol_sync
    USE ENTITY work.rx_demod_optimized_src_ofdm_symbol_sync(rtl);

  FOR ALL : rx_demod_optimized_src_ofdm_separator
    USE ENTITY work.rx_demod_optimized_src_ofdm_separator(rtl);

  FOR ALL : rx_demod_optimized_src_get_cp
    USE ENTITY work.rx_demod_optimized_src_get_cp(rtl);

  FOR ALL : rx_demod_optimized_src_ofdm_demod
    USE ENTITY work.rx_demod_optimized_src_ofdm_demod(rtl);

  FOR ALL : rx_demod_optimized_src_ofdm_rx_counter
    USE ENTITY work.rx_demod_optimized_src_ofdm_rx_counter(rtl);

  FOR ALL : rx_demod_optimized_src_get_init
    USE ENTITY work.rx_demod_optimized_src_get_init(rtl);

  FOR ALL : rx_demod_optimized_src_constellation_descrambler
    USE ENTITY work.rx_demod_optimized_src_constellation_descrambler(rtl);

  FOR ALL : rx_demod_optimized_src_channel_estimation_and_equalization
    USE ENTITY work.rx_demod_optimized_src_channel_estimation_and_equalization(rtl);

  FOR ALL : rx_demod_optimized_src_4QAM_demod
    USE ENTITY work.rx_demod_optimized_src_4QAM_demod(rtl);

  -- Signals
  SIGNAL enb_1_2_0                        : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_2_1                        : std_logic;
  SIGNAL Constant1_out1                   : std_logic;
  SIGNAL ofdm_symbol_sync_out3            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL ofdm_symbol_sync_out3_signed     : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Rate_Transition_out1             : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL Delay2_out1                      : signed(15 DOWNTO 0);  -- sfix16_En15
  SIGNAL downshifter_out1_re              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL downshifter_out1_im              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL valid_out                        : std_logic;
  SIGNAL decimator_out1_re                : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL decimator_out1_im                : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL ofdm_symbol_sync_out1_re         : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL ofdm_symbol_sync_out1_im         : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL peak_sync                        : std_logic;
  SIGNAL ofdm_symbol_sync_out5            : std_logic;
  SIGNAL psdu_size                        : std_logic_vector(23 DOWNTO 0);  -- boolean [24]
  SIGNAL ofdm_separator_out1_re           : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL ofdm_separator_out1_im           : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL valid_channel                    : std_logic;
  SIGNAL valid_header_1                   : std_logic;
  SIGNAL valid_payload_1                  : std_logic;
  SIGNAL ofdm_separator_out5              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch2_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL valid_channel_1                  : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL valid_header_2                   : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL cp_len                           : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL delayMatch3_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL From2_out1                       : std_logic;
  SIGNAL ofdm_demod_out3                  : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL ofdm_valid                       : std_logic;
  SIGNAL ofdm_demod_out1_re               : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL ofdm_demod_out1_im               : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL valid_ofdm_demod_out             : std_logic;
  SIGNAL descrambler_valid                : std_logic;
  SIGNAL is_channel                       : std_logic;
  SIGNAL is_header                        : std_logic;
  SIGNAL is_payload                       : std_logic;
  SIGNAL last_frame_1                     : std_logic;
  SIGNAL get_init_out1                    : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL data_out_re                      : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL data_out_im                      : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL qam_demod_valid                  : std_logic;
  SIGNAL Delay8_reg                       : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL Delay8_out1                      : std_logic;
  SIGNAL Delay15_reg                      : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL Delay15_out1                     : std_logic;
  SIGNAL OR_out1                          : std_logic;
  SIGNAL delayMatch4_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL qam_demod_valid_1                : std_logic;
  SIGNAL AND2_out1                        : std_logic;
  SIGNAL delayMatch5_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL qam_demod_valid_2                : std_logic;
  SIGNAL Delay1_reg                       : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL AND1_out1                        : std_logic;
  SIGNAL channel_estimation_and_equalization_out1_re : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL channel_estimation_and_equalization_out1_im : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL channel_estimation_and_equalization_out2 : std_logic;
  SIGNAL alpha4QAM_demod_out1             : vector_of_std_logic_vector16(0 TO 1);  -- ufix16 [2]
  SIGNAL alpha4QAM_demod_out2             : std_logic;
  SIGNAL Delay4_reg                       : std_logic_vector(99 DOWNTO 0);  -- ufix1 [100]
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Delay18_reg                      : std_logic_vector(6 DOWNTO 0);  -- ufix1 [7]
  SIGNAL Delay18_out1                     : std_logic;
  SIGNAL Logical_Operator6_out1           : std_logic;
  SIGNAL Delay7_reg                       : std_logic_vector(99 DOWNTO 0);  -- ufix1 [100]
  SIGNAL Delay7_out1                      : std_logic;
  SIGNAL Delay19_reg                      : std_logic_vector(6 DOWNTO 0);  -- ufix1 [7]
  SIGNAL Delay19_out1                     : std_logic;
  SIGNAL Logical_Operator7_out1           : std_logic;
  SIGNAL Delay16_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay16_out1                     : std_logic;
  SIGNAL Delay17_reg                      : std_logic_vector(99 DOWNTO 0);  -- ufix1 [100]
  SIGNAL Delay17_out1                     : std_logic;
  SIGNAL Delay20_reg                      : std_logic_vector(6 DOWNTO 0);  -- ufix1 [7]
  SIGNAL Delay20_out1                     : std_logic;

BEGIN
  -- Last frame has one less delay because of the falling edge

  u_rx_demodulator_full_tc : rx_demod_optimized_src_rx_demodulator_full_tc
    PORT MAP( clk => clk,
              reset_x => reset_x,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_2_0 => enb_1_2_0,
              enb_1_2_1 => enb_1_2_1
              );

  u_downshifter : rx_demod_optimized_src_downshifter
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => data_in,  -- sfix14_En13
              valid_in => Constant1_out1,
              phase_offset => std_logic_vector(Delay2_out1),  -- sfix16_En15
              data_out_re => downshifter_out1_re,  -- sfix16_En14
              data_out_im => downshifter_out1_im,  -- sfix16_En14
              valid_out => valid_out
              );

  u_decimator : rx_demod_optimized_src_decimator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              data_in_re => downshifter_out1_re,  -- sfix16_En14
              data_in_im => downshifter_out1_im,  -- sfix16_En14
              valid_in => valid_out,
              data_out_re => decimator_out1_re,  -- sfix14_En12
              data_out_im => decimator_out1_im  -- sfix14_En12
              );

  u_ofdm_symbol_sync : rx_demod_optimized_src_ofdm_symbol_sync
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => decimator_out1_re,  -- sfix14_En12
              data_in_im => decimator_out1_im,  -- sfix14_En12
              data_out_re => ofdm_symbol_sync_out1_re,  -- sfix14_En12
              data_out_im => ofdm_symbol_sync_out1_im,  -- sfix14_En12
              peak_sync => peak_sync,
              phase_offset => ofdm_symbol_sync_out3,  -- sfix16_En15
              reset_ofdm => ofdm_symbol_sync_out5
              );

  u_ofdm_separator : rx_demod_optimized_src_ofdm_separator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => ofdm_symbol_sync_out1_re,  -- sfix14_En12
              data_in_im => ofdm_symbol_sync_out1_im,  -- sfix14_En12
              peak => peak_sync,
              psdu_size => psdu_size,  -- boolean [24]
              payload_bits_per_subcarrier => payload_bits_per_subcarrier,  -- uint8
              payload_cp_len => payload_cp_len,  -- uint8
              header_ready => header_ready,
              data_out_re => ofdm_separator_out1_re,  -- sfix14_En12
              data_out_im => ofdm_separator_out1_im,  -- sfix14_En12
              valid_channel => valid_channel,
              valid_header => valid_header_1,
              valid_payload => valid_payload_1,
              payload_num_ofdm_symbols => ofdm_separator_out5  -- uint16
              );

  u_get_cp : rx_demod_optimized_src_get_cp
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              valid_header => valid_header_1,
              valid_payload => valid_payload_1,
              cp_payload => payload_cp_len,  -- uint8
              ofdm_cp_len => cp_len  -- uint8
              );

  u_ofdm_demod : rx_demod_optimized_src_ofdm_demod
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => ofdm_separator_out1_re,  -- sfix14_En12
              data_in_im => ofdm_separator_out1_im,  -- sfix14_En12
              valid_in => ofdm_valid,
              cp_len => cp_len,  -- uint8
              reset => From2_out1,
              data_out_re => ofdm_demod_out1_re,  -- sfix12_En10
              data_out_im => ofdm_demod_out1_im,  -- sfix12_En10
              valid_out => valid_ofdm_demod_out,
              ready => ofdm_demod_out3
              );

  u_ofdm_rx_counter : rx_demod_optimized_src_ofdm_rx_counter
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              valid => valid_ofdm_demod_out,
              rst => valid_channel,
              payload_num_ofdm_symbols => ofdm_separator_out5,  -- uint16
              is_channel => is_channel,
              is_header => is_header,
              is_payload => is_payload,
              last_frame => last_frame_1
              );

  u_get_init : rx_demod_optimized_src_get_init
    PORT MAP( valid_header => is_header,
              valid_payload => is_payload,
              descrambler_init => get_init_out1  -- boolean [13]
              );

  u_constellation_descrambler : rx_demod_optimized_src_constellation_descrambler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => ofdm_demod_out1_re,  -- sfix12_En10
              data_in_im => ofdm_demod_out1_im,  -- sfix12_En10
              valid_in => descrambler_valid,
              init => get_init_out1,  -- boolean [13]
              data_out_re => data_out_re,  -- sfix12_En10
              data_out_im => data_out_im,  -- sfix12_En10
              valid_out => qam_demod_valid
              );

  u_channel_estimation_and_equalization : rx_demod_optimized_src_channel_estimation_and_equalization
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => data_out_re,  -- sfix12_En10
              data_in_im => data_out_im,  -- sfix12_En10
              valid_data => AND2_out1,
              valid_channel => AND1_out1,
              reset => ofdm_symbol_sync_out5,
              data_out_re => channel_estimation_and_equalization_out1_re,  -- sfix12_En10
              data_out_im => channel_estimation_and_equalization_out1_im,  -- sfix12_En10
              valid_out => channel_estimation_and_equalization_out2
              );

  u_4QAM_demod : rx_demod_optimized_src_4QAM_demod
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => channel_estimation_and_equalization_out1_re,  -- sfix12_En10
              data_in_im => channel_estimation_and_equalization_out1_im,  -- sfix12_En10
              valid_in => channel_estimation_and_equalization_out2,
              data_out => alpha4QAM_demod_out1,  -- sfix16_En10 [2]
              valid_out => alpha4QAM_demod_out2
              );

  Constant1_out1 <= '1';

  ofdm_symbol_sync_out3_signed <= signed(ofdm_symbol_sync_out3);

  Rate_Transition_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition_out1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        Rate_Transition_out1 <= ofdm_symbol_sync_out3_signed;
      END IF;
    END IF;
  END PROCESS Rate_Transition_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay2_out1 <= Rate_Transition_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  psdu_size(0) <= psdu_size_0;
  psdu_size(1) <= psdu_size_1;
  psdu_size(2) <= psdu_size_2;
  psdu_size(3) <= psdu_size_3;
  psdu_size(4) <= psdu_size_4;
  psdu_size(5) <= psdu_size_5;
  psdu_size(6) <= psdu_size_6;
  psdu_size(7) <= psdu_size_7;
  psdu_size(8) <= psdu_size_8;
  psdu_size(9) <= psdu_size_9;
  psdu_size(10) <= psdu_size_10;
  psdu_size(11) <= psdu_size_11;
  psdu_size(12) <= psdu_size_12;
  psdu_size(13) <= psdu_size_13;
  psdu_size(14) <= psdu_size_14;
  psdu_size(15) <= psdu_size_15;
  psdu_size(16) <= psdu_size_16;
  psdu_size(17) <= psdu_size_17;
  psdu_size(18) <= psdu_size_18;
  psdu_size(19) <= psdu_size_19;
  psdu_size(20) <= psdu_size_20;
  psdu_size(21) <= psdu_size_21;
  psdu_size(22) <= psdu_size_22;
  psdu_size(23) <= psdu_size_23;

  stateControl_1 <= '1';

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch2_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch2_reg(0) <= stateControl_1;
        delayMatch2_reg(1) <= delayMatch2_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  stateControl_2 <= delayMatch2_reg(1);

  enb_1_2_0_gated <= stateControl_2 AND enb_1_2_0;

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch_reg(0) <= valid_channel;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  valid_channel_1 <= delayMatch_reg(1);

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch1_reg(0) <= valid_header_1;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  valid_header_2 <= delayMatch1_reg(1);

  Logical_Operator1_out1 <= valid_payload_1 OR (valid_channel_1 OR valid_header_2);

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch3_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch3_reg(0) <= ofdm_symbol_sync_out5;
        delayMatch3_reg(1) <= delayMatch3_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch3_process;

  From2_out1 <= delayMatch3_reg(1);

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay_out1 <= ofdm_demod_out3;
      END IF;
    END IF;
  END PROCESS Delay_process;


  ofdm_valid <= Delay_out1 AND Logical_Operator1_out1;

  descrambler_valid <= valid_ofdm_demod_out;

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay8_reg(0) <= is_header;
        Delay8_reg(2 DOWNTO 1) <= Delay8_reg(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay8_process;

  Delay8_out1 <= Delay8_reg(2);

  Delay15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay15_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay15_reg(0) <= is_payload;
        Delay15_reg(2 DOWNTO 1) <= Delay15_reg(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay15_process;

  Delay15_out1 <= Delay15_reg(2);

  OR_out1 <= Delay8_out1 OR Delay15_out1;

  delayMatch4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch4_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch4_reg(0) <= qam_demod_valid;
        delayMatch4_reg(1) <= delayMatch4_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch4_process;

  qam_demod_valid_1 <= delayMatch4_reg(1);

  AND2_out1 <= OR_out1 AND qam_demod_valid_1;

  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch5_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch5_reg(0) <= qam_demod_valid;
        delayMatch5_reg(1) <= delayMatch5_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch5_process;

  qam_demod_valid_2 <= delayMatch5_reg(1);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_reg(0) <= is_channel;
        Delay1_reg(2 DOWNTO 1) <= Delay1_reg(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(2);

  AND1_out1 <= qam_demod_valid_2 AND Delay1_out1;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay4_reg(0) <= Delay8_out1;
        Delay4_reg(99 DOWNTO 1) <= Delay4_reg(98 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1 <= Delay4_reg(99);

  Delay18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay18_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay18_reg(0) <= Delay4_out1;
        Delay18_reg(6 DOWNTO 1) <= Delay18_reg(5 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay18_process;

  Delay18_out1 <= Delay18_reg(6);

  Logical_Operator6_out1 <= alpha4QAM_demod_out2 AND Delay18_out1;

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_reg(0) <= Delay15_out1;
        Delay7_reg(99 DOWNTO 1) <= Delay7_reg(98 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay7_process;

  Delay7_out1 <= Delay7_reg(99);

  Delay19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay19_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay19_reg(0) <= Delay7_out1;
        Delay19_reg(6 DOWNTO 1) <= Delay19_reg(5 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay19_process;

  Delay19_out1 <= Delay19_reg(6);

  Logical_Operator7_out1 <= alpha4QAM_demod_out2 AND Delay19_out1;

  Delay16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay16_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay16_reg(0) <= last_frame_1;
        Delay16_reg(1) <= Delay16_reg(0);
      END IF;
    END IF;
  END PROCESS Delay16_process;

  Delay16_out1 <= Delay16_reg(1);

  Delay17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay17_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay17_reg(0) <= Delay16_out1;
        Delay17_reg(99 DOWNTO 1) <= Delay17_reg(98 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay17_process;

  Delay17_out1 <= Delay17_reg(99);

  Delay20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay20_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay20_reg(0) <= Delay17_out1;
        Delay20_reg(6 DOWNTO 1) <= Delay20_reg(5 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay20_process;

  Delay20_out1 <= Delay20_reg(6);

  ce_out <= enb_1_2_1;

  data_out_0 <= alpha4QAM_demod_out1(0);

  data_out_1 <= alpha4QAM_demod_out1(1);

  valid_header <= Logical_Operator6_out1;

  valid_payload <= Logical_Operator7_out1;

  last_frame <= Delay20_out1;

END rtl;

