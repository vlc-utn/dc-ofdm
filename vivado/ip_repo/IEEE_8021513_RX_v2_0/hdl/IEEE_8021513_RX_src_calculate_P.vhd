-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_calculate_P.vhd
-- Created: 2024-11-23 11:22:02
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_calculate_P
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/calculate_P
-- Hierarchy Level: 4
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_calculate_P IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        r_d_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        r_d_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        alphaP_d_2                        :   OUT   std_logic_vector(43 DOWNTO 0);  -- sfix44_En23
        P_d_re                            :   OUT   std_logic_vector(19 DOWNTO 0);  -- sfix20_En10
        P_d_im                            :   OUT   std_logic_vector(19 DOWNTO 0)  -- sfix20_En10
        );
END IEEE_8021513_RX_src_calculate_P;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_calculate_P IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_complex_multiplier_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in_a_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          in_a_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          in_b_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          in_b_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          a_times_b_re                    :   OUT   std_logic_vector(33 DOWNTO 0);  -- sfix34_En20
          a_times_b_im                    :   OUT   std_logic_vector(33 DOWNTO 0)  -- sfix34_En20
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_complex_multiplier1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          in_a_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          in_a_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          in_b_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          in_b_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          a_times_b_re                    :   OUT   std_logic_vector(33 DOWNTO 0);  -- sfix34_En20
          a_times_b_im                    :   OUT   std_logic_vector(33 DOWNTO 0)  -- sfix34_En20
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3
    USE ENTITY work.IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3(rtl);

  FOR ALL : IEEE_8021513_RX_src_complex_multiplier_block
    USE ENTITY work.IEEE_8021513_RX_src_complex_multiplier_block(rtl);

  FOR ALL : IEEE_8021513_RX_src_complex_multiplier1
    USE ENTITY work.IEEE_8021513_RX_src_complex_multiplier1(rtl);

  -- Signals
  SIGNAL r_d_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL r_d_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL mergedDelay_waddr                : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL mergedDelay_wrenb                : std_logic;  -- ufix1
  SIGNAL mergedDelay_raddr                : unsigned(10 DOWNTO 0);  -- ufix11
  SIGNAL mergedOutput                     : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL slicedInput                      : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL imagOutput                       : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL r_d_L_im                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL r_d_L_re                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL mergedInput                      : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL mergedDelay_regin                : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL mergedDelay_regout               : std_logic_vector(63 DOWNTO 0);  -- ufix64
  SIGNAL mergedDelay_regout_unsigned      : unsigned(63 DOWNTO 0);  -- ufix64
  SIGNAL slicedInput_1                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL realOutput                       : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL conj_cast                        : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL conj_cast_1                      : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL Conjugate1_out1_re               : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Conjugate1_out1_im               : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL complex_multiplier_out1_re       : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL complex_multiplier_out1_im       : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL complex_multiplier_out1_re_signed : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL complex_multiplier_out1_im_signed : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL slicedInput_2                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL realOutput_1                     : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL r_d_re_1                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL r_d_im_1                         : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL slicedInput_3                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL imagOutput_1                     : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL conj_cast_2                      : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL conj_cast_3                      : signed(16 DOWNTO 0);  -- sfix17_En10
  SIGNAL Conjugate2_out1_re               : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Conjugate2_out1_im               : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL complex_multiplier1_out1_re      : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL complex_multiplier1_out1_im      : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL complex_multiplier1_out1_re_signed : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL complex_multiplier1_out1_im_signed : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL Subtract1_sub_cast               : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL Subtract1_sub_cast_1             : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL Subtract1_sub_cast_2             : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL Subtract1_sub_cast_3             : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL Subtract1_out1_re                : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL Subtract1_out1_im                : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL P_d_re_1                         : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL P_d_im_1                         : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL acum_re                          : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL acum_im                          : signed(34 DOWNTO 0);  -- sfix35_En20
  SIGNAL Data_Type_Conversion3_out1       : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Delay6_reg                       : vector_of_signed25(0 TO 1);  -- sfix25 [2]
  SIGNAL Delay6_out1                      : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Data_Type_Conversion4_out1       : signed(17 DOWNTO 0);  -- sfix18_En8
  SIGNAL Delay7_reg                       : vector_of_signed18(0 TO 1);  -- sfix18 [2]
  SIGNAL Delay7_out1                      : signed(17 DOWNTO 0);  -- sfix18_En8
  SIGNAL Product1_out1                    : signed(42 DOWNTO 0);  -- sfix43_En23
  SIGNAL Delay12_reg                      : vector_of_signed43(0 TO 1);  -- sfix43 [2]
  SIGNAL Delay12_out1                     : signed(42 DOWNTO 0);  -- sfix43_En23
  SIGNAL Data_Type_Conversion1_out1       : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Delay14_reg                      : vector_of_signed25(0 TO 1);  -- sfix25 [2]
  SIGNAL Delay14_out1                     : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Data_Type_Conversion2_out1       : signed(17 DOWNTO 0);  -- sfix18_En8
  SIGNAL Delay5_reg                       : vector_of_signed18(0 TO 1);  -- sfix18 [2]
  SIGNAL Delay5_out1                      : signed(17 DOWNTO 0);  -- sfix18_En8
  SIGNAL Product2_out1                    : signed(42 DOWNTO 0);  -- sfix43_En23
  SIGNAL Delay11_reg                      : vector_of_signed43(0 TO 1);  -- sfix43 [2]
  SIGNAL Delay11_out1                     : signed(42 DOWNTO 0);  -- sfix43_En23
  SIGNAL Add1_add_cast                    : signed(43 DOWNTO 0);  -- sfix44_En23
  SIGNAL Add1_add_cast_1                  : signed(43 DOWNTO 0);  -- sfix44_En23
  SIGNAL Add1_out1                        : signed(43 DOWNTO 0);  -- sfix44_En23
  SIGNAL Delay13_out1                     : signed(43 DOWNTO 0);  -- sfix44_En23
  SIGNAL Data_Type_Conversion_out1_re     : signed(19 DOWNTO 0);  -- sfix20_En10
  SIGNAL Data_Type_Conversion_out1_im     : signed(19 DOWNTO 0);  -- sfix20_En10
  SIGNAL Delay16_reg_re                   : vector_of_signed20(0 TO 1);  -- sfix20_En10 [2]
  SIGNAL Delay16_reg_im                   : vector_of_signed20(0 TO 1);  -- sfix20_En10 [2]
  SIGNAL Delay16_out1_re                  : signed(19 DOWNTO 0);  -- sfix20_En10
  SIGNAL Delay16_out1_im                  : signed(19 DOWNTO 0);  -- sfix20_En10
  SIGNAL Delay3_reg_re                    : vector_of_signed20(0 TO 1);  -- sfix20_En10 [2]
  SIGNAL Delay3_reg_im                    : vector_of_signed20(0 TO 1);  -- sfix20_En10 [2]
  SIGNAL Delay3_out1_re                   : signed(19 DOWNTO 0);  -- sfix20_En10
  SIGNAL Delay3_out1_im                   : signed(19 DOWNTO 0);  -- sfix20_En10
  SIGNAL Delay4_out1_re                   : signed(19 DOWNTO 0);  -- sfix20_En10
  SIGNAL Delay4_out1_im                   : signed(19 DOWNTO 0);  -- sfix20_En10

