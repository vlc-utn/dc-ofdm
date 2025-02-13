-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip.vhd
-- Created: 2024-09-01 12:13:21
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Model base rate: -1
-- Target subsystem base rate: -1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip
-- Source Path: full_ofdm_modulator_ip
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_ofdm_modulator_ip IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        valid_in                          :   IN    std_logic;  -- ufix1
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        init                              :   IN    std_logic_vector(12 DOWNTO 0);  -- ufix13
        new_ofdm_sym                      :   IN    std_logic;  -- ufix1
        cp_len                            :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
        data_out                          :   OUT   std_logic_vector(11 DOWNTO 0);  -- ufix12
        valid_out                         :   OUT   std_logic;  -- ufix1
        ready                             :   OUT   std_logic  -- ufix1
        );
END full_ofdm_modulator_ip;


ARCHITECTURE rtl OF full_ofdm_modulator_ip IS

  -- Component Declarations
  COMPONENT full_ofdm_modulator_ip_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_ofdm_modulator_ip_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          data_in                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          valid_in                        :   IN    std_logic;  -- ufix1
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          init_0                          :   IN    std_logic;  -- ufix1
          init_1                          :   IN    std_logic;  -- ufix1
          init_2                          :   IN    std_logic;  -- ufix1
          init_3                          :   IN    std_logic;  -- ufix1
          init_4                          :   IN    std_logic;  -- ufix1
          init_5                          :   IN    std_logic;  -- ufix1
          init_6                          :   IN    std_logic;  -- ufix1
          init_7                          :   IN    std_logic;  -- ufix1
          init_8                          :   IN    std_logic;  -- ufix1
          init_9                          :   IN    std_logic;  -- ufix1
          init_10                         :   IN    std_logic;  -- ufix1
          init_11                         :   IN    std_logic;  -- ufix1
          init_12                         :   IN    std_logic;  -- ufix1
          new_ofdm_sym                    :   IN    std_logic;  -- ufix1
          cp_len                          :   IN    std_logic_vector(7 DOWNTO 0);  -- ufix8
          ce_out_0                        :   OUT   std_logic;  -- ufix1
          ce_out_1                        :   OUT   std_logic;  -- ufix1
          data_out                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_out                       :   OUT   std_logic;  -- ufix1
          ready                           :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_ofdm_modulator_ip_reset_sync
    USE ENTITY work.full_ofdm_modulator_ip_reset_sync(rtl);

  FOR ALL : full_ofdm_modulator_ip_dut
    USE ENTITY work.full_ofdm_modulator_ip_dut(rtl);

  -- Signals
  SIGNAL reset_x                          : std_logic;
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL init_unsigned                    : unsigned(12 DOWNTO 0);  -- ufix13
  SIGNAL init_slice                       : std_logic;  -- ufix1
  SIGNAL init_slice_1                     : std_logic;  -- ufix1
  SIGNAL init_slice_2                     : std_logic;  -- ufix1
  SIGNAL init_slice_3                     : std_logic;  -- ufix1
  SIGNAL init_slice_4                     : std_logic;  -- ufix1
  SIGNAL init_slice_5                     : std_logic;  -- ufix1
  SIGNAL init_slice_6                     : std_logic;  -- ufix1
  SIGNAL init_slice_7                     : std_logic;  -- ufix1
  SIGNAL init_slice_8                     : std_logic;  -- ufix1
  SIGNAL init_slice_9                     : std_logic;  -- ufix1
  SIGNAL init_slice_10                    : std_logic;  -- ufix1
  SIGNAL init_slice_11                    : std_logic;  -- ufix1
  SIGNAL init_slice_12                    : std_logic;  -- ufix1
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL ce_out_0_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_1_sig                     : std_logic;  -- ufix1
  SIGNAL data_out_sig                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL valid_out_sig                    : std_logic;  -- ufix1
  SIGNAL ready_sig                        : std_logic;  -- ufix1
  SIGNAL data_out_sig_signed              : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL data_out_tmp                     : unsigned(11 DOWNTO 0);  -- ufix12

BEGIN
  u_full_ofdm_modulator_ip_reset_sync_inst : full_ofdm_modulator_ip_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_cm,  -- ufix1
              reset_out => reset_x
              );

  u_full_ofdm_modulator_ip_dut_inst : full_ofdm_modulator_ip_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              dut_enable => dut_enable,  -- ufix1
              data_in => data_in,  -- ufix12
              valid_in => valid_in,  -- ufix1
              bits_per_subcarrier => bits_per_subcarrier,  -- ufix4
              init_0 => init_slice,  -- ufix1
              init_1 => init_slice_1,  -- ufix1
              init_2 => init_slice_2,  -- ufix1
              init_3 => init_slice_3,  -- ufix1
              init_4 => init_slice_4,  -- ufix1
              init_5 => init_slice_5,  -- ufix1
              init_6 => init_slice_6,  -- ufix1
              init_7 => init_slice_7,  -- ufix1
              init_8 => init_slice_8,  -- ufix1
              init_9 => init_slice_9,  -- ufix1
              init_10 => init_slice_10,  -- ufix1
              init_11 => init_slice_11,  -- ufix1
              init_12 => init_slice_12,  -- ufix1
              new_ofdm_sym => new_ofdm_sym,  -- ufix1
              cp_len => cp_len,  -- ufix8
              ce_out_0 => ce_out_0_sig,  -- ufix1
              ce_out_1 => ce_out_1_sig,  -- ufix1
              data_out => data_out_sig,  -- sfix12_En10
              valid_out => valid_out_sig,  -- ufix1
              ready => ready_sig  -- ufix1
              );

  dut_enable <= '1';

  init_unsigned <= unsigned(init);

  init_slice <= init_unsigned(0);

  init_slice_1 <= init_unsigned(1);

  init_slice_2 <= init_unsigned(2);

  init_slice_3 <= init_unsigned(3);

  init_slice_4 <= init_unsigned(4);

  init_slice_5 <= init_unsigned(5);

  init_slice_6 <= init_unsigned(6);

  init_slice_7 <= init_unsigned(7);

  init_slice_8 <= init_unsigned(8);

  init_slice_9 <= init_unsigned(9);

  init_slice_10 <= init_unsigned(10);

  init_slice_11 <= init_unsigned(11);

  init_slice_12 <= init_unsigned(12);

  reset_cm <=  NOT IPCORE_RESETN;

  data_out_sig_signed <= signed(data_out_sig);

  data_out_tmp <= unsigned(data_out_sig_signed);

  data_out <= std_logic_vector(data_out_tmp);

  valid_out <= valid_out_sig;

  ready <= ready_sig;

END rtl;

