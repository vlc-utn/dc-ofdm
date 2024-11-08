-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_raw_src_full_tx.vhd
-- Created: 2024-08-31 20:20:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: 1e-08
-- Target subsystem base rate: 1e-08
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out_0      1e-08
-- ce_out_1      8e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- data_out                      ce_out_0      1e-08
-- valid_out                     ce_out_0      1e-08
-- ready                         ce_out_1      8e-08
-- debug_payload                 ce_out_0      1e-08
-- debug_payload_ctrl_start      ce_out_0      1e-08
-- debug_payload_ctrl_end        ce_out_0      1e-08
-- debug_payload_ctrl_valid      ce_out_0      1e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_raw_src_full_tx
-- Source Path: HDLTx/full_tx
-- Hierarchy Level: 0
-- Model version: 4.99
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_tx_raw_src_full_tx_pac.ALL;

ENTITY full_tx_raw_src_full_tx IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        new_frame_in                      :   IN    std_logic;
        reg0                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        reg1                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        reg2                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        reg3                              :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        data_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        valid_in                          :   IN    std_logic;
        last_frame                        :   IN    std_logic;
        ce_out_0                          :   OUT   std_logic;
        ce_out_1                          :   OUT   std_logic;
        data_out                          :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_out                         :   OUT   std_logic;
        ready                             :   OUT   std_logic;
        debug_payload                     :   OUT   std_logic;
        debug_payload_ctrl_start          :   OUT   std_logic;
        debug_payload_ctrl_end            :   OUT   std_logic;
        debug_payload_ctrl_valid          :   OUT   std_logic
        );
END full_tx_raw_src_full_tx;


