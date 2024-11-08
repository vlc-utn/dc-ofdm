-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_channel_estimation_and_equalization.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_channel_estimation_and_equalization
-- Source Path: HDLRxDemodulator/rx_demodulator_full/channel_estimation_and_equalization
-- Hierarchy Level: 1
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_ip_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_ip_src_channel_estimation_and_equalization IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_data                        :   IN    std_logic;
        valid_channel                     :   IN    std_logic;
        dont_use_equalizer                :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_out                         :   OUT   std_logic
        );
END rx_demod_ip_src_channel_estimation_and_equalization;


ARCHITECTURE rtl OF rx_demod_ip_src_channel_estimation_and_equalization IS

  -- Component Declarations
  COMPONENT rx_demod_ip_src_Channel_Estimation
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_in                        :   IN    std_logic;
          reset                           :   IN    std_logic;
          channel_estimate_re             :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          channel_estimate_im             :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_estimate                  :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_Channel_Equalization
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_in_im                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_data                      :   IN    std_logic;
          channel_estimate_in_re          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          channel_estimate_in_im          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_channel_estimate          :   IN    std_logic;
          dont_use_equalizer              :   IN    std_logic;
          reset                           :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_out_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_ip_src_Channel_Estimation
    USE ENTITY work.rx_demod_ip_src_Channel_Estimation(rtl);

  FOR ALL : rx_demod_ip_src_Channel_Equalization
    USE ENTITY work.rx_demod_ip_src_Channel_Equalization(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rd_0_reg_re                      : vector_of_signed16(0 TO 3);  -- sfix16_En14 [4]
  SIGNAL rd_0_reg_im                      : vector_of_signed16(0 TO 3);  -- sfix16_En14 [4]
  SIGNAL data_in_re_1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_im_1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_re_2                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_im_2                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channelEstimates_re              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL channelEstimates_im              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL channelEstimatesValid            : std_logic;
  SIGNAL channelEstimates_re_signed       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channelEstimates_im_signed       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channelEstimates_re_1            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channelEstimates_im_1            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channelEstimatesValid_1          : std_logic;
  SIGNAL Channel_Equalization_out1_re     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Channel_Equalization_out1_im     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Channel_Equalization_out2        : std_logic;
  SIGNAL Channel_Equalization_out1_re_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Channel_Equalization_out1_im_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Channel_Equalization_out1_re_1   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Channel_Equalization_out1_im_1   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Channel_Equalization_out2_1      : std_logic;

BEGIN
  -- Stores the estimate from Channel Estimation subsystem for each frame and perform channel equalization.
  -- Estimates the channel frequency response for each frame.

  u_Channel_Estimation : rx_demod_ip_src_Channel_Estimation
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              data_in_re => std_logic_vector(data_in_re_2),  -- sfix16_En14
              data_in_im => std_logic_vector(data_in_im_2),  -- sfix16_En14
              valid_in => valid_channel,
              reset => reset,
              channel_estimate_re => channelEstimates_re,  -- sfix16_En14
              channel_estimate_im => channelEstimates_im,  -- sfix16_En14
              valid_estimate => channelEstimatesValid
              );

  u_Channel_Equalization : rx_demod_ip_src_Channel_Equalization
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              data_in_re => std_logic_vector(data_in_re_1),  -- sfix16_En14
              data_in_im => std_logic_vector(data_in_im_1),  -- sfix16_En14
              valid_data => valid_data,
              channel_estimate_in_re => std_logic_vector(channelEstimates_re_1),  -- sfix16_En14
              channel_estimate_in_im => std_logic_vector(channelEstimates_im_1),  -- sfix16_En14
              valid_channel_estimate => channelEstimatesValid_1,
              dont_use_equalizer => dont_use_equalizer,
              reset => reset,
              data_out_re => Channel_Equalization_out1_re,  -- sfix16_En14
              data_out_im => Channel_Equalization_out1_im,  -- sfix16_En14
              valid_out => Channel_Equalization_out2
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_0_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        rd_0_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        rd_0_reg_im(0) <= data_in_im_signed;
        rd_0_reg_im(1 TO 3) <= rd_0_reg_im(0 TO 2);
        rd_0_reg_re(0) <= data_in_re_signed;
        rd_0_reg_re(1 TO 3) <= rd_0_reg_re(0 TO 2);
      END IF;
    END IF;
  END PROCESS rd_0_process;

  data_in_re_1 <= rd_0_reg_re(3);
  data_in_im_1 <= rd_0_reg_im(3);

  rd_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        data_in_re_2 <= to_signed(16#0000#, 16);
        data_in_im_2 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        data_in_re_2 <= data_in_re_signed;
        data_in_im_2 <= data_in_im_signed;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  channelEstimates_re_signed <= signed(channelEstimates_re);

  channelEstimates_im_signed <= signed(channelEstimates_im);

  rd_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        channelEstimates_re_1 <= to_signed(16#0000#, 16);
        channelEstimates_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        channelEstimates_re_1 <= channelEstimates_re_signed;
        channelEstimates_im_1 <= channelEstimates_im_signed;
      END IF;
    END IF;
  END PROCESS rd_2_process;


  rd_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        channelEstimatesValid_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        channelEstimatesValid_1 <= channelEstimatesValid;
      END IF;
    END IF;
  END PROCESS rd_3_process;


  Channel_Equalization_out1_re_signed <= signed(Channel_Equalization_out1_re);

  Channel_Equalization_out1_im_signed <= signed(Channel_Equalization_out1_im);

  rd_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Channel_Equalization_out1_re_1 <= to_signed(16#0000#, 16);
        Channel_Equalization_out1_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        Channel_Equalization_out1_re_1 <= Channel_Equalization_out1_re_signed;
        Channel_Equalization_out1_im_1 <= Channel_Equalization_out1_im_signed;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  data_out_re <= std_logic_vector(Channel_Equalization_out1_re_1);

  data_out_im <= std_logic_vector(Channel_Equalization_out1_im_1);

  rd_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Channel_Equalization_out2_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Channel_Equalization_out2_1 <= Channel_Equalization_out2;
      END IF;
    END IF;
  END PROCESS rd_5_process;


  valid_out <= Channel_Equalization_out2_1;

END rtl;

