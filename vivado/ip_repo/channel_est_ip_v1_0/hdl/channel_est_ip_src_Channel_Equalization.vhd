-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLChannelEstimator/channel_est_ip_src_Channel_Equalization.vhd
-- Created: 2024-10-02 11:31:35
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: channel_est_ip_src_Channel_Equalization
-- Source Path: HDLChannelEstimator/hdl_wrapper/channel_estimation_and_equalization/Channel Equalization
-- Hierarchy Level: 2
-- Model version: 1.24
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY channel_est_ip_src_Channel_Equalization IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_in_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_data                        :   IN    std_logic;
        channel_estimate_in_re            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        channel_estimate_in_im            :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_channel_estimate            :   IN    std_logic;
        dont_use_equalizer                :   IN    std_logic;
        reset                             :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_out_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_out                         :   OUT   std_logic;
        channel_est_out_re                :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        channel_est_out_im                :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En10
        );
END channel_est_ip_src_Channel_Equalization;


ARCHITECTURE rtl OF channel_est_ip_src_Channel_Equalization IS

  -- Component Declarations
  COMPONENT channel_est_ip_src_rising_edge_detector1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT channel_est_ip_src_rising_edge_detector
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT channel_est_ip_src_SimpleDualPortRAM_generic_block
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din_re                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_din_im                       :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout_re                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          dout_im                         :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT channel_est_ip_src_OFDM_Equalizer
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          dataIn_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dataIn_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          hEst_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          hEst_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          validIn                         :   IN    std_logic;
          hEstLen                         :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          loadhEst                        :   IN    std_logic;
          reset                           :   IN    std_logic;
          dataOut_re                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dataOut_im                      :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT channel_est_ip_src_SimpleDualPortRAM_generic_block1
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : channel_est_ip_src_rising_edge_detector1
    USE ENTITY work.channel_est_ip_src_rising_edge_detector1(rtl);

  FOR ALL : channel_est_ip_src_rising_edge_detector
    USE ENTITY work.channel_est_ip_src_rising_edge_detector(rtl);

  FOR ALL : channel_est_ip_src_SimpleDualPortRAM_generic_block
    USE ENTITY work.channel_est_ip_src_SimpleDualPortRAM_generic_block(rtl);

  FOR ALL : channel_est_ip_src_OFDM_Equalizer
    USE ENTITY work.channel_est_ip_src_OFDM_Equalizer(rtl);

  FOR ALL : channel_est_ip_src_SimpleDualPortRAM_generic_block1
    USE ENTITY work.channel_est_ip_src_SimpleDualPortRAM_generic_block1(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL data_in_im_signed                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay6_out1_re                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay6_out1_im                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay_out1_re                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay_out1_im                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay24_out1_re                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay24_out1_im                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL channel_estimate_in_re_signed    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL channel_estimate_in_im_signed    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay5_out1_re                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay5_out1_im                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL rising_edge_detector1_out1       : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL count_step                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_from                       : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_reset                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HDL_Counter_out1                 : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count                            : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_1                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_2                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rising_edge_detector_out1        : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL count_step_1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_from_1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_reset_1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL rdAddr                           : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_3                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL need_to_wrap_1                   : std_logic;
  SIGNAL count_value_1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_4                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL count_5                          : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Channel_Estimates_Store_RAM_out1_re : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL Channel_Estimates_Store_RAM_out1_im : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL Channel_Estimates_Store_RAM_out1_re_signed : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Channel_Estimates_Store_RAM_out1_im_signed : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL hEst_re                          : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL hEst_im                          : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay28_out1                     : std_logic;
  SIGNAL Valid                            : std_logic;
  SIGNAL Constant_out1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Constant1_out1                   : std_logic;
  SIGNAL OFDM_Equalizer_out1_re           : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL OFDM_Equalizer_out1_im           : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL OFDM_Equalizer_out2              : std_logic;
  SIGNAL OFDM_Equalizer_out1_re_signed    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL OFDM_Equalizer_out1_im_signed    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL mergedInput                      : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL mergedDelay_regin                : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL mergedDelay_waddr                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL mergedDelay_wrenb                : std_logic;  -- ufix1
  SIGNAL mergedDelay_raddr                : unsigned(6 DOWNTO 0);  -- ufix7
  SIGNAL mergedDelay_regout               : std_logic_vector(47 DOWNTO 0);  -- ufix48
  SIGNAL mergedDelay_regout_unsigned      : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL mergedOutput                     : unsigned(47 DOWNTO 0);  -- ufix48
  SIGNAL slicedInput                      : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL realOutput                       : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL slicedInput_1                    : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL imagOutput                       : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Switch_out1_re                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Switch_out1_im                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL slicedInput_2                    : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL realOutput_1                     : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL slicedInput_3                    : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL imagOutput_1                     : signed(11 DOWNTO 0);  -- sfix12_En10

BEGIN
  u_rising_edge_detector1 : channel_est_ip_src_rising_edge_detector1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => valid_channel_estimate,
              Out_rsvd => rising_edge_detector1_out1
              );

  u_rising_edge_detector : channel_est_ip_src_rising_edge_detector
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => valid_data,
              Out_rsvd => rising_edge_detector_out1
              );

  u_Channel_Estimates_Store_RAM : channel_est_ip_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 8,
                 DataWidth => 12
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din_re => std_logic_vector(Delay5_out1_re),
              wr_din_im => std_logic_vector(Delay5_out1_im),
              wr_addr => std_logic_vector(HDL_Counter_out1),
              wr_en => Delay3_out1,
              rd_addr => std_logic_vector(rdAddr),
              dout_re => Channel_Estimates_Store_RAM_out1_re,
              dout_im => Channel_Estimates_Store_RAM_out1_im
              );

  u_OFDM_Equalizer : channel_est_ip_src_OFDM_Equalizer
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              dataIn_re => std_logic_vector(Delay24_out1_re),  -- sfix12_En10
              dataIn_im => std_logic_vector(Delay24_out1_im),  -- sfix12_En10
              hEst_re => std_logic_vector(hEst_re),  -- sfix12_En10
              hEst_im => std_logic_vector(hEst_im),  -- sfix12_En10
              validIn => Valid,
              hEstLen => std_logic_vector(Constant_out1),  -- uint8
              loadhEst => Constant1_out1,
              reset => reset,
              dataOut_re => OFDM_Equalizer_out1_re,  -- sfix12_En10
              dataOut_im => OFDM_Equalizer_out1_im,  -- sfix12_En10
              validOut => OFDM_Equalizer_out2
              );

  u_ShiftRegisterRAM_generic : channel_est_ip_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 7,
                 DataWidth => 48
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => std_logic_vector(mergedDelay_regin),
              wr_addr => std_logic_vector(mergedDelay_waddr),
              wr_en => mergedDelay_wrenb,  -- ufix1
              rd_addr => std_logic_vector(mergedDelay_raddr),
              dout => mergedDelay_regout
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1_re <= to_signed(16#000#, 12);
        Delay6_out1_im <= to_signed(16#000#, 12);
      ELSIF enb = '1' THEN
        Delay6_out1_re <= data_in_re_signed;
        Delay6_out1_im <= data_in_im_signed;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_re <= to_signed(16#000#, 12);
        Delay_out1_im <= to_signed(16#000#, 12);
      ELSIF enb = '1' THEN
        Delay_out1_re <= Delay6_out1_re;
        Delay_out1_im <= Delay6_out1_im;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Delay24_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay24_out1_re <= to_signed(16#000#, 12);
        Delay24_out1_im <= to_signed(16#000#, 12);
      ELSIF enb = '1' THEN
        Delay24_out1_re <= Delay_out1_re;
        Delay24_out1_im <= Delay_out1_im;
      END IF;
    END IF;
  END PROCESS Delay24_process;


  channel_estimate_in_re_signed <= signed(channel_estimate_in_re);

  channel_estimate_in_im_signed <= signed(channel_estimate_in_im);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_re <= to_signed(16#000#, 12);
        Delay5_out1_im <= to_signed(16#000#, 12);
      ELSIF enb = '1' THEN
        Delay5_out1_re <= channel_estimate_in_re_signed;
        Delay5_out1_im <= channel_estimate_in_im_signed;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1 <= valid_channel_estimate;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 204
  count_step <= to_unsigned(16#01#, 8);

  count_from <= to_unsigned(16#00#, 8);

  count_reset <= to_unsigned(16#00#, 8);

  count <= HDL_Counter_out1 + count_step;

  
  need_to_wrap <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#CC#, 8) ELSE
      '0';

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= HDL_Counter_out1 WHEN Delay3_out1 = '0' ELSE
      count_value;

  
  count_2 <= count_1 WHEN rising_edge_detector1_out1 = '0' ELSE
      count_reset;

  HDL_Counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        HDL_Counter_out1 <= count_2;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay4_out1 <= valid_data;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 204
  count_step_1 <= to_unsigned(16#01#, 8);

  count_from_1 <= to_unsigned(16#00#, 8);

  count_reset_1 <= to_unsigned(16#00#, 8);

  count_3 <= rdAddr + count_step_1;

  
  need_to_wrap_1 <= '1' WHEN rdAddr = to_unsigned(16#CC#, 8) ELSE
      '0';

  
  count_value_1 <= count_3 WHEN need_to_wrap_1 = '0' ELSE
      count_from_1;

  
  count_4 <= rdAddr WHEN Delay4_out1 = '0' ELSE
      count_value_1;

  
  count_5 <= count_4 WHEN rising_edge_detector_out1 = '0' ELSE
      count_reset_1;

  HDL_Counter1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rdAddr <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        rdAddr <= count_5;
      END IF;
    END IF;
  END PROCESS HDL_Counter1_process;


  Channel_Estimates_Store_RAM_out1_re_signed <= signed(Channel_Estimates_Store_RAM_out1_re);

  Channel_Estimates_Store_RAM_out1_im_signed <= signed(Channel_Estimates_Store_RAM_out1_im);

  Delay23_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        hEst_re <= to_signed(16#000#, 12);
        hEst_im <= to_signed(16#000#, 12);
      ELSIF enb = '1' THEN
        hEst_re <= Channel_Estimates_Store_RAM_out1_re_signed;
        hEst_im <= Channel_Estimates_Store_RAM_out1_im_signed;
      END IF;
    END IF;
  END PROCESS Delay23_process;


  Delay28_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay28_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay28_out1 <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS Delay28_process;


  Delay25_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Valid <= '0';
      ELSIF enb = '1' THEN
        Valid <= Delay28_out1;
      END IF;
    END IF;
  END PROCESS Delay25_process;


  Constant_out1 <= to_unsigned(16#CD#, 8);

  Constant1_out1 <= '1';

  OFDM_Equalizer_out1_re_signed <= signed(OFDM_Equalizer_out1_re);

  OFDM_Equalizer_out1_im_signed <= signed(OFDM_Equalizer_out1_im);

  mergedInput <= unsigned(hEst_re) & unsigned(hEst_im) & unsigned(Delay24_out1_re) & unsigned(Delay24_out1_im);

  -- Input register for RAM-based shift register mergedDelay
  mergedDelay_reginc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_regin <= to_unsigned(0, 48);
      ELSIF enb = '1' THEN
        mergedDelay_regin <= mergedInput;
      END IF;
    END IF;
  END PROCESS mergedDelay_reginc_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 89
  -- Write address counter for RAM-based shift register mergedDelay
  mergedDelay_wr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_waddr <= to_unsigned(16#00#, 7);
      ELSIF enb = '1' THEN
        IF mergedDelay_waddr >= to_unsigned(16#59#, 7) THEN 
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
  --  count to value  = 89
  -- Read address counter for RAM-based shift register mergedDelay
  mergedDelay_rd_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_raddr <= to_unsigned(16#01#, 7);
      ELSIF enb = '1' THEN
        IF mergedDelay_raddr >= to_unsigned(16#59#, 7) THEN 
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
        mergedOutput <= to_unsigned(0, 48);
      ELSIF enb = '1' THEN
        mergedOutput <= mergedDelay_regout_unsigned;
      END IF;
    END IF;
  END PROCESS mergedDelay_regoutc_process;


  slicedInput <= mergedOutput(23 DOWNTO 12);

  realOutput <= signed(slicedInput);

  slicedInput_1 <= mergedOutput(11 DOWNTO 0);

  imagOutput <= signed(slicedInput_1);

  
  Switch_out1_re <= OFDM_Equalizer_out1_re_signed WHEN dont_use_equalizer = '0' ELSE
      realOutput;
  
  Switch_out1_im <= OFDM_Equalizer_out1_im_signed WHEN dont_use_equalizer = '0' ELSE
      imagOutput;

  data_out_re <= std_logic_vector(Switch_out1_re);

  data_out_im <= std_logic_vector(Switch_out1_im);

  slicedInput_2 <= mergedOutput(47 DOWNTO 36);

  realOutput_1 <= signed(slicedInput_2);

  channel_est_out_re <= std_logic_vector(realOutput_1);

  slicedInput_3 <= mergedOutput(35 DOWNTO 24);

  imagOutput_1 <= signed(slicedInput_3);

  channel_est_out_im <= std_logic_vector(imagOutput_1);

  valid_out <= OFDM_Equalizer_out2;

END rtl;

