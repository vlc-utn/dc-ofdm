-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_store_frame_in_ram.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_store_frame_in_ram
-- Source Path: HDLTx/full_tx/store_frame_in_ram
-- Hierarchy Level: 1
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_store_frame_in_ram IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        preamble                          :   IN    std_logic;
        preamble_valid                    :   IN    std_logic;
        channel                           :   IN    std_logic;
        channel_valid                     :   IN    std_logic;
        header                            :   IN    std_logic_vector(1 DOWNTO 0);  -- boolean [2]
        header_valid                      :   IN    std_logic;
        payload                           :   IN    std_logic_vector(1 DOWNTO 0);  -- boolean [2]
        payload_valid                     :   IN    std_logic;
        payload_len                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        cp_len_in                         :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        ready                             :   IN    std_logic;
        data_out                          :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
        valid_out                         :   OUT   std_logic;
        bits_per_subcarrier_out           :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
        init                              :   OUT   std_logic_vector(12 DOWNTO 0);  -- boolean [13]
        new_rsvd                          :   OUT   std_logic;
        cp_len                            :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        new_psdu                          :   OUT   std_logic
        );
END IEEE_8021513_TX_src_store_frame_in_ram;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_store_frame_in_ram IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_write_frame_to_ram
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
          write_data                      :   OUT   std_logic_vector(1 DOWNTO 0);  -- ufix2
          wr_addr                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          we                              :   OUT   std_logic;
          end_rsvd                        :   OUT   std_logic;
          ram_size                        :   OUT   std_logic_vector(24 DOWNTO 0)  -- ufix25
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_read_frame_from_ram
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          start_reading                   :   IN    std_logic;
          ram_size                        :   IN    std_logic_vector(24 DOWNTO 0);  -- ufix25
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          cp_len_in                       :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
          ready                           :   IN    std_logic;
          rd_addr                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- uint16
          valid_out                       :   OUT   std_logic;
          bits_per_subcarrier_out         :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          init                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- boolean [13]
          new_rsvd                        :   OUT   std_logic;
          cp_len                          :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_write_frame_to_ram
    USE ENTITY work.IEEE_8021513_TX_src_write_frame_to_ram(rtl);

  FOR ALL : IEEE_8021513_TX_src_read_frame_from_ram
    USE ENTITY work.IEEE_8021513_TX_src_read_frame_from_ram(rtl);

  FOR ALL : IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block
    USE ENTITY work.IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block(rtl);

  -- Signals
  SIGNAL new_din                          : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL new_wr_addr                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL new_we                           : std_logic;
  SIGNAL write_frame_to_ram_out4          : std_logic;
  SIGNAL write_frame_to_ram_out5          : std_logic_vector(24 DOWNTO 0);  -- ufix25
  SIGNAL new_rd_addr                      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL valid_new                        : std_logic;
  SIGNAL read_frame_from_ram_out3         : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL read_frame_from_ram_out4         : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL new_new                          : std_logic;
  SIGNAL read_frame_from_ram_out6         : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL Simple_Dual_Port_RAM_out1        : std_logic_vector(1 DOWNTO 0);  -- ufix2
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL Delay_out1                       : std_logic;
  SIGNAL read_frame_from_ram_out3_unsigned : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL stateControl_3                   : std_logic;
  SIGNAL stateControl_4                   : std_logic;
  SIGNAL enb_1_2_0_gated_1                : std_logic;
  SIGNAL Delay1_out1                      : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL stateControl_5                   : std_logic;
  SIGNAL stateControl_6                   : std_logic;
  SIGNAL enb_1_2_0_gated_2                : std_logic;
  SIGNAL Delay2_out1                      : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL stateControl_7                   : std_logic;
  SIGNAL stateControl_8                   : std_logic;
  SIGNAL enb_1_2_0_gated_3                : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL read_frame_from_ram_out6_unsigned : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL stateControl_9                   : std_logic;
  SIGNAL stateControl_10                  : std_logic;
  SIGNAL enb_1_2_0_gated_4                : std_logic;
  SIGNAL Delay4_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL stateControl_11                  : std_logic;
  SIGNAL stateControl_12                  : std_logic;
  SIGNAL enb_1_2_0_gated_5                : std_logic;
  SIGNAL Delay6_reg                       : std_logic_vector(3 DOWNTO 0);  -- ufix1 [4]
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL stateControl_13                  : std_logic;
  SIGNAL stateControl_14                  : std_logic;
  SIGNAL enb_1_2_0_gated_6                : std_logic;
  SIGNAL Delay5_out1                      : std_logic;

