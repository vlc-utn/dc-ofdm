-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_ofdm_rx_counter.vhd
-- Created: 2024-08-10 11:14:30
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_ofdm_rx_counter
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_rx_counter
-- Hierarchy Level: 2
-- Model version: 1.14
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_ofdm_rx_counter IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        valid                             :   IN    std_logic;
        rst                               :   IN    std_logic;
        payload_num_ofdm_symbols          :   IN    std_logic_vector(16 DOWNTO 0);  -- sfix17
        is_channel                        :   OUT   std_logic;
        is_header                         :   OUT   std_logic;
        is_payload                        :   OUT   std_logic
        );
END full_rx_ip_src_ofdm_rx_counter;


ARCHITECTURE rtl OF full_rx_ip_src_ofdm_rx_counter IS

  -- Component Declarations
  COMPONENT full_rx_ip_src_rising_edge_detector1_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_rx_ip_src_falling_edge_detector1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in_rsvd                         :   IN    std_logic;
          out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_rx_ip_src_rising_edge_detector1_block
    USE ENTITY work.full_rx_ip_src_rising_edge_detector1_block(rtl);

  FOR ALL : full_rx_ip_src_falling_edge_detector1
    USE ENTITY work.full_rx_ip_src_falling_edge_detector1(rtl);

  -- Signals
  SIGNAL rising_edge_detector1_out1       : std_logic;
  SIGNAL falling_edge_detector1_out1      : std_logic;
  SIGNAL count_step                       : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_reset                      : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL HDL_Counter_out1                 : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count                            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_1                          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_2                          : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Constant1_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL channel                          : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Constant2_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL Relational_Operator2_out1        : std_logic;
  SIGNAL header                           : std_logic;
  SIGNAL payload                          : std_logic;
  SIGNAL Constant3_out1                   : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL payload_num_ofdm_symbols_signed  : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Add_add_cast                     : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Add_out1                         : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Relational_Operator3_cast        : signed(17 DOWNTO 0);  -- sfix18
  SIGNAL Relational_Operator3_out1        : std_logic;
  SIGNAL payload_1                        : std_logic;

BEGIN
  -- Counts the amount of OFDM symbols for every "end" signal, and assigns them a position (preamble, channel, header, 
  -- payload

  u_rising_edge_detector1 : full_rx_ip_src_rising_edge_detector1_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              In_rsvd => rst,
              Out_rsvd => rising_edge_detector1_out1
              );

  u_falling_edge_detector1 : full_rx_ip_src_falling_edge_detector1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in_rsvd => valid,
              out_rsvd => falling_edge_detector1_out1
              );

  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  count_step <= to_unsigned(16#0001#, 16);

  count_reset <= to_unsigned(16#0000#, 16);

  count <= HDL_Counter_out1 + count_step;

  
  count_1 <= HDL_Counter_out1 WHEN falling_edge_detector1_out1 = '0' ELSE
      count;

  
  count_2 <= count_1 WHEN rising_edge_detector1_out1 = '0' ELSE
      count_reset;

  HDL_Counter_process : PROCESS (clk, reset_x)
  BEGIN
    IF reset_x = '1' THEN
      HDL_Counter_out1 <= to_unsigned(16#0000#, 16);
    ELSIF clk'EVENT AND clk = '1' THEN
      IF enb_1_2_0 = '1' THEN
        HDL_Counter_out1 <= count_2;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  Constant1_out1 <= to_unsigned(16#0002#, 16);

  
  channel <= '1' WHEN HDL_Counter_out1 < Constant1_out1 ELSE
      '0';

  Logical_Operator3_out1 <=  NOT channel;

  Constant2_out1 <= to_unsigned(16#0003#, 16);

  
  Relational_Operator2_out1 <= '1' WHEN HDL_Counter_out1 < Constant2_out1 ELSE
      '0';

  header <= Logical_Operator3_out1 AND Relational_Operator2_out1;

  payload <=  NOT Relational_Operator2_out1;

  Constant3_out1 <= to_unsigned(16#0003#, 16);

  payload_num_ofdm_symbols_signed <= signed(payload_num_ofdm_symbols);

  Add_add_cast <= signed(resize(Constant3_out1, 18));
  Add_out1 <= Add_add_cast + resize(payload_num_ofdm_symbols_signed, 18);

  Relational_Operator3_cast <= signed(resize(HDL_Counter_out1, 18));
  
  Relational_Operator3_out1 <= '1' WHEN Relational_Operator3_cast < Add_out1 ELSE
      '0';

  payload_1 <= payload AND Relational_Operator3_out1;

  is_channel <= channel;

  is_header <= header;

  is_payload <= payload_1;

END rtl;
