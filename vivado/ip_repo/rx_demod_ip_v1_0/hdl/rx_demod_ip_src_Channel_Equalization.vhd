-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_Channel_Equalization.vhd
-- Created: 2024-09-22 18:53:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_Channel_Equalization
-- Source Path: HDLRxDemodulator/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization
-- Hierarchy Level: 2
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_ip_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_ip_src_Channel_Equalization IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_data                        :   IN    std_logic;
        channel_estimate_in_re            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        channel_estimate_in_im            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_channel_estimate            :   IN    std_logic;
        dont_use_equalizer                :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_out                         :   OUT   std_logic
        );
END rx_demod_ip_src_Channel_Equalization;


ARCHITECTURE rtl OF rx_demod_ip_src_Channel_Equalization IS

  -- Component Declarations
  COMPONENT rx_demod_ip_src_rising_edge_detector1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_rising_edge_detector
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_SimpleDualPortRAM_generic_block
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din_re                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_din_im                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout_re                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          dout_im                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_OFDM_Equalizer
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          enb                             :   IN    std_logic;
          enb_1_2_1                       :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataIn_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          hEst_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          hEst_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validIn                         :   IN    std_logic;
          hEstLen                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          loadhEst                        :   IN    std_logic;
          reset                           :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dataOut_im                      :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_ip_src_SimpleDualPortRAM_generic_block1
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_ip_src_rising_edge_detector1
    USE ENTITY work.rx_demod_ip_src_rising_edge_detector1(rtl);

  FOR ALL : rx_demod_ip_src_rising_edge_detector
    USE ENTITY work.rx_demod_ip_src_rising_edge_detector(rtl);

  FOR ALL : rx_demod_ip_src_SimpleDualPortRAM_generic_block
    USE ENTITY work.rx_demod_ip_src_SimpleDualPortRAM_generic_block(rtl);

  FOR ALL : rx_demod_ip_src_OFDM_Equalizer
    USE ENTITY work.rx_demod_ip_src_OFDM_Equalizer(rtl);

  FOR ALL : rx_demod_ip_src_SimpleDualPortRAM_generic_block1
    USE ENTITY work.rx_demod_ip_src_SimpleDualPortRAM_generic_block1(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_re_1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_im_1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay6_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay6_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay6_out1_re_1                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay6_out1_im_1                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rd_20_reg_re                     : vector_of_signed16(0 TO 1);  -- sfix16_En14 [2]
  SIGNAL rd_20_reg_im                     : vector_of_signed16(0 TO 1);  -- sfix16_En14 [2]
  SIGNAL Delay6_out1_re_2                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay6_out1_im_2                 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channel_estimate_in_re_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channel_estimate_in_im_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channel_estimate_in_re_1         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL channel_estimate_in_im_1         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL rising_edge_detector1_out1       : std_logic;
  SIGNAL rising_edge_detector1_out1_1     : std_logic;
  SIGNAL valid_channel_estimate_1         : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Delay3_out1_1                    : std_logic;
  SIGNAL count_step                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_from                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rising_edge_detector1_out1_2     : std_logic;
  SIGNAL count_reset                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_reset_1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count                            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_value_1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter_out1_1               : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter_out1_2               : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_1                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_2                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_3                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter_bypass_reg           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL rising_edge_detector_out1        : std_logic;
  SIGNAL rising_edge_detector_out1_1      : std_logic;
  SIGNAL rd_14_reg                        : std_logic_vector(3 DOWNTO 0);  -- ufix1 [4]
  SIGNAL valid_data_1                     : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL Delay4_out1_1                    : std_logic;
  SIGNAL count_step_1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_from_1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rising_edge_detector_out1_2      : std_logic;
  SIGNAL count_reset_2                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_reset_3                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rdAddr                           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_4                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL need_to_wrap_1                   : std_logic;
  SIGNAL count_value_2                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_value_3                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rdAddr_1                         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rdAddr_2                         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_5                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_6                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_7                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter1_bypass_reg          : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL valid_channel_estimate_2         : std_logic;
  SIGNAL rdAddr_3                         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Channel_Estimates_Store_RAM_out1_re : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Channel_Estimates_Store_RAM_out1_im : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL hEst_re                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL hEst_im                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL hEst_re_1                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL hEst_im_1                        : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay28_bypass_reg               : std_logic;  -- ufix1
  SIGNAL Delay4_out1_2                    : std_logic;
  SIGNAL Valid                            : std_logic;
  SIGNAL rd_22_reg                        : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Valid_1                          : std_logic;
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant1_out1                   : std_logic;
  SIGNAL OFDM_Equalizer_out1_re           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL OFDM_Equalizer_out1_im           : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL OFDM_Equalizer_out2              : std_logic;
  SIGNAL OFDM_Equalizer_out1_re_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL OFDM_Equalizer_out1_im_signed    : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL mergedInput                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedDelay_regin                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedDelay_waddr                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL mergedDelay_wrenb                : std_logic;  -- ufix1
  SIGNAL mergedDelay_raddr                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL mergedDelay_regout               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedDelay_regout_unsigned      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedOutput                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL slicedInput                      : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL realOutput                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL slicedInput_1                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL imagOutput                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Switch_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Switch_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN
  u_rising_edge_detector1 : rx_demod_ip_src_rising_edge_detector1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_rsvd => valid_channel_estimate,
              Out_rsvd => rising_edge_detector1_out1
              );

  u_rising_edge_detector : rx_demod_ip_src_rising_edge_detector
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_rsvd => valid_data,
              Out_rsvd => rising_edge_detector_out1
              );

  u_Channel_Estimates_Store_RAM : rx_demod_ip_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 16
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din_re => std_logic_vector(channel_estimate_in_re_1),
              wr_din_im => std_logic_vector(channel_estimate_in_im_1),
              wr_addr => std_logic_vector(HDL_Counter_out1_1),
              wr_en => valid_channel_estimate_2,
              rd_addr => std_logic_vector(rdAddr_3),
              dout_re => Channel_Estimates_Store_RAM_out1_re,
              dout_im => Channel_Estimates_Store_RAM_out1_im
              );

  u_OFDM_Equalizer : rx_demod_ip_src_OFDM_Equalizer
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              enb => enb,
              enb_1_2_1 => enb_1_2_1,
              dataIn_re => std_logic_vector(Delay6_out1_re_2),  -- sfix16_En14
              dataIn_im => std_logic_vector(Delay6_out1_im_2),  -- sfix16_En14
              hEst_re => std_logic_vector(hEst_re_1),  -- sfix16_En14
              hEst_im => std_logic_vector(hEst_im_1),  -- sfix16_En14
              validIn => Valid_1,
              hEstLen => std_logic_vector(Constant_out1),  -- uint8
              loadhEst => Constant1_out1,
              reset => reset,
              dataOut_re => OFDM_Equalizer_out1_re,  -- sfix16_En14
              dataOut_im => OFDM_Equalizer_out1_im,  -- sfix16_En14
              validOut => OFDM_Equalizer_out2
              );

  u_ShiftRegisterRAM : rx_demod_ip_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 7,
                 DataWidth => 32
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => std_logic_vector(mergedDelay_regin),
              wr_addr => std_logic_vector(mergedDelay_waddr),
              wr_en => mergedDelay_wrenb,  -- ufix1
              rd_addr => std_logic_vector(mergedDelay_raddr),
              dout => mergedDelay_regout
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        data_in_re_1 <= to_signed(16#0000#, 16);
        data_in_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        data_in_re_1 <= data_in_re_signed;
        data_in_im_1 <= data_in_im_signed;
      END IF;
    END IF;
  END PROCESS rd_0_process;


  Delay6_out1_re <= data_in_re_1;

  Delay6_out1_im <= data_in_im_1;

  Delay_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1_re_1 <= to_signed(16#0000#, 16);
        Delay6_out1_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_1 = '1' THEN
        Delay6_out1_re_1 <= Delay6_out1_re;
        Delay6_out1_im_1 <= Delay6_out1_im;
      END IF;
    END IF;
  END PROCESS Delay_output_process;


  rd_20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_20_reg_re <= (OTHERS => to_signed(16#0000#, 16));
        rd_20_reg_im <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        rd_20_reg_im(0) <= Delay6_out1_im_1;
        rd_20_reg_im(1) <= rd_20_reg_im(0);
        rd_20_reg_re(0) <= Delay6_out1_re_1;
        rd_20_reg_re(1) <= rd_20_reg_re(0);
      END IF;
    END IF;
  END PROCESS rd_20_process;

  Delay6_out1_re_2 <= rd_20_reg_re(1);
  Delay6_out1_im_2 <= rd_20_reg_im(1);

  channel_estimate_in_re_signed <= signed(channel_estimate_in_re);

  channel_estimate_in_im_signed <= signed(channel_estimate_in_im);

  rd_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        channel_estimate_in_re_1 <= to_signed(16#0000#, 16);
        channel_estimate_in_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        channel_estimate_in_re_1 <= channel_estimate_in_re_signed;
        channel_estimate_in_im_1 <= channel_estimate_in_im_signed;
      END IF;
    END IF;
  END PROCESS rd_2_process;


  rising_edge_detector1_out1_1 <= rising_edge_detector1_out1;

  rd_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        valid_channel_estimate_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        valid_channel_estimate_1 <= valid_channel_estimate;
      END IF;
    END IF;
  END PROCESS rd_5_process;


  Delay3_out1 <= valid_channel_estimate_1;

  rd_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1_1 <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS rd_6_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 204
  count_step <= to_unsigned(16#01#, 8);

  count_from <= to_unsigned(16#00#, 8);

  rd_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rising_edge_detector1_out1_2 <= '0';
      ELSIF enb = '1' THEN
        rising_edge_detector1_out1_2 <= rising_edge_detector1_out1_1;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  count_reset <= to_unsigned(16#00#, 8);

  count_reset_1 <= count_reset;

  count <= HDL_Counter_out1 + count_step;

  
  need_to_wrap <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#CC#, 8) ELSE
      '0';

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  rd_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count_value_1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        count_value_1 <= count_value;
      END IF;
    END IF;
  END PROCESS rd_8_process;


  HDL_Counter_out1 <= HDL_Counter_out1_1;

  rd_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter_out1_2 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        HDL_Counter_out1_2 <= HDL_Counter_out1;
      END IF;
    END IF;
  END PROCESS rd_9_process;


  
  count_1 <= HDL_Counter_out1_2 WHEN Delay3_out1_1 = '0' ELSE
      count_value_1;

  
  count_2 <= count_1 WHEN rising_edge_detector1_out1_2 = '0' ELSE
      count_reset_1;

  rd_10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count_3 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        count_3 <= count_2;
      END IF;
    END IF;
  END PROCESS rd_10_process;


  HDL_Counter_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter_bypass_reg <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_1 = '1' THEN
        HDL_Counter_bypass_reg <= count_3;
      END IF;
    END IF;
  END PROCESS HDL_Counter_bypass_process;

  
  HDL_Counter_out1_1 <= count_3 WHEN enb_1_2_1 = '1' ELSE
      HDL_Counter_bypass_reg;

  rising_edge_detector_out1_1 <= rising_edge_detector_out1;

  rd_14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_14_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        rd_14_reg(0) <= valid_data;
        rd_14_reg(3 DOWNTO 1) <= rd_14_reg(2 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS rd_14_process;

  valid_data_1 <= rd_14_reg(3);

  Delay4_out1 <= valid_data_1;

  rd_15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1_1 <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS rd_15_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 204
  count_step_1 <= to_unsigned(16#01#, 8);

  count_from_1 <= to_unsigned(16#00#, 8);

  rd_13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rising_edge_detector_out1_2 <= '0';
      ELSIF enb = '1' THEN
        rising_edge_detector_out1_2 <= rising_edge_detector_out1_1;
      END IF;
    END IF;
  END PROCESS rd_13_process;


  count_reset_2 <= to_unsigned(16#00#, 8);

  count_reset_3 <= count_reset_2;

  count_4 <= rdAddr + count_step_1;

  
  need_to_wrap_1 <= '1' WHEN rdAddr = to_unsigned(16#CC#, 8) ELSE
      '0';

  
  count_value_2 <= count_4 WHEN need_to_wrap_1 = '0' ELSE
      count_from_1;

  rd_17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count_value_3 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        count_value_3 <= count_value_2;
      END IF;
    END IF;
  END PROCESS rd_17_process;


  rdAddr <= rdAddr_1;

  rd_18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rdAddr_2 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        rdAddr_2 <= rdAddr;
      END IF;
    END IF;
  END PROCESS rd_18_process;


  
  count_5 <= rdAddr_2 WHEN Delay4_out1_1 = '0' ELSE
      count_value_3;

  
  count_6 <= count_5 WHEN rising_edge_detector_out1_2 = '0' ELSE
      count_reset_3;

  rd_19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count_7 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        count_7 <= count_6;
      END IF;
    END IF;
  END PROCESS rd_19_process;


  HDL_Counter1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter1_bypass_reg <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_1 = '1' THEN
        HDL_Counter1_bypass_reg <= count_7;
      END IF;
    END IF;
  END PROCESS HDL_Counter1_bypass_process;

  
  rdAddr_1 <= count_7 WHEN enb_1_2_1 = '1' ELSE
      HDL_Counter1_bypass_reg;

  rd_11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        valid_channel_estimate_2 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        valid_channel_estimate_2 <= valid_channel_estimate;
      END IF;
    END IF;
  END PROCESS rd_11_process;


  rdAddr_3 <= rdAddr_1;

  hEst_re <= signed(Channel_Estimates_Store_RAM_out1_re);

  hEst_im <= signed(Channel_Estimates_Store_RAM_out1_im);

  rd_21_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        hEst_re_1 <= to_signed(16#0000#, 16);
        hEst_im_1 <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        hEst_re_1 <= hEst_re;
        hEst_im_1 <= hEst_im;
      END IF;
    END IF;
  END PROCESS rd_21_process;


  Delay28_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay28_bypass_reg <= '0';
      ELSIF enb_1_2_1 = '1' THEN
        Delay28_bypass_reg <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS Delay28_bypass_process;

  
  Delay4_out1_2 <= Delay4_out1 WHEN enb_1_2_1 = '1' ELSE
      Delay28_bypass_reg;

  Valid <= Delay4_out1_2;

  rd_22_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_22_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        rd_22_reg(0) <= Valid;
        rd_22_reg(1) <= rd_22_reg(0);
      END IF;
    END IF;
  END PROCESS rd_22_process;

  Valid_1 <= rd_22_reg(1);

  Constant_out1 <= to_unsigned(16#CD#, 8);

  Constant1_out1 <= '1';

  OFDM_Equalizer_out1_re_signed <= signed(OFDM_Equalizer_out1_re);

  OFDM_Equalizer_out1_im_signed <= signed(OFDM_Equalizer_out1_im);

  mergedInput <= unsigned(Delay6_out1_re_1) & unsigned(Delay6_out1_im_1);

  -- Input register for RAM-based shift register mergedDelay
  mergedDelay_reginc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_regin <= to_unsigned(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        mergedDelay_regin <= mergedInput;
      END IF;
    END IF;
  END PROCESS mergedDelay_reginc_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 91
  -- Write address counter for RAM-based shift register mergedDelay
  mergedDelay_wr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_waddr <= to_unsigned(16#00#, 7);
      ELSIF enb_1_2_0 = '1' THEN
        IF mergedDelay_waddr >= to_unsigned(16#5B#, 7) THEN 
          mergedDelay_waddr <= to_unsigned(16#00#, 7);
        ELSE 
          mergedDelay_waddr <= mergedDelay_waddr + to_unsigned(16#01#, 7);
        END IF;
      END IF;
    END IF;
  END PROCESS mergedDelay_wr_process;


  mergedDelay_wrenb <= '1';

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 91
  -- Read address counter for RAM-based shift register mergedDelay
  mergedDelay_rd_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_raddr <= to_unsigned(16#01#, 7);
      ELSIF enb_1_2_0 = '1' THEN
        IF mergedDelay_raddr >= to_unsigned(16#5B#, 7) THEN 
          mergedDelay_raddr <= to_unsigned(16#00#, 7);
        ELSE 
          mergedDelay_raddr <= mergedDelay_raddr + to_unsigned(16#01#, 7);
        END IF;
      END IF;
    END IF;
  END PROCESS mergedDelay_rd_process;


  mergedDelay_regout_unsigned <= unsigned(mergedDelay_regout);

  -- Output register for RAM-based shift register mergedDelay
  mergedDelay_regoutc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedOutput <= to_unsigned(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        mergedOutput <= mergedDelay_regout_unsigned;
      END IF;
    END IF;
  END PROCESS mergedDelay_regoutc_process;


  slicedInput <= mergedOutput(31 DOWNTO 16);

  realOutput <= signed(slicedInput);

  slicedInput_1 <= mergedOutput(15 DOWNTO 0);

  imagOutput <= signed(slicedInput_1);

  
  Switch_out1_re <= OFDM_Equalizer_out1_re_signed WHEN dont_use_equalizer = '0' ELSE
      realOutput;
  
  Switch_out1_im <= OFDM_Equalizer_out1_im_signed WHEN dont_use_equalizer = '0' ELSE
      imagOutput;

  data_out_re <= std_logic_vector(Switch_out1_re);

  data_out_im <= std_logic_vector(Switch_out1_im);

  valid_out <= OFDM_Equalizer_out2;

END rtl;

