-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/test/divider_ip_src_ForEach_Complex_Divide.vhd
-- Created: 2024-10-03 19:36:10
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: divider_ip_src_ForEach_Complex_Divide
-- Source Path: test/divider/Complex Divide HDL Optimized/ForEach - Complex Divide
-- Hierarchy Level: 2
-- Model version: 1.59
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.divider_ip_src_divider_pac.ALL;

ENTITY divider_ip_src_ForEach_Complex_Divide IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        den_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        den_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        num_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        num_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        validIn                           :   IN    std_logic;
        y_re                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        y_im                              :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        validOut                          :   OUT   std_logic
        );
END divider_ip_src_ForEach_Complex_Divide;


ARCHITECTURE rtl OF divider_ip_src_ForEach_Complex_Divide IS

  -- Component Declarations
  COMPONENT divider_ip_src_Upcast_Wordlength
    PORT( x_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          x_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          y_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          y_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          u_re                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          u_im                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          v_re                            :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          v_im                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Rotate_to_real_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          den_real                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          den_imag                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          num_real                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          num_imag                        :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          validIn                         :   IN    std_logic;
          den_real_out                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          num_real_out                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          num_imag_out                    :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Normalize_real_numerator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT divider_ip_src_MATLAB_Function1
    PORT( num                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          t_num                           :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          num_out                         :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          t_num_out                       :   OUT   std_logic_vector(32 DOWNTO 0)  -- sfix33
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Normalize_denominator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Divide_real_numerator_by_denominator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          num                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          tNum                            :   IN    std_logic_vector(32 DOWNTO 0);  -- sfix33
          den                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          tDen                            :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          isNumNegative                   :   IN    std_logic;
          isDenNegative                   :   IN    std_logic;
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          e                               :   OUT   std_logic_vector(33 DOWNTO 0);  -- sfix34
          isDenZero                       :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Normalize_imag_numerator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          u                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
          validIn                         :   IN    std_logic;
          x                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          e                               :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
          isNegative                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Divide_imag_numerator_by_denominator
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          num                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          tNum                            :   IN    std_logic_vector(32 DOWNTO 0);  -- sfix33
          den                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          tDen                            :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          isNumNegative                   :   IN    std_logic;
          isDenNegative                   :   IN    std_logic;
          validIn                         :   IN    std_logic;
          y                               :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          e                               :   OUT   std_logic_vector(33 DOWNTO 0);  -- sfix34
          isDenZero                       :   OUT   std_logic;
          validOut                        :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Shift_and_cast_to_output_type
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          x                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          shiftValue                      :   IN    std_logic_vector(33 DOWNTO 0);  -- sfix34
          y                               :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Shift_and_cast_to_output_type1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          x                               :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          shiftValue                      :   IN    std_logic_vector(33 DOWNTO 0);  -- sfix34
          y                               :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Divide_by_zero_handler_real
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          yIn                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          yOut                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
          );
  END COMPONENT;

  COMPONENT divider_ip_src_Divide_by_zero_handler_imag
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          yIn                             :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          yOut                            :   OUT   std_logic_vector(15 DOWNTO 0)  -- sfix16_En10
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : divider_ip_src_Upcast_Wordlength
    USE ENTITY work.divider_ip_src_Upcast_Wordlength(rtl);

  FOR ALL : divider_ip_src_Rotate_to_real_block
    USE ENTITY work.divider_ip_src_Rotate_to_real_block(rtl);

  FOR ALL : divider_ip_src_Normalize_real_numerator
    USE ENTITY work.divider_ip_src_Normalize_real_numerator(rtl);

  FOR ALL : divider_ip_src_MATLAB_Function1
    USE ENTITY work.divider_ip_src_MATLAB_Function1(rtl);

  FOR ALL : divider_ip_src_Normalize_denominator
    USE ENTITY work.divider_ip_src_Normalize_denominator(rtl);

  FOR ALL : divider_ip_src_Divide_real_numerator_by_denominator
    USE ENTITY work.divider_ip_src_Divide_real_numerator_by_denominator(rtl);

  FOR ALL : divider_ip_src_Normalize_imag_numerator
    USE ENTITY work.divider_ip_src_Normalize_imag_numerator(rtl);

  FOR ALL : divider_ip_src_Divide_imag_numerator_by_denominator
    USE ENTITY work.divider_ip_src_Divide_imag_numerator_by_denominator(rtl);

  FOR ALL : divider_ip_src_Shift_and_cast_to_output_type
    USE ENTITY work.divider_ip_src_Shift_and_cast_to_output_type(rtl);

  FOR ALL : divider_ip_src_Shift_and_cast_to_output_type1
    USE ENTITY work.divider_ip_src_Shift_and_cast_to_output_type1(rtl);

  FOR ALL : divider_ip_src_Divide_by_zero_handler_real
    USE ENTITY work.divider_ip_src_Divide_by_zero_handler_real(rtl);

  FOR ALL : divider_ip_src_Divide_by_zero_handler_imag
    USE ENTITY work.divider_ip_src_Divide_by_zero_handler_imag(rtl);

  -- Signals
  SIGNAL u_re                             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL u_im                             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL v_re                             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL v_im                             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL u_re_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL u_im_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay4_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay4_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL v_re_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL v_im_signed                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay14_out1_re                  : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay14_out1_im                  : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay15_out1                     : std_logic;
  SIGNAL den_real_out                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL num_real_out                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL num_imag_out                     : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL validOut_1                       : std_logic;
  SIGNAL num_real_out_signed              : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay7_out1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL x                                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL e                                : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL isNegative                       : std_logic;
  SIGNAL x_signed                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL e_signed                         : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay25_out1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay26_out1                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL MATLAB_Function_out1             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL MATLAB_Function_out2             : std_logic_vector(32 DOWNTO 0);  -- ufix33
  SIGNAL MATLAB_Function_out1_signed      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL MATLAB_Function_out2_signed      : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL Delay16_out1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay17_out1                     : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL den_real_out_signed              : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay5_out1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL x_1                              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL e_1                              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL isNegative_1                     : std_logic;
  SIGNAL validOut_2                       : std_logic;
  SIGNAL x_signed_1                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay9_reg                       : vector_of_signed16(0 TO 1);  -- sfix16 [2]
  SIGNAL Delay9_out1                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL e_signed_1                       : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay10_reg                      : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay10_out1                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay18_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay18_out1                     : std_logic;
  SIGNAL Delay11_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay11_out1                     : std_logic;
  SIGNAL Delay12_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay12_out1                     : std_logic;
  SIGNAL y                                : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL t                                : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL isDenZeroOut                     : std_logic;
  SIGNAL validOut_3                       : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous4_out1 : std_logic;
  SIGNAL num_imag_out_signed              : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay8_out1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL x_2                              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL e_2                              : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL isNegative_2                     : std_logic;
  SIGNAL x_signed_2                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL e_signed_2                       : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay28_out1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay27_out1                     : signed(31 DOWNTO 0);  -- int32
  SIGNAL num_out                          : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL t_num_out                        : std_logic_vector(32 DOWNTO 0);  -- ufix33
  SIGNAL num_out_signed                   : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL t_num_out_signed                 : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL Delay19_out1                     : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Delay20_out1                     : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL Delay21_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay21_out1                     : std_logic;
  SIGNAL y_1                              : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL t_1                              : std_logic_vector(33 DOWNTO 0);  -- ufix34
  SIGNAL isDenZeroOut_1                   : std_logic;
  SIGNAL validOut_4                       : std_logic;
  SIGNAL Unit_Delay_Enabled_Synchronous5_out1 : std_logic;
  SIGNAL AND_out1                         : std_logic;
  SIGNAL Delay29_reg                      : std_logic_vector(2 DOWNTO 0);  -- ufix1 [3]
  SIGNAL Delay29_out1                     : std_logic;
  SIGNAL y_signed                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Unit_Delay_Enabled_Synchronous_out1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL t_signed                         : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Unit_Delay_Enabled_Synchronous1_out1 : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Shift_and_cast_to_output_type_out1 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Shift_and_cast_to_output_type_out1_signed : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay1_out1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL y_signed_1                       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Unit_Delay_Enabled_Synchronous2_out1 : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL t_signed_1                       : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Unit_Delay_Enabled_Synchronous3_out1 : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Shift_and_cast_to_output_type1_out1 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Shift_and_cast_to_output_type1_out1_signed : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay2_out1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Divide_by_zero_handler_real_out1 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Divide_by_zero_handler_real_out1_signed : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay13_out1                     : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Divide_by_zero_handler_imag_out1 : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL Divide_by_zero_handler_imag_out1_signed : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay24_out1                     : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Switch_out1_re                   : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Switch_out1_im                   : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay22_out1                     : std_logic;
  SIGNAL Delay23_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay23_out1                     : std_logic;
  SIGNAL Delay3_out1                      : std_logic;

BEGIN
  u_Upcast_Wordlength : divider_ip_src_Upcast_Wordlength
    PORT MAP( x_re => den_re,  -- sfix16_En10
              x_im => den_im,  -- sfix16_En10
              y_re => num_re,  -- sfix16_En10
              y_im => num_im,  -- sfix16_En10
              u_re => u_re,  -- sfix16_En10
              u_im => u_im,  -- sfix16_En10
              v_re => v_re,  -- sfix16_En10
              v_im => v_im  -- sfix16_En10
              );

  u_Rotate_to_real : divider_ip_src_Rotate_to_real_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              den_real => std_logic_vector(Delay4_out1_re),  -- sfix16_En10
              den_imag => std_logic_vector(Delay4_out1_im),  -- sfix16_En10
              num_real => std_logic_vector(Delay14_out1_re),  -- sfix16_En10
              num_imag => std_logic_vector(Delay14_out1_im),  -- sfix16_En10
              validIn => Delay15_out1,
              den_real_out => den_real_out,  -- sfix16_En10
              num_real_out => num_real_out,  -- sfix16_En10
              num_imag_out => num_imag_out,  -- sfix16_En10
              validOut => validOut_1
              );

  u_Normalize_real_numerator : divider_ip_src_Normalize_real_numerator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              u => std_logic_vector(Delay7_out1),  -- sfix16_En10
              validIn => Delay6_out1,
              x => x,  -- sfix16_En14
              e => e,  -- int32
              isNegative => isNegative
              );

  u_MATLAB_Function : divider_ip_src_MATLAB_Function1
    PORT MAP( num => std_logic_vector(Delay25_out1),  -- sfix16_En14
              t_num => std_logic_vector(Delay26_out1),  -- int32
              num_out => MATLAB_Function_out1,  -- sfix16_En14
              t_num_out => MATLAB_Function_out2  -- sfix33
              );

  u_Normalize_denominator : divider_ip_src_Normalize_denominator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              u => std_logic_vector(Delay5_out1),  -- sfix16_En10
              validIn => Delay6_out1,
              x => x_1,  -- sfix16_En14
              e => e_1,  -- int32
              isNegative => isNegative_1,
              validOut => validOut_2
              );

  u_Divide_real_numerator_by_denominator : divider_ip_src_Divide_real_numerator_by_denominator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              num => std_logic_vector(Delay16_out1),  -- sfix16_En14
              tNum => std_logic_vector(Delay17_out1),  -- sfix33
              den => std_logic_vector(Delay9_out1),  -- sfix16_En14
              tDen => std_logic_vector(Delay10_out1),  -- int32
              isNumNegative => Delay18_out1,
              isDenNegative => Delay11_out1,
              validIn => Delay12_out1,
              y => y,  -- sfix16_En14
              e => t,  -- sfix34
              isDenZero => isDenZeroOut,
              validOut => validOut_3
              );

  u_Normalize_imag_numerator : divider_ip_src_Normalize_imag_numerator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              u => std_logic_vector(Delay8_out1),  -- sfix16_En10
              validIn => Delay6_out1,
              x => x_2,  -- sfix16_En14
              e => e_2,  -- int32
              isNegative => isNegative_2
              );

  u_MATLAB_Function1 : divider_ip_src_MATLAB_Function1
    PORT MAP( num => std_logic_vector(Delay28_out1),  -- sfix16_En14
              t_num => std_logic_vector(Delay27_out1),  -- int32
              num_out => num_out,  -- sfix16_En14
              t_num_out => t_num_out  -- sfix33
              );

  u_Divide_imag_numerator_by_denominator : divider_ip_src_Divide_imag_numerator_by_denominator
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              num => std_logic_vector(Delay19_out1),  -- sfix16_En14
              tNum => std_logic_vector(Delay20_out1),  -- sfix33
              den => std_logic_vector(Delay9_out1),  -- sfix16_En14
              tDen => std_logic_vector(Delay10_out1),  -- int32
              isNumNegative => Delay21_out1,
              isDenNegative => Delay11_out1,
              validIn => Delay12_out1,
              y => y_1,  -- sfix16_En14
              e => t_1,  -- sfix34
              isDenZero => isDenZeroOut_1,
              validOut => validOut_4
              );

  u_Shift_and_cast_to_output_type : divider_ip_src_Shift_and_cast_to_output_type
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              x => std_logic_vector(Unit_Delay_Enabled_Synchronous_out1),  -- sfix16_En14
              shiftValue => std_logic_vector(Unit_Delay_Enabled_Synchronous1_out1),  -- sfix34
              y => Shift_and_cast_to_output_type_out1  -- sfix16_En10
              );

  u_Shift_and_cast_to_output_type1 : divider_ip_src_Shift_and_cast_to_output_type1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              x => std_logic_vector(Unit_Delay_Enabled_Synchronous2_out1),  -- sfix16_En14
              shiftValue => std_logic_vector(Unit_Delay_Enabled_Synchronous3_out1),  -- sfix34
              y => Shift_and_cast_to_output_type1_out1  -- sfix16_En10
              );

  u_Divide_by_zero_handler_real : divider_ip_src_Divide_by_zero_handler_real
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              yIn => std_logic_vector(Unit_Delay_Enabled_Synchronous_out1),  -- sfix16_En14
              yOut => Divide_by_zero_handler_real_out1  -- sfix16_En10
              );

  u_Divide_by_zero_handler_imag : divider_ip_src_Divide_by_zero_handler_imag
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              yIn => std_logic_vector(Unit_Delay_Enabled_Synchronous2_out1),  -- sfix16_En14
              yOut => Divide_by_zero_handler_imag_out1  -- sfix16_En10
              );

  u_re_signed <= signed(u_re);

  u_im_signed <= signed(u_im);

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1_re <= to_signed(16#0000#, 16);
        Delay4_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay4_out1_re <= u_re_signed;
        Delay4_out1_im <= u_im_signed;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  v_re_signed <= signed(v_re);

  v_im_signed <= signed(v_im);

  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1_re <= to_signed(16#0000#, 16);
        Delay14_out1_im <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay14_out1_re <= v_re_signed;
        Delay14_out1_im <= v_im_signed;
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


  num_real_out_signed <= signed(num_real_out);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay7_out1 <= num_real_out_signed;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay6_out1 <= validOut_1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  x_signed <= signed(x);

  e_signed <= signed(e);

  Delay25_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay25_out1 <= to_signed(16#0000#, 16);
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


  MATLAB_Function_out1_signed <= signed(MATLAB_Function_out1);

  MATLAB_Function_out2_signed <= signed(MATLAB_Function_out2);

  Delay16_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay16_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay16_out1 <= MATLAB_Function_out1_signed;
      END IF;
    END IF;
  END PROCESS Delay16_process;


  Delay17_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay17_out1 <= to_signed(0, 33);
      ELSIF enb = '1' THEN
        Delay17_out1 <= MATLAB_Function_out2_signed;
      END IF;
    END IF;
  END PROCESS Delay17_process;


  den_real_out_signed <= signed(den_real_out);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay5_out1 <= den_real_out_signed;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  x_signed_1 <= signed(x_1);

  Delay9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_reg <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb = '1' THEN
        Delay9_reg(0) <= x_signed_1;
        Delay9_reg(1) <= Delay9_reg(0);
      END IF;
    END IF;
  END PROCESS Delay9_process;

  Delay9_out1 <= Delay9_reg(1);

  e_signed_1 <= signed(e_1);

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
        Delay12_reg(0) <= validOut_2;
        Delay12_reg(1) <= Delay12_reg(0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(1);

  Unit_Delay_Enabled_Synchronous4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous4_out1 <= '0';
      ELSIF enb = '1' AND validOut_3 = '1' THEN
        Unit_Delay_Enabled_Synchronous4_out1 <= isDenZeroOut;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous4_process;


  num_imag_out_signed <= signed(num_imag_out);

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay8_out1 <= num_imag_out_signed;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  x_signed_2 <= signed(x_2);

  e_signed_2 <= signed(e_2);

  Delay28_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay28_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay28_out1 <= x_signed_2;
      END IF;
    END IF;
  END PROCESS Delay28_process;


  Delay27_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay27_out1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay27_out1 <= e_signed_2;
      END IF;
    END IF;
  END PROCESS Delay27_process;


  num_out_signed <= signed(num_out);

  t_num_out_signed <= signed(t_num_out);

  Delay19_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay19_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay19_out1 <= num_out_signed;
      END IF;
    END IF;
  END PROCESS Delay19_process;


  Delay20_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay20_out1 <= to_signed(0, 33);
      ELSIF enb = '1' THEN
        Delay20_out1 <= t_num_out_signed;
      END IF;
    END IF;
  END PROCESS Delay20_process;


  Delay21_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay21_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay21_reg(0) <= isNegative_2;
        Delay21_reg(1) <= Delay21_reg(0);
      END IF;
    END IF;
  END PROCESS Delay21_process;

  Delay21_out1 <= Delay21_reg(1);

  Unit_Delay_Enabled_Synchronous5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous5_out1 <= '0';
      ELSIF enb = '1' AND validOut_4 = '1' THEN
        Unit_Delay_Enabled_Synchronous5_out1 <= isDenZeroOut_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous5_process;


  AND_out1 <= Unit_Delay_Enabled_Synchronous4_out1 AND Unit_Delay_Enabled_Synchronous5_out1;

  Delay29_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay29_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay29_reg(0) <= AND_out1;
        Delay29_reg(2 DOWNTO 1) <= Delay29_reg(1 DOWNTO 0);
      END IF;
    END IF;
  END PROCESS Delay29_process;

  Delay29_out1 <= Delay29_reg(2);

  y_signed <= signed(y);

  Unit_Delay_Enabled_Synchronous_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' AND validOut_3 = '1' THEN
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
      ELSIF enb = '1' AND validOut_3 = '1' THEN
        Unit_Delay_Enabled_Synchronous1_out1 <= t_signed;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous1_process;


  Shift_and_cast_to_output_type_out1_signed <= signed(Shift_and_cast_to_output_type_out1);

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay1_out1 <= Shift_and_cast_to_output_type_out1_signed;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  y_signed_1 <= signed(y_1);

  Unit_Delay_Enabled_Synchronous2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' AND validOut_4 = '1' THEN
        Unit_Delay_Enabled_Synchronous2_out1 <= y_signed_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous2_process;


  t_signed_1 <= signed(t_1);

  Unit_Delay_Enabled_Synchronous3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_Enabled_Synchronous3_out1 <= to_signed(0, 34);
      ELSIF enb = '1' AND validOut_4 = '1' THEN
        Unit_Delay_Enabled_Synchronous3_out1 <= t_signed_1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_Enabled_Synchronous3_process;


  Shift_and_cast_to_output_type1_out1_signed <= signed(Shift_and_cast_to_output_type1_out1);

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay2_out1 <= Shift_and_cast_to_output_type1_out1_signed;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  Divide_by_zero_handler_real_out1_signed <= signed(Divide_by_zero_handler_real_out1);

  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay13_out1 <= Divide_by_zero_handler_real_out1_signed;
      END IF;
    END IF;
  END PROCESS Delay13_process;


  Divide_by_zero_handler_imag_out1_signed <= signed(Divide_by_zero_handler_imag_out1);

  Delay24_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay24_out1 <= to_signed(16#0000#, 16);
      ELSIF enb = '1' THEN
        Delay24_out1 <= Divide_by_zero_handler_imag_out1_signed;
      END IF;
    END IF;
  END PROCESS Delay24_process;


  
  Switch_out1_re <= Delay1_out1 WHEN Delay29_out1 = '0' ELSE
      Delay13_out1;
  
  Switch_out1_im <= Delay2_out1 WHEN Delay29_out1 = '0' ELSE
      Delay24_out1;

  y_re <= std_logic_vector(Switch_out1_re);

  y_im <= std_logic_vector(Switch_out1_im);

  Delay22_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay22_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay22_out1 <= validOut_4;
      END IF;
    END IF;
  END PROCESS Delay22_process;


  Delay23_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay23_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        Delay23_reg(0) <= Delay22_out1;
        Delay23_reg(1) <= Delay23_reg(0);
      END IF;
    END IF;
  END PROCESS Delay23_process;

  Delay23_out1 <= Delay23_reg(1);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1 <= Delay23_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  validOut <= Delay3_out1;

END rtl;