BEGIN
  u_ShiftRegisterRAM : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3
    GENERIC MAP( AddrWidth => 11,
                 DataWidth => 64
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => std_logic_vector(mergedDelay_regin),
              wr_addr => std_logic_vector(mergedDelay_waddr),
              wr_en => mergedDelay_wrenb,  -- ufix1
              rd_addr => std_logic_vector(mergedDelay_raddr),
              dout => mergedDelay_regout
              );

  u_complex_multiplier : IEEE_8021513_RX_src_complex_multiplier_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in_a_re => r_d_re,  -- sfix16_En10
              in_a_im => r_d_im,  -- sfix16_En10
              in_b_re => std_logic_vector(Conjugate1_out1_re),  -- sfix16_En10
              in_b_im => std_logic_vector(Conjugate1_out1_im),  -- sfix16_En10
              a_times_b_re => complex_multiplier_out1_re,  -- sfix34_En20
              a_times_b_im => complex_multiplier_out1_im  -- sfix34_En20
              );

  u_complex_multiplier1 : IEEE_8021513_RX_src_complex_multiplier1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              in_a_re => std_logic_vector(realOutput),  -- sfix16_En10
              in_a_im => std_logic_vector(imagOutput),  -- sfix16_En10
              in_b_re => std_logic_vector(Conjugate2_out1_re),  -- sfix16_En10
              in_b_im => std_logic_vector(Conjugate2_out1_im),  -- sfix16_En10
              a_times_b_re => complex_multiplier1_out1_re,  -- sfix34_En20
              a_times_b_im => complex_multiplier1_out1_im  -- sfix34_En20
              );

  r_d_re_signed <= signed(r_d_re);

  r_d_im_signed <= signed(r_d_im);

  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 1277
  -- Write address counter for RAM-based shift register mergedDelay
  mergedDelay_wr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_waddr <= to_unsigned(16#000#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        IF mergedDelay_waddr >= to_unsigned(16#4FD#, 11) THEN 
          mergedDelay_waddr <= to_unsigned(16#000#, 11);
        ELSE 
          mergedDelay_waddr <= mergedDelay_waddr + to_unsigned(16#001#, 11);
        END IF;
      END IF;
    END IF;
  END PROCESS mergedDelay_wr_process;


  mergedDelay_wrenb <= '1';

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 1277
  -- Read address counter for RAM-based shift register mergedDelay
  mergedDelay_rd_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_raddr <= to_unsigned(16#001#, 11);
      ELSIF enb_1_2_0 = '1' THEN
        IF mergedDelay_raddr >= to_unsigned(16#4FD#, 11) THEN 
          mergedDelay_raddr <= to_unsigned(16#000#, 11);
        ELSE 
          mergedDelay_raddr <= mergedDelay_raddr + to_unsigned(16#001#, 11);
        END IF;
      END IF;
    END IF;
  END PROCESS mergedDelay_rd_process;


  slicedInput <= mergedOutput(47 DOWNTO 32);

  imagOutput <= signed(slicedInput);

  r_d_L_im <= imagOutput;

  mergedInput <= unsigned(r_d_re_signed) & unsigned(r_d_im_signed) & unsigned(r_d_L_re) & unsigned(r_d_L_im);

  -- Input register for RAM-based shift register mergedDelay
  mergedDelay_reginc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_regin <= to_unsigned(0, 64);
      ELSIF enb_1_2_0 = '1' THEN
        mergedDelay_regin <= mergedInput;
      END IF;
    END IF;
  END PROCESS mergedDelay_reginc_process;


  mergedDelay_regout_unsigned <= unsigned(mergedDelay_regout);

  -- Output register for RAM-based shift register mergedDelay
  mergedDelay_regoutc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedOutput <= to_unsigned(0, 64);
      ELSIF enb_1_2_0 = '1' THEN
        mergedOutput <= mergedDelay_regout_unsigned;
      END IF;
    END IF;
  END PROCESS mergedDelay_regoutc_process;


  slicedInput_1 <= mergedOutput(63 DOWNTO 48);

  realOutput <= signed(slicedInput_1);

  r_d_L_re <= realOutput;

  Conjugate1_out1_re <= r_d_L_re;
  conj_cast <= resize(r_d_L_im, 17);
  conj_cast_1 <=  - (conj_cast);
  
  Conjugate1_out1_im <= X"7FFF" WHEN (conj_cast_1(16) = '0') AND (conj_cast_1(15) /= '0') ELSE
      X"8000" WHEN (conj_cast_1(16) = '1') AND (conj_cast_1(15) /= '1') ELSE
      conj_cast_1(15 DOWNTO 0);

  complex_multiplier_out1_re_signed <= signed(complex_multiplier_out1_re);

  complex_multiplier_out1_im_signed <= signed(complex_multiplier_out1_im);

  slicedInput_2 <= mergedOutput(31 DOWNTO 16);

  realOutput_1 <= signed(slicedInput_2);

  r_d_re_1 <= realOutput_1;

  slicedInput_3 <= mergedOutput(15 DOWNTO 0);

  imagOutput_1 <= signed(slicedInput_3);

  r_d_im_1 <= imagOutput_1;

  Conjugate2_out1_re <= r_d_re_1;
  conj_cast_2 <= resize(r_d_im_1, 17);
  conj_cast_3 <=  - (conj_cast_2);
  
  Conjugate2_out1_im <= X"7FFF" WHEN (conj_cast_3(16) = '0') AND (conj_cast_3(15) /= '0') ELSE
      X"8000" WHEN (conj_cast_3(16) = '1') AND (conj_cast_3(15) /= '1') ELSE
      conj_cast_3(15 DOWNTO 0);

  complex_multiplier1_out1_re_signed <= signed(complex_multiplier1_out1_re);

  complex_multiplier1_out1_im_signed <= signed(complex_multiplier1_out1_im);

  Subtract1_sub_cast <= resize(complex_multiplier_out1_re_signed, 35);
  Subtract1_sub_cast_1 <= resize(complex_multiplier1_out1_re_signed, 35);
  Subtract1_out1_re <= Subtract1_sub_cast - Subtract1_sub_cast_1;
  Subtract1_sub_cast_2 <= resize(complex_multiplier_out1_im_signed, 35);
  Subtract1_sub_cast_3 <= resize(complex_multiplier1_out1_im_signed, 35);
  Subtract1_out1_im <= Subtract1_sub_cast_2 - Subtract1_sub_cast_3;

  acum_re <= Subtract1_out1_re + P_d_re_1;
  acum_im <= Subtract1_out1_im + P_d_im_1;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        P_d_re_1 <= to_signed(0, 35);
        P_d_im_1 <= to_signed(0, 35);
      ELSIF enb_1_2_0 = '1' THEN
        P_d_re_1 <= acum_re;
        P_d_im_1 <= acum_im;
      END IF;
    END IF;
  END PROCESS Delay_process;


  Data_Type_Conversion3_out1 <= P_d_re_1(29 DOWNTO 5);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_reg <= (OTHERS => to_signed(16#0000000#, 25));
      ELSIF enb_1_2_0 = '1' THEN
        Delay6_reg(0) <= Data_Type_Conversion3_out1;
        Delay6_reg(1) <= Delay6_reg(0);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1 <= Delay6_reg(1);

  Data_Type_Conversion4_out1 <= P_d_re_1(29 DOWNTO 12);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_reg <= (OTHERS => to_signed(16#00000#, 18));
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_reg(0) <= Data_Type_Conversion4_out1;
        Delay7_reg(1) <= Delay7_reg(0);
      END IF;
    END IF;
  END PROCESS Delay7_process;

  Delay7_out1 <= Delay7_reg(1);

  Product1_out1 <= Delay6_out1 * Delay7_out1;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_reg <= (OTHERS => to_signed(0, 43));
      ELSIF enb_1_2_0 = '1' THEN
        Delay12_reg(0) <= Product1_out1;
        Delay12_reg(1) <= Delay12_reg(0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(1);

  Data_Type_Conversion1_out1 <= P_d_im_1(29 DOWNTO 5);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_reg <= (OTHERS => to_signed(16#0000000#, 25));
      ELSIF enb_1_2_0 = '1' THEN
        Delay14_reg(0) <= Data_Type_Conversion1_out1;
        Delay14_reg(1) <= Delay14_reg(0);
      END IF;
    END IF;
  END PROCESS Delay14_process;

  Delay14_out1 <= Delay14_reg(1);

  Data_Type_Conversion2_out1 <= P_d_im_1(29 DOWNTO 12);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_reg <= (OTHERS => to_signed(16#00000#, 18));
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_reg(0) <= Data_Type_Conversion2_out1;
        Delay5_reg(1) <= Delay5_reg(0);
      END IF;
    END IF;
  END PROCESS Delay5_process;

  Delay5_out1 <= Delay5_reg(1);

  Product2_out1 <= Delay14_out1 * Delay5_out1;

  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_reg <= (OTHERS => to_signed(0, 43));
      ELSIF enb_1_2_0 = '1' THEN
        Delay11_reg(0) <= Product2_out1;
        Delay11_reg(1) <= Delay11_reg(0);
      END IF;
    END IF;
  END PROCESS Delay11_process;

  Delay11_out1 <= Delay11_reg(1);

  Add1_add_cast <= resize(Delay12_out1, 44);
  Add1_add_cast_1 <= resize(Delay11_out1, 44);
  Add1_out1 <= Add1_add_cast + Add1_add_cast_1;

  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_out1 <= to_signed(0, 44);
      ELSIF enb_1_2_0 = '1' THEN
        Delay13_out1 <= Add1_out1;
      END IF;
    END IF;
  END PROCESS Delay13_process;


  alphaP_d_2 <= std_logic_vector(Delay13_out1);

  Data_Type_Conversion_out1_re <= P_d_re_1(29 DOWNTO 10);
  Data_Type_Conversion_out1_im <= P_d_im_1(29 DOWNTO 10);

  Delay16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay16_reg_re <= (OTHERS => to_signed(16#00000#, 20));
        Delay16_reg_im <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_1_2_0 = '1' THEN
        Delay16_reg_im(0) <= Data_Type_Conversion_out1_im;
        Delay16_reg_im(1) <= Delay16_reg_im(0);
        Delay16_reg_re(0) <= Data_Type_Conversion_out1_re;
        Delay16_reg_re(1) <= Delay16_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay16_process;

  Delay16_out1_re <= Delay16_reg_re(1);
  Delay16_out1_im <= Delay16_reg_im(1);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_reg_re <= (OTHERS => to_signed(16#00000#, 20));
        Delay3_reg_im <= (OTHERS => to_signed(16#00000#, 20));
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_reg_im(0) <= Delay16_out1_im;
        Delay3_reg_im(1) <= Delay3_reg_im(0);
        Delay3_reg_re(0) <= Delay16_out1_re;
        Delay3_reg_re(1) <= Delay3_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1_re <= Delay3_reg_re(1);
  Delay3_out1_im <= Delay3_reg_im(1);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1_re <= to_signed(16#00000#, 20);
        Delay4_out1_im <= to_signed(16#00000#, 20);
      ELSIF enb_1_2_0 = '1' THEN
        Delay4_out1_re <= Delay3_out1_re;
        Delay4_out1_im <= Delay3_out1_im;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  P_d_re <= std_logic_vector(Delay4_out1_re);

  P_d_im <= std_logic_vector(Delay4_out1_im);

END rtl;

