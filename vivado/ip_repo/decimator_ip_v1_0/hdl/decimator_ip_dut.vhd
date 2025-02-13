-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLDecimator/decimator_ip_dut.vhd
-- Created: 2024-10-01 07:52:42
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: decimator_ip_dut
-- Source Path: decimator_ip/decimator_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY decimator_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_in                          :   IN    std_logic;  -- ufix1
        ce_out                            :   OUT   std_logic;  -- ufix1
        data_out                          :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_out                         :   OUT   std_logic  -- ufix1
        );
END decimator_ip_dut;


ARCHITECTURE rtl OF decimator_ip_dut IS

  -- Component Declarations
  COMPONENT decimator_ip_src_decimator
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_in                        :   IN    std_logic;  -- ufix1
          ce_out                          :   OUT   std_logic;  -- ufix1
          data_out                        :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_out                       :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : decimator_ip_src_decimator
    USE ENTITY work.decimator_ip_src_decimator(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL valid_in_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL data_out_sig                     : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL valid_out_sig                    : std_logic;  -- ufix1

BEGIN
  u_decimator_ip_src_decimator : decimator_ip_src_decimator
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset_x => reset_x,
              data_in => data_in,  -- sfix12_En10
              valid_in => valid_in_sig,  -- ufix1
              ce_out => ce_out_sig,  -- ufix1
              data_out => data_out_sig,  -- sfix12_En10
              valid_out => valid_out_sig  -- ufix1
              );

  valid_in_sig <= valid_in;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  data_out <= data_out_sig;

  valid_out <= valid_out_sig;

END rtl;

