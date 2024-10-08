-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_complex_multiplier.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_complex_multiplier
-- Source Path: HDLRxDemodulator/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/complex_multiplier
-- Hierarchy Level: 4
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_complex_multiplier IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        in_a_re                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        in_a_im                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        in_b_re                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        in_b_im                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        a_times_b_re                      :   OUT   std_logic_vector(25 DOWNTO 0);  -- sfix26_En20
        a_times_b_im                      :   OUT   std_logic_vector(25 DOWNTO 0)  -- sfix26_En20
        );
END rx_demod_optimized_src_complex_multiplier;


ARCHITECTURE rtl OF rx_demod_optimized_src_complex_multiplier IS

  -- Signals
  SIGNAL in_b_re_signed                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL in_b_im_signed                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay2_out1                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay3_out1                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Subtract_sub_cast                : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Subtract_sub_cast_1              : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Subtract_out1                    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay5_reg                       : vector_of_signed13(0 TO 1);  -- sfix13 [2]
  SIGNAL Delay5_out1                      : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay5_out1_1                    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL in_a_re_signed                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL in_a_im_signed                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay_out1                       : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay7_reg                       : vector_of_signed12(0 TO 1);  -- sfix12 [2]
  SIGNAL Delay7_out1                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay7_out1_1                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Product1_out1                    : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Product1_out1_1                  : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Delay1_out1                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Subtract1_sub_cast               : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Subtract1_sub_cast_1             : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Subtract1_out1                   : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay4_reg                       : vector_of_signed13(0 TO 1);  -- sfix13 [2]
  SIGNAL Delay4_out1                      : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay4_out1_1                    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay9_reg                       : vector_of_signed12(0 TO 1);  -- sfix12 [2]
  SIGNAL Delay9_out1                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay9_out1_1                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Product_out1                     : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Product_out1_1                   : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Add1_add_cast                    : signed(25 DOWNTO 0);  -- sfix26_En20
  SIGNAL Add1_add_cast_1                  : signed(25 DOWNTO 0);  -- sfix26_En20
  SIGNAL Add1_out1                        : signed(25 DOWNTO 0);  -- sfix26_En20
  SIGNAL Add_add_cast                     : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Add_add_cast_1                   : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Add_out1                         : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay6_reg                       : vector_of_signed13(0 TO 1);  -- sfix13 [2]
  SIGNAL Delay6_out1                      : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay6_out1_1                    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Delay14_reg                      : vector_of_signed12(0 TO 1);  -- sfix12 [2]
  SIGNAL Delay14_out1                     : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay14_out1_1                   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Product2_out1                    : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Product2_out1_1                  : signed(24 DOWNTO 0);  -- sfix25_En20
  SIGNAL Add2_add_cast                    : signed(25 DOWNTO 0);  -- sfix26_En20
  SIGNAL Add2_add_cast_1                  : signed(25 DOWNTO 0);  -- sfix26_En20
  SIGNAL Add2_out1                        : signed(25 DOWNTO 0);  -- sfix26_En20
  SIGNAL Delay10_out1_re                  : signed(25 DOWNTO 0);  -- sfix26_En20
  SIGNAL Delay10_out1_im                  : signed(25 DOWNTO 0);  -- sfix26_En20

