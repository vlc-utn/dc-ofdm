-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_payload_full.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_payload_full
-- Source Path: HDLTx/full_tx/payload_full
-- Hierarchy Level: 1
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_payload_full IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_8_0                         :   IN    std_logic;
        enb_1_8_1                         :   IN    std_logic;
        enb_1_1_1                         :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        valid_in                          :   IN    std_logic;
        new_frame                         :   IN    std_logic;
        scrambler_init                    :   IN    std_logic_vector(3 DOWNTO 0);  -- boolean [4]
        bat_id                            :   IN    std_logic_vector(4 DOWNTO 0);  -- boolean [5]
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
        payload                           :   OUT   std_logic;
        ctrl_out_start                    :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic;
        ready                             :   OUT   std_logic;
        len_in_ofdm_symbols               :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
        bits_per_subcarrier               :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
        );
END IEEE_8021513_TX_src_payload_full;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_payload_full IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_batid_to_bits_per_subcarrier
    PORT( bat_id                          :   IN    std_logic_vector(4 DOWNTO 0);  -- boolean [5]
          bits_per_subcarrier             :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_psdu_size_to_payload_length
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          psdu_size                       :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
          payload_len_in_ofdm_symbols     :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          payload_len_in_words            :   OUT   std_logic_vector(23 DOWNTO 0)  -- ufix24
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_valid_to_ctrl_block1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          validIn                         :   IN    std_logic;
          ctrlOut_start                   :   OUT   std_logic;
          ctrlOut_end                     :   OUT   std_logic;
          ctrlOut_valid                   :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_HDL_FIFO
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
          enb_1_1_1                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
          Full                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_rising_edge_detector_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_next_frame_to_ready
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          next_frame                      :   IN    std_logic;
          ready                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_p_scrambler
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    std_logic;  -- ufix1
          ctrl_in_start                   :   IN    std_logic;
          ctrl_in_end                     :   IN    std_logic;
          ctrl_in_valid                   :   IN    std_logic;
          SI                              :   IN    std_logic_vector(3 DOWNTO 0);  -- boolean [4]
          data_out                        :   OUT   std_logic;
          ctrl_out_start                  :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_reduced_ldpc
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    std_logic;
          ctrl_in_start                   :   IN    std_logic;
          ctrl_in_end                     :   IN    std_logic;
          ctrl_in_valid                   :   IN    std_logic;
          data_out                        :   OUT   std_logic;
          ctrl_out_start                  :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic;
          next_frame                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_tone_mapping
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    std_logic;
          ctrl_in_start                   :   IN    std_logic;
          ctrl_in_end                     :   IN    std_logic;
          ctrl_in_valid                   :   IN    std_logic;
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          len_in_ofdm_symbols             :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
          new_frame                       :   IN    std_logic;
          data_out                        :   OUT   std_logic;
          ctrl_out_start                  :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_batid_to_bits_per_subcarrier
    USE ENTITY work.IEEE_8021513_TX_src_batid_to_bits_per_subcarrier(rtl);

  FOR ALL : IEEE_8021513_TX_src_psdu_size_to_payload_length
    USE ENTITY work.IEEE_8021513_TX_src_psdu_size_to_payload_length(rtl);

  FOR ALL : IEEE_8021513_TX_src_valid_to_ctrl_block1
    USE ENTITY work.IEEE_8021513_TX_src_valid_to_ctrl_block1(rtl);

  FOR ALL : IEEE_8021513_TX_src_HDL_FIFO
    USE ENTITY work.IEEE_8021513_TX_src_HDL_FIFO(rtl);

  FOR ALL : IEEE_8021513_TX_src_rising_edge_detector_block
    USE ENTITY work.IEEE_8021513_TX_src_rising_edge_detector_block(rtl);

  FOR ALL : IEEE_8021513_TX_src_next_frame_to_ready
    USE ENTITY work.IEEE_8021513_TX_src_next_frame_to_ready(rtl);

  FOR ALL : IEEE_8021513_TX_src_p_scrambler
    USE ENTITY work.IEEE_8021513_TX_src_p_scrambler(rtl);

  FOR ALL : IEEE_8021513_TX_src_reduced_ldpc
    USE ENTITY work.IEEE_8021513_TX_src_reduced_ldpc(rtl);

  FOR ALL : IEEE_8021513_TX_src_tone_mapping
    USE ENTITY work.IEEE_8021513_TX_src_tone_mapping(rtl);

  -- Signals
  SIGNAL end_rsvd                         : std_logic;
  SIGNAL count_step                       : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_reset                      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL bits_per_subcarrier_1            : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL len_in_ofdm_symbols_1            : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL len_in_words                     : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL len_in_words_unsigned            : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL Bit_Shift_out1                   : unsigned(23 DOWNTO 0);  -- ufix24
  SIGNAL data_in_unsigned                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay4_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Delay9_out1                      : std_logic_vector(3 DOWNTO 0);  -- boolean [4]
  SIGNAL valid_to_ctrl_out1_valid         : std_logic;
  SIGNAL Delay8_out1_valid                : std_logic;
  SIGNAL valid_to_ctrl_out1_end           : std_logic;
  SIGNAL Delay8_out1_end                  : std_logic;
  SIGNAL Serializer1D_out2                : std_logic;
  SIGNAL valid_to_ctrl_out1_start         : std_logic;
  SIGNAL Delay8_out1_start                : std_logic;
  SIGNAL HDL_FIFO_out1_unsigned           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL y_8                              : std_logic;  -- ufix1
  SIGNAL y_7                              : std_logic;  -- ufix1
  SIGNAL y_6                              : std_logic;  -- ufix1
  SIGNAL y_5                              : std_logic;  -- ufix1
  SIGNAL y_4                              : std_logic;  -- ufix1
  SIGNAL y_3                              : std_logic;  -- ufix1
  SIGNAL y_2                              : std_logic;  -- ufix1
  SIGNAL pop                              : std_logic;
  SIGNAL HDL_FIFO_out1                    : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL HDL_FIFO_out2                    : std_logic;
  SIGNAL y_1                              : std_logic;  -- ufix1
  SIGNAL y                                : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL Delay5_out1                      : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL serial_in_1                      : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL reduced_ldpc_out3                : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Unit_Delay1_out1                 : std_logic;
  SIGNAL counter                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count                            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_1                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_2                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Relational_Operator_out1         : std_logic;
  SIGNAL last_frame                       : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Rate_Transition1_out1            : std_logic;
  SIGNAL Delay11_out1                     : std_logic;
  SIGNAL ready_1                          : std_logic;
  SIGNAL Delay13_reg                      : std_logic_vector(7 DOWNTO 0);  -- ufix1 [8]
  SIGNAL Delay14_out1                     : std_logic;
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL control_in_2                     : std_logic;
  SIGNAL Serializer1D_contl_cnt           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Serializer1D_invldSignal         : std_logic;
  SIGNAL Serializer1D_data                : std_logic_vector(6 DOWNTO 0);  -- ufix1 [7]
  SIGNAL Serializer1D_data_next           : std_logic_vector(6 DOWNTO 0);  -- ufix1 [7]
  SIGNAL serializer_PostProcessed         : std_logic;  -- ufix1
  SIGNAL Delay_out1                       : std_logic;  -- ufix1
  SIGNAL Delay7_out1                      : std_logic;  -- ufix1
  SIGNAL p_scrambler_out1                 : std_logic;
  SIGNAL p_scrambler_out2_start           : std_logic;
  SIGNAL p_scrambler_out2_end             : std_logic;
  SIGNAL p_scrambler_out2_valid           : std_logic;
  SIGNAL dataOut                          : std_logic;
  SIGNAL ctrl_in_start                    : std_logic;
  SIGNAL ctrl_in_end                      : std_logic;
  SIGNAL ctrl_in_valid                    : std_logic;
  SIGNAL bits_per_subcarrier_unsigned     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Delay6_out1                      : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL len_in_ofdm_symbols_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Delay10_out1                     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL end_rsvd_1                       : std_logic;
  SIGNAL tone_mapping_out1                : std_logic;
  SIGNAL tone_mapping_out2_start          : std_logic;
  SIGNAL tone_mapping_out2_end            : std_logic;
  SIGNAL tone_mapping_out2_valid          : std_logic;
  SIGNAL NOT_out1                         : std_logic;
  SIGNAL Delay12_out1                     : std_logic;

BEGIN
  u_batid_to_bits_per_subcarrier : IEEE_8021513_TX_src_batid_to_bits_per_subcarrier
    PORT MAP( bat_id => bat_id,  -- boolean [5]
              bits_per_subcarrier => bits_per_subcarrier_1  -- ufix4
              );

  u_psdu_size_to_payload_length : IEEE_8021513_TX_src_psdu_size_to_payload_length
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              bits_per_subcarrier => bits_per_subcarrier_1,  -- ufix4
              psdu_size => psdu_size,  -- boolean [24]
              payload_len_in_ofdm_symbols => len_in_ofdm_symbols_1,  -- uint16
              payload_len_in_words => len_in_words  -- ufix24
              );

  u_valid_to_ctrl : IEEE_8021513_TX_src_valid_to_ctrl_block1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              validIn => Serializer1D_out2,
              ctrlOut_start => valid_to_ctrl_out1_start,
              ctrlOut_end => valid_to_ctrl_out1_end,
              ctrlOut_valid => valid_to_ctrl_out1_valid
              );

  u_HDL_FIFO : IEEE_8021513_TX_src_HDL_FIFO
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_8_1 => enb_1_8_1,
              enb_1_1_1 => enb_1_1_1,
              In_rsvd => std_logic_vector(Delay4_out1),  -- uint8
              Push => Delay3_out1,
              Pop => pop,
              Out_rsvd => HDL_FIFO_out1,  -- uint8
              Full => HDL_FIFO_out2
              );

  u_rising_edge_detector : IEEE_8021513_TX_src_rising_edge_detector_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => Relational_Operator_out1,
              Out_rsvd => last_frame
              );

  u_next_frame_to_ready : IEEE_8021513_TX_src_next_frame_to_ready
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              next_frame => Delay11_out1,
              ready => ready_1
              );

  u_p_scrambler : IEEE_8021513_TX_src_p_scrambler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => Delay7_out1,  -- ufix1
              ctrl_in_start => Delay8_out1_start,
              ctrl_in_end => Delay8_out1_end,
              ctrl_in_valid => Delay8_out1_valid,
              SI => Delay9_out1,  -- boolean [4]
              data_out => p_scrambler_out1,
              ctrl_out_start => p_scrambler_out2_start,
              ctrl_out_end => p_scrambler_out2_end,
              ctrl_out_valid => p_scrambler_out2_valid
              );

  u_reduced_ldpc : IEEE_8021513_TX_src_reduced_ldpc
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => p_scrambler_out1,
              ctrl_in_start => p_scrambler_out2_start,
              ctrl_in_end => p_scrambler_out2_end,
              ctrl_in_valid => p_scrambler_out2_valid,
              data_out => dataOut,
              ctrl_out_start => ctrl_in_start,
              ctrl_out_end => ctrl_in_end,
              ctrl_out_valid => ctrl_in_valid,
              next_frame => reduced_ldpc_out3
              );

  u_tone_mapping : IEEE_8021513_TX_src_tone_mapping
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => dataOut,
              ctrl_in_start => ctrl_in_start,
              ctrl_in_end => ctrl_in_end,
              ctrl_in_valid => ctrl_in_valid,
              bits_per_subcarrier => std_logic_vector(Delay6_out1),  -- ufix4
              len_in_ofdm_symbols => std_logic_vector(Delay10_out1),  -- uint16
              new_frame => end_rsvd_1,
              data_out => tone_mapping_out1,
              ctrl_out_start => tone_mapping_out2_start,
              ctrl_out_end => tone_mapping_out2_end,
              ctrl_out_valid => tone_mapping_out2_valid
              );

  end_rsvd <= new_frame;

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  count_step <= to_unsigned(1, 32);

  count_reset <= to_unsigned(0, 32);

  len_in_words_unsigned <= unsigned(len_in_words);

  Bit_Shift_out1 <= len_in_words_unsigned sll 3;

  data_in_unsigned <= unsigned(data_in);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        Delay4_out1 <= data_in_unsigned;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1 <= valid_in;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Delay9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_out1 <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay9_out1 <= scrambler_init;
      END IF;
    END IF;
  END PROCESS Delay9_process;


  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1_valid <= '0';
      ELSIF enb = '1' THEN
        Delay8_out1_valid <= valid_to_ctrl_out1_valid;
      END IF;
    END IF;
  END PROCESS c_process;


  c_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1_end <= '0';
      ELSIF enb = '1' THEN
        Delay8_out1_end <= valid_to_ctrl_out1_end;
      END IF;
    END IF;
  END PROCESS c_1_process;


  c_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1_start <= '0';
      ELSIF enb = '1' THEN
        Delay8_out1_start <= valid_to_ctrl_out1_start;
      END IF;
    END IF;
  END PROCESS c_2_process;


  y_8 <= HDL_FIFO_out1_unsigned(7);

  y_7 <= HDL_FIFO_out1_unsigned(6);

  y_6 <= HDL_FIFO_out1_unsigned(5);

  y_5 <= HDL_FIFO_out1_unsigned(4);

  y_4 <= HDL_FIFO_out1_unsigned(3);

  y_3 <= HDL_FIFO_out1_unsigned(2);

  y_2 <= HDL_FIFO_out1_unsigned(1);

  HDL_FIFO_out1_unsigned <= unsigned(HDL_FIFO_out1);

  y_1 <= HDL_FIFO_out1_unsigned(0);

  y(0) <= y_1;
  y(1) <= y_2;
  y(2) <= y_3;
  y(3) <= y_4;
  y(4) <= y_5;
  y(5) <= y_6;
  y(6) <= y_7;
  y(7) <= y_8;

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= (OTHERS => '0');
      ELSIF enb_1_8_0 = '1' THEN
        Delay5_out1 <= y;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  serial_in_1 <= Delay5_out1;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1 <= reduced_ldpc_out3;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Unit_Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay1_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  count <= counter + count_step;

  
  count_1 <= counter WHEN Serializer1D_out2 = '0' ELSE
      count;

  
  count_2 <= count_1 WHEN end_rsvd = '0' ELSE
      count_reset;

  HDL_Counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        counter <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        counter <= count_2;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  Relational_Operator_out1 <= '1' WHEN counter >= resize(Bit_Shift_out1, 32) ELSE
      '0';

  Logical_Operator5_out1 <= new_frame OR last_frame;

  
  Switch1_out1 <= Unit_Delay1_out1 WHEN Logical_Operator5_out1 = '0' ELSE
      new_frame;

  Logical_Operator_out1 <= Switch1_out1 AND Delay1_out1;

  Rate_Transition1_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Rate_Transition1_out1 <= '0';
      ELSIF enb_1_8_1 = '1' THEN
        Rate_Transition1_out1 <= Logical_Operator_out1;
      END IF;
    END IF;
  END PROCESS Rate_Transition1_output_process;


  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Delay11_out1 <= Rate_Transition1_out1;
      END IF;
    END IF;
  END PROCESS Delay11_process;


  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_reg <= (OTHERS => '0');
      ELSIF enb_1_8_0 = '1' THEN
        Delay13_reg(0) <= ready_1;
        Delay13_reg(7 DOWNTO 1) <= Delay13_reg(6 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay13_process;

  pop <= Delay13_reg(7);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Delay14_out1 <= pop;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb_1_8_0 = '1' THEN
        Delay2_out1 <= Delay14_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  control_in_2 <= Delay2_out1;

  Serializer1D_contl_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Serializer1D_contl_cnt <= to_unsigned(16#0#, 3);
      ELSIF enb = '1' THEN
        IF Serializer1D_contl_cnt = to_unsigned(16#7#, 3) THEN 
          Serializer1D_contl_cnt <= to_unsigned(16#0#, 3);
        ELSE 
          Serializer1D_contl_cnt <= Serializer1D_contl_cnt + to_unsigned(16#1#, 3);
        END IF;
      END IF;
    END IF;
  END PROCESS Serializer1D_contl_process;

  Serializer1D_out2 <= control_in_2;
  
  Serializer1D_invldSignal <= '1' WHEN Serializer1D_contl_cnt = to_unsigned(16#0#, 3) ELSE
      '0';

  Serializer1D_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Serializer1D_data <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Serializer1D_data <= Serializer1D_data_next;
      END IF;
    END IF;
  END PROCESS Serializer1D_process;

  Serializer1D_output : PROCESS (Serializer1D_data, Serializer1D_invldSignal, serial_in_1)
  BEGIN
    Serializer1D_data_next <= Serializer1D_data;
    IF Serializer1D_invldSignal /= '0' THEN 
      serializer_PostProcessed <= serial_in_1(0);
    ELSE 
      serializer_PostProcessed <= Serializer1D_data(0);
    END IF;
    IF Serializer1D_invldSignal /= '0' THEN 
      Serializer1D_data_next(6 DOWNTO 0) <= serial_in_1(7 DOWNTO 1);
    ELSE 
      Serializer1D_data_next(5 DOWNTO 0) <= Serializer1D_data(6 DOWNTO 1);
      Serializer1D_data_next(6) <= serial_in_1(7);
    END IF;
  END PROCESS Serializer1D_output;


  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay_out1 <= serializer_PostProcessed;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay7_out1 <= Delay_out1;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  bits_per_subcarrier_unsigned <= unsigned(bits_per_subcarrier_1);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1 <= to_unsigned(16#0#, 4);
      ELSIF enb = '1' THEN
        Delay6_out1 <= bits_per_subcarrier_unsigned;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  len_in_ofdm_symbols_unsigned <= unsigned(len_in_ofdm_symbols_1);

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_out1 <= to_unsigned(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay10_out1 <= len_in_ofdm_symbols_unsigned;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  end_rsvd_1 <= new_frame;

  NOT_out1 <=  NOT HDL_FIFO_out2;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay12_out1 <= NOT_out1;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  len_in_ofdm_symbols <= std_logic_vector(Delay10_out1);

  bits_per_subcarrier <= std_logic_vector(Delay6_out1);

  payload <= tone_mapping_out1;

  ctrl_out_start <= tone_mapping_out2_start;

  ctrl_out_end <= tone_mapping_out2_end;

  ctrl_out_valid <= tone_mapping_out2_valid;

  ready <= Delay12_out1;

END rtl;

