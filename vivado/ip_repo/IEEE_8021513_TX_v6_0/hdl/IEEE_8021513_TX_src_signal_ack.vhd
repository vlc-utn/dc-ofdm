-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_signal_ack.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_signal_ack
-- Source Path: HDLTx/full_tx/signal_ack
-- Hierarchy Level: 1
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_signal_ack IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        signal_in                         :   IN    std_logic;
        free_signal                       :   IN    std_logic;
        signal_out                        :   OUT   std_logic
        );
END IEEE_8021513_TX_src_signal_ack;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_signal_ack IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_rising_edge_detector_block3
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          In_rsvd                         :   IN    std_logic;
          Out_rsvd                        :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_rising_edge_detector_block3
    USE ENTITY work.IEEE_8021513_TX_src_rising_edge_detector_block3(rtl);

  -- Signals
  SIGNAL delayMatch_reg                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL free_signal_1                    : std_logic;
  SIGNAL rising_edge_detector_out1        : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL delayMatch2_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL enb_gated                        : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL free_signal_2                    : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL Unit_Delay_out1                  : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;

BEGIN
  u_rising_edge_detector : IEEE_8021513_TX_src_rising_edge_detector_block3
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              In_rsvd => signal_in,
              Out_rsvd => rising_edge_detector_out1
              );

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch_reg(0) <= free_signal;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  free_signal_1 <= delayMatch_reg(1);

  Logical_Operator_out1 <= free_signal_1 OR rising_edge_detector_out1;

  stateControl_1 <= '1';

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch2_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch2_reg(0) <= stateControl_1;
        delayMatch2_reg(1) <= delayMatch2_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  stateControl_2 <= delayMatch2_reg(1);

  enb_gated <= stateControl_2 AND enb;

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch1_reg(0) <= free_signal;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  free_signal_2 <= delayMatch1_reg(1);

  Unit_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_out1 <= '0';
      ELSIF enb_gated = '1' THEN
        Unit_Delay_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  
  Switch_out1 <= Unit_Delay_out1 WHEN Logical_Operator_out1 = '0' ELSE
      free_signal_2;

  Logical_Operator3_out1 <=  NOT Switch_out1;

  signal_out <= Logical_Operator3_out1;

END rtl;