ARCHITECTURE rtl OF full_tx_raw_src_full_tx IS

  -- Component Declarations
  COMPONENT full_tx_raw_src_full_tx_tc
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_1_1                       :   OUT   std_logic;
          enb_1_2_0                       :   OUT   std_logic;
          enb_1_2_1                       :   OUT   std_logic;
          enb_1_8_0                       :   OUT   std_logic;
          enb_1_8_1                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_reg_to_variable
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          new_frame_in                    :   IN    std_logic;
          reg0                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          reg1                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          reg2                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          reg3                            :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
          new_frame_out                   :   OUT   std_logic;
          psdu_size                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- boolean [24]
          msg_duration                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- boolean [16]
          block_size                      :   OUT   std_logic_vector(1 DOWNTO 0);  -- boolean [2]
          fec_rate                        :   OUT   std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          rep_number                      :   OUT   std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          concat_factor                   :   OUT   std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          scrambler_init                  :   OUT   std_logic_vector(3 DOWNTO 0);  -- boolean [4]
          bat_id                          :   OUT   std_logic_vector(4 DOWNTO 0);  -- boolean [5]
          cp_id                           :   OUT   std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          mimo_spacing                    :   OUT   std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          mimo_number                     :   OUT   std_logic_vector(2 DOWNTO 0)  -- boolean [3]
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_preamble_gen
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          new_frame                       :   IN    std_logic;
          data_out                        :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_channel_gen
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          new_frame                       :   IN    std_logic;
          data_out                        :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_new_frame_rate_conversion
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
          ctrl_in_end                     :   IN    std_logic;
          new_frame                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_header_full
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          new_frame                       :   IN    std_logic;
          psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
          msg_duration                    :   IN    std_logic_vector(15 DOWNTO 0);  -- boolean [16]
          block_size                      :   IN    std_logic_vector(1 DOWNTO 0);  -- boolean [2]
          fec_rate                        :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          rep_number                      :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          concat_factor                   :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          scrambler_init                  :   IN    std_logic_vector(3 DOWNTO 0);  -- boolean [4]
          bat_id                          :   IN    std_logic_vector(4 DOWNTO 0);  -- boolean [5]
          cp_id                           :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          mimo_spacing                    :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          mimo_number                     :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          header                          :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_new_frame_rate_conversion1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
          ctrl_in_end                     :   IN    std_logic;
          new_frame                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_payload_full
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          valid_in                        :   IN    std_logic;
          last_frame                      :   IN    std_logic;
          new_frame                       :   IN    std_logic;
          scrambler_init                  :   IN    std_logic_vector(3 DOWNTO 0);  -- boolean [4]
          bat_id                          :   IN    std_logic_vector(4 DOWNTO 0);  -- boolean [5]
          psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
          payload                         :   OUT   std_logic;
          ctrl_out_start                  :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic;
          ready                           :   OUT   std_logic;
          len_in_ofdm_symbols             :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          bits_per_subcarrier             :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_clock_crossing
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          preamble_in                     :   IN    std_logic;
          preamble_ctrl_in_valid          :   IN    std_logic;
          channel                         :   IN    std_logic;
          channel_ctrl_valid              :   IN    std_logic;
          header_in                       :   IN    std_logic;
          header_ctrl_in_valid            :   IN    std_logic;
          payload_in                      :   IN    std_logic;
          payload_ctrl_in_valid           :   IN    std_logic;
          cp_len_in                       :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          payload_len_in                  :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          bits_per_subcarrier_in          :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          preamble_out                    :   OUT   std_logic;
          preamble_valid                  :   OUT   std_logic;
          channel_out                     :   OUT   std_logic;
          channel_valid                   :   OUT   std_logic;
          header_out                      :   OUT   std_logic_vector(1 DOWNTO 0);  -- boolean [2]
          header_valid                    :   OUT   std_logic;
          payload_out                     :   OUT   std_logic_vector(1 DOWNTO 0);  -- boolean [2]
          payload_valid_out               :   OUT   std_logic;
          payload_len_out                 :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          bits_per_subcarrier_out         :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          cp_len_out                      :   OUT   std_logic_vector(2 DOWNTO 0)  -- boolean [3]
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_store_frame_in_ram
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          preamble                        :   IN    std_logic;
          preamble_valid                  :   IN    std_logic;
          channel                         :   IN    std_logic;
          channel_valid                   :   IN    std_logic;
          header                          :   IN    std_logic_vector(1 DOWNTO 0);  -- boolean [2]
          header_valid                    :   IN    std_logic;
          payload                         :   IN    std_logic_vector(1 DOWNTO 0);  -- boolean [2]
          payload_valid                   :   IN    std_logic;
          payload_len                     :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          cp_len_in                       :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          ready                           :   IN    std_logic;
          data_out                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
          valid_out                       :   OUT   std_logic;
          bits_per_subcarrier_out         :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          init                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- boolean [13]
          new_rsvd                        :   OUT   std_logic;
          cp_len                          :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_full_ofdm_modulator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          valid_in                        :   IN    std_logic;
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          init                            :   IN    std_logic_vector(12 DOWNTO 0);  -- boolean [13]
          new_ofdm_sym                    :   IN    std_logic;
          cp_len                          :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          data_out                        :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_out                       :   OUT   std_logic;
          ready                           :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_tx_raw_src_full_tx_tc
    USE ENTITY work.full_tx_raw_src_full_tx_tc(rtl);

  FOR ALL : full_tx_raw_src_reg_to_variable
    USE ENTITY work.full_tx_raw_src_reg_to_variable(rtl);

  FOR ALL : full_tx_raw_src_preamble_gen
    USE ENTITY work.full_tx_raw_src_preamble_gen(rtl);

  FOR ALL : full_tx_raw_src_channel_gen
    USE ENTITY work.full_tx_raw_src_channel_gen(rtl);

  FOR ALL : full_tx_raw_src_new_frame_rate_conversion
    USE ENTITY work.full_tx_raw_src_new_frame_rate_conversion(rtl);

  FOR ALL : full_tx_raw_src_header_full
    USE ENTITY work.full_tx_raw_src_header_full(rtl);

  FOR ALL : full_tx_raw_src_new_frame_rate_conversion1
    USE ENTITY work.full_tx_raw_src_new_frame_rate_conversion1(rtl);

  FOR ALL : full_tx_raw_src_payload_full
    USE ENTITY work.full_tx_raw_src_payload_full(rtl);

  FOR ALL : full_tx_raw_src_clock_crossing
    USE ENTITY work.full_tx_raw_src_clock_crossing(rtl);

  FOR ALL : full_tx_raw_src_store_frame_in_ram
    USE ENTITY work.full_tx_raw_src_store_frame_in_ram(rtl);

  FOR ALL : full_tx_raw_src_full_ofdm_modulator
    USE ENTITY work.full_tx_raw_src_full_ofdm_modulator(rtl);

  -- Signals
  SIGNAL enb_1_2_0                        : std_logic;
  SIGNAL enb_1_8_0                        : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_2_1                        : std_logic;
  SIGNAL enb_1_8_1                        : std_logic;
  SIGNAL enb_1_1_1                        : std_logic;
  SIGNAL reg_to_variable_out1             : std_logic;
  SIGNAL reg_to_variable_out2             : std_logic_vector(23 DOWNTO 0);  -- boolean [24]
  SIGNAL reg_to_variable_out3             : std_logic_vector(15 DOWNTO 0);  -- boolean [16]
  SIGNAL reg_to_variable_out4             : std_logic_vector(1 DOWNTO 0);  -- boolean [2]
  SIGNAL reg_to_variable_out5             : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL reg_to_variable_out6             : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL reg_to_variable_out7             : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL reg_to_variable_out8             : std_logic_vector(3 DOWNTO 0);  -- boolean [4]
  SIGNAL reg_to_variable_out9             : std_logic_vector(4 DOWNTO 0);  -- boolean [5]
  SIGNAL reg_to_variable_out10            : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL reg_to_variable_out11            : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL reg_to_variable_out12            : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL Rate_Transition_out1             : std_logic;
  SIGNAL preamble_gen_out1                : std_logic;
  SIGNAL preamble_gen_out2_end            : std_logic;
  SIGNAL preamble_gen_out2_valid          : std_logic;
  SIGNAL end_rsvd                         : std_logic;
  SIGNAL channel_gen_out1                 : std_logic;
  SIGNAL channel_gen_out2_end             : std_logic;
  SIGNAL channel_gen_out2_valid           : std_logic;
  SIGNAL new_frame_rate_conversion_out1   : std_logic;
  SIGNAL header_full_out1                 : std_logic;
  SIGNAL header_full_out2_end             : std_logic;
  SIGNAL header_full_out2_valid           : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL payload_new_frame_in             : std_logic;
  SIGNAL payload_full_out1                : std_logic;
  SIGNAL payload_ctrl_out_start           : std_logic;
  SIGNAL payload_ctrl_out_end             : std_logic;
  SIGNAL payload_ctrl_out_valid           : std_logic;
  SIGNAL payload_full_out3                : std_logic;
  SIGNAL payload_full_out4                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL payload_full_out5                : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL clock_crossing_out1              : std_logic;
  SIGNAL clock_crossing_out2              : std_logic;
  SIGNAL clock_crossing_out3              : std_logic;
  SIGNAL clock_crossing_out4              : std_logic;
  SIGNAL deserializer_PostProcessed       : std_logic_vector(1 DOWNTO 0);  -- boolean [2]
  SIGNAL clock_crossing_out6              : std_logic;
  SIGNAL deserializer_PostProcessed_1     : std_logic_vector(1 DOWNTO 0);  -- boolean [2]
  SIGNAL clock_crossing_out8              : std_logic;
  SIGNAL clock_crossing_out9              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL clock_crossing_out10             : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL clock_crossing_out11             : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL clock_crossing_out2_1            : std_logic;
  SIGNAL clock_crossing_out4_1            : std_logic;
  SIGNAL deserializer_PostProcessed_2     : std_logic_vector(1 DOWNTO 0);  -- boolean [2]
  SIGNAL clock_crossing_out6_1            : std_logic;
  SIGNAL deserializer_PostProcessed_3     : std_logic_vector(1 DOWNTO 0);  -- boolean [2]
  SIGNAL clock_crossing_out8_1            : std_logic;
  SIGNAL clock_crossing_out9_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL clock_crossing_out9_1            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL clock_crossing_out10_unsigned    : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL clock_crossing_out10_1           : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL clock_crossing_out11_1           : std_logic_vector(2 DOWNTO 0);  -- boolean [3]
  SIGNAL ready_1                          : std_logic;
  SIGNAL dout_magic                       : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL store_frame_in_ram_out2          : std_logic;
  SIGNAL store_frame_in_ram_out3          : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL store_frame_in_ram_out4          : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL store_frame_in_ram_out5          : std_logic;
  SIGNAL store_frame_in_ram_out6          : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL full_ofdm_modulator_out1         : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL valid_out_1                      : std_logic;
  SIGNAL full_ofdm_modulator_out1_signed  : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL delayMatch9_reg                  : vector_of_signed16(0 TO 5);  -- sfix16 [6]
  SIGNAL full_ofdm_modulator_out1_1       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL delayMatch10_reg                 : std_logic_vector(5 DOWNTO 0);  -- ufix1 [6]
  SIGNAL payload_full_out3_1              : std_logic;
  SIGNAL delayMatch12_reg                 : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL payload_full_out1_1              : std_logic;
  SIGNAL alpha_reg                        : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL payload_ctrl_out_start_1         : std_logic;
  SIGNAL alpha_reg_1                      : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL payload_ctrl_out_end_1           : std_logic;
  SIGNAL alpha_reg_2                      : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL payload_ctrl_out_valid_1         : std_logic;

