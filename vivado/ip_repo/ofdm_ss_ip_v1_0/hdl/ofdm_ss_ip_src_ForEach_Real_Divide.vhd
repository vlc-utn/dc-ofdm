-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLOFDMSS/ofdm_ss_ip_src_ForEach_Real_Divide.vhd
-- Created: 2024-10-01 22:57:03
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: ofdm_ss_ip_src_ForEach_Real_Divide
-- Source Path: HDLOFDMSS/hdl_wrapper/ofdm_symbol_sync/m_cox/Real Divide HDL Optimized/ForEach - Real Divide
-- Hierarchy Level: 4
-- Model version: 1.113
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.ofdm_ss_ip_src_hdl_wrapper_pac.ALL;

ENTITY ofdm_ss_ip_src_ForEach_Real_Divide IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        den                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        num                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        validIn                           :   IN    std_logic;
        y                                 :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
        );
END ofdm_ss_ip_src_ForEach_Real_Divide;


ARCHITECTURE rtl OF ofdm_ss_ip_src_ForEach_Real_Divide IS

  -- Component Declarations
  COMPONENT ofdm_ss_ip_src_Upcast_Wordlength
    PORT( x                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          y                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          u                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          v                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En24
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_Normalize_numerator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_MATLAB_Function
    PORT( num                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          t_num                           :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          num_out                         :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          t_num_out                       :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_Normalize_denominator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          u                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_Divide_real_numerator_by_denominator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          num                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          tNum                            :   IN    std_logic_vector(32 DOWNTO 0);  -- sfix33
          den                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          tDen                            :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          isNumNegative                   :   IN    std_logic;
          isDenNegative                   :   IN    std_logic;
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          e                               :   OUT   std_logic_vector(33 DOWNTO 0);  -- sfix34
          isDenZero                       :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_Shift_and_cast_to_output_type
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          x                               :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          shiftValue                      :   IN    std_logic_vector(33 DOWNTO 0);  -- sfix34
          y                               :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  COMPONENT ofdm_ss_ip_src_Divide_by_zero_handler
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          yIn                             :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En30
          yOut                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En14
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : ofdm_ss_ip_src_Upcast_Wordlength
    USE ENTITY work.ofdm_ss_ip_src_Upcast_Wordlength(rtl);

  FOR ALL : ofdm_ss_ip_src_Normalize_numerator
    USE ENTITY work.ofdm_ss_ip_src_Normalize_numerator(rtl);

  FOR ALL : ofdm_ss_ip_src_MATLAB_Function
    USE ENTITY work.ofdm_ss_ip_src_MATLAB_Function(rtl);

  FOR ALL : ofdm_ss_ip_src_Normalize_denominator
    USE ENTITY work.ofdm_ss_ip_src_Normalize_denominator(rtl);

  FOR ALL : ofdm_ss_ip_src_Divide_real_numerator_by_denominator
    USE ENTITY work.ofdm_ss_ip_src_Divide_real_numerator_by_denominator(rtl);

  FOR ALL : ofdm_ss_ip_src_Shift_and_cast_to_output_type
    USE ENTITY work.ofdm_ss_ip_src_Shift_and_cast_to_output_type(rtl);

  FOR ALL : ofdm_ss_ip_src_Divide_by_zero_handler
    USE ENTITY work.ofdm_ss_ip_src_Divide_by_zero_handler(rtl);

  -- Signals
  SIGNAL u                                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL v                                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL v_signed                         : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay14_out1                     : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay15_out1                     : std_logic;
  SIGNAL x                                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL e                                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL isNegative                       : std_logic;
  SIGNAL x_signed                         : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL e_signed                         : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay25_out1                     : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Delay26_out1                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL num_out                          : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL t_num_out                        : std_logic_vector(32 DOWNTO 0);  -- ufix33
  SIGNAL num_out_signed                   : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL t_num_out_signed                 : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL u_signed                         : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay4_out1                      : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL x_1                              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL e_1                              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL isNegative_1                     : std_logic;
  SIGNAL validOut                         : std_logic;
  SIGNAL x_signed_1                       : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL e_signed_1                       : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay16_out1                     : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Delay17_out1                     : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL Delay9_reg                       : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay9_out1                      : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Delay10_reg                      : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay10_out1                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay18_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay18_out1                     : std_logic;
  SIGNAL Delay11_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay11_out1                     : std_logic;
  SIGNAL Delay12_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay12_out1                     : std_logic;
  SIGNAL y_1                              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL t                                : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL isDenZeroOut                     : std_logic;
  SIGNAL validOut_1                       : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous2_out1 : std_logic;
  SIGNAL y_signed                         : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : signed(31 DOWNTO 0);  -- sfix32_En30
  SIGNAL t_signed                         : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Unit_Delay_Enabled_Synchronous1_out1 : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Delay2_reg                       : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay2_out1                      : std_logic;
  SIGNAL Shift_and_cast_to_output_type_out1 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Shift_and_cast_to_output_type_out1_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Divide_by_zero_handler_out1      : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Divide_by_zero_handler_out1_signed : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Switch_out1                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay1_out1                      : signed(15 DOWNTO 0);  -- sfix16_En14

BEGIN

  u_Upcast_Wordlength : ofdm_ss_ip_src_Upcast_Wordlength
    PORT MAP( x => den,  -- sfix32_En24
              y => num,  -- sfix32_En24
              u => u,  -- sfix32_En24
              v => v  -- sfix32_En24
              );

  u_Normalize_numerator : ofdm_ss_ip_src_Normalize_numerator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              u => std_logic_vector(Delay14_out1),  -- sfix32_En24
              validIn => Delay15_out1,
              x => x,  -- sfix32_En30
              e => e,  -- int32
              isNegative => isNegative
              );

  u_MATLAB_Function : ofdm_ss_ip_src_MATLAB_Function
    PORT MAP( num => std_logic_vector(Delay25_out1),  -- sfix32_En30
              t_num => std_logic_vector(Delay26_out1),  -- int32
              num_out => num_out,  -- sfix32_En30
              t_num_out => t_num_out  -- sfix33
              );

  u_Normalize_denominator : ofdm_ss_ip_src_Normalize_denominator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              u => std_logic_vector(Delay4_out1),  -- sfix32_En24
              validIn => Delay15_out1,
              x => x_1,  -- sfix32_En30
              e => e_1,  -- int32
              isNegative => isNegative_1,
              validOut => validOut
              );

  u_Divide_real_numerator_by_denominator : ofdm_ss_ip_src_Divide_real_numerator_by_denominator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              num => std_logic_vector(Delay16_out1),  -- sfix32_En30
              tNum => std_logic_vector(Delay17_out1),  -- sfix33
              den => std_logic_vector(Delay9_out1),  -- sfix32_En30
              tDen => std_logic_vector(Delay10_out1),  -- int32
              isNumNegative => Delay18_out1,
              isDenNegative => Delay11_out1,
              validIn => Delay12_out1,
              y => y_1,  -- sfix32_En30
              e => t,  -- sfix34
              isDenZero => isDenZeroOut,
              validOut => validOut_1
              );

  u_Shift_and_cast_to_output_type : ofdm_ss_ip_src_Shift_and_cast_to_output_type
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              x => std_logic_vector(Unit_Delay_Enabled_Synchronous_out1),  -- sfix32_En30
              shiftValue => std_logic_vector(Unit_Delay_Enabled_Synchronous1_out1),  -- sfix34
              y => Shift_and_cast_to_output_type_out1  -- sfix16_En14
              );

  u_Divide_by_zero_handler : ofdm_ss_ip_src_Divide_by_zero_handler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              yIn => std_logic_vector(Unit_Delay_Enabled_Synchronous_out1),  -- sfix32_En30
              yOut => Divide_by_zero_handler_out1  -- sfix16_En14
              );

  v_signed <= signed(v);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay14_out1 <= v_signed;
      END IF;
    END IF;
  END PROCESS Delay14_process;


  Delay15_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay15_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay15_out1 <= validIn;
      END IF;
    END IF;
  END PROCESS Delay15_process;


  x_signed <= signed(x);

  e_signed <= signed(e);

  Delay25_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay25_out1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay25_out1 <= x_signed;
      END IF;
    END IF;
  END PROCESS Delay25_process;


  Delay26_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay26_out1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay26_out1 <= e_signed;
      END IF;
    END IF;
  END PROCESS Delay26_process;


  num_out_signed <= signed(num_out);

  t_num_out_signed <= signed(t_num_out);

  u_signed <= signed(u);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay4_out1 <= u_signed;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  x_signed_1 <= signed(x_1);

  e_signed_1 <= signed(e_1);

  Delay16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay16_out1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay16_out1 <= num_out_signed;
      END IF;
    END IF;
  END PROCESS Delay16_process;


  Delay17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay17_out1 <= to_signed(0, 33);
      ELSIF enb = '1' THEN
        Delay17_out1 <= t_num_out_signed;
      END IF;
    END IF;
  END PROCESS Delay17_process;


  Delay9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        Delay9_reg(0) <= x_signed_1;
        Delay9_reg(1) <= Delay9_reg(0);
      END IF;
    END IF;
  END PROCESS Delay9_process;

  Delay9_out1 <= Delay9_reg(1);

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        Delay10_reg(0) <= e_signed_1;
        Delay10_reg(1) <= Delay10_reg(0);
      END IF;
    END IF;
  END PROCESS Delay10_process;

  Delay10_out1 <= Delay10_reg(1);

  Delay18_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay18_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay18_reg(0) <= isNegative;
        Delay18_reg(1) <= Delay18_reg(0);
      END IF;
    END IF;
  END PROCESS Delay18_process;

  Delay18_out1 <= Delay18_reg(1);

  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay11_reg(0) <= isNegative_1;
        Delay11_reg(1) <= Delay11_reg(0);
      END IF;
    END IF;
  END PROCESS Delay11_process;

  Delay11_out1 <= Delay11_reg(1);

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay12_reg(0) <= validOut;
        Delay12_reg(1) <= Delay12_reg(0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(1);

  Unit_Delay_Enabled_Synchronous2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1 <= '0';
      ELSIF enb = '1' AND validOut_1 = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1 <= isDenZeroOut;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous2_process;


  y_signed <= signed(y_1);

  Unit_Delay_Enabled_Synchronous_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= to_signed(0, 32);
      ELSIF enb = '1' AND validOut_1 = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= y_signed;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous_process;


  t_signed <= signed(t);

  Unit_Delay_Enabled_Synchronous1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1 <= to_signed(0, 34);
      ELSIF enb = '1' AND validOut_1 = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1 <= t_signed;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous1_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay2_reg(0) <= Unit_Delay_Enabled_Synchronous2_out1;
        Delay2_reg(1) <= Delay2_reg(0);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(1);

  Shift_and_cast_to_output_type_out1_signed <= signed(Shift_and_cast_to_output_type_out1);

  Divide_by_zero_handler_out1_signed <= signed(Divide_by_zero_handler_out1);

  
  Switch_out1 <= Shift_and_cast_to_output_type_out1_signed WHEN Delay2_out1 = '0' ELSE
      Divide_by_zero_handler_out1_signed;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay1_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  y <= std_logic_vector(Delay1_out1);

END rtl;

