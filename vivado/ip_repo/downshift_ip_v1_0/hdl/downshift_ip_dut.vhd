-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLDownshifter/downshift_ip_dut.vhd
-- Created: 2024-09-23 00:12:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: downshift_ip_dut
-- Source Path: downshift_ip/downshift_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY downshift_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        data_in                           :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En13
        valid_in                          :   IN    std_logic;  -- ufix1
        phase_offset                      :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
        ce_out                            :   OUT   std_logic;  -- ufix1
        data_out_real                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_imag                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        valid_out                         :   OUT   std_logic  -- ufix1
        );
END downshift_ip_dut;


ARCHITECTURE rtl OF downshift_ip_dut IS

  -- Component Declarations
  COMPONENT downshift_ip_src_downshifter_hdl_wrapper
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En13
          valid_in                        :   IN    std_logic;  -- ufix1
          phase_offset                    :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En15
          ce_out                          :   OUT   std_logic;  -- ufix1
          data_out_real                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          data_out_imag                   :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          valid_out                       :   OUT   std_logic  -- ufix1
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : downshift_ip_src_downshifter_hdl_wrapper
    USE ENTITY work.downshift_ip_src_downshifter_hdl_wrapper(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL valid_in_sig                     : std_logic;  -- ufix1
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL data_out_real_sig                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL data_out_imag_sig                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL valid_out_sig                    : std_logic;  -- ufix1

BEGIN
  u_downshift_ip_src_downshifter_hdl_wrapper : downshift_ip_src_downshifter_hdl_wrapper
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset_x => reset_x,
              data_in => data_in,  -- sfix14_En13
              valid_in => valid_in_sig,  -- ufix1
              phase_offset => phase_offset,  -- sfix16_En15
              ce_out => ce_out_sig,  -- ufix1
              data_out_real => data_out_real_sig,  -- sfix16_En14
              data_out_imag => data_out_imag_sig,  -- sfix16_En14
              valid_out => valid_out_sig  -- ufix1
              );

  valid_in_sig <= valid_in;

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  data_out_real <= data_out_real_sig;

  data_out_imag <= data_out_imag_sig;

  valid_out <= valid_out_sig;

END rtl;

