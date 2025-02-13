-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_h_remove_repetition.vhd
-- Created: 2024-10-27 23:05:38
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_h_remove_repetition
-- Source Path: HDLRx/full_rx/h_rx_full/h_remove_repetition
-- Hierarchy Level: 2
-- Model version: 1.138
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_h_remove_repetition IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        start_in                          :   IN    std_logic;
        data_out                          :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        ctrl_out_start                    :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic
        );
END IEEE_8021513_RX_src_h_remove_repetition;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_h_remove_repetition IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block1
    PORT( In1                             :   IN    std_logic;
          In2                             :   IN    std_logic;
          In3                             :   IN    std_logic;
          Out1_start                      :   OUT   std_logic;
          Out1_end                        :   OUT   std_logic;
          Out1_valid                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block1
    USE ENTITY work.IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block1(rtl);

  -- Signals
  SIGNAL data_in_signed                   : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL data_in_1                        : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL Unit_Delay5_out1                 : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL rst                              : std_logic;
  SIGNAL Unit_Delay6_out1                 : std_logic;
  SIGNAL Unit_Delay2_out1                 : std_logic;
  SIGNAL count_step                       : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_from                       : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_reset                      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL zero_1                           : std_logic;
  SIGNAL count                            : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL range_hit                        : std_logic;
  SIGNAL count_1                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL need_to_wrap                     : std_logic;
  SIGNAL count_value                      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Unit_Delay_out1                  : std_logic;
  SIGNAL HDL_Counter_out2                 : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL Unit_Delay1_out1                 : std_logic;
  SIGNAL count_2                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_3                          : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL count_hit                        : std_logic;
  SIGNAL Unit_Delay7_out1                 : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_start : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_end : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_valid : std_logic;

BEGIN
  u_Sample_Control_Bus_Creator : IEEE_8021513_RX_src_Sample_Control_Bus_Creator_block1
    PORT MAP( In1 => Unit_Delay6_out1,
              In2 => HDL_Counter_out2,
              In3 => Unit_Delay7_out1,
              Out1_start => Sample_Control_Bus_Creator_out1_start,
              Out1_end => Sample_Control_Bus_Creator_out1_end,
              Out1_valid => Sample_Control_Bus_Creator_out1_valid
              );

  data_in_signed <= signed(data_in);

  Unit_Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        data_in_1 <= to_signed(16#0#, 4);
      ELSIF enb = '1' THEN
        data_in_1 <= data_in_signed;
      END IF;
    END IF;
  END PROCESS Unit_Delay4_process;


  Unit_Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay5_out1 <= to_signed(16#0#, 4);
      ELSIF enb = '1' THEN
        Unit_Delay5_out1 <= data_in_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay5_process;


  data_out <= std_logic_vector(Unit_Delay5_out1);

  Unit_Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rst <= '0';
      ELSIF enb = '1' THEN
        rst <= start_in;
      END IF;
    END IF;
  END PROCESS Unit_Delay3_process;


  Unit_Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay6_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay6_out1 <= rst;
      END IF;
    END IF;
  END PROCESS Unit_Delay6_process;


  Unit_Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay2_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay2_out1 <= start_in;
      END IF;
    END IF;
  END PROCESS Unit_Delay2_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 335
  count_step <= to_unsigned(16#001#, 9);

  count_from <= to_unsigned(16#000#, 9);

  count_reset <= to_unsigned(16#000#, 9);

  zero_1 <= '0';

  
  range_hit <= '1' WHEN count > to_unsigned(16#1FE#, 9) ELSE
      '0';

  count_1 <= count + count_step;

  
  count_value <= count_1 WHEN need_to_wrap = '0' ELSE
      count_from;

  Unit_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  Logical_Operator_out1 <= start_in OR HDL_Counter_out2;

  Unit_Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay1_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay1_out1 <= Logical_Operator_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay1_process;


  
  Switch_out1 <= Unit_Delay_out1 WHEN Unit_Delay1_out1 = '0' ELSE
      Unit_Delay2_out1;

  
  count_2 <= count WHEN Switch_out1 = '0' ELSE
      count_value;

  
  count_3 <= count_2 WHEN rst = '0' ELSE
      count_reset;

  HDL_Counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count <= to_unsigned(16#000#, 9);
      ELSIF enb = '1' THEN
        count <= count_3;
      END IF;
    END IF;
  END PROCESS HDL_Counter_process;


  
  need_to_wrap <= '1' WHEN count = to_unsigned(16#14F#, 9) ELSE
      '0';

  count_hit <= need_to_wrap OR range_hit;

  
  HDL_Counter_out2 <= count_hit WHEN rst = '0' ELSE
      zero_1;

  Unit_Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay7_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay7_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay7_process;


  ctrl_out_start <= Sample_Control_Bus_Creator_out1_start;

  ctrl_out_end <= Sample_Control_Bus_Creator_out1_end;

  ctrl_out_valid <= Sample_Control_Bus_Creator_out1_valid;

END rtl;

