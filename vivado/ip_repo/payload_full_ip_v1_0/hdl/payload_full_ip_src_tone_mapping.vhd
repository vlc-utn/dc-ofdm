-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLPayloadFull/payload_full_ip_src_tone_mapping.vhd
-- Created: 2024-08-31 17:52:44
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: payload_full_ip_src_tone_mapping
-- Source Path: HDLPayloadFull/payload_full/tone_mapping
-- Hierarchy Level: 1
-- Model version: 1.46
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.payload_full_ip_src_payload_full_pac.ALL;

ENTITY payload_full_ip_src_tone_mapping IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        data_in                           :   IN    std_logic;
        ctrl_in_start                     :   IN    std_logic;
        ctrl_in_end                       :   IN    std_logic;
        ctrl_in_valid                     :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        len_in_ofdm_symbols               :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        new_frame                         :   IN    std_logic;
        data_out                          :   OUT   std_logic;
        ctrl_out_start                    :   OUT   std_logic;
        ctrl_out_end                      :   OUT   std_logic;
        ctrl_out_valid                    :   OUT   std_logic
        );
END payload_full_ip_src_tone_mapping;


ARCHITECTURE rtl OF payload_full_ip_src_tone_mapping IS

  -- Component Declarations
  COMPONENT payload_full_ip_src_Compare_To_Constant
    PORT( u                               :   IN    std_logic_vector(25 DOWNTO 0);  -- ufix26
          y                               :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT payload_full_ip_src_Sample_Control_Bus_Creator
    PORT( In1                             :   IN    std_logic;
          In2                             :   IN    std_logic;
          In3                             :   IN    std_logic;
          Out1_start                      :   OUT   std_logic;
          Out1_end                        :   OUT   std_logic;
          Out1_valid                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : payload_full_ip_src_Compare_To_Constant
    USE ENTITY work.payload_full_ip_src_Compare_To_Constant(rtl);

  FOR ALL : payload_full_ip_src_Sample_Control_Bus_Creator
    USE ENTITY work.payload_full_ip_src_Sample_Control_Bus_Creator(rtl);

  -- Signals
  SIGNAL kconst                           : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL kconst_1                         : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL bits_per_subcarrier_unsigned     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL Data_Type_Conversion_out1        : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL HwModeRegister3_reg              : vector_of_unsigned8(0 TO 1);  -- ufix8 [2]
  SIGNAL Data_Type_Conversion_out1_1      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay8_out1                      : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay8_out1_1                    : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL Delay8_out1_2                    : unsigned(9 DOWNTO 0);  -- ufix10
  SIGNAL len_in_ofdm_symbols_unsigned     : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL HwModeRegister1_reg              : vector_of_unsigned16(0 TO 3);  -- ufix16 [4]
  SIGNAL len_in_ofdm_symbols_1            : unsigned(15 DOWNTO 0);  -- uint16
  SIGNAL count_hit                        : unsigned(25 DOWNTO 0);  -- ufix26
  SIGNAL count_hit_1                      : unsigned(25 DOWNTO 0);  -- ufix26
  SIGNAL count_hit_2                      : unsigned(25 DOWNTO 0);  -- ufix26
  SIGNAL count_hit_3                      : unsigned(25 DOWNTO 0);  -- ufix26
  SIGNAL new_frame_1                      : std_logic;
  SIGNAL ctrl_in_valid_1                  : std_logic;
  SIGNAL valid                            : std_logic;
  SIGNAL count_step                       : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_reset                      : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL ctrl_in_end_1                    : std_logic;
  SIGNAL end_rsvd                         : std_logic;
  SIGNAL Subtract_out1                    : unsigned(25 DOWNTO 0);  -- ufix26
  SIGNAL Relational_Operator_out1         : std_logic;
  SIGNAL Logical_Operator_out1            : std_logic;
  SIGNAL count                            : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_1                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Switch2_out1                     : std_logic;
  SIGNAL hold_end                         : std_logic;
  SIGNAL enable                           : std_logic;
  SIGNAL count_2                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_3                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL count_4                          : unsigned(31 DOWNTO 0);  -- uint32
  SIGNAL Subtract_sub_cast                : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL Subtract_sub_cast_1              : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL Subtract_sub_temp                : signed(32 DOWNTO 0);  -- sfix33
  SIGNAL Compare_To_Constant_out1         : std_logic;
  SIGNAL Logical_Operator5_out1           : std_logic;
  SIGNAL Logical_Operator6_out1           : std_logic;
  SIGNAL Switch2_out1_1                   : std_logic;
  SIGNAL hold_end_1                       : std_logic;
  SIGNAL hold_end_2                       : std_logic;
  SIGNAL rd_10_reg                        : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL data_in_1                        : std_logic;
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Switch_out1                      : std_logic;
  SIGNAL ctrl_in_start_1                  : std_logic;
  SIGNAL start                            : std_logic;
  SIGNAL start_1                          : std_logic;
  SIGNAL Logical_Operator7_out1           : std_logic;
  SIGNAL new_frame_hold                   : std_logic;
  SIGNAL new_frame_hold_1                 : std_logic;
  SIGNAL Logical_Operator1_out1           : std_logic;
  SIGNAL Logical_Operator1_out1_1         : std_logic;
  SIGNAL hold_end_3                       : std_logic;
  SIGNAL Logical_Operator3_out1           : std_logic;
  SIGNAL Logical_Operator2_out1           : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_start : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_end : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_valid : std_logic;

BEGIN
  u_Compare_To_Constant : payload_full_ip_src_Compare_To_Constant
    PORT MAP( u => std_logic_vector(Subtract_out1),  -- ufix26
              y => Compare_To_Constant_out1
              );

  u_Sample_Control_Bus_Creator : payload_full_ip_src_Sample_Control_Bus_Creator
    PORT MAP( In1 => Logical_Operator1_out1_1,
              In2 => Logical_Operator3_out1,
              In3 => Logical_Operator2_out1,
              Out1_start => Sample_Control_Bus_Creator_out1_start,
              Out1_end => Sample_Control_Bus_Creator_out1_end,
              Out1_valid => Sample_Control_Bus_Creator_out1_valid
              );

  kconst <= to_unsigned(16#C2#, 8);

  HwModeRegister2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        kconst_1 <= to_unsigned(16#00#, 8);
      ELSIF enb = '1' THEN
        kconst_1 <= kconst;
      END IF;
    END IF;
  END PROCESS HwModeRegister2_process;


  bits_per_subcarrier_unsigned <= unsigned(bits_per_subcarrier);

  Data_Type_Conversion_out1 <= resize(bits_per_subcarrier_unsigned, 8);

  HwModeRegister3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister3_reg <= (OTHERS => to_unsigned(16#00#, 8));
      ELSIF enb = '1' THEN
        HwModeRegister3_reg(0) <= Data_Type_Conversion_out1;
        HwModeRegister3_reg(1) <= HwModeRegister3_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister3_process;

  Data_Type_Conversion_out1_1 <= HwModeRegister3_reg(1);

  Delay8_out1 <= resize(kconst_1 * Data_Type_Conversion_out1_1, 10);

  PipelineRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1_1 <= to_unsigned(16#000#, 10);
      ELSIF enb = '1' THEN
        Delay8_out1_1 <= Delay8_out1;
      END IF;
    END IF;
  END PROCESS PipelineRegister1_process;


  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1_2 <= to_unsigned(16#000#, 10);
      ELSIF enb = '1' THEN
        Delay8_out1_2 <= Delay8_out1_1;
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;


  len_in_ofdm_symbols_unsigned <= unsigned(len_in_ofdm_symbols);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister1_reg <= (OTHERS => to_unsigned(16#0000#, 16));
      ELSIF enb = '1' THEN
        HwModeRegister1_reg(0) <= len_in_ofdm_symbols_unsigned;
        HwModeRegister1_reg(1 TO 3) <= HwModeRegister1_reg(0 TO 2);
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;

  len_in_ofdm_symbols_1 <= HwModeRegister1_reg(3);

  count_hit <= Delay8_out1_2 * len_in_ofdm_symbols_1;

  PipelineRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count_hit_1 <= to_unsigned(16#0000000#, 26);
      ELSIF enb = '1' THEN
        count_hit_1 <= count_hit;
      END IF;
    END IF;
  END PROCESS PipelineRegister_process;


  count_hit_2 <= count_hit_1;

  count_hit_3 <= count_hit_2;

  rd_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        new_frame_1 <= '0';
      ELSIF enb = '1' THEN
        new_frame_1 <= new_frame;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        ctrl_in_valid_1 <= '0';
      ELSIF enb = '1' THEN
        ctrl_in_valid_1 <= ctrl_in_valid;
      END IF;
    END IF;
  END PROCESS c_process;


  rd_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        valid <= '0';
      ELSIF enb = '1' THEN
        valid <= ctrl_in_valid_1;
      END IF;
    END IF;
  END PROCESS rd_5_process;


  -- Free running, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  count_step <= to_unsigned(1, 32);

  count_reset <= to_unsigned(0, 32);

  c_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        ctrl_in_end_1 <= '0';
      ELSIF enb = '1' THEN
        ctrl_in_end_1 <= ctrl_in_end;
      END IF;
    END IF;
  END PROCESS c_1_process;


  end_rsvd <= ctrl_in_end_1;

  
  Relational_Operator_out1 <= '1' WHEN Subtract_out1 <= resize(Delay8_out1_1, 26) ELSE
      '0';

  Logical_Operator_out1 <= end_rsvd AND Relational_Operator_out1;

  count_1 <= count + count_step;

  hold_end <= Switch2_out1;

  enable <= valid OR hold_end;

  
  count_2 <= count WHEN enable = '0' ELSE
      count_1;

  rd_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        count_3 <= to_unsigned(0, 32);
      ELSIF enb = '1' THEN
        count_3 <= count_2;
      END IF;
    END IF;
  END PROCESS rd_7_process;


  
  count <= count_3 WHEN new_frame_1 = '0' ELSE
      count_reset;

  count_4 <= count;

  Subtract_sub_cast <= signed(resize(count_hit_3, 33));
  Subtract_sub_cast_1 <= signed(resize(count_4, 33));
  Subtract_sub_temp <= Subtract_sub_cast - Subtract_sub_cast_1;
  Subtract_out1 <= unsigned(Subtract_sub_temp(25 DOWNTO 0));

  Logical_Operator5_out1 <= Compare_To_Constant_out1 AND Switch2_out1;

  Logical_Operator6_out1 <= Logical_Operator5_out1 OR Logical_Operator_out1;

  
  Switch2_out1_1 <= Switch2_out1 WHEN Logical_Operator6_out1 = '0' ELSE
      Logical_Operator_out1;

  reduced_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Switch2_out1 <= '0';
      ELSIF enb = '1' THEN
        Switch2_out1 <= Switch2_out1_1;
      END IF;
    END IF;
  END PROCESS reduced_process;


  hold_end_1 <= Switch2_out1;

  rd_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        hold_end_2 <= '0';
      ELSIF enb = '1' THEN
        hold_end_2 <= hold_end_1;
      END IF;
    END IF;
  END PROCESS rd_9_process;


  rd_10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        rd_10_reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        rd_10_reg(0) <= data_in;
        rd_10_reg(1) <= rd_10_reg(0);
      END IF;
    END IF;
  END PROCESS rd_10_process;

  data_in_1 <= rd_10_reg(1);

  Constant_out1 <= '0';

  
  Switch_out1 <= data_in_1 WHEN hold_end_2 = '0' ELSE
      Constant_out1;

  c_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        ctrl_in_start_1 <= '0';
      ELSIF enb = '1' THEN
        ctrl_in_start_1 <= ctrl_in_start;
      END IF;
    END IF;
  END PROCESS c_2_process;


  start <= ctrl_in_start_1;

  rd_11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        start_1 <= '0';
      ELSIF enb = '1' THEN
        start_1 <= start;
      END IF;
    END IF;
  END PROCESS rd_11_process;


  Logical_Operator7_out1 <= start_1 OR new_frame;

  rd_12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        new_frame_hold_1 <= '0';
      ELSIF enb = '1' THEN
        new_frame_hold_1 <= new_frame_hold;
      END IF;
    END IF;
  END PROCESS rd_12_process;


  
  new_frame_hold <= new_frame_hold_1 WHEN Logical_Operator7_out1 = '0' ELSE
      new_frame;

  Logical_Operator1_out1 <= new_frame_hold AND start;

  rd_13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Logical_Operator1_out1_1 <= '0';
      ELSIF enb = '1' THEN
        Logical_Operator1_out1_1 <= Logical_Operator1_out1;
      END IF;
    END IF;
  END PROCESS rd_13_process;


  hold_end_3 <= Switch2_out1;

  Logical_Operator3_out1 <= Compare_To_Constant_out1 AND hold_end_3;

  Logical_Operator2_out1 <= valid OR Switch2_out1;

  data_out <= Switch_out1;

  ctrl_out_start <= Sample_Control_Bus_Creator_out1_start;

  ctrl_out_end <= Sample_Control_Bus_Creator_out1_end;

  ctrl_out_valid <= Sample_Control_Bus_Creator_out1_valid;

END rtl;

