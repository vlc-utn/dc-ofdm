-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip_src_RADIX22FFT_SDF1_7.vhd
-- Created: 2024-09-01 00:44:14
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip_src_RADIX22FFT_SDF1_7
-- Source Path: HDLModulatorFull/full_ofdm_modulator/ofdm_modulator/OFDM Modulator/dsphdl.IFFT/RADIX22FFT_SDF1_7
-- Hierarchy Level: 4
-- Model version: 1.36
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_ofdm_modulator_ip_src_full_ofdm_modulator_pac.ALL;

ENTITY full_ofdm_modulator_ip_src_RADIX22FFT_SDF1_7 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        din_7_1_re_dly                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        din_7_1_im_dly                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        din_7_vld_dly                     :   IN    std_logic;
        rd_7_Addr                         :   IN    std_logic;  -- ufix1
        rd_7_Enb                          :   IN    std_logic;
        twdl_7_1_re                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_7_1_im                       :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        proc_7_enb                        :   IN    std_logic;
        dout_7_1_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        dout_7_1_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        dout_7_1_vld                      :   OUT   std_logic;
        dinXTwdl_7_1_vld                  :   OUT   std_logic
        );
END full_ofdm_modulator_ip_src_RADIX22FFT_SDF1_7;


ARCHITECTURE rtl OF full_ofdm_modulator_ip_src_RADIX22FFT_SDF1_7 IS

  -- Component Declarations
  COMPONENT full_ofdm_modulator_ip_src_Complex4Multiply_block1
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          din_7_1_re_dly                  :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          din_7_1_im_dly                  :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          din_7_vld_dly                   :   IN    std_logic;
          twdl_7_1_re                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          twdl_7_1_im                     :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dinXTwdl_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dinXTwdl_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dinXTwdl_7_1_vld                :   OUT   std_logic
          );
  END COMPONENT;

  COMPONENT full_ofdm_modulator_ip_src_SDFCommutator7
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          din_7_vld_dly                   :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          xf_im                           :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          xf_vld                          :   IN    std_logic;
          dinXTwdlf_re                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dinXTwdlf_im                    :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dinxTwdlf_vld                   :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          btf1_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          btf2_re                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          btf2_im                         :   IN    std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          btf_vld                         :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          wrData_im                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          wrAddr                          :   OUT   std_logic;  -- ufix1
          wrEnb                           :   OUT   std_logic;
          dout_7_1_re                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dout_7_1_im                     :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
          dout_7_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : full_ofdm_modulator_ip_src_Complex4Multiply_block1
    USE ENTITY work.full_ofdm_modulator_ip_src_Complex4Multiply_block1(rtl);

  FOR ALL : full_ofdm_modulator_ip_src_SDFCommutator7
    USE ENTITY work.full_ofdm_modulator_ip_src_SDFCommutator7(rtl);

  -- Signals
  SIGNAL dinXTwdl_re                      : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL dinXTwdl_im                      : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL dinXTwdl_7_1_vld_1               : std_logic;
  SIGNAL dinXTwdl_re_signed               : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL dinXTwdl_im_signed               : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL x_vld                            : std_logic;
  SIGNAL btf2_im                          : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL btf2_re                          : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL btf1_im                          : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL btf1_re                          : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL dinXTwdlf_im                     : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL dinXTwdlf_re                     : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL xf_im                            : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL wrData_im                        : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL wrData_im_signed                 : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL wrData_re                        : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL wrData_re_signed                 : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL wrAddr                           : std_logic;  -- ufix1
  SIGNAL wrEnb                            : std_logic;
  SIGNAL twoLocationReg_0_MEM_re_0        : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twoLocationReg_0_MEM_im_0        : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twoLocationReg_0_MEM_re_1        : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twoLocationReg_0_MEM_im_1        : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twoLocationReg_0_dout_re_reg     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twoLocationReg_0_dout_im_reg     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL twoLocationReg_0_MEM_re_0_next   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twoLocationReg_0_MEM_im_0_next   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twoLocationReg_0_MEM_re_1_next   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twoLocationReg_0_MEM_im_1_next   : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twoLocationReg_0_dout_re_reg_next : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twoLocationReg_0_dout_im_reg_next : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL x_re                             : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL x_im                             : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL Radix22ButterflyG1_btf1_re_reg   : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_btf1_im_reg   : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_btf2_re_reg   : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_btf2_im_reg   : signed(12 DOWNTO 0);  -- sfix13
  SIGNAL Radix22ButterflyG1_x_re_dly1     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG1_x_im_dly1     : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG1_x_vld_dly1    : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly1 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly1 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG1_dinXtwdl_re_dly2 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG1_dinXtwdl_im_dly2 : signed(11 DOWNTO 0);  -- sfix12
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly1 : std_logic;
  SIGNAL Radix22ButterflyG1_dinXtwdl_vld_dly2 : std_logic;
  SIGNAL Radix22ButterflyG1_btf1_re_reg_next : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_btf1_im_reg_next : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_btf2_re_reg_next : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_btf2_im_reg_next : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_add_cast      : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_add_cast_1    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sub_cast      : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sub_cast_1    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_add_cast_2    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_add_cast_3    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sub_cast_2    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sub_cast_3    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sra_temp      : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sra_temp_1    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sra_temp_2    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL Radix22ButterflyG1_sra_temp_3    : signed(12 DOWNTO 0);  -- sfix13_En10
  SIGNAL xf_re                            : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinxTwdlf_vld                    : std_logic;
  SIGNAL btf_vld                          : std_logic;
  SIGNAL dout_7_1_re_tmp                  : std_logic_vector(11 DOWNTO 0);  -- ufix12
  SIGNAL dout_7_1_im_tmp                  : std_logic_vector(11 DOWNTO 0);  -- ufix12

