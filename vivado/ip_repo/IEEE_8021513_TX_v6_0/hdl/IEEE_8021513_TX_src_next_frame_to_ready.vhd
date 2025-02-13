-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_next_frame_to_ready.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_next_frame_to_ready
-- Source Path: HDLTx/full_tx/payload_full/next_frame_to_ready
-- Hierarchy Level: 2
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_next_frame_to_ready IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_8_0                         :   IN    std_logic;
        next_frame                        :   IN    std_logic;
        ready                             :   OUT   std_logic
        );
END IEEE_8021513_TX_src_next_frame_to_ready;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_next_frame_to_ready IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_rising_edge_detector_block1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_8_0                       :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_rising_edge_detector_block1
    USE ENTITY work.IEEE_8021513_TX_src_rising_edge_detector_block1(rtl);

  -- Signals
  SIGNAL rising_edge_detector_out1        : std_logic;
  SIGNAL count_step                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL count_from                       : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL HDL_Counter_out2                 : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL HDL_Counter_out1                 : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL range_hit                        : std_logic;
  SIGNAL count                            : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : std_logic;
  SIGNAL count_1                          : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Logical_Operator3_out1           : std_logic;

BEGIN
  -- Given a next frame rising edge, this subsystem will generate a "ready" signal for the duration of "payloadWordsPerBlock0" 
  -- clock cycle

  u_rising_edge_detector : IEEE_8021513_TX_src_rising_edge_detector_block1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_8_0 => enb_1_8_0,
              In_rsvd => next_frame,
              Out_rsvd => rising_edge_detector_out1
              );

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 20
  count_step <= to_unsigned(16#01#, 5);

  count_from <= to_unsigned(16#00#, 5);

  Logical_Operator2_out1 <=  NOT HDL_Counter_out2;

  
  range_hit <= '1' WHEN HDL_Counter_out1 > to_unsigned(16#1E#, 5) ELSE
      '0';

  count <= HDL_Counter_out1 + count_step;

  
  count_value <= count WHEN need_to_wrap = '0' ELSE
      count_from;

  
  count_1 <= HDL_Counter_out1 WHEN Unit_Delay_Enabled_Synchronous_out1 = '0' ELSE
      count_value;

  HDL_Counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HDL_Counter_out1 <= to_unsigned(16#00#, 5);
      ELSIF enb_1_8_0 = '1' THEN
        HDL_Counter_out1 <= count_1;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  need_to_wrap <= '1' WHEN HDL_Counter_out1 = to_unsigned(16#14#, 5) ELSE
      '0';

  HDL_Counter_out2 <= need_to_wrap OR range_hit;

  Logical_Operator3_out1 <= rising_edge_detector_out1 OR HDL_Counter_out2;

  Unit_Delay_Enabled_Synchronous_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= '0';
      ELSIF enb_1_8_0 = '1' AND Logical_Operator3_out1 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= Logical_Operator2_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_process;


  ready <= Unit_Delay_Enabled_Synchronous_out1;

END rtl;

