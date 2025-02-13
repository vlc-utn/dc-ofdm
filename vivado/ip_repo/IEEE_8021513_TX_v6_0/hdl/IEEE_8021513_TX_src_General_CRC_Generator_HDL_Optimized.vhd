-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized.vhd
-- Created: 2024-11-21 09:59:25
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized
-- Source Path: HDLTx/full_tx/header_full/h_crc/General CRC Generator HDL Optimized
-- Hierarchy Level: 3
-- Model version: 4.222
-- 
-- CRC Generator HDL Optimized
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn                            :   IN    std_logic;
        startIn                           :   IN    std_logic;
        endIn                             :   IN    std_logic;
        validIn                           :   IN    std_logic;
        dataOut                           :   OUT   std_logic;
        startOut                          :   OUT   std_logic;
        endOut                            :   OUT   std_logic;
        validOut                          :   OUT   std_logic
        );
END IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_General_CRC_Generator_HDL_Optimized IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_CRCGenControl
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          startIn                         :   IN    std_logic;
          endIn                           :   IN    std_logic;
          validIn                         :   IN    std_logic;
          startOut                        :   OUT   std_logic;
          processMsg                      :   OUT   std_logic;
          padZero                         :   OUT   std_logic;
          outputCRC                       :   OUT   std_logic;
          endOut                          :   OUT   std_logic;
          validOut                        :   OUT   std_logic;
          counter                         :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          counter_outputCRC               :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_CRCGenCompute
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          datainReg                       :   IN    std_logic;
          validIn                         :   IN    std_logic;
          processMsg                      :   IN    std_logic;
          padZero                         :   IN    std_logic;
          counter                         :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          crcChecksum                     :   OUT   std_logic_vector(15 DOWNTO 0)  -- boolean [16]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_CRCGenControl
    USE ENTITY work.IEEE_8021513_TX_src_CRCGenControl(rtl);

  FOR ALL : IEEE_8021513_TX_src_CRCGenCompute
    USE ENTITY work.IEEE_8021513_TX_src_CRCGenCompute(rtl);

  -- Signals
  SIGNAL startIn_vld                      : std_logic;
  SIGNAL endIn_vld                        : std_logic;
  SIGNAL tstartout                        : std_logic;
  SIGNAL processMsg                       : std_logic;
  SIGNAL padZero                          : std_logic;
  SIGNAL outputCRC                        : std_logic;
  SIGNAL lastfout                         : std_logic;
  SIGNAL validdata                        : std_logic;
  SIGNAL counter                          : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL counter_opcrc                    : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL const0                           : std_logic;  -- ufix1
  SIGNAL msgenb                           : std_logic;
  SIGNAL datainReg                        : std_logic;
  SIGNAL alpha_reg                        : std_logic_vector(15 DOWNTO 0);  -- ufix1 [16]
  SIGNAL dataBuffer                       : std_logic;  -- ufix1
  SIGNAL counter_opcrc_unsigned           : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL crcCheckSum                      : std_logic_vector(15 DOWNTO 0);  -- boolean [16]
  SIGNAL crcCheckSum_0                    : std_logic;
  SIGNAL crcCheckSum_1                    : std_logic;
  SIGNAL crcCheckSum_2                    : std_logic;
  SIGNAL crcCheckSum_3                    : std_logic;
  SIGNAL crcCheckSum_4                    : std_logic;
  SIGNAL crcCheckSum_5                    : std_logic;
  SIGNAL crcCheckSum_6                    : std_logic;
  SIGNAL crcCheckSum_7                    : std_logic;
  SIGNAL crcCheckSum_8                    : std_logic;
  SIGNAL crcCheckSum_9                    : std_logic;
  SIGNAL crcCheckSum_10                   : std_logic;
  SIGNAL crcCheckSum_11                   : std_logic;
  SIGNAL crcCheckSum_12                   : std_logic;
  SIGNAL crcCheckSum_13                   : std_logic;
  SIGNAL crcCheckSum_14                   : std_logic;
  SIGNAL crcCheckSum_15                   : std_logic;
  SIGNAL crcOut                           : std_logic;  -- ufix1
  SIGNAL msgcrc                           : std_logic;  -- ufix1
  SIGNAL tdataout                         : std_logic;  -- ufix1

