-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_Shift_and_cast_to_output_type_block.vhd
-- Created: 2024-10-05 22:40:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_Shift_and_cast_to_output_type_block
-- Source Path: HDLRx/full_rx/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimized1/ForEach - Real Divide/Shift and cast to output typ
-- Hierarchy Level: 7
-- Model version: 1.125
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_rx_ip_src_Shift_and_cast_to_output_type_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        x                                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        shiftValue                        :   IN    std_logic_vector(33 DOWNTO 0);  -- sfix34
        y                                 :   OUT   std_logic_vector(17 DOWNTO 0)  -- sfix18_En12
        );
END full_rx_ip_src_Shift_and_cast_to_output_type_block;


ARCHITECTURE rtl OF full_rx_ip_src_Shift_and_cast_to_output_type_block IS

  -- Component Declarations
  COMPONENT full_rx_ip_src_Cast_to_Union_of_Types_block
    PORT( Xref                            :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En12
          Cin                             :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
          Cout                            :   OUT   std_logic_vector(21 DOWNTO 0)  -- sfix22_En16
          );
  END COMPONENT;

  COMPONENT full_rx_ip_src_Variable_Right_Shift_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          x                               :   IN    std_logic_vector(21 DOWNTO 0);  -- sfix22_En16
          rightShift                      :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          y                               :   OUT   std_logic_vector(21 DOWNTO 0)  -- sfix22_En16
          );
  END COMPONENT;

  COMPONENT full_rx_ip_src_Variable_Left_Shift_block
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          x                               :   IN    std_logic_vector(21 DOWNTO 0);  -- sfix22_En16
          leftShift                       :   IN    std_logic_vector(31 DOWNTO 0);  -- int32
          y                               :   OUT   std_logic_vector(21 DOWNTO 0)  -- sfix22_En16
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_rx_ip_src_Cast_to_Union_of_Types_block
    USE ENTITY work.full_rx_ip_src_Cast_to_Union_of_Types_block(rtl);

  FOR ALL : full_rx_ip_src_Variable_Right_Shift_block
    USE ENTITY work.full_rx_ip_src_Variable_Right_Shift_block(rtl);

  FOR ALL : full_rx_ip_src_Variable_Left_Shift_block
    USE ENTITY work.full_rx_ip_src_Variable_Left_Shift_block(rtl);

  -- Signals
  SIGNAL shiftValue_signed                : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL Constant_out1                    : signed(17 DOWNTO 0);  -- sfix18_En12
  SIGNAL Cout                             : std_logic_vector(21 DOWNTO 0);  -- ufix22
  SIGNAL Abs_rsvd_y                       : signed(34 DOWNTO 0);  -- sfix35
  SIGNAL Abs_out1                         : signed(31 DOWNTO 0);  -- int32
  SIGNAL Delay3_out1                      : signed(33 DOWNTO 0);  -- sfix34
  SIGNAL switch_compare_1                 : std_logic;
  SIGNAL Variable_Right_Shift_out1        : std_logic_vector(21 DOWNTO 0);  -- ufix22
  SIGNAL Variable_Right_Shift_out1_signed : signed(21 DOWNTO 0);  -- sfix22_En16
  SIGNAL Variable_Left_Shift_out1         : std_logic_vector(21 DOWNTO 0);  -- ufix22
  SIGNAL Variable_Left_Shift_out1_signed  : signed(21 DOWNTO 0);  -- sfix22_En16
  SIGNAL Switch_out1                      : signed(21 DOWNTO 0);  -- sfix22_En16
  SIGNAL Delay1_out1                      : signed(21 DOWNTO 0);  -- sfix22_En16
  SIGNAL Data_Type_Conversion_out1        : signed(17 DOWNTO 0);  -- sfix18_En12

BEGIN
  u_Cast_to_Union_of_Types : full_rx_ip_src_Cast_to_Union_of_Types_block
    PORT MAP( Xref => std_logic_vector(Constant_out1),  -- sfix18_En12
              Cin => x,  -- sfix18_En16
              Cout => Cout  -- sfix22_En16
              );

  u_Variable_Right_Shift : full_rx_ip_src_Variable_Right_Shift_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              x => Cout,  -- sfix22_En16
              rightShift => std_logic_vector(Abs_out1),  -- int32
              y => Variable_Right_Shift_out1  -- sfix22_En16
              );

  u_Variable_Left_Shift : full_rx_ip_src_Variable_Left_Shift_block
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              x => Cout,  -- sfix22_En16
              leftShift => std_logic_vector(Abs_out1),  -- int32
              y => Variable_Left_Shift_out1  -- sfix22_En16
              );

  shiftValue_signed <= signed(shiftValue);

  Constant_out1 <= to_signed(16#00000#, 18);

  
  Abs_rsvd_y <=  - (resize(shiftValue_signed, 35)) WHEN shiftValue_signed < to_signed(0, 34) ELSE
      resize(shiftValue_signed, 35);
  Abs_out1 <= Abs_rsvd_y(31 DOWNTO 0);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= to_signed(0, 34);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1 <= shiftValue_signed;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  
  switch_compare_1 <= '1' WHEN Delay3_out1 >= to_signed(0, 34) ELSE
      '0';

  Variable_Right_Shift_out1_signed <= signed(Variable_Right_Shift_out1);

  Variable_Left_Shift_out1_signed <= signed(Variable_Left_Shift_out1);

  
  Switch_out1 <= Variable_Right_Shift_out1_signed WHEN switch_compare_1 = '0' ELSE
      Variable_Left_Shift_out1_signed;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= to_signed(16#000000#, 22);
      ELSIF enb_1_2_0 = '1' THEN
        Delay1_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Data_Type_Conversion_out1 <= Delay1_out1(21 DOWNTO 4);

  y <= std_logic_vector(Data_Type_Conversion_out1);

END rtl;