BEGIN
  u_full_tx_tc : full_tx_raw_src_full_tx_tc
    PORT MAP( clk => clk,
              reset_x => reset_x,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_1_1 => enb_1_1_1,
              enb_1_2_0 => enb_1_2_0,
              enb_1_2_1 => enb_1_2_1,
              enb_1_8_0 => enb_1_8_0,
              enb_1_8_1 => enb_1_8_1
              );

  u_reg_to_variable : full_tx_raw_src_reg_to_variable
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              new_frame_in => new_frame_in,
              reg0 => reg0,  -- uint32
              reg1 => reg1,  -- uint32
              reg2 => reg2,  -- uint32
              reg3 => reg3,  -- uint32
              new_frame_out => reg_to_variable_out1,
              psdu_size => reg_to_variable_out2,  -- boolean [24]
              msg_duration => reg_to_variable_out3,  -- boolean [16]
              block_size => reg_to_variable_out4,  -- boolean [2]
              fec_rate => reg_to_variable_out5,  -- boolean [3]
              rep_number => reg_to_variable_out6,  -- boolean [3]
              concat_factor => reg_to_variable_out7,  -- boolean [3]
              scrambler_init => reg_to_variable_out8,  -- boolean [4]
              bat_id => reg_to_variable_out9,  -- boolean [5]
              cp_id => reg_to_variable_out10,  -- boolean [3]
              mimo_spacing => reg_to_variable_out11,  -- boolean [3]
              mimo_number => reg_to_variable_out12  -- boolean [3]
              );

  u_preamble_gen : full_tx_raw_src_preamble_gen
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              new_frame => Rate_Transition_out1,
              data_out => preamble_gen_out1,
              ctrl_out_end => preamble_gen_out2_end,
              ctrl_out_valid => preamble_gen_out2_valid
              );

  u_channel_gen : full_tx_raw_src_channel_gen
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              new_frame => end_rsvd,
              data_out => channel_gen_out1,
              ctrl_out_end => channel_gen_out2_end,
              ctrl_out_valid => channel_gen_out2_valid
              );

  u_new_frame_rate_conversion : full_tx_raw_src_new_frame_rate_conversion
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb_1_8_1 => enb_1_8_1,
              ctrl_in_end => channel_gen_out2_end,
              new_frame => new_frame_rate_conversion_out1
              );

  u_header_full : full_tx_raw_src_header_full
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              enb => enb,
              new_frame => new_frame_rate_conversion_out1,
              psdu_size => reg_to_variable_out2,  -- boolean [24]
              msg_duration => reg_to_variable_out3,  -- boolean [16]
              block_size => reg_to_variable_out4,  -- boolean [2]
              fec_rate => reg_to_variable_out5,  -- boolean [3]
              rep_number => reg_to_variable_out6,  -- boolean [3]
              concat_factor => reg_to_variable_out7,  -- boolean [3]
              scrambler_init => reg_to_variable_out8,  -- boolean [4]
              bat_id => reg_to_variable_out9,  -- boolean [5]
              cp_id => reg_to_variable_out10,  -- boolean [3]
              mimo_spacing => reg_to_variable_out11,  -- boolean [3]
              mimo_number => reg_to_variable_out12,  -- boolean [3]
              header => header_full_out1,
              ctrl_out_end => header_full_out2_end,
              ctrl_out_valid => header_full_out2_valid
              );

  u_new_frame_rate_conversion1 : full_tx_raw_src_new_frame_rate_conversion1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_8_1 => enb_1_8_1,
              ctrl_in_end => header_full_out2_end,
              new_frame => payload_new_frame_in
              );

  u_payload_full : full_tx_raw_src_payload_full
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              enb => enb,
              enb_1_8_1 => enb_1_8_1,
              data_in => data_in,  -- uint8
              valid_in => valid_in,
              last_frame => Delay1_out1,
              new_frame => payload_new_frame_in,
              scrambler_init => reg_to_variable_out8,  -- boolean [4]
              bat_id => reg_to_variable_out9,  -- boolean [5]
              psdu_size => reg_to_variable_out2,  -- boolean [24]
              payload => payload_full_out1,
              ctrl_out_start => payload_ctrl_out_start,
              ctrl_out_end => payload_ctrl_out_end,
              ctrl_out_valid => payload_ctrl_out_valid,
              ready => payload_full_out3,
              len_in_ofdm_symbols => payload_full_out4,  -- uint16
              bits_per_subcarrier => payload_full_out5  -- ufix4
              );

  u_clock_crossing : full_tx_raw_src_clock_crossing
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              preamble_in => preamble_gen_out1,
              preamble_ctrl_in_valid => preamble_gen_out2_valid,
              channel => channel_gen_out1,
              channel_ctrl_valid => channel_gen_out2_valid,
              header_in => header_full_out1,
              header_ctrl_in_valid => header_full_out2_valid,
              payload_in => payload_full_out1,
              payload_ctrl_in_valid => payload_ctrl_out_valid,
              cp_len_in => reg_to_variable_out10,  -- boolean [3]
              payload_len_in => payload_full_out4,  -- uint16
              bits_per_subcarrier_in => payload_full_out5,  -- ufix4
              preamble_out => clock_crossing_out1,
              preamble_valid => clock_crossing_out2,
              channel_out => clock_crossing_out3,
              channel_valid => clock_crossing_out4,
              header_out => deserializer_PostProcessed,  -- boolean [2]
              header_valid => clock_crossing_out6,
              payload_out => deserializer_PostProcessed_1,  -- boolean [2]
              payload_valid_out => clock_crossing_out8,
              payload_len_out => clock_crossing_out9,  -- uint16
              bits_per_subcarrier_out => clock_crossing_out10,  -- ufix4
              cp_len_out => clock_crossing_out11  -- boolean [3]
              );

  u_store_frame_in_ram : full_tx_raw_src_store_frame_in_ram
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              preamble => clock_crossing_out1,
              preamble_valid => clock_crossing_out2_1,
              channel => clock_crossing_out3,
              channel_valid => clock_crossing_out4_1,
              header => deserializer_PostProcessed_2,  -- boolean [2]
              header_valid => clock_crossing_out6_1,
              payload => deserializer_PostProcessed_3,  -- boolean [2]
              payload_valid => clock_crossing_out8_1,
              payload_len => std_logic_vector(clock_crossing_out9_1),  -- uint16
              bits_per_subcarrier => std_logic_vector(clock_crossing_out10_1),  -- ufix4
              cp_len_in => clock_crossing_out11_1,  -- boolean [3]
              ready => ready_1,
              data_out => dout_magic,  -- ufix12
              valid_out => store_frame_in_ram_out2,
              bits_per_subcarrier_out => store_frame_in_ram_out3,  -- ufix4
              init => store_frame_in_ram_out4,  -- boolean [13]
              new_rsvd => store_frame_in_ram_out5,
              cp_len => store_frame_in_ram_out6  -- uint8
              );

  u_full_ofdm_modulator : full_tx_raw_src_full_ofdm_modulator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              data_in => dout_magic,  -- ufix12
              valid_in => store_frame_in_ram_out2,
              bits_per_subcarrier => store_frame_in_ram_out3,  -- ufix4
              init => store_frame_in_ram_out4,  -- boolean [13]
              new_ofdm_sym => store_frame_in_ram_out5,
              cp_len => store_frame_in_ram_out6,  -- uint8
              data_out => full_ofdm_modulator_out1,  -- sfix16_En14
              valid_out => valid_out_1,
              ready => ready_1
              );

  Rate_Transition_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition_out1 <= reg_to_variable_out1;
      END IF;
    END IF;
  END PROCESS Rate_Transition_process;


  end_rsvd <= preamble_gen_out2_end;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Delay1_out1 <= last_frame;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        clock_crossing_out2_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        clock_crossing_out2_1 <= clock_crossing_out2;
      END IF;
    END IF;
  END PROCESS delayMatch_process;


  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        clock_crossing_out4_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        clock_crossing_out4_1 <= clock_crossing_out4;
      END IF;
    END IF;
  END PROCESS delayMatch1_process;


  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        deserializer_PostProcessed_2 <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        deserializer_PostProcessed_2 <= deserializer_PostProcessed;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        clock_crossing_out6_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        clock_crossing_out6_1 <= clock_crossing_out6;
      END IF;
    END IF;
  END PROCESS delayMatch3_process;


  delayMatch4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        deserializer_PostProcessed_3 <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        deserializer_PostProcessed_3 <= deserializer_PostProcessed_1;
      END IF;
    END IF;
  END PROCESS delayMatch4_process;


  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        clock_crossing_out8_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        clock_crossing_out8_1 <= clock_crossing_out8;
      END IF;
    END IF;
  END PROCESS delayMatch5_process;


  clock_crossing_out9_unsigned <= unsigned(clock_crossing_out9);

  delayMatch6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        clock_crossing_out9_1 <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        clock_crossing_out9_1 <= clock_crossing_out9_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch6_process;


  clock_crossing_out10_unsigned <= unsigned(clock_crossing_out10);

  delayMatch7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        clock_crossing_out10_1 <= to_unsigned(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        clock_crossing_out10_1 <= clock_crossing_out10_unsigned;
      END IF;
    END IF;
  END PROCESS delayMatch7_process;


  delayMatch8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        clock_crossing_out11_1 <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        clock_crossing_out11_1 <= clock_crossing_out11;
      END IF;
    END IF;
  END PROCESS delayMatch8_process;


  full_ofdm_modulator_out1_signed <= signed(full_ofdm_modulator_out1);

  delayMatch9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch9_reg <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' THEN
        delayMatch9_reg(0) <= full_ofdm_modulator_out1_signed;
        delayMatch9_reg(1 TO 5) <= delayMatch9_reg(0 TO 4);
      END IF;
    END IF;
  END PROCESS delayMatch9_process;

  full_ofdm_modulator_out1_1 <= delayMatch9_reg(5);

  data_out <= std_logic_vector(full_ofdm_modulator_out1_1);

  delayMatch10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch10_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch10_reg(0) <= valid_out_1;
        delayMatch10_reg(5 DOWNTO 1) <= delayMatch10_reg(4 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS delayMatch10_process;

  valid_out <= delayMatch10_reg(5);

  delayMatch11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        payload_full_out3_1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        payload_full_out3_1 <= payload_full_out3;
      END IF;
    END IF;
  END PROCESS delayMatch11_process;


  delayMatch12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch12_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch12_reg(0) <= payload_full_out1;
        delayMatch12_reg(7 DOWNTO 1) <= delayMatch12_reg(6 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS delayMatch12_process;

  payload_full_out1_1 <= delayMatch12_reg(7);

  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alpha_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        alpha_reg(0) <= payload_ctrl_out_start;
        alpha_reg(7 DOWNTO 1) <= alpha_reg(6 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS c_process;

  payload_ctrl_out_start_1 <= alpha_reg(7);

  c_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alpha_reg_1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        alpha_reg_1(0) <= payload_ctrl_out_end;
        alpha_reg_1(7 DOWNTO 1) <= alpha_reg_1(6 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS c_1_process;

  payload_ctrl_out_end_1 <= alpha_reg_1(7);

  c_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alpha_reg_2 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        alpha_reg_2(0) <= payload_ctrl_out_valid;
        alpha_reg_2(7 DOWNTO 1) <= alpha_reg_2(6 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS c_2_process;

  payload_ctrl_out_valid_1 <= alpha_reg_2(7);

  ce_out_0 <= enb_1_1_1;

  ce_out_1 <= enb_1_8_1;

  ready <= payload_full_out3_1;

  debug_payload <= payload_full_out1_1;

  debug_payload_ctrl_start <= payload_ctrl_out_start_1;

  debug_payload_ctrl_end <= payload_ctrl_out_end_1;

  debug_payload_ctrl_valid <= payload_ctrl_out_valid_1;

END rtl;

