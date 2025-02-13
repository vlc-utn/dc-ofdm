-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_full_rx.vhd
-- Created: 2024-10-27 23:05:39
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
-- ce_out        6.4e-08
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- data_out                      ce_out        6.4e-08
-- valid_out                     ce_out        6.4e-08
-- start_out                     ce_out        6.4e-08
-- end_out                       ce_out        6.4e-08
-- reg0                          ce_out        6.4e-08
-- reg1                          ce_out        6.4e-08
-- reg2                          ce_out        6.4e-08
-- reg3                          ce_out        6.4e-08
-- header_ready                  ce_out        6.4e-08
-- header_error                  ce_out        6.4e-08
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_full_rx
-- Source Path: HDLRx/full_rx
-- Hierarchy Level: 0
-- Model version: 1.138
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_full_rx IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(15 DOWNTO 0);  -- int16
        header_ack                        :   IN    std_logic;
        ce_out                            :   OUT   std_logic;
        data_out                          :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        valid_out                         :   OUT   std_logic;
        start_out                         :   OUT   std_logic;
        end_out                           :   OUT   std_logic;
        reg0                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        reg1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        reg2                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        reg3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
        header_ready                      :   OUT   std_logic;
        header_error                      :   OUT   std_logic
        );
END IEEE_8021513_RX_src_full_rx;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_full_rx IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_full_rx_tc
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          enb                             :   OUT   std_logic;
          enb_1_2_0                       :   OUT   std_logic;
          enb_1_2_1                       :   OUT   std_logic;
          enb_1_8_0                       :   OUT   std_logic;
          enb_1_8_1                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_batid_to_bits_per_subcarrier
    PORT( bat_id                          :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix1 [5]
          bits_per_subcarrier             :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_LDPC_shared
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          ldpc_data_header                :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          ldpc_ctrl_header_start          :   IN    std_logic;
          ldpc_ctrl_header_end            :   IN    std_logic;
          ldpc_ctrl_header_valid          :   IN    std_logic;
          ldpc_data_payload               :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          ldpc_ctrl_payload_start         :   IN    std_logic;
          ldpc_ctrl_payload_end           :   IN    std_logic;
          ldpc_ctrl_payload_valid         :   IN    std_logic;
          start_header                    :   IN    std_logic;
          end_header                      :   IN    std_logic;
          ldpc_data_out                   :   OUT   std_logic;
          ldpc_ctrl_header_out_start      :   OUT   std_logic;
          ldpc_ctrl_header_out_end        :   OUT   std_logic;
          ldpc_ctrl_header_out_valid      :   OUT   std_logic;
          ldpc_ctrl_payload_out_start     :   OUT   std_logic;
          ldpc_ctrl_payload_out_valid     :   OUT   std_logic;
          ldpc_next_frame                 :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_header_clock_x2
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    vector_of_std_logic_vector4(0 TO 1);  -- sfix4_En1 [2]
          valid_header                    :   IN    std_logic;
          data_out                        :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          start                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_h_rx_full
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          start_in                        :   IN    std_logic;
          ldpc_in                         :   IN    std_logic;
          ldpc_ctrl_in_start              :   IN    std_logic;
          ldpc_ctrl_in_end                :   IN    std_logic;
          ldpc_ctrl_in_valid              :   IN    std_logic;
          psdu_size                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
          msg_duration                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- ufix1 [16]
          block_size                      :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
          fec_rate                        :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          rep_number                      :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          concat_factor                   :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          scrambler_init                  :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix1 [4]
          bat_id                          :   OUT   std_logic_vector(4 DOWNTO 0);  -- ufix1 [5]
          cp_id                           :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          mimo_spacing                    :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          mimo_number                     :   OUT   std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          end_rsvd                        :   OUT   std_logic;
          err                             :   OUT   std_logic;
          ldpc_out                        :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          ldpc_ctrl_out_start             :   OUT   std_logic;
          ldpc_ctrl_out_end               :   OUT   std_logic;
          ldpc_ctrl_out_valid             :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_cpid_to_cplen
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          cp_id                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          payload_cp_len                  :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_rx_demodulator_full
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En13
          payload_cp_len                  :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          payload_bits_per_subcarrier     :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
          header_ready                    :   IN    std_logic;
          data_out                        :   OUT   vector_of_std_logic_vector4(0 TO 1);  -- sfix4_En1 [2]
          valid_header                    :   OUT   std_logic;
          valid_payload                   :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_prepare_payload_data
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    vector_of_std_logic_vector4(0 TO 1);  -- sfix4_En1 [2]
          valid_payload                   :   IN    std_logic;
          payload_ready                   :   IN    std_logic;
          reset                           :   IN    std_logic;
          dataOut                         :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          valid_in                        :   OUT   std_logic;
          new_frame                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_rx_payload_full
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          valid_in                        :   IN    std_logic;
          new_frame                       :   IN    std_logic;
          scrambler_init                  :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix1 [4]
          psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
          msg_duration                    :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix1 [16]
          ldpc_data_in                    :   IN    std_logic;
          ldpc_ctrl_in_start              :   IN    std_logic;
          ldpc_ctrl_in_valid              :   IN    std_logic;
          ldpc_next_frame_in              :   IN    std_logic;
          data_out                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          valid_out                       :   OUT   std_logic;
          start                           :   OUT   std_logic;
          end_rsvd                        :   OUT   std_logic;
          ready                           :   OUT   std_logic;
          ldpc_data_out                   :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          ldpc_ctrl_out_start             :   OUT   std_logic;
          ldpc_ctrl_out_end               :   OUT   std_logic;
          ldpc_ctrl_out_valid             :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_variable_to_reg
    PORT( psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
          msg_duration                    :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix1 [16]
          block_size                      :   IN    std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
          fec_rate                        :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          rep_number                      :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          concat_factor                   :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          scrambler_init                  :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix1 [4]
          bat_id                          :   IN    std_logic_vector(4 DOWNTO 0);  -- ufix1 [5]
          cp_id                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          mimo_spacing                    :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          mimo_number                     :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
          reg0                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          reg1                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          reg2                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- uint32
          reg3                            :   OUT   std_logic_vector(31 DOWNTO 0)  -- uint32
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_signal_ack
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          signal_in                       :   IN    std_logic;
          free_signal                     :   IN    std_logic;
          signal_out                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_full_rx_tc
    USE ENTITY work.IEEE_8021513_RX_src_full_rx_tc(rtl);

  FOR ALL : IEEE_8021513_RX_src_batid_to_bits_per_subcarrier
    USE ENTITY work.IEEE_8021513_RX_src_batid_to_bits_per_subcarrier(rtl);

  FOR ALL : IEEE_8021513_RX_src_LDPC_shared
    USE ENTITY work.IEEE_8021513_RX_src_LDPC_shared(rtl);

  FOR ALL : IEEE_8021513_RX_src_header_clock_x2
    USE ENTITY work.IEEE_8021513_RX_src_header_clock_x2(rtl);

  FOR ALL : IEEE_8021513_RX_src_h_rx_full
    USE ENTITY work.IEEE_8021513_RX_src_h_rx_full(rtl);

  FOR ALL : IEEE_8021513_RX_src_cpid_to_cplen
    USE ENTITY work.IEEE_8021513_RX_src_cpid_to_cplen(rtl);

  FOR ALL : IEEE_8021513_RX_src_rx_demodulator_full
    USE ENTITY work.IEEE_8021513_RX_src_rx_demodulator_full(rtl);

  FOR ALL : IEEE_8021513_RX_src_prepare_payload_data
    USE ENTITY work.IEEE_8021513_RX_src_prepare_payload_data(rtl);

  FOR ALL : IEEE_8021513_RX_src_rx_payload_full
    USE ENTITY work.IEEE_8021513_RX_src_rx_payload_full(rtl);

  FOR ALL : IEEE_8021513_RX_src_variable_to_reg
    USE ENTITY work.IEEE_8021513_RX_src_variable_to_reg(rtl);

  FOR ALL : IEEE_8021513_RX_src_signal_ack
    USE ENTITY work.IEEE_8021513_RX_src_signal_ack(rtl);

  -- Signals
  SIGNAL enb_1_2_0                        : std_logic;
  SIGNAL enb                              : std_logic;
  SIGNAL enb_1_8_0                        : std_logic;
  SIGNAL enb_1_8_1                        : std_logic;
  SIGNAL enb_1_2_1                        : std_logic;
  SIGNAL data_in_signed                   : signed(15 DOWNTO 0);  -- int16
  SIGNAL adc_to_ip_out1                   : signed(13 DOWNTO 0);  -- sfix14_En13
  SIGNAL h_rx_full_out2                   : std_logic_vector(15 DOWNTO 0);  -- ufix1 [16]
  SIGNAL Rate_Transition3_out1            : std_logic_vector(15 DOWNTO 0);  -- ufix1 [16]
  SIGNAL h_rx_full_out1                   : std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
  SIGNAL Rate_Transition8_out1            : std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
  SIGNAL h_rx_full_out7                   : std_logic_vector(3 DOWNTO 0);  -- ufix1 [4]
  SIGNAL Rate_Transition5_out1            : std_logic_vector(3 DOWNTO 0);  -- ufix1 [4]
  SIGNAL ready                            : std_logic;
  SIGNAL payload_ready                    : std_logic;
  SIGNAL header_ready_1                   : std_logic;
  SIGNAL Rate_Transition9_out1            : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Rate_Transition_out1             : std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
  SIGNAL Delay2_out1                      : std_logic_vector(23 DOWNTO 0);  -- ufix1 [24]
  SIGNAL h_rx_full_out8                   : std_logic_vector(4 DOWNTO 0);  -- ufix1 [5]
  SIGNAL y                                : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL y_1                              : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Rate_Transition1_out1            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay1_out1                      : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Rate_Transition4_out1            : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL h_rx_full_out14                  : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL h_rx_full_out15_start            : std_logic;
  SIGNAL h_rx_full_out15_end              : std_logic;
  SIGNAL h_rx_full_out15_valid            : std_logic;
  SIGNAL rx_payload_full_out6             : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL rx_payload_full_out7_start       : std_logic;
  SIGNAL rx_payload_full_out7_end         : std_logic;
  SIGNAL rx_payload_full_out7_valid       : std_logic;
  SIGNAL header_clock_x2_out2             : std_logic;
  SIGNAL LDPC_shared_out1                 : std_logic;
  SIGNAL LDPC_shared_out2_start           : std_logic;
  SIGNAL LDPC_shared_out2_end             : std_logic;
  SIGNAL LDPC_shared_out2_valid           : std_logic;
  SIGNAL LDPC_shared_out3_start           : std_logic;
  SIGNAL LDPC_shared_out3_valid           : std_logic;
  SIGNAL LDPC_shared_out4                 : std_logic;
  SIGNAL rx_demodulator_full_out1         : vector_of_std_logic_vector4(0 TO 1);  -- ufix4 [2]
  SIGNAL valid_header                     : std_logic;
  SIGNAL serializer_PostProcessed         : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL h_rx_full_out3                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL h_rx_full_out4                   : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL h_rx_full_out5                   : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL h_rx_full_out6                   : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL h_rx_full_out9                   : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL h_rx_full_out10                  : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL h_rx_full_out11                  : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL h_rx_full_out13                  : std_logic;
  SIGNAL cpid_to_cplen_out1               : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL cpid_to_cplen_out1_unsigned      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Rate_Transition2_out1            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay_out1                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL valid_payload                    : std_logic;
  SIGNAL prepare_payload_data_out1        : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL valid_payload_to_ldpc            : std_logic;
  SIGNAL prepare_payload_data_out3        : std_logic;
  SIGNAL rx_payload_full_out1             : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL rx_payload_full_out2             : std_logic;
  SIGNAL rx_payload_full_out3             : std_logic;
  SIGNAL end_rsvd                         : std_logic;
  SIGNAL reg0_tmp                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reg1_tmp                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reg2_tmp                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reg3_tmp                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Tapped_Delay_out1                : std_logic_vector(7 DOWNTO 0);  -- boolean [8]
  SIGNAL Tapped_Delay_out1_0              : std_logic;
  SIGNAL Tapped_Delay_out1_1              : std_logic;
  SIGNAL Tapped_Delay_out1_2              : std_logic;
  SIGNAL Tapped_Delay_out1_3              : std_logic;
  SIGNAL Tapped_Delay_out1_4              : std_logic;
  SIGNAL Tapped_Delay_out1_5              : std_logic;
  SIGNAL Tapped_Delay_out1_6              : std_logic;
  SIGNAL Tapped_Delay_out1_7              : std_logic;
  SIGNAL Bitwise_Operator1_out1           : std_logic;
  SIGNAL Rate_Transition10_out1           : std_logic;
  SIGNAL Delay5_out1                      : std_logic;
  SIGNAL signal_out                       : std_logic;

BEGIN
  u_full_rx_tc : IEEE_8021513_RX_src_full_rx_tc
    PORT MAP( clk => clk,
              reset_x => reset_x,
              clk_enable => clk_enable,
              enb => enb,
              enb_1_2_0 => enb_1_2_0,
              enb_1_2_1 => enb_1_2_1,
              enb_1_8_0 => enb_1_8_0,
              enb_1_8_1 => enb_1_8_1
              );

  u_batid_to_bits_per_subcarrier : IEEE_8021513_RX_src_batid_to_bits_per_subcarrier
    PORT MAP( bat_id => h_rx_full_out8,  -- ufix1 [5]
              bits_per_subcarrier => y  -- ufix4
              );

  u_LDPC_shared : IEEE_8021513_RX_src_LDPC_shared
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              ldpc_data_header => h_rx_full_out14,  -- sfix4_En1
              ldpc_ctrl_header_start => h_rx_full_out15_start,
              ldpc_ctrl_header_end => h_rx_full_out15_end,
              ldpc_ctrl_header_valid => h_rx_full_out15_valid,
              ldpc_data_payload => rx_payload_full_out6,  -- sfix4_En1
              ldpc_ctrl_payload_start => rx_payload_full_out7_start,
              ldpc_ctrl_payload_end => rx_payload_full_out7_end,
              ldpc_ctrl_payload_valid => rx_payload_full_out7_valid,
              start_header => header_clock_x2_out2,
              end_header => Delay4_out1,
              ldpc_data_out => LDPC_shared_out1,
              ldpc_ctrl_header_out_start => LDPC_shared_out2_start,
              ldpc_ctrl_header_out_end => LDPC_shared_out2_end,
              ldpc_ctrl_header_out_valid => LDPC_shared_out2_valid,
              ldpc_ctrl_payload_out_start => LDPC_shared_out3_start,
              ldpc_ctrl_payload_out_valid => LDPC_shared_out3_valid,
              ldpc_next_frame => LDPC_shared_out4
              );

  u_header_clock_x2 : IEEE_8021513_RX_src_header_clock_x2
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => rx_demodulator_full_out1,  -- sfix4_En1 [2]
              valid_header => valid_header,
              data_out => serializer_PostProcessed,  -- sfix4_En1
              start => header_clock_x2_out2
              );

  u_h_rx_full : IEEE_8021513_RX_src_h_rx_full
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_8_0 => enb_1_8_0,
              enb_1_8_1 => enb_1_8_1,
              data_in => serializer_PostProcessed,  -- sfix4_En1
              start_in => header_clock_x2_out2,
              ldpc_in => LDPC_shared_out1,
              ldpc_ctrl_in_start => LDPC_shared_out2_start,
              ldpc_ctrl_in_end => LDPC_shared_out2_end,
              ldpc_ctrl_in_valid => LDPC_shared_out2_valid,
              psdu_size => h_rx_full_out1,  -- ufix1 [24]
              msg_duration => h_rx_full_out2,  -- ufix1 [16]
              block_size => h_rx_full_out3,  -- ufix1 [2]
              fec_rate => h_rx_full_out4,  -- ufix1 [3]
              rep_number => h_rx_full_out5,  -- ufix1 [3]
              concat_factor => h_rx_full_out6,  -- ufix1 [3]
              scrambler_init => h_rx_full_out7,  -- ufix1 [4]
              bat_id => h_rx_full_out8,  -- ufix1 [5]
              cp_id => h_rx_full_out9,  -- ufix1 [3]
              mimo_spacing => h_rx_full_out10,  -- ufix1 [3]
              mimo_number => h_rx_full_out11,  -- ufix1 [3]
              end_rsvd => header_ready_1,
              err => h_rx_full_out13,
              ldpc_out => h_rx_full_out14,  -- sfix4_En1
              ldpc_ctrl_out_start => h_rx_full_out15_start,
              ldpc_ctrl_out_end => h_rx_full_out15_end,
              ldpc_ctrl_out_valid => h_rx_full_out15_valid
              );

  u_cpid_to_cplen : IEEE_8021513_RX_src_cpid_to_cplen
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              cp_id => h_rx_full_out9,  -- ufix1 [3]
              payload_cp_len => cpid_to_cplen_out1  -- uint8
              );

  u_rx_demodulator_full : IEEE_8021513_RX_src_rx_demodulator_full
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              data_in => std_logic_vector(adc_to_ip_out1),  -- sfix14_En13
              payload_cp_len => std_logic_vector(Delay_out1),  -- uint8
              payload_bits_per_subcarrier => std_logic_vector(Delay1_out1),  -- ufix4
              psdu_size => Delay2_out1,  -- ufix1 [24]
              header_ready => Delay3_out1,
              data_out => rx_demodulator_full_out1,  -- sfix4_En1 [2]
              valid_header => valid_header,
              valid_payload => valid_payload
              );

  u_prepare_payload_data : IEEE_8021513_RX_src_prepare_payload_data
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => rx_demodulator_full_out1,  -- sfix4_En1 [2]
              valid_payload => valid_payload,
              payload_ready => payload_ready,
              reset => Delay4_out1,
              dataOut => prepare_payload_data_out1,  -- sfix4_En1
              valid_in => valid_payload_to_ldpc,
              new_frame => prepare_payload_data_out3
              );

  u_rx_payload_full : IEEE_8021513_RX_src_rx_payload_full
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_8_0 => enb_1_8_0,
              enb_1_8_1 => enb_1_8_1,
              data_in => prepare_payload_data_out1,  -- sfix4_En1
              valid_in => valid_payload_to_ldpc,
              new_frame => prepare_payload_data_out3,
              scrambler_init => Rate_Transition5_out1,  -- ufix1 [4]
              psdu_size => Rate_Transition8_out1,  -- ufix1 [24]
              msg_duration => Rate_Transition3_out1,  -- ufix1 [16]
              ldpc_data_in => LDPC_shared_out1,
              ldpc_ctrl_in_start => LDPC_shared_out3_start,
              ldpc_ctrl_in_valid => LDPC_shared_out3_valid,
              ldpc_next_frame_in => LDPC_shared_out4,
              data_out => rx_payload_full_out1,  -- uint8
              valid_out => rx_payload_full_out2,
              start => rx_payload_full_out3,
              end_rsvd => end_rsvd,
              ready => ready,
              ldpc_data_out => rx_payload_full_out6,  -- sfix4_En1
              ldpc_ctrl_out_start => rx_payload_full_out7_start,
              ldpc_ctrl_out_end => rx_payload_full_out7_end,
              ldpc_ctrl_out_valid => rx_payload_full_out7_valid
              );

  u_variable_to_reg : IEEE_8021513_RX_src_variable_to_reg
    PORT MAP( psdu_size => h_rx_full_out1,  -- ufix1 [24]
              msg_duration => h_rx_full_out2,  -- ufix1 [16]
              block_size => h_rx_full_out3,  -- ufix1 [2]
              fec_rate => h_rx_full_out4,  -- ufix1 [3]
              rep_number => h_rx_full_out5,  -- ufix1 [3]
              concat_factor => h_rx_full_out6,  -- ufix1 [3]
              scrambler_init => h_rx_full_out7,  -- ufix1 [4]
              bat_id => h_rx_full_out8,  -- ufix1 [5]
              cp_id => h_rx_full_out9,  -- ufix1 [3]
              mimo_spacing => h_rx_full_out10,  -- ufix1 [3]
              mimo_number => h_rx_full_out11,  -- ufix1 [3]
              reg0 => reg0_tmp,  -- uint32
              reg1 => reg1_tmp,  -- uint32
              reg2 => reg2_tmp,  -- uint32
              reg3 => reg3_tmp  -- uint32
              );

  u_signal_ack : IEEE_8021513_RX_src_signal_ack
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              signal_in => header_ready_1,
              free_signal => Delay5_out1,
              signal_out => signal_out
              );

  data_in_signed <= signed(data_in);

  adc_to_ip_out1 <= data_in_signed(13 DOWNTO 0);

  Rate_Transition3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition3_out1 <= (OTHERS => '0');
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition3_out1 <= h_rx_full_out2;
      END IF;
    END IF;
  END PROCESS Rate_Transition3_process;


  Rate_Transition8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition8_out1 <= (OTHERS => '0');
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition8_out1 <= h_rx_full_out1;
      END IF;
    END IF;
  END PROCESS Rate_Transition8_process;


  Rate_Transition5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition5_out1 <= (OTHERS => '0');
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition5_out1 <= h_rx_full_out7;
      END IF;
    END IF;
  END PROCESS Rate_Transition5_process;


  payload_ready <= ready;

  Rate_Transition9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition9_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition9_out1 <= header_ready_1;
      END IF;
    END IF;
  END PROCESS Rate_Transition9_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= Rate_Transition9_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Rate_Transition_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition_out1 <= (OTHERS => '0');
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition_out1 <= h_rx_full_out1;
      END IF;
    END IF;
  END PROCESS Rate_Transition_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_out1 <= Rate_Transition_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  y_1 <= unsigned(y);

  Rate_Transition1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition1_out1 <= to_unsigned(16#0#, 4);
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition1_out1 <= y_1;
      END IF;
    END IF;
  END PROCESS Rate_Transition1_process;


  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_unsigned(16#0#, 4);
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Rate_Transition1_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Rate_Transition4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition4_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition4_out1 <= header_ready_1;
      END IF;
    END IF;
  END PROCESS Rate_Transition4_process;


  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1 <= Rate_Transition4_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  cpid_to_cplen_out1_unsigned <= unsigned(cpid_to_cplen_out1);

  Rate_Transition2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition2_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_8_0 = '1' THEN
        Rate_Transition2_out1 <= cpid_to_cplen_out1_unsigned;
      END IF;
    END IF;
  END PROCESS Rate_Transition2_process;


  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0 = '1' THEN
        Delay_out1 <= Rate_Transition2_out1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Tapped_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Tapped_Delay_out1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Tapped_Delay_out1(7) <= header_ack;
        Tapped_Delay_out1(6 DOWNTO 0) <= Tapped_Delay_out1(7 DOWNTO 1);
      END IF;
    END IF;
  END PROCESS Tapped_Delay_process;


  Tapped_Delay_out1_0 <= Tapped_Delay_out1(0);

  Tapped_Delay_out1_1 <= Tapped_Delay_out1(1);

  Tapped_Delay_out1_2 <= Tapped_Delay_out1(2);

  Tapped_Delay_out1_3 <= Tapped_Delay_out1(3);

  Tapped_Delay_out1_4 <= Tapped_Delay_out1(4);

  Tapped_Delay_out1_5 <= Tapped_Delay_out1(5);

  Tapped_Delay_out1_6 <= Tapped_Delay_out1(6);

  Tapped_Delay_out1_7 <= Tapped_Delay_out1(7);

  Bitwise_Operator1_out1 <= Tapped_Delay_out1_7 OR (Tapped_Delay_out1_6 OR (Tapped_Delay_out1_5 OR (Tapped_Delay_out1_4 OR (Tapped_Delay_out1_3 OR (Tapped_Delay_out1_2 OR (Tapped_Delay_out1_0 OR Tapped_Delay_out1_1))))));

  Rate_Transition10_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition10_out1 <= '0';
      ELSIF enb_1_8_1 = '1' THEN
        Rate_Transition10_out1 <= Bitwise_Operator1_out1;
      END IF;
    END IF;
  END PROCESS Rate_Transition10_output_process;


  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Delay5_out1 <= Rate_Transition10_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  ce_out <= enb_1_8_1;

  data_out <= rx_payload_full_out1;

  valid_out <= rx_payload_full_out2;

  start_out <= rx_payload_full_out3;

  end_out <= end_rsvd;

  reg0 <= reg0_tmp;

  reg1 <= reg1_tmp;

  reg2 <= reg2_tmp;

  reg3 <= reg3_tmp;

  header_ready <= signal_out;

  header_error <= h_rx_full_out13;

END rtl;