BEGIN
  in_b_re_signed <= signed(in_b_re);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_out1 <= in_b_re_signed;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  in_b_im_signed <= signed(in_b_im);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= in_b_im_signed;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Subtract_sub_cast <= resize(Delay2_out1, 13);
  Subtract_sub_cast_1 <= resize(Delay3_out1, 13);
  Subtract_out1 <= Subtract_sub_cast - Subtract_sub_cast_1;

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_reg <= (OTHERS => to_signed(16#0000#, 13));
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_reg(0) <= Subtract_out1;
        Delay5_reg(1) <= Delay5_reg(0);
      END IF;
    END IF;
  END PROCESS Delay5_process;

  Delay5_out1 <= Delay5_reg(1);

  HwModeRegister2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_1 <= to_signed(16#0000#, 13);
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_out1_1 <= Delay5_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister2_process;


  in_a_re_signed <= signed(in_a_re);

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay_out1 <= in_a_re_signed;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_reg <= (OTHERS => to_signed(16#000#, 12));
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_reg(0) <= Delay_out1;
        Delay7_reg(1) <= Delay7_reg(0);
      END IF;
    END IF;
  END PROCESS Delay7_process;

  Delay7_out1 <= Delay7_reg(1);

  HwModeRegister3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1_1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_out1_1 <= Delay7_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister3_process;


  Product1_out1 <= Delay5_out1_1 * Delay7_out1_1;

  PipelineRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Product1_out1_1 <= to_signed(16#0000000#, 25);
      ELSIF enb_1_2_0 = '1' THEN
        Product1_out1_1 <= Product1_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;


  in_a_im_signed <= signed(in_a_im);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= in_a_im_signed;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Subtract1_sub_cast <= resize(Delay_out1, 13);
  Subtract1_sub_cast_1 <= resize(Delay1_out1, 13);
  Subtract1_out1 <= Subtract1_sub_cast - Subtract1_sub_cast_1;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_reg <= (OTHERS => to_signed(16#0000#, 13));
      ELSIF enb_1_2_0 = '1' THEN
        Delay4_reg(0) <= Subtract1_out1;
        Delay4_reg(1) <= Delay4_reg(0);
      END IF;
    END IF;
  END PROCESS Delay4_process;

  Delay4_out1 <= Delay4_reg(1);

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1_1 <= to_signed(16#0000#, 13);
      ELSIF enb_1_2_0 = '1' THEN
        Delay4_out1_1 <= Delay4_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  Delay9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_reg <= (OTHERS => to_signed(16#000#, 12));
      ELSIF enb_1_2_0 = '1' THEN
        Delay9_reg(0) <= Delay3_out1;
        Delay9_reg(1) <= Delay9_reg(0);
      END IF;
    END IF;
  END PROCESS Delay9_process;

  Delay9_out1 <= Delay9_reg(1);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_out1_1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay9_out1_1 <= Delay9_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;


  Product_out1 <= Delay4_out1_1 * Delay9_out1_1;

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Product_out1_1 <= to_signed(16#0000000#, 25);
      ELSIF enb_1_2_0 = '1' THEN
        Product_out1_1 <= Product_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  Add1_add_cast <= resize(Product1_out1_1, 26);
  Add1_add_cast_1 <= resize(Product_out1_1, 26);
  Add1_out1 <= Add1_add_cast + Add1_add_cast_1;

  Add_add_cast <= resize(Delay2_out1, 13);
  Add_add_cast_1 <= resize(Delay3_out1, 13);
  Add_out1 <= Add_add_cast + Add_add_cast_1;

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_reg <= (OTHERS => to_signed(16#0000#, 13));
      ELSIF enb_1_2_0 = '1' THEN
        Delay6_reg(0) <= Add_out1;
        Delay6_reg(1) <= Delay6_reg(0);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1 <= Delay6_reg(1);

  HwModeRegister4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1_1 <= to_signed(16#0000#, 13);
      ELSIF enb_1_2_0 = '1' THEN
        Delay6_out1_1 <= Delay6_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister4_process;


  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_reg <= (OTHERS => to_signed(16#000#, 12));
      ELSIF enb_1_2_0 = '1' THEN
        Delay14_reg(0) <= Delay1_out1;
        Delay14_reg(1) <= Delay14_reg(0);
      END IF;
    END IF;
  END PROCESS Delay14_process;

  Delay14_out1 <= Delay14_reg(1);

  HwModeRegister5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1_1 <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        Delay14_out1_1 <= Delay14_out1;
      END IF;
    END IF;
  END PROCESS HwModeRegister5_process;


  Product2_out1 <= Delay6_out1_1 * Delay14_out1_1;

  PipelineRegister2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Product2_out1_1 <= to_signed(16#0000000#, 25);
      ELSIF enb_1_2_0 = '1' THEN
        Product2_out1_1 <= Product2_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister2_process;


  Add2_add_cast <= resize(Product_out1_1, 26);
  Add2_add_cast_1 <= resize(Product2_out1_1, 26);
  Add2_out1 <= Add2_add_cast + Add2_add_cast_1;

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_out1_re <= to_signed(16#0000000#, 26);
        Delay10_out1_im <= to_signed(16#0000000#, 26);
      ELSIF enb_1_2_0 = '1' THEN
        Delay10_out1_re <= Add1_out1;
        Delay10_out1_im <= Add2_out1;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  a_times_b_re <= std_logic_vector(Delay10_out1_re);

  a_times_b_im <= std_logic_vector(Delay10_out1_im);

END rtl;

