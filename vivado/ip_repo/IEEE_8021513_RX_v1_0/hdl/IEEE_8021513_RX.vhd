-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX.vhd
-- Created: 2024-10-27 23:07:10
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
-- Module: IEEE_8021513_RX
-- Source Path: IEEE_8021513_RX
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX IS
  PORT( IPCORE_CLK                        :   IN    std_logic;  -- ufix1
        IPCORE_RESETN                     :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16
        header_ack                        :   IN    std_logic;  -- ufix1
        data_out                          :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
        valid_out                         :   OUT   std_logic;  -- ufix1
        start_out                         :   OUT   std_logic;  -- ufix1
        end_out                           :   OUT   std_logic;  -- ufix1
        reg0                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        reg1                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        reg2                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        reg3                              :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
        header_ready                      :   OUT   std_logic;  -- ufix1
        header_error                      :   OUT   std_logic  -- ufix1
        );
END IEEE_8021513_RX;


ARCHITECTURE rtl OF IEEE_8021513_RX IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_reset_sync
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_in                        :   IN    std_logic;  -- ufix1
          reset_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_dut
    PORT( clk                             :   IN    std_logic;  -- ufix1
          reset_x                         :   IN    std_logic;
          dut_enable                      :   IN    std_logic;  -- ufix1
          data_in                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16
          header_ack                      :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          data_out                        :   OUT   std_logic_vector(7 DOWNTO 0);  -- ufix8
          valid_out                       :   OUT   std_logic;  -- ufix1
          start_out                       :   OUT   std_logic;  -- ufix1
          end_out                         :   OUT   std_logic;  -- ufix1
          reg0                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          reg1                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          reg2                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          reg3                            :   OUT   std_logic_vector(31 DOWNTO 0);  -- ufix32
          header_ready                    :   OUT   std_logic;  -- ufix1
          header_error                    :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_reset_sync
    USE ENTITY work.IEEE_8021513_RX_reset_sync(rtl);

  FOR ALL : IEEE_8021513_RX_dut
    USE ENTITY work.IEEE_8021513_RX_dut(rtl);

  -- Signals
  SIGNAL reset_x                          : std_logic;
  SIGNAL dut_enable                       : std_logic;  -- ufix1
  SIGNAL data_in_unsigned                 : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL data_in_sig                      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL reset_cm                         : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL data_out_sig                     : std_logic_vector(7 DOWNTO 0);  -- ufix8
  SIGNAL valid_out_sig                    : std_logic;  -- ufix1
  SIGNAL start_out_sig                    : std_logic;  -- ufix1
  SIGNAL end_out_sig                      : std_logic;  -- ufix1
  SIGNAL reg0_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reg1_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reg2_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL reg3_sig                         : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL header_ready_sig                 : std_logic;  -- ufix1
  SIGNAL header_error_sig                 : std_logic;  -- ufix1

BEGIN
  u_IEEE_8021513_RX_reset_sync_inst : IEEE_8021513_RX_reset_sync
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_in => reset_cm,  -- ufix1
              reset_out => reset_x
              );

  u_IEEE_8021513_RX_dut_inst : IEEE_8021513_RX_dut
    PORT MAP( clk => IPCORE_CLK,  -- ufix1
              reset_x => reset_x,
              dut_enable => dut_enable,  -- ufix1
              data_in => std_logic_vector(data_in_sig),  -- sfix16
              header_ack => header_ack,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              data_out => data_out_sig,  -- ufix8
              valid_out => valid_out_sig,  -- ufix1
              start_out => start_out_sig,  -- ufix1
              end_out => end_out_sig,  -- ufix1
              reg0 => reg0_sig,  -- ufix32
              reg1 => reg1_sig,  -- ufix32
              reg2 => reg2_sig,  -- ufix32
              reg3 => reg3_sig,  -- ufix32
              header_ready => header_ready_sig,  -- ufix1
              header_error => header_error_sig  -- ufix1
              );

  dut_enable <= '1';

  data_in_unsigned <= unsigned(data_in);

  data_in_sig <= signed(data_in_unsigned);

  reset_cm <=  NOT IPCORE_RESETN;

  data_out <= data_out_sig;

  valid_out <= valid_out_sig;

  start_out <= start_out_sig;

  end_out <= end_out_sig;

  reg0 <= reg0_sig;

  reg1 <= reg1_sig;

  reg2 <= reg2_sig;

  reg3 <= reg3_sig;

  header_ready <= header_ready_sig;

  header_error <= header_error_sig;

END rtl;
