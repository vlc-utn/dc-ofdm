-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip_src_enabled_qam_and_scrambler.vhd
-- Created: 2024-09-01 12:13:06
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip_src_enabled_qam_and_scrambler
-- Source Path: HDLModulatorFull/full_ofdm_modulator/enabled_qam_and_scrambler
-- Hierarchy Level: 1
-- Model version: 1.43
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_ofdm_modulator_ip_src_full_ofdm_modulator_pac.ALL;

ENTITY full_ofdm_modulator_ip_src_enabled_qam_and_scrambler IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        data_in                           :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        valid_in                          :   IN    std_logic;
        bits_per_subcarrier               :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        init                              :   IN    std_logic_vector(12 DOWNTO 0);  -- boolean [13]
        new_rsvd                          :   IN    std_logic;
        cp_len                            :   IN    std_logic_vector(7 DOWNTO 0);  -- uint8
        ofdm_en                           :   IN    std_logic;
        Enable                            :   IN    std_logic;
        data_out_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        data_out_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        valid_out                         :   OUT   std_logic;
        cp_len_out                        :   OUT   std_logic_vector(7 DOWNTO 0)  -- uint8
        );
END full_ofdm_modulator_ip_src_enabled_qam_and_scrambler;


ARCHITECTURE rtl OF full_ofdm_modulator_ip_src_enabled_qam_and_scrambler IS

  -- Component Declarations
  COMPONENT full_ofdm_modulator_ip_src_qam_mod
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in                         :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
          valid_in                        :   IN    std_logic;
          bits_per_subcarrier             :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
          ready_out                       :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_out_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_ofdm_modulator_ip_src_sync_constellation_scrambler
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          valid_in                        :   IN    std_logic;
          init                            :   IN    std_logic_vector(12 DOWNTO 0);  -- boolean [13]
          new_ofdm_symbol                 :   IN    std_logic;
          ready_out                       :   IN    std_logic;
          s1                              :   OUT   std_logic;
          s2                              :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_ofdm_modulator_ip_src_constellation_scrambler
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          data_in_re                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_in_im                      :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_in                        :   IN    std_logic;
          s1_in                           :   IN    std_logic;
          s2_in                           :   IN    std_logic;
          ready_out                       :   IN    std_logic;
          data_out_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          data_out_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          valid_out                       :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_ofdm_modulator_ip_src_qam_mod
    USE ENTITY work.full_ofdm_modulator_ip_src_qam_mod(rtl);

  FOR ALL : full_ofdm_modulator_ip_src_sync_constellation_scrambler
    USE ENTITY work.full_ofdm_modulator_ip_src_sync_constellation_scrambler(rtl);

  FOR ALL : full_ofdm_modulator_ip_src_constellation_scrambler
    USE ENTITY work.full_ofdm_modulator_ip_src_constellation_scrambler(rtl);

  -- Signals
  SIGNAL ready_out                        : std_logic;
  SIGNAL ready_out_1                      : std_logic;
  SIGNAL enb_1_2_0_gated                  : std_logic;
  SIGNAL qam_mod_out1_re                  : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL qam_mod_out1_im                  : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL qam_mod_out2                     : std_logic;
  SIGNAL qam_mod_out1_re_signed           : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL qam_mod_out1_im_signed           : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL enb_1_2_0_gated_1                : std_logic;
  SIGNAL Delay10_out1_re                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay10_out1_im                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL enb_1_2_0_gated_2                : std_logic;
  SIGNAL Delay9_out1                      : std_logic;
  SIGNAL init_1                           : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL enb_1_2_0_gated_3                : std_logic;
  SIGNAL Delay_out1                       : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL enb_1_2_0_gated_4                : std_logic;
  SIGNAL Delay8_out1                      : std_logic_vector(12 DOWNTO 0);  -- boolean [13]
  SIGNAL new_rsvd_1                       : std_logic;
  SIGNAL enb_1_2_0_gated_5                : std_logic;
  SIGNAL Delay1_out1                      : std_logic;
  SIGNAL enb_1_2_0_gated_6                : std_logic;
  SIGNAL Delay7_out1                      : std_logic;
  SIGNAL sync_constellation_scrambler_out1 : std_logic;
  SIGNAL sync_constellation_scrambler_out2 : std_logic;
  SIGNAL out_new_re                       : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL out_new_im                       : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL constellation_scrambler_out2     : std_logic;
  SIGNAL out_new_re_signed                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL out_new_im_signed                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL enb_1_2_0_gated_7                : std_logic;
  SIGNAL valid_new_re                     : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL valid_new_im                     : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay13_reg_re                   : vector_of_signed12(0 TO 1);  -- sfix12_En10 [2]
  SIGNAL Delay13_reg_im                   : vector_of_signed12(0 TO 1);  -- sfix12_En10 [2]
  SIGNAL Delay13_out1_re                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay13_out1_im                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay13_out1_re_1                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay13_out1_im_1                : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay13_out1_last_value_re       : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Delay13_out1_last_value_im       : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL enb_1_2_0_gated_8                : std_logic;
  SIGNAL ofdm_en_1                        : std_logic;
  SIGNAL enb_1_2_0_gated_9                : std_logic;
  SIGNAL Delay4_out1                      : std_logic;
  SIGNAL valid_new                        : std_logic;
  SIGNAL Delay12_reg                      : std_logic_vector(1 DOWNTO 0);  -- ufix1 [2]
  SIGNAL Delay12_out1                     : std_logic;
  SIGNAL Delay12_out1_1                   : std_logic;
  SIGNAL Delay12_out1_last_value          : std_logic;
  SIGNAL ready_out_2                      : std_logic;
  SIGNAL enb_1_2_0_gated_10               : std_logic;
  SIGNAL cp_len_unsigned                  : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL cp_len_1                         : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL enb_1_2_0_gated_11               : std_logic;
  SIGNAL Delay2_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL enb_1_2_0_gated_12               : std_logic;
  SIGNAL Delay11_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL enb_1_2_0_gated_13               : std_logic;
  SIGNAL Delay3_reg                       : vector_of_unsigned8(0 TO 2);  -- ufix8 [3]
  SIGNAL Delay3_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay3_out1_1                    : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL enb_1_2_0_gated_14               : std_logic;
  SIGNAL Delay6_out1                      : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay14_reg                      : vector_of_unsigned8(0 TO 1);  -- ufix8 [2]
  SIGNAL Delay14_out1                     : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay14_out1_1                   : unsigned(7 DOWNTO 0);  -- uint8
  SIGNAL Delay14_out1_last_value          : unsigned(7 DOWNTO 0);  -- uint8

