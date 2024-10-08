-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_raw_src_full_tx_tc.vhd
-- Created: 2024-08-31 20:20:57
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_raw_src_full_tx_tc
-- Source Path: full_tx_tc
-- Hierarchy Level: 1
-- 
-- Master clock enable input: clk_enable
-- 
-- enb         : identical to clk_enable
-- enb_1_1_1   : identical to clk_enable
-- enb_1_2_0   : 2x slower than clk with last phase
-- enb_1_2_1   : 2x slower than clk with phase 1
-- enb_1_8_0   : 8x slower than clk with last phase
-- enb_1_8_1   : 8x slower than clk with phase 1
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_raw_src_full_tx_tc IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        enb                               :   OUT   std_logic;
        enb_1_1_1                         :   OUT   std_logic;
        enb_1_2_0                         :   OUT   std_logic;
        enb_1_2_1                         :   OUT   std_logic;
        enb_1_8_0                         :   OUT   std_logic;
        enb_1_8_1                         :   OUT   std_logic
        );
END full_tx_raw_src_full_tx_tc;


ARCHITECTURE rtl OF full_tx_raw_src_full_tx_tc IS

  -- Signals
  SIGNAL count2                           : std_logic;  -- ufix1
  SIGNAL comp_0_tmp                       : std_logic;
  SIGNAL phase_0_tmp                      : std_logic;
  SIGNAL phase_0                          : std_logic;
  SIGNAL enb_1_2_0_1                      : std_logic;
  SIGNAL comp_1_tmp                       : std_logic;
  SIGNAL phase_1_tmp                      : std_logic;
  SIGNAL phase_1                          : std_logic;
  SIGNAL enb_1_2_1_1                      : std_logic;
  SIGNAL count8                           : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL comp_0_tmp_1                     : std_logic;
  SIGNAL phase_0_tmp_1                    : std_logic;
  SIGNAL phase_0_1                        : std_logic;
  SIGNAL enb_1_8_0_1                      : std_logic;
  SIGNAL comp_1_tmp_1                     : std_logic;
  SIGNAL phase_1_tmp_1                    : std_logic;
  SIGNAL phase_1_1                        : std_logic;
  SIGNAL enb_1_8_1_1                      : std_logic;

BEGIN
  enb <= clk_enable;

  enb_1_1_1 <= clk_enable;

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 1
  counter_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count2 <= '1';
      ELSIF clk_enable = '1' THEN
        count2 <=  NOT count2;
      END IF;
    END IF;
  END PROCESS counter_2_process;


  
  comp_0_tmp <= '1' WHEN count2 = '1' ELSE
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


  enb_1_2_0_1 <= phase_0 AND clk_enable;

  enb_1_2_0 <= enb_1_2_0_1;

  
  comp_1_tmp <= '1' WHEN count2 = '0' ELSE
      '0';

  phase_1_tmp <= comp_1_tmp AND clk_enable;

  phase_delay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_1 <= '1';
      ELSIF clk_enable = '1' THEN
        phase_1 <= phase_1_tmp;
      END IF;
    END IF;
  END PROCESS phase_delay_1_process;


  enb_1_2_1_1 <= phase_1 AND clk_enable;

  enb_1_2_1 <= enb_1_2_1_1;

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


  
  comp_0_tmp_1 <= '1' WHEN count8 = to_unsigned(16#7#, 3) ELSE
      '0';

  phase_0_tmp_1 <= comp_0_tmp_1 AND clk_enable;

  phase_delay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_0_1 <= '0';
      ELSIF clk_enable = '1' THEN
        phase_0_1 <= phase_0_tmp_1;
      END IF;
    END IF;
  END PROCESS phase_delay_2_process;


  enb_1_8_0_1 <= phase_0_1 AND clk_enable;

  enb_1_8_0 <= enb_1_8_0_1;

  
  comp_1_tmp_1 <= '1' WHEN count8 = to_unsigned(16#0#, 3) ELSE
      '0';

  phase_1_tmp_1 <= comp_1_tmp_1 AND clk_enable;

  phase_delay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        phase_1_1 <= '1';
      ELSIF clk_enable = '1' THEN
        phase_1_1 <= phase_1_tmp_1;
      END IF;
    END IF;
  END PROCESS phase_delay_3_process;


  enb_1_8_1_1 <= phase_1_1 AND clk_enable;

  enb_1_8_1 <= enb_1_8_1_1;

END rtl;