BEGIN
  u_MUL4 : full_ofdm_modulator_ip_src_Complex4Multiply_block1
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              din_7_1_re_dly => din_7_1_re_dly,  -- sfix12_En10
              din_7_1_im_dly => din_7_1_im_dly,  -- sfix12_En10
              din_7_vld_dly => din_7_vld_dly,
              twdl_7_1_re => twdl_7_1_re,  -- sfix12_En10
              twdl_7_1_im => twdl_7_1_im,  -- sfix12_En10
              dinXTwdl_re => dinXTwdl_re,  -- sfix12_En10
              dinXTwdl_im => dinXTwdl_im,  -- sfix12_En10
              dinXTwdl_7_1_vld => dinXTwdl_7_1_vld_1
              );

  u_SDFCOMMUTATOR_7 : full_ofdm_modulator_ip_src_SDFCommutator7
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              din_7_vld_dly => din_7_vld_dly,
              xf_re => std_logic_vector(xf_re),  -- sfix12_En10
              xf_im => std_logic_vector(xf_im),  -- sfix12_En10
              xf_vld => xf_vld,
              dinXTwdlf_re => std_logic_vector(dinXTwdlf_re),  -- sfix12_En10
              dinXTwdlf_im => std_logic_vector(dinXTwdlf_im),  -- sfix12_En10
              dinxTwdlf_vld => dinxTwdlf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix12_En10
              btf1_im => std_logic_vector(btf1_im),  -- sfix12_En10
              btf2_re => std_logic_vector(btf2_re),  -- sfix12_En10
              btf2_im => std_logic_vector(btf2_im),  -- sfix12_En10
              btf_vld => btf_vld,
              wrData_re => wrData_re,  -- sfix12_En10
              wrData_im => wrData_im,  -- sfix12_En10
              wrAddr => wrAddr,  -- ufix1
              wrEnb => wrEnb,
              dout_7_1_re => dout_7_1_re_tmp,  -- sfix12_En10
              dout_7_1_im => dout_7_1_im_tmp,  -- sfix12_En10
              dout_7_1_vld => dout_7_1_vld
              );

  dinXTwdl_re_signed <= signed(dinXTwdl_re);

  dinXTwdl_im_signed <= signed(dinXTwdl_im);

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        x_vld <= rd_7_Enb;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  wrData_im_signed <= signed(wrData_im);

  wrData_re_signed <= signed(wrData_re);

  -- twoLocationReg_0
  twoLocationReg_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twoLocationReg_0_MEM_re_0 <= to_signed(16#000#, 12);
        twoLocationReg_0_MEM_im_0 <= to_signed(16#000#, 12);
        twoLocationReg_0_MEM_re_1 <= to_signed(16#000#, 12);
        twoLocationReg_0_MEM_im_1 <= to_signed(16#000#, 12);
        twoLocationReg_0_dout_re_reg <= to_signed(16#000#, 12);
        twoLocationReg_0_dout_im_reg <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
        twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
        twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
        twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
        twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
        twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
      END IF;
    END IF;
  END PROCESS twoLocationReg_0_process;

  twoLocationReg_0_output : PROCESS (rd_7_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im_signed, wrData_re_signed, wrEnb)
  BEGIN
    twoLocationReg_0_MEM_re_0_next <= twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next <= twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next <= twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next <= twoLocationReg_0_MEM_im_1;
    IF rd_7_Addr = '1' THEN 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_1;
    ELSE 
      twoLocationReg_0_dout_re_reg_next <= twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next <= twoLocationReg_0_MEM_im_0;
    END IF;
    IF wrEnb = '1' THEN 
      IF wrAddr = '1' THEN 
        twoLocationReg_0_MEM_re_1_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_1_next <= wrData_im_signed;
      ELSE 
        twoLocationReg_0_MEM_re_0_next <= wrData_re_signed;
        twoLocationReg_0_MEM_im_0_next <= wrData_im_signed;
      END IF;
    END IF;
    x_re <= twoLocationReg_0_dout_re_reg;
    x_im <= twoLocationReg_0_dout_im_reg;
  END PROCESS twoLocationReg_0_output;


  -- Radix22ButterflyG1
  Radix22ButterflyG1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Radix22ButterflyG1_btf1_re_reg <= to_signed(16#0000#, 13);
        Radix22ButterflyG1_btf1_im_reg <= to_signed(16#0000#, 13);
        Radix22ButterflyG1_btf2_re_reg <= to_signed(16#0000#, 13);
        Radix22ButterflyG1_btf2_im_reg <= to_signed(16#0000#, 13);
        Radix22ButterflyG1_x_re_dly1 <= to_signed(16#000#, 12);
        Radix22ButterflyG1_x_im_dly1 <= to_signed(16#000#, 12);
        Radix22ButterflyG1_x_vld_dly1 <= '0';
        xf_re <= to_signed(16#000#, 12);
        xf_im <= to_signed(16#000#, 12);
        xf_vld <= '0';
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= to_signed(16#000#, 12);
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= to_signed(16#000#, 12);
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= to_signed(16#000#, 12);
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= to_signed(16#000#, 12);
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= '0';
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= '0';
        btf_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
        Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
        Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
        Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
        xf_re <= Radix22ButterflyG1_x_re_dly1;
        xf_im <= Radix22ButterflyG1_x_im_dly1;
        xf_vld <= Radix22ButterflyG1_x_vld_dly1;
        btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re_signed;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im_signed;
        Radix22ButterflyG1_x_re_dly1 <= x_re;
        Radix22ButterflyG1_x_im_dly1 <= x_im;
        Radix22ButterflyG1_x_vld_dly1 <= x_vld;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_7_enb AND dinXTwdl_7_1_vld_1;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG1_process;

  dinxTwdlf_vld <= ( NOT proc_7_enb) AND dinXTwdl_7_1_vld_1;
  Radix22ButterflyG1_add_cast <= resize(Radix22ButterflyG1_x_re_dly1, 13);
  Radix22ButterflyG1_add_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 13);
  Radix22ButterflyG1_btf1_re_reg_next <= Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  Radix22ButterflyG1_sub_cast <= resize(Radix22ButterflyG1_x_re_dly1, 13);
  Radix22ButterflyG1_sub_cast_1 <= resize(Radix22ButterflyG1_dinXtwdl_re_dly2, 13);
  Radix22ButterflyG1_btf2_re_reg_next <= Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  Radix22ButterflyG1_add_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 13);
  Radix22ButterflyG1_add_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 13);
  Radix22ButterflyG1_btf1_im_reg_next <= Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  Radix22ButterflyG1_sub_cast_2 <= resize(Radix22ButterflyG1_x_im_dly1, 13);
  Radix22ButterflyG1_sub_cast_3 <= resize(Radix22ButterflyG1_dinXtwdl_im_dly2, 13);
  Radix22ButterflyG1_btf2_im_reg_next <= Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  dinXTwdlf_re <= dinXTwdl_re_signed;
  dinXTwdlf_im <= dinXTwdl_im_signed;
  Radix22ButterflyG1_sra_temp <= SHIFT_RIGHT(Radix22ButterflyG1_btf1_re_reg, 1);
  btf1_re <= Radix22ButterflyG1_sra_temp(11 DOWNTO 0);
  Radix22ButterflyG1_sra_temp_1 <= SHIFT_RIGHT(Radix22ButterflyG1_btf1_im_reg, 1);
  btf1_im <= Radix22ButterflyG1_sra_temp_1(11 DOWNTO 0);
  Radix22ButterflyG1_sra_temp_2 <= SHIFT_RIGHT(Radix22ButterflyG1_btf2_re_reg, 1);
  btf2_re <= Radix22ButterflyG1_sra_temp_2(11 DOWNTO 0);
  Radix22ButterflyG1_sra_temp_3 <= SHIFT_RIGHT(Radix22ButterflyG1_btf2_im_reg, 1);
  btf2_im <= Radix22ButterflyG1_sra_temp_3(11 DOWNTO 0);

  dout_7_1_re <= dout_7_1_re_tmp;

  dout_7_1_im <= dout_7_1_im_tmp;

  dinXTwdl_7_1_vld <= dinXTwdl_7_1_vld_1;

END rtl;
