-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxPayload/rx_payload_ip_src_BetaDecompress_2.vhd
-- Created: 2024-10-03 13:09:50
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_payload_ip_src_BetaDecompress_2
-- Source Path: HDLRxPayload/rx_payload_full/reduced_ldpc_rx/Hc_12S_B80/DecoderCore/FunctionalUnit/BetaDecompress_2
-- Hierarchy Level: 5
-- Model version: 1.67
-- 
-- Beta_Decompress_Unit_2
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_payload_ip_src_rx_payload_full_pac.ALL;

ENTITY rx_payload_ip_src_BetaDecompress_2 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        betacomp1                         :   IN    vector_of_std_logic_vector7(0 TO 79);  -- ufix7 [80]
        betacomp2                         :   IN    vector_of_std_logic_vector4(0 TO 79);  -- ufix4 [80]
        betacomp3                         :   IN    vector_of_std_logic_vector6(0 TO 79);  -- ufix6 [80]
        validin                           :   IN    std_logic;  -- ufix1
        count                             :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
        reset                             :   IN    std_logic;  -- ufix1
        beta                              :   OUT   vector_of_std_logic_vector4(0 TO 79)  -- sfix4_En1 [80]
        );
END rx_payload_ip_src_BetaDecompress_2;


ARCHITECTURE rtl OF rx_payload_ip_src_BetaDecompress_2 IS

  -- Component Declarations
  COMPONENT rx_payload_ip_src_BetaCalculation_2
    PORT( signs                           :   IN    std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
          prodsign                        :   IN    std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
          minidx                          :   IN    vector_of_std_logic_vector3(0 TO 79);  -- ufix3 [80]
          min1                            :   IN    vector_of_std_logic_vector4(0 TO 79);  -- ufix4_En1 [80]
          min2                            :   IN    vector_of_std_logic_vector4(0 TO 79);  -- ufix4_En1 [80]
          count                           :   IN    std_logic_vector(2 DOWNTO 0);  -- ufix3
          beta                            :   OUT   vector_of_std_logic_vector4(0 TO 79)  -- sfix4_En1 [80]
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_payload_ip_src_BetaCalculation_2
    USE ENTITY work.rx_payload_ip_src_BetaCalculation_2(rtl);

  -- Signals
  SIGNAL count_unsigned                   : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL const1                           : std_logic;  -- ufix1
  SIGNAL AddComp_add_cast                 : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL countIdx                         : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL resetCount                       : std_logic;  -- ufix1
  SIGNAL alpha_switch_delay               : std_logic;  -- ufix1
  SIGNAL enbCount                         : std_logic;  -- ufix1
  SIGNAL enbCountReg                      : std_logic;  -- ufix1
  SIGNAL countVal                         : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL countValReg                      : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL countMax                         : std_logic;  -- ufix1
  SIGNAL betacomp1_unsigned               : vector_of_unsigned7(0 TO 79);  -- ufix7 [80]
  SIGNAL sign_1                           : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sign_2                           : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sign_3                           : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sign_4                           : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sign_5                           : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sign_6                           : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sign_7                           : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL signs                            : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL betacomp2_unsigned               : vector_of_unsigned4(0 TO 79);  -- ufix4 [80]
  SIGNAL betacomp3_unsigned               : vector_of_unsigned6(0 TO 79);  -- ufix6 [80]
  SIGNAL prodsign                         : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL min_index                        : vector_of_unsigned3(0 TO 79);  -- ufix3 [80]
  SIGNAL min_index_1                      : vector_of_std_logic_vector3(0 TO 79);  -- ufix3 [80]
  SIGNAL min1_dtc                         : vector_of_unsigned3(0 TO 79);  -- ufix3 [80]
  SIGNAL sMin1                            : vector_of_unsigned4(0 TO 79);  -- ufix4_En1 [80]
  SIGNAL sMin1_1                          : vector_of_std_logic_vector4(0 TO 79);  -- ufix4 [80]
  SIGNAL min2_dtc                         : vector_of_unsigned3(0 TO 79);  -- ufix3 [80]
  SIGNAL sMin2                            : vector_of_unsigned4(0 TO 79);  -- ufix4_En1 [80]
  SIGNAL sMin2_1                          : vector_of_std_logic_vector4(0 TO 79);  -- ufix4 [80]
  SIGNAL betaReg                          : vector_of_std_logic_vector4(0 TO 79);  -- ufix4 [80]
  SIGNAL betaReg_signed                   : vector_of_signed4(0 TO 79);  -- sfix4_En1 [80]
  SIGNAL beta_tmp                         : vector_of_signed4(0 TO 79);  -- sfix4_En1 [80]

BEGIN
  u_BetaCalUnit : rx_payload_ip_src_BetaCalculation_2
    PORT MAP( signs => signs,  -- ufix1 [80]
              prodsign => prodsign,  -- ufix1 [80]
              minidx => min_index_1,  -- ufix3 [80]
              min1 => sMin1_1,  -- ufix4_En1 [80]
              min2 => sMin2_1,  -- ufix4_En1 [80]
              count => std_logic_vector(countVal),  -- ufix3
              beta => betaReg  -- sfix4_En1 [80]
              );

  count_unsigned <= unsigned(count);

  const1 <= '1';

  AddComp_add_cast <= '0' & '0' & const1;
  countIdx <= count_unsigned + AddComp_add_cast;

  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alpha_switch_delay <= '0';
      ELSIF enb = '1' THEN
        IF resetCount = '1' THEN
          alpha_switch_delay <= '0';
        ELSIF validin = '1' THEN
          alpha_switch_delay <= validin;
        END IF;
      END IF;
    END IF;
  END PROCESS c_process;

  
  enbCount <= '0' WHEN resetCount = '1' ELSE
      alpha_switch_delay;

  enbCountReg <= validin OR enbCount;

  c_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        countValReg <= to_unsigned(16#0#, 3);
      ELSIF enb = '1' THEN
        countValReg <= countVal;
      END IF;
    END IF;
  END PROCESS c_1_process;


  
  countMax <= '1' WHEN countIdx = countValReg ELSE
      '0';

  resetCount <= countMax OR reset;

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 7
  counter_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        countVal <= to_unsigned(16#0#, 3);
      ELSIF enb = '1' THEN
        IF resetCount = '1' THEN 
          countVal <= to_unsigned(16#0#, 3);
        ELSIF enbCountReg = '1' THEN 
          countVal <= countVal + to_unsigned(16#1#, 3);
        END IF;
      END IF;
    END IF;
  END PROCESS counter_process;


  outputgen7: FOR k18 IN 0 TO 79 GENERATE
    betacomp1_unsigned(k18) <= unsigned(betacomp1(k18));
  END GENERATE;


  sign_1_gen: FOR k IN 0 TO 79 GENERATE
    sign_1(k) <= betacomp1_unsigned(k)(6);
  END GENERATE sign_1_gen;



  sign_2_gen: FOR k1 IN 0 TO 79 GENERATE
    sign_2(k1) <= betacomp1_unsigned(k1)(5);
  END GENERATE sign_2_gen;



  sign_3_gen: FOR k2 IN 0 TO 79 GENERATE
    sign_3(k2) <= betacomp1_unsigned(k2)(4);
  END GENERATE sign_3_gen;



  sign_4_gen: FOR k3 IN 0 TO 79 GENERATE
    sign_4(k3) <= betacomp1_unsigned(k3)(3);
  END GENERATE sign_4_gen;



  sign_5_gen: FOR k4 IN 0 TO 79 GENERATE
    sign_5(k4) <= betacomp1_unsigned(k4)(2);
  END GENERATE sign_5_gen;



  sign_6_gen: FOR k5 IN 0 TO 79 GENERATE
    sign_6(k5) <= betacomp1_unsigned(k5)(1);
  END GENERATE sign_6_gen;



  sign_7_gen: FOR k6 IN 0 TO 79 GENERATE
    sign_7(k6) <= betacomp1_unsigned(k6)(0);
  END GENERATE sign_7_gen;


  multiportswitch_output : PROCESS (countVal, sign_1, sign_2, sign_3, sign_4, sign_5, sign_6, sign_7)
  BEGIN
    IF countVal = to_unsigned(16#0#, 3) THEN 
      signs <= sign_1;
    ELSIF countVal = to_unsigned(16#1#, 3) THEN 
      signs <= sign_2;
    ELSIF countVal = to_unsigned(16#2#, 3) THEN 
      signs <= sign_3;
    ELSIF countVal = to_unsigned(16#3#, 3) THEN 
      signs <= sign_4;
    ELSIF countVal = to_unsigned(16#4#, 3) THEN 
      signs <= sign_5;
    ELSIF countVal = to_unsigned(16#5#, 3) THEN 
      signs <= sign_6;
    ELSIF countVal = to_unsigned(16#6#, 3) THEN 
      signs <= sign_7;
    ELSE 
      signs <= sign_1;
    END IF;
  END PROCESS multiportswitch_output;


  outputgen6: FOR k17 IN 0 TO 79 GENERATE
    betacomp2_unsigned(k17) <= unsigned(betacomp2(k17));
  END GENERATE;

  outputgen5: FOR k16 IN 0 TO 79 GENERATE
    betacomp3_unsigned(k16) <= unsigned(betacomp3(k16));
  END GENERATE;


  prodsign_gen: FOR k7 IN 0 TO 79 GENERATE
    prodsign(k7) <= betacomp2_unsigned(k7)(3);
  END GENERATE prodsign_gen;



  min_index_gen: FOR k8 IN 0 TO 79 GENERATE
    min_index(k8) <= betacomp2_unsigned(k8)(2 DOWNTO 0);
  END GENERATE min_index_gen;


  outputgen4: FOR k15 IN 0 TO 79 GENERATE
    min_index_1(k15) <= std_logic_vector(min_index(k15));
  END GENERATE;


  min1_dtc_gen: FOR k9 IN 0 TO 79 GENERATE
    min1_dtc(k9) <= betacomp3_unsigned(k9)(5 DOWNTO 3);
  END GENERATE min1_dtc_gen;



  sMin1_gen: FOR ii IN 0 TO 79 GENERATE
    sMin1(ii) <= resize(min1_dtc(ii), 4);
  END GENERATE sMin1_gen;


  outputgen3: FOR k14 IN 0 TO 79 GENERATE
    sMin1_1(k14) <= std_logic_vector(sMin1(k14));
  END GENERATE;


  min2_dtc_gen: FOR k10 IN 0 TO 79 GENERATE
    min2_dtc(k10) <= betacomp3_unsigned(k10)(2 DOWNTO 0);
  END GENERATE min2_dtc_gen;



  sMin2_gen: FOR ii1 IN 0 TO 79 GENERATE
    sMin2(ii1) <= resize(min2_dtc(ii1), 4);
  END GENERATE sMin2_gen;


  outputgen2: FOR k13 IN 0 TO 79 GENERATE
    sMin2_1(k13) <= std_logic_vector(sMin2(k13));
  END GENERATE;

  outputgen1: FOR k12 IN 0 TO 79 GENERATE
    betaReg_signed(k12) <= signed(betaReg(k12));
  END GENERATE;

  beta_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        beta_tmp <= (OTHERS => to_signed(16#0#, 4));
      ELSIF enb = '1' THEN
        beta_tmp <= betaReg_signed;
      END IF;
    END IF;
  END PROCESS beta_1_process;


  outputgen: FOR k11 IN 0 TO 79 GENERATE
    beta(k11) <= std_logic_vector(beta_tmp(k11));
  END GENERATE;

END rtl;
