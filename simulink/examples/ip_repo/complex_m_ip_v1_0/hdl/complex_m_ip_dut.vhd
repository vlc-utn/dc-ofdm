-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/exampleIPCore/complex_m_ip_dut.vhd
-- Created: 2024-06-30 18:26:19
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: complex_m_ip_dut
-- Source Path: complex_m_ip/complex_m_ip_dut
-- Hierarchy Level: 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY complex_m_ip_dut IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        dut_enable                        :   IN    std_logic;  -- ufix1
        ar                                :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
        ai                                :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
        br                                :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
        bi                                :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
        ce_out                            :   OUT   std_logic;  -- ufix1
        a_b_r                             :   OUT   std_logic_vector(32 DOWNTO 0);  -- sfix33_En16
        a_b_i                             :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33_En16
        );
END complex_m_ip_dut;


ARCHITECTURE rtl OF complex_m_ip_dut IS

  -- Component Declarations
  COMPONENT complex_m_ip_src_complex_multiply
    PORT( clk                             :   IN    std_logic;
          clk_enable                      :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          ar                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
          ai                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
          br                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
          bi                              :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En8
          ce_out                          :   OUT   std_logic;  -- ufix1
          a_b_r                           :   OUT   std_logic_vector(32 DOWNTO 0);  -- sfix33_En16
          a_b_i                           :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33_En16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : complex_m_ip_src_complex_multiply
    USE ENTITY work.complex_m_ip_src_complex_multiply(rtl);

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL ce_out_sig                       : std_logic;  -- ufix1
  SIGNAL a_b_r_sig                        : std_logic_vector(32 DOWNTO 0);  -- ufix33
  SIGNAL a_b_i_sig                        : std_logic_vector(32 DOWNTO 0);  -- ufix33

BEGIN
  u_complex_m_ip_src_complex_multiply : complex_m_ip_src_complex_multiply
    PORT MAP( clk => clk,
              clk_enable => enb,
              reset_x => reset_x,
              ar => ar,  -- sfix16_En8
              ai => ai,  -- sfix16_En8
              br => br,  -- sfix16_En8
              bi => bi,  -- sfix16_En8
              ce_out => ce_out_sig,  -- ufix1
              a_b_r => a_b_r_sig,  -- sfix33_En16
              a_b_i => a_b_i_sig  -- sfix33_En16
              );

  enb <= dut_enable;

  ce_out <= ce_out_sig;

  a_b_r <= a_b_r_sig;

  a_b_i <= a_b_i_sig;

END rtl;

