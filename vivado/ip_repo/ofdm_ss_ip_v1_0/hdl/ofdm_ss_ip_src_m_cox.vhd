-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLOFDMSS/ofdm_ss_ip_src_m_cox.vhd
-- Created: 2024-10-01 22:57:03
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_ss_ip_src_m_cox
-- Source Path: HDLOFDMSS/hdl_wrapper/ofdm_symbol_sync/m_cox
-- Hierarchy Level: 2
-- Model version: 1.113
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_ss_ip_src_hdl_wrapper_pac.ALL;

ENTITY ofdm_ss_ip_src_m_cox IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in_re                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_in_im                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        data_out_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        M_d                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        P_d_re                            :   OUT   std_logic_vector(12 DOWNTO 0);  -- sfix13_En9
        P_d_im                            :   OUT   std_logic_vector(12 DOWNTO 0)  -- sfix13_En9
        );
END ofdm_ss_ip_src_m_cox;


ARCHITECTURE rtl OF ofdm_ss_ip_src_m_cox IS

  -- Component Declarations
  COMPONENT ofdm_ss_ip_src_SimpleDualPortRAM_generic
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_calculate_P
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          r_d_re                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          r_d_im                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          alphaP_d_2                      :   OUT   std_logic_vector(43 DOWNTO 0);  -- sfix44_En31
          P_d_re                          :   OUT   std_logic_vector(34 DOWNTO 0);  -- sfix35_En28
          P_d_im                          :   OUT   std_logic_vector(34 DOWNTO 0)  -- sfix35_En28
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_calculate_R
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          r_d_re                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          r_d_im                          :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          Rf2                             :   OUT   std_logic_vector(42 DOWNTO 0)  -- sfix43_En31
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_Compare_To_Zero
    PORT( u                               :   IN    std_logic_vector(42 DOWNTO 0);  -- sfix43_En31
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_Real_Divide_HDL_Optimized
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          num                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          den                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_ss_ip_src_SimpleDualPortRAM_generic
    USE ENTITY work.ofdm_ss_ip_src_SimpleDualPortRAM_generic(rtl);

  FOR ALL : ofdm_ss_ip_src_calculate_P
    USE ENTITY work.ofdm_ss_ip_src_calculate_P(rtl);

  FOR ALL : ofdm_ss_ip_src_calculate_R
    USE ENTITY work.ofdm_ss_ip_src_calculate_R(rtl);

  FOR ALL : ofdm_ss_ip_src_Compare_To_Zero
    USE ENTITY work.ofdm_ss_ip_src_Compare_To_Zero(rtl);

  FOR ALL : ofdm_ss_ip_src_Real_Divide_HDL_Optimized
    USE ENTITY work.ofdm_ss_ip_src_Real_Divide_HDL_Optimized(rtl);

  -- Signals
  SIGNAL data_in_re_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL data_in_im_signed                : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL mergedInput                      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedDelay_regin                : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedDelay_waddr                : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL mergedDelay_wrenb                : std_logic;  -- ufix1
  SIGNAL mergedDelay_raddr                : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL mergedDelay_regout               : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedDelay_regout_unsigned      : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL mergedOutput                     : unsigned(31 DOWNTO 0);  -- ufix32
  SIGNAL slicedInput                      : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL realOutput                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL slicedInput_1                    : unsigned(15 DOWNTO 0);  -- ufix16
  SIGNAL imagOutput                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL p_sig                            : std_logic_vector(43 DOWNTO 0);  -- ufix44
  SIGNAL p_pelado_re                      : std_logic_vector(34 DOWNTO 0);  -- ufix35
  SIGNAL p_pelado_im                      : std_logic_vector(34 DOWNTO 0);  -- ufix35
  SIGNAL r_sig                            : std_logic_vector(42 DOWNTO 0);  -- ufix43
  SIGNAL Compare_To_Zero_out1             : std_logic;
  SIGNAL Constant1_out1                   : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL p_sig_signed                     : signed(43 DOWNTO 0);  -- sfix44_En31
  SIGNAL Data_Type_Conversion2_out1       : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL r_sig_signed                     : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL Switch_out1                      : signed(42 DOWNTO 0);  -- sfix43_En31
  SIGNAL Data_Type_Conversion3_out1       : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Real_Divide_HDL_Optimized_out1   : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL p_pelado_re_signed               : signed(34 DOWNTO 0);  -- sfix35_En28
  SIGNAL p_pelado_im_signed               : signed(34 DOWNTO 0);  -- sfix35_En28
  SIGNAL Data_Type_Conversion_out1_re     : signed(12 DOWNTO 0);  -- sfix13_En9
  SIGNAL Data_Type_Conversion_out1_im     : signed(12 DOWNTO 0);  -- sfix13_En9
  SIGNAL Delay1_reg_re                    : vector_of_signed13(0 TO 46);  -- sfix13_En9 [47]
  SIGNAL Delay1_reg_im                    : vector_of_signed13(0 TO 46);  -- sfix13_En9 [47]
  SIGNAL Delay1_out1_re                   : signed(12 DOWNTO 0);  -- sfix13_En9
  SIGNAL Delay1_out1_im                   : signed(12 DOWNTO 0);  -- sfix13_En9

BEGIN
  -- Delay of m_cox = delay blocks + delay divider + delay_10_preambles_symbols
  -- Delay of m_cox = 12 + 47 + 2580
  -- Latency of the real divide block is:1 + nextpow2(u.WordLength + 1 - issigned(u) + 1) + 2 + u.WordLength + 2 - issigned(u) 
  -- + 

  u_ShiftRegisterRAM : ofdm_ss_ip_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 12,
                 DataWidth => 32
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => std_logic_vector(mergedDelay_regin),
              wr_addr => std_logic_vector(mergedDelay_waddr),
              wr_en => mergedDelay_wrenb,  -- ufix1
              rd_addr => std_logic_vector(mergedDelay_raddr),
              dout => mergedDelay_regout
              );

  u_calculate_P : ofdm_ss_ip_src_calculate_P
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              r_d_re => data_in_re,  -- sfix16_En14
              r_d_im => data_in_im,  -- sfix16_En14
              alphaP_d_2 => p_sig,  -- sfix44_En31
              P_d_re => p_pelado_re,  -- sfix35_En28
              P_d_im => p_pelado_im  -- sfix35_En28
              );

  u_calculate_R : ofdm_ss_ip_src_calculate_R
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              r_d_re => data_in_re,  -- sfix16_En14
              r_d_im => data_in_im,  -- sfix16_En14
              Rf2 => r_sig  -- sfix43_En31
              );

  u_Compare_To_Zero : ofdm_ss_ip_src_Compare_To_Zero
    PORT MAP( u => r_sig,  -- sfix43_En31
              y => Compare_To_Zero_out1
              );

  u_Real_Divide_HDL_Optimized : ofdm_ss_ip_src_Real_Divide_HDL_Optimized
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              num => std_logic_vector(Data_Type_Conversion2_out1),  -- sfix32_En24
              den => std_logic_vector(Data_Type_Conversion3_out1),  -- sfix32_En24
              validIn => Constant_out1,
              y => Real_Divide_HDL_Optimized_out1  -- sfix16_En14
              );

  data_in_re_signed <= signed(data_in_re);

  data_in_im_signed <= signed(data_in_im);

  mergedInput <= unsigned(data_in_re_signed) & unsigned(data_in_im_signed);

  -- Input register for RAM-based shift register mergedDelay
  mergedDelay_reginc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_regin <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        mergedDelay_regin <= mergedInput;
      END IF;
    END IF;
  END PROCESS mergedDelay_reginc_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 2636
  -- Write address counter for RAM-based shift register mergedDelay
  mergedDelay_wr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_waddr <= to_unsigned(16#000#, 12);
      ELSIF enb = '1' THEN
        IF mergedDelay_waddr >= to_unsigned(16#A4C#, 12) THEN 
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
  --  count to value  = 2636
  -- Read address counter for RAM-based shift register mergedDelay
  mergedDelay_rd_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        mergedDelay_raddr <= to_unsigned(16#001#, 12);
      ELSIF enb = '1' THEN
        IF mergedDelay_raddr >= to_unsigned(16#A4C#, 12) THEN 
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
        mergedOutput <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        mergedOutput <= mergedDelay_regout_unsigned;
      END IF;
    END IF;
  END PROCESS mergedDelay_regoutc_process;


  slicedInput <= mergedOutput(31 DOWNTO 16);

  realOutput <= signed(slicedInput);

  data_out_re <= std_logic_vector(realOutput);

  slicedInput_1 <= mergedOutput(15 DOWNTO 0);

  imagOutput <= signed(slicedInput_1);

  data_out_im <= std_logic_vector(imagOutput);

  Constant1_out1 <= signed'("0000000000010000000000000000000000000000000");

  p_sig_signed <= signed(p_sig);

  Data_Type_Conversion2_out1 <= p_sig_signed(38 DOWNTO 7);

  r_sig_signed <= signed(r_sig);

  
  Switch_out1 <= Constant1_out1 WHEN Compare_To_Zero_out1 = '0' ELSE
      r_sig_signed;

  Data_Type_Conversion3_out1 <= Switch_out1(38 DOWNTO 7);

  Constant_out1 <= '1';

  p_pelado_re_signed <= signed(p_pelado_re);

  p_pelado_im_signed <= signed(p_pelado_im);

  Data_Type_Conversion_out1_re <= p_pelado_re_signed(31 DOWNTO 19);
  Data_Type_Conversion_out1_im <= p_pelado_im_signed(31 DOWNTO 19);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_reg_re <= (OTHERS => to_signed(16#0000#, 13));
        Delay1_reg_im <= (OTHERS => to_signed(16#0000#, 13));
      ELSIF enb = '1' THEN
        Delay1_reg_im(0) <= Data_Type_Conversion_out1_im;
        Delay1_reg_im(1 TO 46) <= Delay1_reg_im(0 TO 45);
        Delay1_reg_re(0) <= Data_Type_Conversion_out1_re;
        Delay1_reg_re(1 TO 46) <= Delay1_reg_re(0 TO 45);
      END IF;
    END IF;
  END PROCESS Delay1_process;

  Delay1_out1_re <= Delay1_reg_re(46);
  Delay1_out1_im <= Delay1_reg_im(46);

  P_d_re <= std_logic_vector(Delay1_out1_re);

  P_d_im <= std_logic_vector(Delay1_out1_im);

  M_d <= Real_Divide_HDL_Optimized_out1;

END rtl;