BEGIN
  u_write_frame_to_ram : IEEE_8021513_TX_src_write_frame_to_ram
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              preamble => preamble,
              preamble_valid => preamble_valid,
              channel => channel,
              channel_valid => channel_valid,
              header => header,  -- boolean [2]
              header_valid => header_valid,
              payload => payload,  -- boolean [2]
              payload_valid => payload_valid,
              payload_len => payload_len,  -- uint16
              write_data => new_din,  -- ufix2
              wr_addr => new_wr_addr,  -- uint16
              we => new_we,
              end_rsvd => write_frame_to_ram_out4,
              ram_size => write_frame_to_ram_out5  -- ufix25
              );

  u_read_frame_from_ram : IEEE_8021513_TX_src_read_frame_from_ram
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              start_reading => write_frame_to_ram_out4,
              ram_size => write_frame_to_ram_out5,  -- ufix25
              bits_per_subcarrier => bits_per_subcarrier,  -- ufix4
              cp_len_in => cp_len_in,  -- boolean [3]
              ready => ready,
              rd_addr => new_rd_addr,  -- uint16
              valid_out => valid_new,
              bits_per_subcarrier_out => read_frame_from_ram_out3,  -- ufix4
              init => read_frame_from_ram_out4,  -- boolean [13]
              new_rsvd => new_new,
              cp_len => read_frame_from_ram_out6  -- uint8
              );

  u_Simple_Dual_Port_RAM : IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 16,
                 DataWidth => 2
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => new_din,
              wr_addr => new_wr_addr,
              wr_en => new_we,
              rd_addr => new_rd_addr,
              dout => Simple_Dual_Port_RAM_out1
              );

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
        Delay_out1 <= '0';
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay_out1 <= valid_new;
      END IF;
    END IF;
  END PROCESS Delay_process;


  read_frame_from_ram_out3_unsigned <= unsigned(read_frame_from_ram_out3);

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
        Delay1_out1 <= to_unsigned(16#0#, 4);
      ELSIF enb_1_2_0_gated_1 = '1' THEN
        Delay1_out1 <= read_frame_from_ram_out3_unsigned;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  bits_per_subcarrier_out <= std_logic_vector(Delay1_out1);

  stateControl_5 <= '1';

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stateControl_6 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        stateControl_6 <= stateControl_5;
      END IF;
    END IF;
  END PROCESS delayMatch2_process;


  enb_1_2_0_gated_2 <= stateControl_6 AND enb_1_2_0;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= (OTHERS => '0');
      ELSIF enb_1_2_0_gated_2 = '1' THEN
        Delay2_out1 <= read_frame_from_ram_out4;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  stateControl_7 <= '1';

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stateControl_8 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        stateControl_8 <= stateControl_7;
      END IF;
    END IF;
  END PROCESS delayMatch3_process;


  enb_1_2_0_gated_3 <= stateControl_8 AND enb_1_2_0;

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb_1_2_0_gated_3 = '1' THEN
        Delay3_out1 <= new_new;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  read_frame_from_ram_out6_unsigned <= unsigned(read_frame_from_ram_out6);

  stateControl_9 <= '1';

  delayMatch4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stateControl_10 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        stateControl_10 <= stateControl_9;
      END IF;
    END IF;
  END PROCESS delayMatch4_process;


  enb_1_2_0_gated_4 <= stateControl_10 AND enb_1_2_0;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated_4 = '1' THEN
        Delay4_out1 <= read_frame_from_ram_out6_unsigned;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  cp_len <= std_logic_vector(Delay4_out1);

  stateControl_11 <= '1';

  delayMatch6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stateControl_12 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        stateControl_12 <= stateControl_11;
      END IF;
    END IF;
  END PROCESS delayMatch6_process;


  enb_1_2_0_gated_5 <= stateControl_12 AND enb_1_2_0;

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0_gated_5 = '1' THEN
        Delay6_reg(0) <= write_frame_to_ram_out4;
        Delay6_reg(3 DOWNTO 1) <= Delay6_reg(2 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1 <= Delay6_reg(3);

  stateControl_13 <= '1';

  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        stateControl_14 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        stateControl_14 <= stateControl_13;
      END IF;
    END IF;
  END PROCESS delayMatch5_process;


  enb_1_2_0_gated_6 <= stateControl_14 AND enb_1_2_0;

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= '0';
      ELSIF enb_1_2_0_gated_6 = '1' THEN
        Delay5_out1 <= Delay6_out1;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  data_out <= Simple_Dual_Port_RAM_out1;

  valid_out <= Delay_out1;

  init <= Delay2_out1;

  new_rsvd <= Delay3_out1;

  new_psdu <= Delay5_out1;

END rtl;

