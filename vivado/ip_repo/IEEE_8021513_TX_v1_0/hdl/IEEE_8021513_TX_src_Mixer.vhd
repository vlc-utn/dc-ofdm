-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_Mixer.vhd
-- Created: 2024-09-15 21:02:44
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_Mixer
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/frequency_upshift/Mixer
-- Hierarchy Level: 3
-- Model version: 4.135
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_TX_src_full_tx_pac.ALL;

ENTITY IEEE_8021513_TX_src_Mixer IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        dataIn_re                         :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En16
        dataIn_im                         :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En16
        ncoIn_re                          :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En16
        ncoIn_im                          :   IN    std_logic_vector(19 DOWNTO 0);  -- sfix20_En16
        mixedOut                          :   OUT   std_logic_vector(19 DOWNTO 0)  -- sfix20_En16
        );
END IEEE_8021513_TX_src_Mixer;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_Mixer IS

  -- Signals
  SIGNAL dataIn_re_signed                 : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL dataIn_im_signed                 : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl                     : std_logic;
  SIGNAL delayMatch10_reg                 : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_1                   : std_logic;
  SIGNAL enb_gated                        : std_logic;
  SIGNAL Delay9_reg_re                    : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay9_reg_im                    : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay9_out1_re                   : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Delay9_out1_im                   : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_2                   : std_logic;
  SIGNAL delayMatch6_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_3                   : std_logic;
  SIGNAL enb_gated_1                      : std_logic;
  SIGNAL Delay5_reg_re                    : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay5_reg_im                    : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay5_out1_re                   : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Delay5_out1_im                   : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_4                   : std_logic;
  SIGNAL delayMatch1_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_5                   : std_logic;
  SIGNAL enb_gated_2                      : std_logic;
  SIGNAL Delay1_reg                       : vector_of_signed20(0 TO 2) := (OTHERS => to_signed(16#00000#, 20));  -- sfix20 [3]
  SIGNAL Delay1_out1                      : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL ncoIn_re_signed                  : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL ncoIn_im_signed                  : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_6                   : std_logic;
  SIGNAL delayMatch9_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_7                   : std_logic;
  SIGNAL enb_gated_3                      : std_logic;
  SIGNAL Delay8_reg_re                    : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay8_reg_im                    : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay8_out1_re                   : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Delay8_out1_im                   : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Gain_cast                        : signed(39 DOWNTO 0);  -- sfix40_En33
  SIGNAL Gain_cast_1                      : signed(39 DOWNTO 0);  -- sfix40_En33
  SIGNAL Gain_out1_re                     : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Gain_out1_im                     : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_9                   : std_logic;
  SIGNAL delayMatch_reg                   : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_10                  : std_logic;
  SIGNAL enb_gated_4                      : std_logic;
  SIGNAL Delay_reg_re                     : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay_reg_im                     : vector_of_signed20(0 TO 1);  -- sfix20_En16 [2]
  SIGNAL Delay_out1_re                    : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Delay_out1_im                    : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_11                  : std_logic;
  SIGNAL delayMatch4_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_12                  : std_logic;
  SIGNAL enb_gated_5                      : std_logic;
  SIGNAL Delay3_reg                       : vector_of_signed20(0 TO 2) := (OTHERS => to_signed(16#00000#, 20));  -- sfix20 [3]
  SIGNAL Delay3_out1                      : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Product1_mul_temp                : signed(39 DOWNTO 0);  -- sfix40_En32
  SIGNAL Product1_out1                    : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_13                  : std_logic;
  SIGNAL delayMatch7_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_14                  : std_logic;
  SIGNAL enb_gated_6                      : std_logic;
  SIGNAL Delay6_reg                       : vector_of_signed20(0 TO 2) := (OTHERS => to_signed(16#00000#, 20));  -- sfix20 [3]
  SIGNAL Delay6_out1                      : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_15                  : std_logic;
  SIGNAL delayMatch3_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_16                  : std_logic;
  SIGNAL enb_gated_7                      : std_logic;
  SIGNAL Delay2_reg                       : vector_of_signed20(0 TO 2) := (OTHERS => to_signed(16#00000#, 20));  -- sfix20 [3]
  SIGNAL Delay2_out1                      : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_17                  : std_logic;
  SIGNAL delayMatch5_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_18                  : std_logic;
  SIGNAL enb_gated_8                      : std_logic;
  SIGNAL Delay4_reg                       : vector_of_signed20(0 TO 2) := (OTHERS => to_signed(16#00000#, 20));  -- sfix20 [3]
  SIGNAL Delay4_out1                      : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Product2_mul_temp                : signed(39 DOWNTO 0);  -- sfix40_En32
  SIGNAL Product2_out1                    : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_19                  : std_logic;
  SIGNAL delayMatch8_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_20                  : std_logic;
  SIGNAL enb_gated_9                      : std_logic;
  SIGNAL Delay7_reg                       : vector_of_signed20(0 TO 2) := (OTHERS => to_signed(16#00000#, 20));  -- sfix20 [3]
  SIGNAL Delay7_out1                      : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL Add_out1                         : signed(19 DOWNTO 0);  -- sfix20_En16
  SIGNAL stateControl_21                  : std_logic;
  SIGNAL delayMatch2_reg                  : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL stateControl_22                  : std_logic;
  SIGNAL enb_gated_10                     : std_logic;
  SIGNAL Delay12_reg                      : vector_of_signed20(0 TO 1) := (OTHERS => to_signed(16#00000#, 20));  -- sfix20 [2]
  SIGNAL Delay12_out1                     : signed(19 DOWNTO 0);  -- sfix20_En16

BEGIN
  dataIn_re_signed <= signed(dataIn_re);

  dataIn_im_signed <= signed(dataIn_im);

  stateControl <= '1';

  delayMatch10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch10_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch10_reg(0) <= stateControl;
        delayMatch10_reg(1) <= delayMatch10_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch10_process;

  stateControl_1 <= delayMatch10_reg(1);

  enb_gated <= stateControl_1 AND enb;

  Delay9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_reg_re <= (OTHERS => to_signed(16#00000#, 20));
        Delay9_reg_im <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_gated = '1' THEN
        Delay9_reg_im(0) <= dataIn_im_signed;
        Delay9_reg_im(1) <= Delay9_reg_im(0);
        Delay9_reg_re(0) <= dataIn_re_signed;
        Delay9_reg_re(1) <= Delay9_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay9_process;

  Delay9_out1_re <= Delay9_reg_re(1);
  Delay9_out1_im <= Delay9_reg_im(1);

  stateControl_2 <= '1';

  delayMatch6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch6_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch6_reg(0) <= stateControl_2;
        delayMatch6_reg(1) <= delayMatch6_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch6_process;

  stateControl_3 <= delayMatch6_reg(1);

  enb_gated_1 <= stateControl_3 AND enb;

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_reg_re <= (OTHERS => to_signed(16#00000#, 20));
        Delay5_reg_im <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_gated_1 = '1' THEN
        Delay5_reg_im(0) <= Delay9_out1_im;
        Delay5_reg_im(1) <= Delay5_reg_im(0);
        Delay5_reg_re(0) <= Delay9_out1_re;
        Delay5_reg_re(1) <= Delay5_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay5_process;

  Delay5_out1_re <= Delay5_reg_re(1);
  Delay5_out1_im <= Delay5_reg_im(1);

  stateControl_4 <= '1';

  delayMatch1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch1_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch1_reg(0) <= stateControl_4;
        delayMatch1_reg(1) <= delayMatch1_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch1_process;

  stateControl_5 <= delayMatch1_reg(1);

  enb_gated_2 <= stateControl_5 AND enb;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_gated_2 = '1' THEN
        Delay1_reg(0) <= Delay5_out1_re;
        Delay1_reg(1 TO 2) <= Delay1_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1 <= Delay1_reg(2);

  ncoIn_re_signed <= signed(ncoIn_re);

  ncoIn_im_signed <= signed(ncoIn_im);

  stateControl_6 <= '1';

  delayMatch9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch9_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch9_reg(0) <= stateControl_6;
        delayMatch9_reg(1) <= delayMatch9_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch9_process;

  stateControl_7 <= delayMatch9_reg(1);

  enb_gated_3 <= stateControl_7 AND enb;

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_reg_re <= (OTHERS => to_signed(16#00000#, 20));
        Delay8_reg_im <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_gated_3 = '1' THEN
        Delay8_reg_im(0) <= ncoIn_im_signed;
        Delay8_reg_im(1) <= Delay8_reg_im(0);
        Delay8_reg_re(0) <= ncoIn_re_signed;
        Delay8_reg_re(1) <= Delay8_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay8_process;

  Delay8_out1_re <= Delay8_reg_re(1);
  Delay8_out1_im <= Delay8_reg_im(1);

  Gain_cast <= resize(Delay8_out1_re & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 40);
  Gain_out1_re <= Gain_cast(36 DOWNTO 17);
  Gain_cast_1 <= resize(Delay8_out1_im & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 40);
  Gain_out1_im <= Gain_cast_1(36 DOWNTO 17);

  stateControl_9 <= '1';

  delayMatch_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch_reg(0) <= stateControl_9;
        delayMatch_reg(1) <= delayMatch_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch_process;

  stateControl_10 <= delayMatch_reg(1);

  enb_gated_4 <= stateControl_10 AND enb;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_reg_re <= (OTHERS => to_signed(16#00000#, 20));
        Delay_reg_im <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_gated_4 = '1' THEN
        Delay_reg_im(0) <= Gain_out1_im;
        Delay_reg_im(1) <= Delay_reg_im(0);
        Delay_reg_re(0) <= Gain_out1_re;
        Delay_reg_re(1) <= Delay_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay_process;

  Delay_out1_re <= Delay_reg_re(1);
  Delay_out1_im <= Delay_reg_im(1);

  stateControl_11 <= '1';

  delayMatch4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch4_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch4_reg(0) <= stateControl_11;
        delayMatch4_reg(1) <= delayMatch4_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch4_process;

  stateControl_12 <= delayMatch4_reg(1);

  enb_gated_5 <= stateControl_12 AND enb;

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_gated_5 = '1' THEN
        Delay3_reg(0) <= Delay_out1_re;
        Delay3_reg(1 TO 2) <= Delay3_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1 <= Delay3_reg(2);

  Product1_mul_temp <= Delay1_out1 * Delay3_out1;
  Product1_out1 <= Product1_mul_temp(35 DOWNTO 16);

  stateControl_13 <= '1';

  delayMatch7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch7_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch7_reg(0) <= stateControl_13;
        delayMatch7_reg(1) <= delayMatch7_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch7_process;

  stateControl_14 <= delayMatch7_reg(1);

  enb_gated_6 <= stateControl_14 AND enb;

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_gated_6 = '1' THEN
        Delay6_reg(0) <= Product1_out1;
        Delay6_reg(1 TO 2) <= Delay6_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1 <= Delay6_reg(2);

  stateControl_15 <= '1';

  delayMatch3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch3_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch3_reg(0) <= stateControl_15;
        delayMatch3_reg(1) <= delayMatch3_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch3_process;

  stateControl_16 <= delayMatch3_reg(1);

  enb_gated_7 <= stateControl_16 AND enb;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_gated_7 = '1' THEN
        Delay2_reg(0) <= Delay5_out1_im;
        Delay2_reg(1 TO 2) <= Delay2_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(2);

  stateControl_17 <= '1';

  delayMatch5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch5_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch5_reg(0) <= stateControl_17;
        delayMatch5_reg(1) <= delayMatch5_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch5_process;

  stateControl_18 <= delayMatch5_reg(1);

  enb_gated_8 <= stateControl_18 AND enb;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_gated_8 = '1' THEN
        Delay4_reg(0) <= Delay_out1_im;
        Delay4_reg(1 TO 2) <= Delay4_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1 <= Delay4_reg(2);

  Product2_mul_temp <= Delay2_out1 * Delay4_out1;
  Product2_out1 <= Product2_mul_temp(35 DOWNTO 16);

  stateControl_19 <= '1';

  delayMatch8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch8_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch8_reg(0) <= stateControl_19;
        delayMatch8_reg(1) <= delayMatch8_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch8_process;

  stateControl_20 <= delayMatch8_reg(1);

  enb_gated_9 <= stateControl_20 AND enb;

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_gated_9 = '1' THEN
        Delay7_reg(0) <= Product2_out1;
        Delay7_reg(1 TO 2) <= Delay7_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay7_process;

  Delay7_out1 <= Delay7_reg(2);

  Add_out1 <= Delay6_out1 - Delay7_out1;

  stateControl_21 <= '1';

  delayMatch2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        delayMatch2_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        delayMatch2_reg(0) <= stateControl_21;
        delayMatch2_reg(1) <= delayMatch2_reg(0);
      END IF;
    END IF;
  END PROCESS delayMatch2_process;

  stateControl_22 <= delayMatch2_reg(1);

  enb_gated_10 <= stateControl_22 AND enb;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF enb_gated_10 = '1' THEN
        Delay12_reg(0) <= Add_out1;
        Delay12_reg(1) <= Delay12_reg(0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(1);

  mixedOut <= std_logic_vector(Delay12_out1);

END rtl;