BEGIN
  u_qam_mod : full_ofdm_modulator_ip_src_qam_mod
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in => data_in,  -- ufix12
              valid_in => valid_in,
              bits_per_subcarrier => bits_per_subcarrier,  -- ufix4
              ready_out => ready_out,
              data_out_re => qam_mod_out1_re,  -- sfix12_En10
              data_out_im => qam_mod_out1_im,  -- sfix12_En10
              valid_out => qam_mod_out2
              );

  u_sync_constellation_scrambler : full_ofdm_modulator_ip_src_sync_constellation_scrambler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              valid_in => Delay9_out1,
              init => Delay8_out1,  -- boolean [13]
              new_ofdm_symbol => Delay7_out1,
              ready_out => ready_out,
              s1 => sync_constellation_scrambler_out1,
              s2 => sync_constellation_scrambler_out2
              );

  u_constellation_scrambler : full_ofdm_modulator_ip_src_constellation_scrambler
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              data_in_re => std_logic_vector(Delay10_out1_re),  -- sfix12_En10
              data_in_im => std_logic_vector(Delay10_out1_im),  -- sfix12_En10
              valid_in => Delay9_out1,
              s1_in => sync_constellation_scrambler_out1,
              s2_in => sync_constellation_scrambler_out2,
              ready_out => ready_out,
              data_out_re => out_new_re,  -- sfix12_En10
              data_out_im => out_new_im,  -- sfix12_En10
              valid_out => constellation_scrambler_out2
              );

  ready_out <= Enable;

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        ready_out_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        ready_out_1 <= ready_out;
      END IF;
    END IF;
  END PROCESS rd_0_process;


  enb_1_2_0_gated <= ready_out_1 AND enb_1_2_0;

  qam_mod_out1_re_signed <= signed(qam_mod_out1_re);

  qam_mod_out1_im_signed <= signed(qam_mod_out1_im);

  enb_1_2_0_gated_1 <= ready_out_1 AND enb_1_2_0;

  Delay10_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay10_out1_re <= to_signed(16#000#, 12);
        Delay10_out1_im <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0_gated_1 = '1' THEN
        Delay10_out1_re <= qam_mod_out1_re_signed;
        Delay10_out1_im <= qam_mod_out1_im_signed;
      END IF;
    END IF;
  END PROCESS Delay10_process;


  enb_1_2_0_gated_2 <= ready_out_1 AND enb_1_2_0;

  Delay9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay9_out1 <= '0';
      ELSIF enb_1_2_0_gated_2 = '1' THEN
        Delay9_out1 <= qam_mod_out2;
      END IF;
    END IF;
  END PROCESS Delay9_process;


  rd_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        init_1 <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        init_1 <= init;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  enb_1_2_0_gated_3 <= ready_out_1 AND enb_1_2_0;

  Delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_out1 <= (OTHERS => '0');
      ELSIF enb_1_2_0_gated_3 = '1' THEN
        Delay_out1 <= init_1;
      END IF;
    END IF;
  END PROCESS Delay_process;


  enb_1_2_0_gated_4 <= ready_out_1 AND enb_1_2_0;

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1 <= (OTHERS => '0');
      ELSIF enb_1_2_0_gated_4 = '1' THEN
        Delay8_out1 <= Delay_out1;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  rd_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        new_rsvd_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        new_rsvd_1 <= new_rsvd;
      END IF;
    END IF;
  END PROCESS rd_2_process;


  enb_1_2_0_gated_5 <= ready_out_1 AND enb_1_2_0;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1 <= '0';
      ELSIF enb_1_2_0_gated_5 = '1' THEN
        Delay1_out1 <= new_rsvd_1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  enb_1_2_0_gated_6 <= ready_out_1 AND enb_1_2_0;

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_out1 <= '0';
      ELSIF enb_1_2_0_gated_6 = '1' THEN
        Delay7_out1 <= Delay1_out1;
      END IF;
    END IF;
  END PROCESS Delay7_process;


  out_new_re_signed <= signed(out_new_re);

  out_new_im_signed <= signed(out_new_im);

  enb_1_2_0_gated_7 <= ready_out_1 AND enb_1_2_0;

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        valid_new_re <= to_signed(16#000#, 12);
        valid_new_im <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0_gated_7 = '1' THEN
        valid_new_re <= out_new_re_signed;
        valid_new_im <= out_new_im_signed;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Delay13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_reg_re <= (OTHERS => to_signed(16#000#, 12));
        Delay13_reg_im <= (OTHERS => to_signed(16#000#, 12));
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay13_reg_im(0) <= valid_new_im;
        Delay13_reg_im(1) <= Delay13_reg_im(0);
        Delay13_reg_re(0) <= valid_new_re;
        Delay13_reg_re(1) <= Delay13_reg_re(0);
      END IF;
    END IF;
  END PROCESS Delay13_process;

  Delay13_out1_re <= Delay13_reg_re(1);
  Delay13_out1_im <= Delay13_reg_im(1);

  out0_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay13_out1_last_value_re <= to_signed(16#000#, 12);
        Delay13_out1_last_value_im <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0_gated = '1' THEN
        Delay13_out1_last_value_re <= Delay13_out1_re_1;
        Delay13_out1_last_value_im <= Delay13_out1_im_1;
      END IF;
    END IF;
  END PROCESS out0_bypass_process;


  
  Delay13_out1_re_1 <= Delay13_out1_last_value_re WHEN ready_out_1 = '0' ELSE
      Delay13_out1_re;
  
  Delay13_out1_im_1 <= Delay13_out1_last_value_im WHEN ready_out_1 = '0' ELSE
      Delay13_out1_im;

  data_out_re <= std_logic_vector(Delay13_out1_re_1);

  data_out_im <= std_logic_vector(Delay13_out1_im_1);

  enb_1_2_0_gated_8 <= ready_out_1 AND enb_1_2_0;

  rd_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        ofdm_en_1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        ofdm_en_1 <= ofdm_en;
      END IF;
    END IF;
  END PROCESS rd_3_process;


  enb_1_2_0_gated_9 <= ready_out_1 AND enb_1_2_0;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_out1 <= '0';
      ELSIF enb_1_2_0_gated_9 = '1' THEN
        Delay4_out1 <= constellation_scrambler_out2;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  valid_new <= ofdm_en_1 AND Delay4_out1;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_reg <= (OTHERS => '0');
      ELSIF enb_1_2_0_gated_8 = '1' THEN
        Delay12_reg(0) <= valid_new;
        Delay12_reg(1) <= Delay12_reg(0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(1);

  out0_bypass_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1_last_value <= '0';
      ELSIF enb_1_2_0_gated_8 = '1' THEN
        Delay12_out1_last_value <= Delay12_out1_1;
      END IF;
    END IF;
  END PROCESS out0_bypass_1_process;


  
  Delay12_out1_1 <= Delay12_out1_last_value WHEN ready_out_1 = '0' ELSE
      Delay12_out1;

  rd_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        ready_out_2 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        ready_out_2 <= ready_out_1;
      END IF;
    END IF;
  END PROCESS rd_6_process;


  enb_1_2_0_gated_10 <= ready_out_2 AND enb_1_2_0;

  cp_len_unsigned <= unsigned(cp_len);

  rd_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        cp_len_1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0 = '1' THEN
        cp_len_1 <= cp_len_unsigned;
      END IF;
    END IF;
  END PROCESS rd_4_process;


  enb_1_2_0_gated_11 <= ready_out_1 AND enb_1_2_0;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated_11 = '1' THEN
        Delay2_out1 <= cp_len_1;
      END IF;
    END IF;
  END PROCESS Delay2_process;


  enb_1_2_0_gated_12 <= ready_out_1 AND enb_1_2_0;

  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated_12 = '1' THEN
        Delay11_out1 <= Delay2_out1;
      END IF;
    END IF;
  END PROCESS Delay11_process;


  enb_1_2_0_gated_13 <= ready_out_1 AND enb_1_2_0;

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_reg <= (OTHERS => to_unsigned(16#00#, 8));
      ELSIF enb_1_2_0_gated_13 = '1' THEN
        Delay3_reg(0) <= Delay11_out1;
        Delay3_reg(1 TO 2) <= Delay3_reg(0 TO 1);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1 <= Delay3_reg(2);

  rd_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_out1_1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_out1_1 <= Delay3_out1;
      END IF;
    END IF;
  END PROCESS rd_5_process;


  enb_1_2_0_gated_14 <= ready_out_2 AND enb_1_2_0;

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_out1 <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated_14 = '1' THEN
        Delay6_out1 <= Delay3_out1_1;
      END IF;
    END IF;
  END PROCESS Delay6_process;


  Delay14_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_reg <= (OTHERS => to_unsigned(16#00#, 8));
      ELSIF enb_1_2_0_gated_10 = '1' THEN
        Delay14_reg(0) <= Delay6_out1;
        Delay14_reg(1) <= Delay14_reg(0);
      END IF;
    END IF;
  END PROCESS Delay14_process;

  Delay14_out1 <= Delay14_reg(1);

  out0_bypass_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay14_out1_last_value <= to_unsigned(16#00#, 8);
      ELSIF enb_1_2_0_gated_10 = '1' THEN
        Delay14_out1_last_value <= Delay14_out1_1;
      END IF;
    END IF;
  END PROCESS out0_bypass_2_process;


  
  Delay14_out1_1 <= Delay14_out1_last_value WHEN ready_out_2 = '0' ELSE
      Delay14_out1;

  cp_len_out <= std_logic_vector(Delay14_out1_1);

  valid_out <= Delay12_out1_1;

END rtl;

