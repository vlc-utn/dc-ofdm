-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_header_full.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_header_full
-- Source Path: HDLTx/full_tx/header_full
-- Hierarchy Level: 1
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_header_full IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_8_0                         :   IN    std_logic;
        enb_1_8_1                         :   IN    std_logic;
        new_frame                         :   IN    std_logic;
        psdu_size                         :   IN    std_logic_vector(23 DOWNTO 0);  -- boolean [24]
        msg_duration                      :   IN    std_logic_vector(15 DOWNTO 0);  -- boolean [16]
        block_size                        :   IN    std_logic_vector(1 DOWNTO 0);  -- boolean [2]
        fec_rate                          :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        rep_number                        :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        concat_factor                     :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        scrambler_init                    :   IN    std_logic_vector(3 DOWNTO 0);  -- boolean [4]
        bat_id                            :   IN    std_logic_vector(4 DOWNTO 0);  -- boolean [5]
        cp_id                             :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        mimo_spacing                      :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        mimo_number                       :   IN    std_logic_vector(2 DOWNTO 0);  -- boolean [3]
        header                            :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic
        );
END IEEE_8021513_TX_src_header_full;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_header_full IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_h_gen
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          enb_1_8_1                       :   IN    std_logic;
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
          data_out                        :   OUT   std_logic;
          ctrl_out_start                  :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_h_crc
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
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_h_scrambler
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
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_header_fec
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    std_logic;
          ctrl_in_start                   :   IN    std_logic;
          ctrl_in_end                     :   IN    std_logic;
          ctrl_in_valid                   :   IN    std_logic;
          data_out                        :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_h_repetition
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          data_in                         :   IN    std_logic;
          ctrl_in_end                     :   IN    std_logic;
          ctrl_in_valid                   :   IN    std_logic;
          data_out                        :   OUT   std_logic;
          ctrl_out_end                    :   OUT   std_logic;
          ctrl_out_valid                  :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_h_gen
    USE ENTITY work.IEEE_8021513_TX_src_h_gen(rtl);

  FOR ALL : IEEE_8021513_TX_src_h_crc
    USE ENTITY work.IEEE_8021513_TX_src_h_crc(rtl);

  FOR ALL : IEEE_8021513_TX_src_h_scrambler
    USE ENTITY work.IEEE_8021513_TX_src_h_scrambler(rtl);

  FOR ALL : IEEE_8021513_TX_src_header_fec
    USE ENTITY work.IEEE_8021513_TX_src_header_fec(rtl);

  FOR ALL : IEEE_8021513_TX_src_h_repetition
    USE ENTITY work.IEEE_8021513_TX_src_h_repetition(rtl);

  -- Signals
  SIGNAL h_gen_out1                       : std_logic;
  SIGNAL h_gen_out2_start                 : std_logic;
  SIGNAL h_gen_out2_end                   : std_logic;
  SIGNAL h_gen_out2_valid                 : std_logic;
  SIGNAL h_crc_out1                       : std_logic;
  SIGNAL h_crc_out2_start                 : std_logic;
  SIGNAL h_crc_out2_end                   : std_logic;
  SIGNAL h_crc_out2_valid                 : std_logic;
  SIGNAL h_scrambler_out1                 : std_logic;
  SIGNAL h_scrambler_out2_start           : std_logic;
  SIGNAL h_scrambler_out2_end             : std_logic;
  SIGNAL h_scrambler_out2_valid           : std_logic;
  SIGNAL dataOut                          : std_logic;
  SIGNAL header_fec_out2_end              : std_logic;
  SIGNAL header_fec_out2_valid            : std_logic;
  SIGNAL h_repetition_out1                : std_logic;
  SIGNAL h_repetition_out2_end            : std_logic;
  SIGNAL h_repetition_out2_valid          : std_logic;

BEGIN
  u_h_gen : IEEE_8021513_TX_src_h_gen
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              enb_1_8_0 => enb_1_8_0,
              enb_1_8_1 => enb_1_8_1,
              new_frame => new_frame,
              psdu_size => psdu_size,  -- boolean [24]
              msg_duration => msg_duration,  -- boolean [16]
              block_size => block_size,  -- boolean [2]
              fec_rate => fec_rate,  -- boolean [3]
              rep_number => rep_number,  -- boolean [3]
              concat_factor => concat_factor,  -- boolean [3]
              scrambler_init => scrambler_init,  -- boolean [4]
              bat_id => bat_id,  -- boolean [5]
              cp_id => cp_id,  -- boolean [3]
              mimo_spacing => mimo_spacing,  -- boolean [3]
              mimo_number => mimo_number,  -- boolean [3]
              data_out => h_gen_out1,
              ctrl_out_start => h_gen_out2_start,
              ctrl_out_end => h_gen_out2_end,
              ctrl_out_valid => h_gen_out2_valid
              );

  u_h_crc : IEEE_8021513_TX_src_h_crc
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => h_gen_out1,
              ctrl_in_start => h_gen_out2_start,
              ctrl_in_end => h_gen_out2_end,
              ctrl_in_valid => h_gen_out2_valid,
              data_out => h_crc_out1,
              ctrl_out_start => h_crc_out2_start,
              ctrl_out_end => h_crc_out2_end,
              ctrl_out_valid => h_crc_out2_valid
              );

  u_h_scrambler : IEEE_8021513_TX_src_h_scrambler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => h_crc_out1,
              ctrl_in_start => h_crc_out2_start,
              ctrl_in_end => h_crc_out2_end,
              ctrl_in_valid => h_crc_out2_valid,
              data_out => h_scrambler_out1,
              ctrl_out_start => h_scrambler_out2_start,
              ctrl_out_end => h_scrambler_out2_end,
              ctrl_out_valid => h_scrambler_out2_valid
              );

  u_header_fec : IEEE_8021513_TX_src_header_fec
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => h_scrambler_out1,
              ctrl_in_start => h_scrambler_out2_start,
              ctrl_in_end => h_scrambler_out2_end,
              ctrl_in_valid => h_scrambler_out2_valid,
              data_out => dataOut,
              ctrl_out_end => header_fec_out2_end,
              ctrl_out_valid => header_fec_out2_valid
              );

  u_h_repetition : IEEE_8021513_TX_src_h_repetition
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              data_in => dataOut,
              ctrl_in_end => header_fec_out2_end,
              ctrl_in_valid => header_fec_out2_valid,
              data_out => h_repetition_out1,
              ctrl_out_end => h_repetition_out2_end,
              ctrl_out_valid => h_repetition_out2_valid
              );

  header <= h_repetition_out1;

  ctrl_out_end <= h_repetition_out2_end;

  ctrl_out_valid <= h_repetition_out2_valid;

END rtl;