BEGIN
  u_Controlsignal_inst : IEEE_8021513_TX_src_CRCGenControl
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              startIn => startIn_vld,
              endIn => endIn_vld,
              validIn => validIn,
              startOut => tstartout,
              processMsg => processMsg,
              padZero => padZero,
              outputCRC => outputCRC,
              endOut => lastfout,
              validOut => validdata,
              counter => counter,  -- ufix4
              counter_outputCRC => counter_opcrc  -- ufix4
              );

  u_ComputeCRC_inst : IEEE_8021513_TX_src_CRCGenCompute
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              datainReg => datainReg,
              validIn => validIn,
              processMsg => processMsg,
              padZero => padZero,
              counter => counter,  -- ufix4
              crcChecksum => crcCheckSum  -- boolean [16]
              );

  startIn_vld <= startIn AND validIn;

  endIn_vld <= endIn AND validIn;

  -- Constant Zero
  const0 <= '0';

  msgenb <= processMsg OR padZero;

  datainput_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        datainReg <= '0';
      ELSIF enb = '1' THEN
        datainReg <= dataIn;
      END IF;
    END IF;
  END PROCESS datainput_register_process;


  -- Buffer Input Data
  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alpha_reg <= (OTHERS => '0');
      ELSIF enb = '1' AND msgenb = '1' THEN
        alpha_reg(0) <= datainReg;
        alpha_reg(15 DOWNTO 1) <= alpha_reg(14 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS c_process;

  dataBuffer <= alpha_reg(15);

  counter_opcrc_unsigned <= unsigned(counter_opcrc);

  -- Select CRC output bits
  crcCheckSum_0 <= crcCheckSum(0);

  -- Select CRC output bits
  crcCheckSum_1 <= crcCheckSum(1);

  -- Select CRC output bits
  crcCheckSum_2 <= crcCheckSum(2);

  -- Select CRC output bits
  crcCheckSum_3 <= crcCheckSum(3);

  -- Select CRC output bits
  crcCheckSum_4 <= crcCheckSum(4);

  -- Select CRC output bits
  crcCheckSum_5 <= crcCheckSum(5);

  -- Select CRC output bits
  crcCheckSum_6 <= crcCheckSum(6);

  -- Select CRC output bits
  crcCheckSum_7 <= crcCheckSum(7);

  -- Select CRC output bits
  crcCheckSum_8 <= crcCheckSum(8);

  -- Select CRC output bits
  crcCheckSum_9 <= crcCheckSum(9);

  -- Select CRC output bits
  crcCheckSum_10 <= crcCheckSum(10);

  -- Select CRC output bits
  crcCheckSum_11 <= crcCheckSum(11);

  -- Select CRC output bits
  crcCheckSum_12 <= crcCheckSum(12);

  -- Select CRC output bits
  crcCheckSum_13 <= crcCheckSum(13);

  -- Select CRC output bits
  crcCheckSum_14 <= crcCheckSum(14);

  -- Select CRC output bits
  crcCheckSum_15 <= crcCheckSum(15);

  
  crcOut <= crcCheckSum_0 WHEN counter_opcrc_unsigned = to_unsigned(16#0#, 4) ELSE
      crcCheckSum_1 WHEN counter_opcrc_unsigned = to_unsigned(16#1#, 4) ELSE
      crcCheckSum_2 WHEN counter_opcrc_unsigned = to_unsigned(16#2#, 4) ELSE
      crcCheckSum_3 WHEN counter_opcrc_unsigned = to_unsigned(16#3#, 4) ELSE
      crcCheckSum_4 WHEN counter_opcrc_unsigned = to_unsigned(16#4#, 4) ELSE
      crcCheckSum_5 WHEN counter_opcrc_unsigned = to_unsigned(16#5#, 4) ELSE
      crcCheckSum_6 WHEN counter_opcrc_unsigned = to_unsigned(16#6#, 4) ELSE
      crcCheckSum_7 WHEN counter_opcrc_unsigned = to_unsigned(16#7#, 4) ELSE
      crcCheckSum_8 WHEN counter_opcrc_unsigned = to_unsigned(16#8#, 4) ELSE
      crcCheckSum_9 WHEN counter_opcrc_unsigned = to_unsigned(16#9#, 4) ELSE
      crcCheckSum_10 WHEN counter_opcrc_unsigned = to_unsigned(16#A#, 4) ELSE
      crcCheckSum_11 WHEN counter_opcrc_unsigned = to_unsigned(16#B#, 4) ELSE
      crcCheckSum_12 WHEN counter_opcrc_unsigned = to_unsigned(16#C#, 4) ELSE
      crcCheckSum_13 WHEN counter_opcrc_unsigned = to_unsigned(16#D#, 4) ELSE
      crcCheckSum_14 WHEN counter_opcrc_unsigned = to_unsigned(16#E#, 4) ELSE
      crcCheckSum_15;

  
  msgcrc <= dataBuffer WHEN outputCRC = '0' ELSE
      crcOut;

  -- Output data and CRC CheckSum
  
  tdataout <= const0 WHEN validdata = '0' ELSE
      msgcrc;

  -- Data output register
  dataOut_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        dataOut <= '0';
      ELSIF enb = '1' THEN
        dataOut <= tdataout;
      END IF;
    END IF;
  END PROCESS dataOut_register_process;


  -- startOut output register
  startOut_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        startOut <= '0';
      ELSIF enb = '1' THEN
        startOut <= tstartout;
      END IF;
    END IF;
  END PROCESS startOut_register_process;


  -- endOut output register
  endout_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        endOut <= '0';
      ELSIF enb = '1' THEN
        endOut <= lastfout;
      END IF;
    END IF;
  END PROCESS endout_register_process;


  -- validOut output register
  validout_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        validOut <= '0';
      ELSIF enb = '1' THEN
        validOut <= validdata;
      END IF;
    END IF;
  END PROCESS validout_register_process;


END rtl;

