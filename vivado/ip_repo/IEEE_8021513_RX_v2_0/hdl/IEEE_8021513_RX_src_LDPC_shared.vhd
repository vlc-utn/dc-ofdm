-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_LDPC_shared.vhd
-- Created: 2024-11-23 11:22:01
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_LDPC_shared
-- Source Path: HDLRx/full_rx/LDPC_shared
-- Hierarchy Level: 1
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY IEEE_8021513_RX_src_LDPC_shared IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        ldpc_data_header                  :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        ldpc_ctrl_header_start            :   IN    std_logic;
        ldpc_ctrl_header_end              :   IN    std_logic;
        ldpc_ctrl_header_valid            :   IN    std_logic;
        ldpc_data_payload                 :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
        ldpc_ctrl_payload_start           :   IN    std_logic;
        ldpc_ctrl_payload_end             :   IN    std_logic;
        ldpc_ctrl_payload_valid           :   IN    std_logic;
        start_header                      :   IN    std_logic;
        end_header                        :   IN    std_logic;
        ldpc_data_out                     :   OUT   std_logic;
        ldpc_ctrl_header_out_start        :   OUT   std_logic;
        ldpc_ctrl_header_out_end          :   OUT   std_logic;
        ldpc_ctrl_header_out_valid        :   OUT   std_logic;
        ldpc_ctrl_payload_out_start       :   OUT   std_logic;
        ldpc_ctrl_payload_out_valid       :   OUT   std_logic;
        ldpc_next_frame                   :   OUT   std_logic
        );
