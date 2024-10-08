-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_raw_src_enabled_qam_and_scrambler.vhd
-- Created: 2024-08-31 20:20:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_raw_src_enabled_qam_and_scrambler
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/enabled_qam_and_scrambler
-- Hierarchy Level: 2
-- Model version: 4.99
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_tx_raw_src_full_tx_pac.ALL;

ENTITY full_tx_raw_src_enabled_qam_and_scrambler IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        valid_in                          :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        init                              :   IN    std_logic_vector(12 DOWNTO 0);  -- boolean [13]
        new_rsvd                          :   IN    std_logic;
        cp_len                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        s2_in                             :   IN    std_logic;
        s1_in                             :   IN    std_logic;
        Enable                            :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_out                         :   OUT   std_logic;
        cp_len_out                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- uint8
        valid_scrambler                   :   OUT   std_logic;
        init_out                          :   OUT   std_logic_vector(12 DOWNTO 0);  -- boolean [13]
        new_out                           :   OUT   std_logic
        );
END full_tx_raw_src_enabled_qam_and_scrambler;


ARCHITECTURE rtl OF full_tx_raw_src_enabled_qam_and_scrambler IS

  -- Component Declarations
  COMPONENT full_tx_raw_src_qam_mod
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          valid_in                        :   IN    std_logic;
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          ready_out                       :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_out_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_tx_raw_src_constellation_scrambler
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_in                        :   IN    std_logic;
          s1_in                           :   IN    std_logic;
          s2_in                           :   IN    std_logic;
          ready_out                       :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_out_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_tx_raw_src_qam_mod
    USE ENTITY work.full_tx_raw_src_qam_mod(rtl);

  FOR ALL : full_tx_raw_src_constellation_scrambler
    USE ENTITY work.full_tx_raw_src_constellation_scrambler(rtl);

  -- Signals
  SIGNAL ready_out                        : std_logic;
  SIGNAL qam_mod_out1_re                  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL qam_mod_out1_im                  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL qam_mod_out2                     : std_logic;
  SIGNAL out_new_re                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL out_new_im                       : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL constellation_scrambler_out2     : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL cp_len_unsigned                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL enb_1_2_0_gated_1                : std_logic;
  SIGNAL Delay2_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay3_reg                       : vector_of_unsigned8(0 TO 2);  -- ufix8 [3]
  SIGNAL Delay3_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay3_out1_1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay3_out1_last_value           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL enb_1_2_0_gated_2                : std_logic;
  SIGNAL Delay_out1                       : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL Delay_out1_1                     : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL Delay_out1_last_value            : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL enb_1_2_0_gated_3                : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL Delay1_out1_1                    : std_logic;
  SIGNAL Delay1_out1_last_value           : std_logic;

BEGIN

  u_qam_mod : full_tx_raw_src_qam_mod
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in => data_in,  -- ufix12
              valid_in => valid_in,
              bits_per_subcarrier => bits_per_subcarrier,  -- ufix4
              ready_out => ready_out,
              data_out_re => qam_mod_out1_re,  -- sfix16_En14
              data_out_im => qam_mod_out1_im,  -- sfix16_En14
              valid_out => qam_mod_out2
              );

  u_constellation_scrambler : full_tx_raw_src_constellation_scrambler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => qam_mod_out1_re,  -- sfix16_En14
              data_in_im => qam_mod_out1_im,  -- sfix16_En14
              valid_in => qam_mod_out2,
              s1_in => s1_in,
              s2_in => s2_in,
              ready_out => ready_out,
              data_out_re => out_new_re,  -- sfix16_En14
              data_out_im => out_new_im,  -- sfix16_En14
              valid_out => constellation_scrambler_out2
              );

  ready_out <= Enable;

  enb_1_2_0_gated <= ready_out AND enb_1_2_0;

  cp_len_unsigned <= unsigned(cp_len);

  enb_1_2_0_gated_1 <= ready_out AND enb_1_2_0;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated_1 = '1' THEN
        Delay2_out1 <= cp_len_unsigned;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_reg <= (OTHERS => to_unsigned(16#00#, 8));
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay3_reg(0) <= Delay2_out1;
        Delay3_reg(1 TO 2) <= Delay3_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1 <= Delay3_reg(2);

  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1_last_value <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay3_out1_last_value <= Delay3_out1_1;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  Delay3_out1_1 <= Delay3_out1_last_value WHEN ready_out = '0' ELSE
      Delay3_out1;

  cp_len_out <= std_logic_vector(Delay3_out1_1);

  enb_1_2_0_gated_2 <= ready_out AND enb_1_2_0;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= (OTHERS => '0');
      ELSIF enb_1_2_0_gated_2 = '1' THEN
        Delay_out1 <= init;
      END IF;
    END IF;
  END PROCESS Delay_process;


  out0_bypass_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_last_value <= (OTHERS => '0');
      ELSIF enb_1_2_0_gated_2 = '1' THEN
        Delay_out1_last_value <= Delay_out1_1;
      END IF;
    END IF;
  END PROCESS out0_bypass_1_process;


  
  Delay_out1_1 <= Delay_out1_last_value WHEN ready_out = '0' ELSE
      Delay_out1;

  enb_1_2_0_gated_3 <= ready_out AND enb_1_2_0;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_2_0_gated_3 = '1' THEN
        Delay1_out1 <= new_rsvd;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  out0_bypass_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_last_value <= '0';
      ELSIF enb_1_2_0_gated_3 = '1' THEN
        Delay1_out1_last_value <= Delay1_out1_1;
      END IF;
    END IF;
  END PROCESS out0_bypass_2_process;


  
  Delay1_out1_1 <= Delay1_out1_last_value WHEN ready_out = '0' ELSE
      Delay1_out1;

  data_out_re <= out_new_re;

  data_out_im <= out_new_im;

  valid_out <= constellation_scrambler_out2;

  valid_scrambler <= qam_mod_out2;

  init_out <= Delay_out1_1;

  new_out <= Delay1_out1_1;

END rtl;

