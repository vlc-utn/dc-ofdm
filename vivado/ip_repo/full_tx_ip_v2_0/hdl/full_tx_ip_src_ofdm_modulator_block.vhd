-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_src_ofdm_modulator_block.vhd
-- Created: 2024-09-01 16:46:30
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_src_ofdm_modulator_block
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/ofdm_modulator
-- Hierarchy Level: 2
-- Model version: 4.102
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_tx_ip_src_full_tx_pac.ALL;

ENTITY full_tx_ip_src_ofdm_modulator_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_in_im                        :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_in                          :   IN    std_logic;
        cp_len                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        data_out_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_out_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_out                         :   OUT   std_logic;
        ready                             :   OUT   std_logic
        );
END full_tx_ip_src_ofdm_modulator_block;


ARCHITECTURE rtl OF full_tx_ip_src_ofdm_modulator_block IS

  -- Component Declarations
  COMPONENT full_tx_ip_src_OFDM_Modulator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid                           :   IN    std_logic;
          FFTLen                          :   IN    std_logic_vector(8 DOWNTO 0);  -- ufix9
          CPLen                           :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
          numLgSc                         :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          numRgSc                         :   IN    std_logic_vector(5 DOWNTO 0);  -- ufix6
          data_re_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_im_1                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_1                         :   OUT   std_logic;
          ready                           :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_tx_ip_src_OFDM_Modulator
    USE ENTITY work.full_tx_ip_src_OFDM_Modulator(rtl);

  -- Signals
  SIGNAL Constant2_out1                   : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Delay2_reg                       : vector_of_unsigned9(0 TO 1);  -- ufix9 [2]
  SIGNAL Delay2_out1                      : unsigned(8 DOWNTO 0);  -- ufix9
  SIGNAL Constant4_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Delay_reg                        : vector_of_unsigned6(0 TO 1);  -- ufix6 [2]
  SIGNAL Delay_out1                       : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Constant3_out1                   : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Delay1_reg                       : vector_of_unsigned6(0 TO 1);  -- ufix6 [2]
  SIGNAL Delay1_out1                      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL data_re                          : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL data_im                          : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL valid                            : std_logic;

BEGIN
  u_OFDM_Modulator : full_tx_ip_src_OFDM_Modulator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_re => data_in_re,  -- sfix12_En10
              data_im => data_in_im,  -- sfix12_En10
              valid => valid_in,
              FFTLen => std_logic_vector(Delay2_out1),  -- ufix9
              CPLen => cp_len,  -- uint8
              numLgSc => std_logic_vector(Delay_out1),  -- ufix6
              numRgSc => std_logic_vector(Delay1_out1),  -- ufix6
              data_re_1 => data_re,  -- sfix12_En10
              data_im_1 => data_im,  -- sfix12_En10
              valid_1 => valid,
              ready => ready
              );

  Constant2_out1 <= to_unsigned(16#100#, 9);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_reg <= (OTHERS => to_unsigned(16#000#, 9));
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_reg(0) <= Constant2_out1;
        Delay2_reg(1) <= Delay2_reg(0);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(1);

  Constant4_out1 <= to_unsigned(16#19#, 6);

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_reg <= (OTHERS => to_unsigned(16#00#, 6));
      ELSIF enb_1_2_0 = '1' THEN
        Delay_reg(0) <= Constant4_out1;
        Delay_reg(1) <= Delay_reg(0);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1 <= Delay_reg(1);

  Constant3_out1 <= to_unsigned(16#25#, 6);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_reg <= (OTHERS => to_unsigned(16#00#, 6));
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_reg(0) <= Constant3_out1;
        Delay1_reg(1) <= Delay1_reg(0);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(1);

  data_out_re <= data_re;

  data_out_im <= data_im;

  valid_out <= valid;

END rtl;

