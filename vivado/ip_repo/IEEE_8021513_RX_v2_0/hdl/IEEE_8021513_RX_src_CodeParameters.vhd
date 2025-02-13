-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_CodeParameters.vhd
-- Created: 2024-11-23 11:22:01
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_CodeParameters
-- Source Path: HDLRx/full_rx/LDPC_shared/LDPC Decoder/CodeParameters
-- Hierarchy Level: 3
-- Model version: 1.147
-- 
-- Code Parameters
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_CodeParameters IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data                              :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        start                             :   IN    std_logic;  -- ufix1
        end_rsvd                          :   IN    std_logic;  -- ufix1
        valid                             :   IN    std_logic;  -- ufix1
        reset                             :   OUT   std_logic;  -- ufix1
        datacp                            :   OUT   std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        validcp                           :   OUT   std_logic;  -- ufix1
        framevalid                        :   OUT   std_logic;  -- ufix1
        endind                            :   OUT   std_logic;  -- ufix1
        nitero                            :   OUT   std_logic_vector(7 DOWNTO 0)  -- ufix8
        );
END IEEE_8021513_RX_src_CodeParameters;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_CodeParameters IS

  -- Functions
  -- HDLCODER_TO_STDLOGIC 
  FUNCTION hdlcoder_to_stdlogic(arg: boolean) RETURN std_logic IS
  BEGIN
    IF arg THEN
      RETURN '1';
    ELSE
      RETURN '0';
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL frameController_frameValid       : std_logic;
  SIGNAL frameController_endReg           : std_logic;
  SIGNAL frameController_validReg         : std_logic;
  SIGNAL frameController_endInd           : std_logic;
  SIGNAL frameController_frameValid_next  : std_logic;
  SIGNAL frameController_endInd_next      : std_logic;
  SIGNAL frameController_reset            : std_logic;
  SIGNAL frameController_frameValid_temp  : std_logic;
  SIGNAL frameController_endInd_temp      : std_logic;
  SIGNAL reset_1                          : std_logic;  -- ufix1
  SIGNAL Valid_1                          : std_logic;  -- ufix1
  SIGNAL frameValid_1                     : std_logic;  -- ufix1
  SIGNAL endInd_1                         : std_logic;  -- ufix1
  SIGNAL data_signed                      : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL datacp_tmp                       : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL nitero_tmp                       : unsigned(7 DOWNTO 0);  -- ufix8

BEGIN
  frameController_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        frameController_frameValid <= '0';
        frameController_endReg <= '0';
        frameController_validReg <= '0';
        frameController_endInd <= '0';
      ELSIF enb = '1' THEN
        frameController_frameValid <= frameController_frameValid_next;
        frameController_endInd <= frameController_endInd_next;
        frameController_endReg <= end_rsvd;
        frameController_validReg <= valid;
      END IF;
    END IF;
  END PROCESS frameController_process;

  frameController_reset <= hdlcoder_to_stdlogic((start /= '0') AND (valid /= '0'));
  
  frameController_frameValid_temp <= '1' WHEN frameController_reset = '1' ELSE
      '0' WHEN (frameController_endReg AND frameController_validReg) = '1' ELSE
      frameController_frameValid;
  
  frameController_endInd_temp <= '0' WHEN (start /= '0') AND (valid /= '0') ELSE
      '1' WHEN (frameController_endReg AND frameController_validReg) = '1' ELSE
      frameController_endInd;
  reset_1 <= frameController_reset;
  Valid_1 <= valid;
  frameValid_1 <= frameController_frameValid_temp;
  endInd_1 <= frameController_endInd_temp;
  frameController_frameValid_next <= frameController_frameValid_temp;
  frameController_endInd_next <= frameController_endInd_temp;

  alpha0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        reset <= '0';
      ELSIF enb = '1' THEN
        reset <= reset_1;
      END IF;
    END IF;
  END PROCESS alpha0_process;


  data_signed <= signed(data);

  alpha0_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        datacp_tmp <= to_signed(16#0#, 4);
      ELSIF enb = '1' THEN
        datacp_tmp <= data_signed;
      END IF;
    END IF;
  END PROCESS alpha0_1_process;


  datacp <= std_logic_vector(datacp_tmp);

  alpha0_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        validcp <= '0';
      ELSIF enb = '1' THEN
        validcp <= Valid_1;
      END IF;
    END IF;
  END PROCESS alpha0_2_process;


  alpha0_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        framevalid <= '0';
      ELSIF enb = '1' THEN
        framevalid <= frameValid_1;
      END IF;
    END IF;
  END PROCESS alpha0_3_process;


  alpha0_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        endind <= '0';
      ELSIF enb = '1' THEN
        endind <= endInd_1;
      END IF;
    END IF;
  END PROCESS alpha0_4_process;


  nitero_tmp <= to_unsigned(16#01#, 8);

  nitero <= std_logic_vector(nitero_tmp);

END rtl;

