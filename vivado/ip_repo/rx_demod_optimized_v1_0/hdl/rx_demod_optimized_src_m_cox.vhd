-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_optimized_src_m_cox.vhd
-- Created: 2024-10-04 10:51:59
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_optimized_src_m_cox
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_symbol_sync/m_cox
-- Hierarchy Level: 2
-- Model version: 1.70
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_optimized_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_optimized_src_m_cox IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        data_in_im                        :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        data_out_re                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        data_out_im                       :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
        M_d                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        P_d_re                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13_En9
        P_d_im                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13_En9
        );
END rx_demod_optimized_src_m_cox;


ARCHITECTURE rtl OF rx_demod_optimized_src_m_cox IS

  -- Component Declarations
  COMPONENT rx_demod_optimized_src_SimpleDualPortRAM_generic_block
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

  COMPONENT rx_demod_optimized_src_calculate_P
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          r_d_re                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          r_d_im                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          alphaP_d_2                      :   OUT   std_logic_vector(43 DOWNTO 0);  -- sfix44_En31
          P_d_re                          :   OUT   std_logic_vector(30 DOWNTO 0);  -- sfix31_En24
          P_d_im                          :   OUT   std_logic_vector(30 DOWNTO 0)  -- sfix31_En24
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_calculate_R
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          r_d_re                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          r_d_im                          :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En12
          Rf2                             :   OUT   std_logic_vector(42 DOWNTO 0)  -- sfix43_En31
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_Compare_To_Constant_block1
    PORT( u                               :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En31
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT rx_demod_optimized_src_Real_Divide_HDL_Optimized_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          num                             :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En10
          den                             :   IN    std_logic_vector(15 DOWNTO 0);  -- ufix16_En10
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_optimized_src_SimpleDualPortRAM_generic_block
    USE ENTITY work.rx_demod_optimized_src_SimpleDualPortRAM_generic_block(rtl);

  FOR ALL : rx_demod_optimized_src_calculate_P
    USE ENTITY work.rx_demod_optimized_src_calculate_P(rtl);

  FOR ALL : rx_demod_optimized_src_calculate_R
    USE ENTITY work.rx_demod_optimized_src_calculate_R(rtl);

  FOR ALL : rx_demod_optimized_src_Compare_To_Constant_block1
    USE ENTITY work.rx_demod_optimized_src_Compare_To_Constant_block1(rtl);

  FOR ALL : rx_demod_optimized_src_Real_Divide_HDL_Optimized_block
    USE ENTITY work.rx_demod_optimized_src_Real_Divide_HDL_Optimized_block(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL data_in_im_signed                : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL mergedInput                      : unsigned(27 DOWNTO 0);  -- ufix28
  SIGNAL mergedDelay_regin                : unsigned(27 DOWNTO 0);  -- ufix28
  SIGNAL mergedDelay_waddr                : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL mergedDelay_wrenb                : std_logic;  -- ufix1
  SIGNAL mergedDelay_raddr                : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL mergedDelay_regout               : std_logic_vector(27 DOWNTO 0);  -- ufix28
  SIGNAL mergedDelay_regout_unsigned      : unsigned(27 DOWNTO 0);  -- ufix28
  SIGNAL mergedOutput                     : unsigned(27 DOWNTO 0);  -- ufix28
  SIGNAL slicedInput                      : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL realOutput                       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL slicedInput_1                    : unsigned(13 DOWNTO 0);  -- ufix14
  SIGNAL imagOutput                       : signed(13 DOWNTO 0);  -- sfix14_En12
  SIGNAL p_sig                            : std_logic_vector(43 DOWNTO 0);  -- ufix44
  SIGNAL p_pelado_re                      : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL p_pelado_im                      : std_logic_vector(30 DOWNTO 0);  -- ufix31
  SIGNAL r_sig                            : std_logic_vector(42 DOWNTO 0);  -- ufix43
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Constant1_out1                   : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL p_sig_signed                     : signed(43 DOWNTO 0);  -- sfix44_En31
  SIGNAL Data_Type_Conversion2_out1       : unsigned(15 DOWNTO 0);  -- ufix16_En10
  SIGNAL r_sig_signed                     : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL Switch_out1                      : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL Data_Type_Conversion3_out1       : unsigned(15 DOWNTO 0);  -- ufix16_En10
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL M                                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL p_pelado_re_signed               : signed(30 DOWNTO 0);  -- sfix31_En24
  SIGNAL p_pelado_im_signed               : signed(30 DOWNTO 0);  -- sfix31_En24
  SIGNAL Data_Type_Conversion_out1_re     : signed(12 DOWNTO 0);  -- sfix13_En9
  SIGNAL Data_Type_Conversion_out1_im     : signed(12 DOWNTO 0);  -- sfix13_En9
  SIGNAL Delay1_reg_re                    : vector_of_signed13(0 TO 31);  -- sfix13_En9 [32]
  SIGNAL Delay1_reg_im                    : vector_of_signed13(0 TO 31);  -- sfix13_En9 [32]
  SIGNAL Delay1_out1_re                   : signed(12 DOWNTO 0);  -- sfix13_En9
  SIGNAL Delay1_out1_im                   : signed(12 DOWNTO 0);  -- sfix13_En9

BEGIN
  -- Delay of m_cox = delay blocks + delay divider + delay_10_preambles_symbols
  -- Delay of m_cox = 12 + 47 + 2580

  u_ShiftRegisterRAM : rx_demod_optimized_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 12,
                 DataWidth => 28
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => std_logic_vector(mergedDelay_regin),
              wr_addr => std_logic_vector(mergedDelay_waddr),
              wr_en => mergedDelay_wrenb,  -- ufix1
              rd_addr => std_logic_vector(mergedDelay_raddr),
              dout => mergedDelay_regout
              );

  u_calculate_P : rx_demod_optimized_src_calculate_P
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              r_d_re => data_in_re,  -- sfix14_En12
              r_d_im => data_in_im,  -- sfix14_En12
              alphaP_d_2 => p_sig,  -- sfix44_En31
              P_d_re => p_pelado_re,  -- sfix31_En24
              P_d_im => p_pelado_im  -- sfix31_En24
              );

  u_calculate_R : rx_demod_optimized_src_calculate_R
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              r_d_re => data_in_re,  -- sfix14_En12
              r_d_im => data_in_im,  -- sfix14_En12
              Rf2 => r_sig  -- sfix43_En31
              );

  u_Compare_To_Constant : rx_demod_optimized_src_Compare_To_Constant_block1
    PORT MAP( u => r_sig,  -- sfix43_En31
              y => Compare_To_Constant_out1
              );

  u_Real_Divide_HDL_Optimized : rx_demod_optimized_src_Real_Divide_HDL_Optimized_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              num => std_logic_vector(Data_Type_Conversion2_out1),  -- ufix16_En10
              den => std_logic_vector(Data_Type_Conversion3_out1),  -- ufix16_En10
              validIn => Constant_out1,
              y => M  -- sfix16_En14
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  mergedInput <= unsigned(data_in_re_signed) & unsigned(data_in_im_signed);

  -- Input register for RAM-based shift register mergedDelay
  mergedDelay_reginc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_regin <= to_unsigned(16#0000000#, 28);
      ELSIF enb_1_2_0 = '1' THEN
        mergedDelay_regin <= mergedInput;
      END IF;
    END IF;
  END PROCESS mergedDelay_reginc_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 2621
  -- Write address counter for RAM-based shift register mergedDelay
  mergedDelay_wr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_waddr <= to_unsigned(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        IF mergedDelay_waddr >= to_unsigned(16#A3D#, 12) THEN 
          mergedDelay_waddr <= to_unsigned(16#000#, 12);
        ELSE 
          mergedDelay_waddr <= mergedDelay_waddr + to_unsigned(16#001#, 12);
        END IF;
      END IF;
    END IF;
  END PROCESS mergedDelay_wr_process;


  mergedDelay_wrenb <= '1';

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 2621
  -- Read address counter for RAM-based shift register mergedDelay
  mergedDelay_rd_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_raddr <= to_unsigned(16#001#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        IF mergedDelay_raddr >= to_unsigned(16#A3D#, 12) THEN 
          mergedDelay_raddr <= to_unsigned(16#000#, 12);
        ELSE 
          mergedDelay_raddr <= mergedDelay_raddr + to_unsigned(16#001#, 12);
        END IF;
      END IF;
    END IF;
  END PROCESS mergedDelay_rd_process;


  mergedDelay_regout_unsigned <= unsigned(mergedDelay_regout);

  -- Output register for RAM-based shift register mergedDelay
  mergedDelay_regoutc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedOutput <= to_unsigned(16#0000000#, 28);
      ELSIF enb_1_2_0 = '1' THEN
        mergedOutput <= mergedDelay_regout_unsigned;
      END IF;
    END IF;
  END PROCESS mergedDelay_regoutc_process;


  slicedInput <= mergedOutput(27 DOWNTO 14);

  realOutput <= signed(slicedInput);

  data_out_re <= std_logic_vector(realOutput);

  slicedInput_1 <= mergedOutput(13 DOWNTO 0);

  imagOutput <= signed(slicedInput_1);

  data_out_im <= std_logic_vector(imagOutput);

  Constant1_out1 <= signed'("0000000000010000000000000000000000000000000");

  p_sig_signed <= signed(p_sig);

  Data_Type_Conversion2_out1 <= unsigned(p_sig_signed(36 DOWNTO 21));

  r_sig_signed <= signed(r_sig);

  
  Switch_out1 <= Constant1_out1 WHEN Compare_To_Constant_out1 = '0' ELSE
      r_sig_signed;

  Data_Type_Conversion3_out1 <= unsigned(Switch_out1(36 DOWNTO 21));

  Constant_out1 <= '1';

  p_pelado_re_signed <= signed(p_pelado_re);

  p_pelado_im_signed <= signed(p_pelado_im);

  Data_Type_Conversion_out1_re <= p_pelado_re_signed(27 DOWNTO 15);
  Data_Type_Conversion_out1_im <= p_pelado_im_signed(27 DOWNTO 15);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_reg_re <= (OTHERS => to_signed(16#0000#, 13));
        Delay1_reg_im <= (OTHERS => to_signed(16#0000#, 13));
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_reg_im(0) <= Data_Type_Conversion_out1_im;
        Delay1_reg_im(1 TO 31) <= Delay1_reg_im(0 TO 30);
        Delay1_reg_re(0) <= Data_Type_Conversion_out1_re;
        Delay1_reg_re(1 TO 31) <= Delay1_reg_re(0 TO 30);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1_re <= Delay1_reg_re(31);
  Delay1_out1_im <= Delay1_reg_im(31);

  P_d_re <= std_logic_vector(Delay1_out1_re);

  P_d_im <= std_logic_vector(Delay1_out1_im);

  M_d <= M;

END rtl;
