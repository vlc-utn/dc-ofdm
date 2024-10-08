-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLHeaderFull/header_full_ip_src_header_full_tc.vhd
-- Created: 2024-08-31 15:23:55
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: header_full_ip_src_header_full_tc
-- Source Path: header_full_tc
-- Hierarchy Level: 1
-- 
-- Master clock enable input: clk_enable
-- 
-- enb         : identical to clk_enable
-- enb_1_1_1   : identical to clk_enable
-- enb_1_8_0   : 8x slower than clk with last phase
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY header_full_ip_src_header_full_tc IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_1_1                         :   OUT   std_logic;
        enb_1_8_0                         :   OUT   std_logic
        );
END header_full_ip_src_header_full_tc;


ARCHITECTURE rtl OF header_full_ip_src_header_full_tc IS

  -- Signals
  SIGNAL count8                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL comp_0_tmp                       : std_logic;
  SIGNAL phase_0_tmp                      : std_logic;
  SIGNAL phase_0                          : std_logic;
  SIGNAL enb_1_8_0_1                      : std_logic;

BEGIN
  enb <= clk_enable;

  enb_1_1_1 <= clk_enable;

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 7
  counter_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count8 <= to_unsigned(16#1#, 3);
      ELSIF clk_enable = '1' THEN
        count8 <= count8 + to_unsigned(16#1#, 3);
      END IF;
    END IF;
  END PROCESS counter_8_process;


  
  comp_0_tmp <= '1' WHEN count8 = to_unsigned(16#7#, 3) ELSE
      '0';

  phase_0_tmp <= comp_0_tmp AND clk_enable;

  phase_delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_0 <= '0';
      ELSIF clk_enable = '1' THEN
        phase_0 <= phase_0_tmp;
      END IF;
    END IF;
  END PROCESS phase_delay_process;


  enb_1_8_0_1 <= phase_0 AND clk_enable;

  enb_1_8_0 <= enb_1_8_0_1;

END rtl;