END IEEE_8021513_RX_src_LDPC_shared;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_LDPC_shared IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_Sample_Control_Bus_Creator
    PORT( In1                             :   IN    std_logic;
          In2                             :   IN    std_logic;
          In3                             :   IN    std_logic;
          Out1_start                      :   OUT   std_logic;
          Out1_end                        :   OUT   std_logic;
          Out1_valid                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_LDPC_Decoder
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb                             :   IN    std_logic;
          in0                             :   IN    std_logic_vector(3 DOWNTO 0);  -- sfix4_En1
          in1_start                       :   IN    std_logic;
          in1_end                         :   IN    std_logic;
          in1_valid                       :   IN    std_logic;
          out0                            :   OUT   std_logic;
          out1_start                      :   OUT   std_logic;
          out1_end                        :   OUT   std_logic;
          out1_valid                      :   OUT   std_logic;
          out2                            :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_Sample_Control_Bus_Creator1
    PORT( In1                             :   IN    std_logic;
          In2                             :   IN    std_logic;
          In3                             :   IN    std_logic;
          Out1_start                      :   OUT   std_logic;
          Out1_end                        :   OUT   std_logic;
          Out1_valid                      :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_Sample_Control_Bus_Creator2
    PORT( In1                             :   IN    std_logic;
          In3                             :   IN    std_logic;
          Out1_start                      :   OUT   std_logic;
          Out1_valid                      :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_Sample_Control_Bus_Creator
    USE ENTITY work.IEEE_8021513_RX_src_Sample_Control_Bus_Creator(rtl);

  FOR ALL : IEEE_8021513_RX_src_LDPC_Decoder
    USE ENTITY work.IEEE_8021513_RX_src_LDPC_Decoder(rtl);

  FOR ALL : IEEE_8021513_RX_src_Sample_Control_Bus_Creator1
    USE ENTITY work.IEEE_8021513_RX_src_Sample_Control_Bus_Creator1(rtl);

  FOR ALL : IEEE_8021513_RX_src_Sample_Control_Bus_Creator2
    USE ENTITY work.IEEE_8021513_RX_src_Sample_Control_Bus_Creator2(rtl);

  -- Signals
  SIGNAL OR_out1                          : std_logic;
  SIGNAL Switch1_out1                     : std_logic;
  SIGNAL Unit_Delay_out1                  : std_logic;
  SIGNAL ldpc_data_payload_signed         : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL ldpc_data_header_signed          : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL Switch_out1                      : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL Delay4_out1                      : signed(3 DOWNTO 0);  -- sfix4_En1
  SIGNAL start                            : std_logic;
  SIGNAL start_1                          : std_logic;
  SIGNAL Switch2_out1                     : std_logic;
  SIGNAL end_rsvd                         : std_logic;
  SIGNAL end_rsvd_1                       : std_logic;
  SIGNAL Switch3_out1                     : std_logic;
  SIGNAL valid                            : std_logic;
  SIGNAL valid_1                          : std_logic;
  SIGNAL Switch4_out1                     : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_start : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_end : std_logic;
  SIGNAL Sample_Control_Bus_Creator_out1_valid : std_logic;
  SIGNAL Delay5_out1_start                : std_logic;
  SIGNAL Delay5_out1_end                  : std_logic;
  SIGNAL Delay5_out1_valid                : std_logic;
  SIGNAL LDPC_Decoder_out1                : std_logic;
  SIGNAL LDPC_Decoder_out2_start          : std_logic;
  SIGNAL LDPC_Decoder_out2_end            : std_logic;
  SIGNAL LDPC_Decoder_out2_valid          : std_logic;
  SIGNAL LDPC_Decoder_out3                : std_logic;
  SIGNAL Delay6_out1                      : std_logic;
  SIGNAL Delay3_out1                      : std_logic;
  SIGNAL Constant2_out1                   : std_logic;
  SIGNAL Delay7_out1_start                : std_logic;
  SIGNAL start_2                          : std_logic;
  SIGNAL Switch5_out1                     : std_logic;
  SIGNAL Constant1_out1                   : std_logic;
  SIGNAL Delay7_out1_end                  : std_logic;
  SIGNAL end_rsvd_2                       : std_logic;
  SIGNAL Switch6_out1                     : std_logic;
  SIGNAL Constant_out1                    : std_logic;
  SIGNAL Delay7_out1_valid                : std_logic;
  SIGNAL valid_2                          : std_logic;
  SIGNAL Switch7_out1                     : std_logic;
  SIGNAL Sample_Control_Bus_Creator1_out1_start : std_logic;
  SIGNAL Sample_Control_Bus_Creator1_out1_end : std_logic;
  SIGNAL Sample_Control_Bus_Creator1_out1_valid : std_logic;
  SIGNAL Delay_out1_start                 : std_logic;
  SIGNAL Delay_out1_end                   : std_logic;
  SIGNAL Delay_out1_valid                 : std_logic;
  SIGNAL Constant5_out1                   : std_logic;
  SIGNAL Switch8_out1                     : std_logic;
  SIGNAL Constant3_out1                   : std_logic;
  SIGNAL Switch10_out1                    : std_logic;
  SIGNAL Sample_Control_Bus_Creator2_out1_start : std_logic;
  SIGNAL Sample_Control_Bus_Creator2_out1_valid : std_logic;
  SIGNAL Delay1_out1_start                : std_logic;
  SIGNAL Delay1_out1_valid                : std_logic;
  SIGNAL Delay8_out1                      : std_logic;
  SIGNAL Delay2_out1                      : std_logic;

BEGIN
  u_Sample_Control_Bus_Creator : IEEE_8021513_RX_src_Sample_Control_Bus_Creator
    PORT MAP( In1 => Switch2_out1,
              In2 => Switch3_out1,
              In3 => Switch4_out1,
              Out1_start => Sample_Control_Bus_Creator_out1_start,
              Out1_end => Sample_Control_Bus_Creator_out1_end,
              Out1_valid => Sample_Control_Bus_Creator_out1_valid
              );

  u_LDPC_Decoder : IEEE_8021513_RX_src_LDPC_Decoder
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb => enb,
              in0 => std_logic_vector(Delay4_out1),  -- sfix4_En1
              in1_start => Delay5_out1_start,
              in1_end => Delay5_out1_end,
              in1_valid => Delay5_out1_valid,
              out0 => LDPC_Decoder_out1,
              out1_start => LDPC_Decoder_out2_start,
              out1_end => LDPC_Decoder_out2_end,
              out1_valid => LDPC_Decoder_out2_valid,
              out2 => LDPC_Decoder_out3
              );

  u_Sample_Control_Bus_Creator1 : IEEE_8021513_RX_src_Sample_Control_Bus_Creator1
    PORT MAP( In1 => Switch5_out1,
              In2 => Switch6_out1,
              In3 => Switch7_out1,
              Out1_start => Sample_Control_Bus_Creator1_out1_start,
              Out1_end => Sample_Control_Bus_Creator1_out1_end,
              Out1_valid => Sample_Control_Bus_Creator1_out1_valid
              );

  u_Sample_Control_Bus_Creator2 : IEEE_8021513_RX_src_Sample_Control_Bus_Creator2
    PORT MAP( In1 => Switch8_out1,
              In3 => Switch10_out1,
              Out1_start => Sample_Control_Bus_Creator2_out1_start,
              Out1_valid => Sample_Control_Bus_Creator2_out1_valid
              );

  OR_out1 <= start_header OR end_header;

  Unit_Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Unit_Delay_out1 <= '0';
      ELSIF enb = '1' THEN
        Unit_Delay_out1 <= Switch1_out1;
      END IF;
    END IF;
  END PROCESS Unit_Delay_process;


  
  Switch1_out1 <= Unit_Delay_out1 WHEN OR_out1 = '0' ELSE
      start_header;

  ldpc_data_payload_signed <= signed(ldpc_data_payload);

  ldpc_data_header_signed <= signed(ldpc_data_header);

  
  Switch_out1 <= ldpc_data_payload_signed WHEN Switch1_out1 = '0' ELSE
      ldpc_data_header_signed;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= to_signed(16#0#, 4);
      ELSIF enb = '1' THEN
        Delay4_out1 <= Switch_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  start <= ldpc_ctrl_payload_start;

  start_1 <= ldpc_ctrl_header_start;

  
  Switch2_out1 <= start WHEN Switch1_out1 = '0' ELSE
      start_1;

  end_rsvd <= ldpc_ctrl_payload_end;

  end_rsvd_1 <= ldpc_ctrl_header_end;

  
  Switch3_out1 <= end_rsvd WHEN Switch1_out1 = '0' ELSE
      end_rsvd_1;

  valid <= ldpc_ctrl_payload_valid;

  valid_1 <= ldpc_ctrl_header_valid;

  
  Switch4_out1 <= valid WHEN Switch1_out1 = '0' ELSE
      valid_1;

  c_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_start <= '0';
      ELSIF enb = '1' THEN
        Delay5_out1_start <= Sample_Control_Bus_Creator_out1_start;
      END IF;
    END IF;
  END PROCESS c_process;


  c_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_end <= '0';
      ELSIF enb = '1' THEN
        Delay5_out1_end <= Sample_Control_Bus_Creator_out1_end;
      END IF;
    END IF;
  END PROCESS c_1_process;


  c_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1_valid <= '0';
      ELSIF enb = '1' THEN
        Delay5_out1_valid <= Sample_Control_Bus_Creator_out1_valid;
      END IF;
    END IF;
  END PROCESS c_2_process;


  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay6_out1 <= LDPC_Decoder_out1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay3_out1 <= Delay6_out1;
      END IF;
    END IF;
  END PROCESS Delay3_process;


  Constant2_out1 <= '0';

  c_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1_start <= '0';
      ELSIF enb = '1' THEN
        Delay7_out1_start <= LDPC_Decoder_out2_start;
      END IF;
    END IF;
  END PROCESS c_3_process;


  start_2 <= Delay7_out1_start;

  
  Switch5_out1 <= Constant2_out1 WHEN Switch1_out1 = '0' ELSE
      start_2;

  Constant1_out1 <= '0';

  c_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1_end <= '0';
      ELSIF enb = '1' THEN
        Delay7_out1_end <= LDPC_Decoder_out2_end;
      END IF;
    END IF;
  END PROCESS c_4_process;


  end_rsvd_2 <= Delay7_out1_end;

  
  Switch6_out1 <= Constant1_out1 WHEN Switch1_out1 = '0' ELSE
      end_rsvd_2;

  Constant_out1 <= '0';

  c_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1_valid <= '0';
      ELSIF enb = '1' THEN
        Delay7_out1_valid <= LDPC_Decoder_out2_valid;
      END IF;
    END IF;
  END PROCESS c_5_process;


  valid_2 <= Delay7_out1_valid;

  
  Switch7_out1 <= Constant_out1 WHEN Switch1_out1 = '0' ELSE
      valid_2;

  c_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_start <= '0';
      ELSIF enb = '1' THEN
        Delay_out1_start <= Sample_Control_Bus_Creator1_out1_start;
      END IF;
    END IF;
  END PROCESS c_6_process;


  c_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_end <= '0';
      ELSIF enb = '1' THEN
        Delay_out1_end <= Sample_Control_Bus_Creator1_out1_end;
      END IF;
    END IF;
  END PROCESS c_7_process;


  c_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1_valid <= '0';
      ELSIF enb = '1' THEN
        Delay_out1_valid <= Sample_Control_Bus_Creator1_out1_valid;
      END IF;
    END IF;
  END PROCESS c_8_process;


  Constant5_out1 <= '0';

  
  Switch8_out1 <= start_2 WHEN Switch1_out1 = '0' ELSE
      Constant5_out1;

  Constant3_out1 <= '0';

  
  Switch10_out1 <= valid_2 WHEN Switch1_out1 = '0' ELSE
      Constant3_out1;

  c_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_start <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1_start <= Sample_Control_Bus_Creator2_out1_start;
      END IF;
    END IF;
  END PROCESS c_9_process;


  c_11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_valid <= '0';
      ELSIF enb = '1' THEN
        Delay1_out1_valid <= Sample_Control_Bus_Creator2_out1_valid;
      END IF;
    END IF;
  END PROCESS c_11_process;


  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay8_out1 <= LDPC_Decoder_out3;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= '0';
      ELSIF enb = '1' THEN
        Delay2_out1 <= Delay8_out1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  ldpc_data_out <= Delay3_out1;

  ldpc_ctrl_header_out_start <= Delay_out1_start;

  ldpc_ctrl_header_out_end <= Delay_out1_end;

  ldpc_ctrl_header_out_valid <= Delay_out1_valid;

  ldpc_ctrl_payload_out_start <= Delay1_out1_start;

  ldpc_ctrl_payload_out_valid <= Delay1_out1_valid;

  ldpc_next_frame <= Delay2_out1;

END rtl;

