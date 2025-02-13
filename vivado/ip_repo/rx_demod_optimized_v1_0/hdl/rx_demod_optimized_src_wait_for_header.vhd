-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_wait_for_header.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_wait_for_header
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_separator/wait_for_header
-- Hierarchy Level: 2
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY rx_demod_optimized_src_wait_for_header IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        data_in_im                        :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        header_ready                      :   IN    std_logic;
        valid_payload                     :   IN    std_logic;
        zero_payload                      :   IN    std_logic;
        one_payload                       :   IN    std_logic;
        ofdm_samples                      :   IN    std_logic_vector(31 DOWNTO 0);  -- uint32
        data_out_re                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        data_out_im                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        valid_payload_out                 :   OUT   std_logic
        );
END rx_demod_optimized_src_wait_for_header;


ARCHITECTURE rtl OF rx_demod_optimized_src_wait_for_header IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_rising_edge_detector1_block1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_HDL_FIFO_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_re                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          In_im                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          Push                            :   IN    std_logic;
          Pop                             :   IN    std_logic;
          rst                             :   IN    std_logic;
          Out_re                          :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          Out_im                          :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          Empty                           :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_rising_edge_detector_block3
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_rising_edge_detector1_block1
    USE ENTITY work.rx_demod_optimized_src_rising_edge_detector1_block1(rtl);

  FOR ALL : rx_demod_optimized_src_HDL_FIFO_block
    USE ENTITY work.rx_demod_optimized_src_HDL_FIFO_block(rtl);

  FOR ALL : rx_demod_optimized_src_rising_edge_detector_block3
    USE ENTITY work.rx_demod_optimized_src_rising_edge_detector_block3(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL data_in_im_signed                : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL Delay12_out1_re                  : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Delay12_out1_im                  : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL stateControl_3                   : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_4                   : std_logic;
  SIGNAL enb_1_2_0_gated_1                : std_logic;
  SIGNAL Delay13_out1                     : std_logic;
  SIGNAL rising_edge_detector1_out1       : std_logic;
  SIGNAL OR_out1                          : std_logic;
  SIGNAL count_step                       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_reset                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count                            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_1                          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_2                          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_3                          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL ofdm_samples_unsigned            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL hit_zero                         : std_logic;
  SIGNAL OR2_out1                         : std_logic;
  SIGNAL stateControl_5                   : std_logic;
  SIGNAL delayMatch3_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_6                   : std_logic;
  SIGNAL enb_1_2_0_gated_2                : std_logic;
  SIGNAL pop                              : std_logic;
  SIGNAL Unit_Delay_out1                  : std_logic;
  SIGNAL HDL_FIFO_out1_re                 : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL HDL_FIFO_out1_im                 : std_logic_vector(13 DOWNTO 0);  -- ufix14
  SIGNAL HDL_FIFO_out2                    : std_logic;
  SIGNAL rising_edge_detector_out1        : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL stateControl_7                   : std_logic;
  SIGNAL delayMatch2_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_8                   : std_logic;
  SIGNAL enb_1_2_0_gated_3                : std_logic;
  SIGNAL Delay14_out1                     : std_logic;
  SIGNAL NOT_out1                         : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL HDL_FIFO_out1_re_signed          : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL HDL_FIFO_out1_im_signed          : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch3_out1_re                  : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL Switch3_out1_im                  : signed(13 DOWNTO 0);  -- sfix14_En12

BEGIN
  -- The RAM value should be large enough to wait for the header to be processed.
  -- Th e LDPC decoder of the header has a delay > 2500, so a value of 3000 is chosen for an extra margin.
  -- Store payload OFDM symbols until header parameters are known (cyclic prefix has to be known before demodulating 
  -- the OFDM symbol

  u_rising_edge_detector1 : rx_demod_optimized_src_rising_edge_detector1_block1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_rsvd => valid_payload,
              Out_rsvd => rising_edge_detector1_out1
              );

  u_HDL_FIFO : rx_demod_optimized_src_HDL_FIFO_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_re => std_logic_vector(Delay12_out1_re),  -- sfix14_En12
              In_im => std_logic_vector(Delay12_out1_im),  -- sfix14_En12
              Push => Delay13_out1,
              Pop => pop,
              rst => OR2_out1,
              Out_re => HDL_FIFO_out1_re,  -- sfix14_En12
              Out_im => HDL_FIFO_out1_im,  -- sfix14_En12
              Empty => HDL_FIFO_out2
              );

  u_rising_edge_detector : rx_demod_optimized_src_rising_edge_detector_block3
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_rsvd => HDL_FIFO_out2,
              Out_rsvd => rising_edge_detector_out1
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  stateControl_1 <= '1';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch_reg(0) <= stateControl_1;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  stateControl_2 <= delayMatch_reg(1);

  enb_1_2_0_gated <= stateControl_2 AND enb_1_2_0;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1_re <= to_signed(16#0000#, 14);
        Delay12_out1_im <= to_signed(16#0000#, 14);
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay12_out1_re <= data_in_re_signed;
        Delay12_out1_im <= data_in_im_signed;
      END IF;
    END IF;
  END PROCESS Delay12_process;


  stateControl_3 <= '1';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch1_reg(0) <= stateControl_3;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  stateControl_4 <= delayMatch1_reg(1);

  enb_1_2_0_gated_1 <= stateControl_4 AND enb_1_2_0;

  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_out1 <= '0';
      ELSIF enb_1_2_0_gated_1 = '1' THEN
        Delay13_out1 <= valid_payload;
      END IF;
    END IF;
  END PROCESS Delay13_process;


  OR_out1 <= rising_edge_detector1_out1 OR zero_payload;

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  count_step <= to_unsigned(16#0001#, 16);

  count_reset <= to_unsigned(16#0000#, 16);

  count_1 <= count + count_step;

  
  count_2 <= count WHEN one_payload = '0' ELSE
      count_1;

  
  count_3 <= count_2 WHEN header_ready = '0' ELSE
      count_reset;

  HDL_Counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count <= to_unsigned(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        count <= count_3;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  ofdm_samples_unsigned <= unsigned(ofdm_samples);

  
  hit_zero <= '1' WHEN resize(count, 32) = ofdm_samples_unsigned ELSE
      '0';

  OR2_out1 <= OR_out1 OR hit_zero;

  stateControl_5 <= '1';

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch3_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch3_reg(0) <= stateControl_5;
        delayMatch3_reg(1) <= delayMatch3_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch3_process;

  stateControl_6 <= delayMatch3_reg(1);

  enb_1_2_0_gated_2 <= stateControl_6 AND enb_1_2_0;

  Unit_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_out1 <= '0';
      ELSIF enb_1_2_0_gated_2 = '1' THEN
        Unit_Delay_out1 <= pop;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Logical_Operator1_out1 <= hit_zero OR (rising_edge_detector_out1 OR header_ready);

  
  pop <= Unit_Delay_out1 WHEN Logical_Operator1_out1 = '0' ELSE
      header_ready;

  stateControl_7 <= '1';

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch2_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        delayMatch2_reg(0) <= stateControl_7;
        delayMatch2_reg(1) <= delayMatch2_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  stateControl_8 <= delayMatch2_reg(1);

  enb_1_2_0_gated_3 <= stateControl_8 AND enb_1_2_0;

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1 <= '0';
      ELSIF enb_1_2_0_gated_3 = '1' THEN
        Delay14_out1 <= pop;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  NOT_out1 <=  NOT hit_zero;

  AND_out1 <= Delay14_out1 AND NOT_out1;

  HDL_FIFO_out1_re_signed <= signed(HDL_FIFO_out1_re);

  HDL_FIFO_out1_im_signed <= signed(HDL_FIFO_out1_im);

  
  Switch3_out1_re <= data_in_re_signed WHEN AND_out1 = '0' ELSE
      HDL_FIFO_out1_re_signed;
  
  Switch3_out1_im <= data_in_im_signed WHEN AND_out1 = '0' ELSE
      HDL_FIFO_out1_im_signed;

  data_out_re <= std_logic_vector(Switch3_out1_re);

  data_out_im <= std_logic_vector(Switch3_out1_im);

  valid_payload_out <= AND_out1;

END rtl;

