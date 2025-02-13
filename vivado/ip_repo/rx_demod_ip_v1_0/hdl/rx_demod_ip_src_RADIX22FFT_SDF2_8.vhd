-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_RADIX22FFT_SDF2_8.vhd
-- Created: 2024-09-22 18:53:33
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_RADIX22FFT_SDF2_8
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_demod/OFDM Demodulator/dsphdl.FFT/RADIX22FFT_SDF2_8
-- Hierarchy Level: 4
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_ip_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_ip_src_RADIX22FFT_SDF2_8 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        dout_7_1_re                       :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En14
        dout_7_1_im                       :   IN    std_logic_vector(22 DOWNTO 0);  -- sfix23_En14
        dout_7_1_vld                      :   IN    std_logic;
        rd_8_Addr                         :   IN    std_logic;
        rd_8_Enb                          :   IN    std_logic;
        proc_8_enb                        :   IN    std_logic;
        multiply_8_J                      :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dout_8_1_re                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
        dout_8_1_im                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
        dout_8_1_vld                      :   OUT   std_logic;
        dinXTwdl_8_1_vld                  :   OUT   std_logic
        );
END rx_demod_ip_src_RADIX22FFT_SDF2_8;


ARCHITECTURE rtl OF rx_demod_ip_src_RADIX22FFT_SDF2_8 IS

  -- Component Declarations
  COMPONENT rx_demod_ip_src_SDFCommutator8
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          dout_7_1_vld                    :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          xf_im                           :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          xf_vld                          :   IN    std_logic;
          dinf_re                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          dinf_im                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          dinf_vld                        :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          btf1_im                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          btf2_re                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          btf2_im                         :   IN    std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          btfout_vld                      :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          wrData_im                       :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          wrAddr                          :   OUT   std_logic;  -- ufix1
          wrEnb                           :   OUT   std_logic;
          dout_8_1_re                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          dout_8_1_im                     :   OUT   std_logic_vector(23 DOWNTO 0);  -- sfix24_En14
          dout_8_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : rx_demod_ip_src_SDFCommutator8
    USE ENTITY work.rx_demod_ip_src_SDFCommutator8(rtl);

  -- Signals
  SIGNAL dout_7_1_re_signed               : signed(22 DOWNTO 0);  -- sfix23_En14
  SIGNAL din_re                           : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL dout_7_1_im_signed               : signed(22 DOWNTO 0);  -- sfix23_En14
  SIGNAL din_im                           : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL saveEnb                          : std_logic;
  SIGNAL dinVld                           : std_logic;
  SIGNAL din_re_dly1                      : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL btfin_re                         : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL din_im_dly1                      : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL btfin_im                         : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL mulIn_vld                        : std_logic;
  SIGNAL procEnb_dly1                     : std_logic;
  SIGNAL btfin_vld                        : std_logic;
  SIGNAL x_vld                            : std_logic;
  SIGNAL x_vld_dly                        : std_logic;
  SIGNAL btf2_im                          : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL btf2_re                          : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL btf1_im                          : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL btf1_re                          : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL dinf_im                          : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL dinf_re                          : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL xf_im                            : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL x_im                             : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL x_im_dly                         : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL wrData_im                        : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL wrData_im_signed                 : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL wrData_re                        : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL wrData_re_signed                 : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL wrAddr                           : std_logic;  -- ufix1
  SIGNAL wrEnb                            : std_logic;
  SIGNAL twoLocationReg_0_MEM_re_0        : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL twoLocationReg_0_MEM_im_0        : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL twoLocationReg_0_MEM_re_1        : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL twoLocationReg_0_MEM_im_1        : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL twoLocationReg_0_dout_re_reg     : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL twoLocationReg_0_dout_im_reg     : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL twoLocationReg_0_MEM_re_0_next   : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL twoLocationReg_0_MEM_im_0_next   : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL twoLocationReg_0_MEM_re_1_next   : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL twoLocationReg_0_MEM_im_1_next   : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL twoLocationReg_0_dout_re_reg_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL twoLocationReg_0_dout_im_reg_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL x_re                             : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL x_re_dly                         : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_procEnb_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1  : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2  : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg   : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG2_btf1_im_reg   : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG2_btf2_re_reg   : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG2_btf2_im_reg   : signed(24 DOWNTO 0);  -- sfix25
  SIGNAL Radix22ButterflyG2_din_re_dly    : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_din_im_dly    : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_din_vld_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly      : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_x_im_dly      : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_x_vld_dly     : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1 : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1 : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2 : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2 : signed(23 DOWNTO 0);  -- sfix24
  SIGNAL Radix22ButterflyG2_multiply_J_dly1 : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2_next : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg_next : signed(24 DOWNTO 0);  -- sfix25_En14
  SIGNAL Radix22ButterflyG2_btf1_im_reg_next : signed(24 DOWNTO 0);  -- sfix25_En14
  SIGNAL Radix22ButterflyG2_btf2_re_reg_next : signed(24 DOWNTO 0);  -- sfix25_En14
  SIGNAL Radix22ButterflyG2_btf2_im_reg_next : signed(24 DOWNTO 0);  -- sfix25_En14
  SIGNAL Radix22ButterflyG2_din_re_dly_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_din_im_dly_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_din_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_x_im_dly_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_x_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2_next : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL Radix22ButterflyG2_multiply_J_dly1_next : std_logic;
  SIGNAL xf_re                            : signed(23 DOWNTO 0);  -- sfix24_En14
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinf_vld                         : std_logic;
  SIGNAL btfout_vld                       : std_logic;
  SIGNAL dout_8_1_re_tmp                  : std_logic_vector(23 DOWNTO 0);  -- ufix24
  SIGNAL dout_8_1_im_tmp                  : std_logic_vector(23 DOWNTO 0);  -- ufix24

BEGIN
  u_SDFCOMMUTATOR_8 : rx_demod_ip_src_SDFCommutator8
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              dout_7_1_vld => dout_7_1_vld,
              xf_re => std_logic_vector(xf_re),  -- sfix24_En14
              xf_im => std_logic_vector(xf_im),  -- sfix24_En14
              xf_vld => xf_vld,
              dinf_re => std_logic_vector(dinf_re),  -- sfix24_En14
              dinf_im => std_logic_vector(dinf_im),  -- sfix24_En14
              dinf_vld => dinf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix24_En14
              btf1_im => std_logic_vector(btf1_im),  -- sfix24_En14
              btf2_re => std_logic_vector(btf2_re),  -- sfix24_En14
              btf2_im => std_logic_vector(btf2_im),  -- sfix24_En14
              btfout_vld => btfout_vld,
              syncReset => syncReset,
              wrData_re => wrData_re,  -- sfix24_En14
              wrData_im => wrData_im,  -- sfix24_En14
              wrAddr => wrAddr,  -- ufix1
              wrEnb => wrEnb,
              dout_8_1_re => dout_8_1_re_tmp,  -- sfix24_En14
              dout_8_1_im => dout_8_1_im_tmp,  -- sfix24_En14
              dout_8_1_vld => dout_8_1_vld
              );

  dout_7_1_re_signed <= signed(dout_7_1_re);

  din_re <= resize(dout_7_1_re_signed, 24);

  dout_7_1_im_signed <= signed(dout_7_1_im);

  din_im <= resize(dout_7_1_im_signed, 24);

  saveEnb <=  NOT proc_8_enb;

  dinVld <= dout_7_1_vld AND saveEnb;

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        din_re_dly1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          din_re_dly1 <= to_signed(16#000000#, 24);
        ELSE 
          din_re_dly1 <= din_re;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        btfin_re <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          btfin_re <= to_signed(16#000000#, 24);
        ELSE 
          btfin_re <= din_re_dly1;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        din_im_dly1 <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          din_im_dly1 <= to_signed(16#000000#, 24);
        ELSE 
          din_im_dly1 <= din_im;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        btfin_im <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          btfin_im <= to_signed(16#000000#, 24);
        ELSE 
          btfin_im <= din_im_dly1;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  mulIn_vld <= dout_7_1_vld AND proc_8_enb;

  intdelay_4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        procEnb_dly1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          procEnb_dly1 <= '0';
        ELSE 
          procEnb_dly1 <= mulIn_vld;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_4_process;


  intdelay_5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        btfin_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          btfin_vld <= '0';
        ELSE 
          btfin_vld <= procEnb_dly1;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_5_process;


  intdelay_6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_vld <= '0';
        ELSE 
          x_vld <= rd_8_Enb;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_6_process;


  intdelay_7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_vld_dly <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_vld_dly <= '0';
        ELSE 
          x_vld_dly <= x_vld;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_7_process;


  intdelay_8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_im_dly <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_im_dly <= to_signed(16#000000#, 24);
        ELSE 
          x_im_dly <= x_im;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_8_process;


  wrData_im_signed <= signed(wrData_im);

  wrData_re_signed <= signed(wrData_re);

  -- twoLocationReg_0
  twoLocationReg_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twoLocationReg_0_MEM_re_0 <= to_signed(16#000000#, 24);
        twoLocationReg_0_MEM_im_0 <= to_signed(16#000000#, 24);
        twoLocationReg_0_MEM_re_1 <= to_signed(16#000000#, 24);
        twoLocationReg_0_MEM_im_1 <= to_signed(16#000000#, 24);
        twoLocationReg_0_dout_re_reg <= to_signed(16#000000#, 24);
        twoLocationReg_0_dout_im_reg <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          twoLocationReg_0_MEM_re_0 <= to_signed(16#000000#, 24);
          twoLocationReg_0_MEM_im_0 <= to_signed(16#000000#, 24);
          twoLocationReg_0_MEM_re_1 <= to_signed(16#000000#, 24);
          twoLocationReg_0_MEM_im_1 <= to_signed(16#000000#, 24);
          twoLocationReg_0_dout_re_reg <= to_signed(16#000000#, 24);
          twoLocationReg_0_dout_im_reg <= to_signed(16#000000#, 24);
        ELSE 
          twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
          twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
          twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
          twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
          twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
          twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
        END IF;
      END IF;
    END IF;
  END PROCESS twoLocationReg_0_process;

  twoLocationReg_0_output : PROCESS (rd_8_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im_signed, wrData_re_signed, wrEnb)
  BEGIN
    twoLocationReg_0_MEM_re_0_next <= twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next <= twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next <= twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next <= twoLocationReg_0_MEM_im_1;
    IF rd_8_Addr = '1' THEN 
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


  intdelay_9_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_re_dly <= to_signed(16#000000#, 24);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_re_dly <= to_signed(16#000000#, 24);
        ELSE 
          x_re_dly <= x_re;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_9_process;


  -- Radix22ButterflyG2
  Radix22ButterflyG2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Radix22ButterflyG2_procEnb_dly <= '0';
        Radix22ButterflyG2_procEnb_dly1 <= '0';
        Radix22ButterflyG2_procEnb_dly2 <= '0';
        Radix22ButterflyG2_btf1_re_reg <= to_signed(16#0000000#, 25);
        Radix22ButterflyG2_btf1_im_reg <= to_signed(16#0000000#, 25);
        Radix22ButterflyG2_btf2_re_reg <= to_signed(16#0000000#, 25);
        Radix22ButterflyG2_btf2_im_reg <= to_signed(16#0000000#, 25);
        Radix22ButterflyG2_din_re_dly <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_din_im_dly <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_din_vld_dly <= '0';
        Radix22ButterflyG2_x_re_dly <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_x_im_dly <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_x_vld_dly <= '0';
        Radix22ButterflyG2_dinXTwdl_re_dly1 <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_dinXTwdl_im_dly1 <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_dinXTwdl_re_dly2 <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_dinXTwdl_im_dly2 <= to_signed(16#000000#, 24);
        Radix22ButterflyG2_multiply_J_dly1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          Radix22ButterflyG2_procEnb_dly <= '0';
          Radix22ButterflyG2_procEnb_dly1 <= '0';
          Radix22ButterflyG2_procEnb_dly2 <= '0';
          Radix22ButterflyG2_btf1_re_reg <= to_signed(16#0000000#, 25);
          Radix22ButterflyG2_btf1_im_reg <= to_signed(16#0000000#, 25);
          Radix22ButterflyG2_btf2_re_reg <= to_signed(16#0000000#, 25);
          Radix22ButterflyG2_btf2_im_reg <= to_signed(16#0000000#, 25);
          Radix22ButterflyG2_din_re_dly <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_din_im_dly <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_din_vld_dly <= '0';
          Radix22ButterflyG2_x_re_dly <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_x_im_dly <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_x_vld_dly <= '0';
          Radix22ButterflyG2_dinXTwdl_re_dly1 <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_dinXTwdl_im_dly1 <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_dinXTwdl_re_dly2 <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_dinXTwdl_im_dly2 <= to_signed(16#000000#, 24);
          Radix22ButterflyG2_multiply_J_dly1 <= '0';
        ELSE 
          Radix22ButterflyG2_procEnb_dly <= Radix22ButterflyG2_procEnb_dly_next;
          Radix22ButterflyG2_procEnb_dly1 <= Radix22ButterflyG2_procEnb_dly1_next;
          Radix22ButterflyG2_procEnb_dly2 <= Radix22ButterflyG2_procEnb_dly2_next;
          Radix22ButterflyG2_btf1_re_reg <= Radix22ButterflyG2_btf1_re_reg_next;
          Radix22ButterflyG2_btf1_im_reg <= Radix22ButterflyG2_btf1_im_reg_next;
          Radix22ButterflyG2_btf2_re_reg <= Radix22ButterflyG2_btf2_re_reg_next;
          Radix22ButterflyG2_btf2_im_reg <= Radix22ButterflyG2_btf2_im_reg_next;
          Radix22ButterflyG2_din_re_dly <= Radix22ButterflyG2_din_re_dly_next;
          Radix22ButterflyG2_din_im_dly <= Radix22ButterflyG2_din_im_dly_next;
          Radix22ButterflyG2_din_vld_dly <= Radix22ButterflyG2_din_vld_dly_next;
          Radix22ButterflyG2_x_re_dly <= Radix22ButterflyG2_x_re_dly_next;
          Radix22ButterflyG2_x_im_dly <= Radix22ButterflyG2_x_im_dly_next;
          Radix22ButterflyG2_x_vld_dly <= Radix22ButterflyG2_x_vld_dly_next;
          Radix22ButterflyG2_dinXTwdl_re_dly1 <= Radix22ButterflyG2_dinXTwdl_re_dly1_next;
          Radix22ButterflyG2_dinXTwdl_im_dly1 <= Radix22ButterflyG2_dinXTwdl_im_dly1_next;
          Radix22ButterflyG2_dinXTwdl_re_dly2 <= Radix22ButterflyG2_dinXTwdl_re_dly2_next;
          Radix22ButterflyG2_dinXTwdl_im_dly2 <= Radix22ButterflyG2_dinXTwdl_im_dly2_next;
          Radix22ButterflyG2_multiply_J_dly1 <= Radix22ButterflyG2_multiply_J_dly1_next;
        END IF;
      END IF;
    END IF;
  END PROCESS Radix22ButterflyG2_process;

  Radix22ButterflyG2_output : PROCESS (Radix22ButterflyG2_btf1_im_reg, Radix22ButterflyG2_btf1_re_reg,
       Radix22ButterflyG2_btf2_im_reg, Radix22ButterflyG2_btf2_re_reg,
       Radix22ButterflyG2_dinXTwdl_im_dly1, Radix22ButterflyG2_dinXTwdl_im_dly2,
       Radix22ButterflyG2_dinXTwdl_re_dly1, Radix22ButterflyG2_dinXTwdl_re_dly2,
       Radix22ButterflyG2_din_im_dly, Radix22ButterflyG2_din_re_dly,
       Radix22ButterflyG2_din_vld_dly, Radix22ButterflyG2_multiply_J_dly1,
       Radix22ButterflyG2_procEnb_dly, Radix22ButterflyG2_procEnb_dly1,
       Radix22ButterflyG2_procEnb_dly2, Radix22ButterflyG2_x_im_dly,
       Radix22ButterflyG2_x_re_dly, Radix22ButterflyG2_x_vld_dly, btfin_im,
       btfin_re, btfin_vld, dinVld, din_im, din_re, multiply_8_J, x_im_dly,
       x_re_dly, x_vld_dly)
    VARIABLE add_cast : signed(24 DOWNTO 0);
    VARIABLE add_cast_0 : signed(24 DOWNTO 0);
    VARIABLE add_cast_1 : signed(24 DOWNTO 0);
    VARIABLE add_cast_2 : signed(24 DOWNTO 0);
    VARIABLE sub_cast : signed(24 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(24 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(24 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(24 DOWNTO 0);
    VARIABLE add_cast_3 : signed(24 DOWNTO 0);
    VARIABLE add_cast_4 : signed(24 DOWNTO 0);
    VARIABLE add_cast_5 : signed(24 DOWNTO 0);
    VARIABLE add_cast_6 : signed(24 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(24 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(24 DOWNTO 0);
    VARIABLE sub_cast_5 : signed(24 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(24 DOWNTO 0);
  BEGIN
    add_cast_1 := to_signed(16#0000000#, 25);
    add_cast_2 := to_signed(16#0000000#, 25);
    sub_cast_1 := to_signed(16#0000000#, 25);
    sub_cast_2 := to_signed(16#0000000#, 25);
    add_cast_5 := to_signed(16#0000000#, 25);
    add_cast_6 := to_signed(16#0000000#, 25);
    sub_cast_5 := to_signed(16#0000000#, 25);
    sub_cast_6 := to_signed(16#0000000#, 25);
    add_cast := to_signed(16#0000000#, 25);
    add_cast_0 := to_signed(16#0000000#, 25);
    sub_cast := to_signed(16#0000000#, 25);
    sub_cast_0 := to_signed(16#0000000#, 25);
    add_cast_3 := to_signed(16#0000000#, 25);
    add_cast_4 := to_signed(16#0000000#, 25);
    sub_cast_3 := to_signed(16#0000000#, 25);
    sub_cast_4 := to_signed(16#0000000#, 25);
    Radix22ButterflyG2_x_re_dly_next <= x_re_dly;
    Radix22ButterflyG2_x_im_dly_next <= x_im_dly;
    Radix22ButterflyG2_x_vld_dly_next <= x_vld_dly;
    Radix22ButterflyG2_din_re_dly_next <= din_re;
    Radix22ButterflyG2_din_im_dly_next <= din_im;
    Radix22ButterflyG2_din_vld_dly_next <= dinVld;
    Radix22ButterflyG2_procEnb_dly2_next <= Radix22ButterflyG2_procEnb_dly1;
    Radix22ButterflyG2_procEnb_dly1_next <= Radix22ButterflyG2_procEnb_dly;
    Radix22ButterflyG2_procEnb_dly_next <= btfin_vld;
    IF Radix22ButterflyG2_multiply_J_dly1 = '1' THEN 
      add_cast_1 := resize(x_re_dly, 25);
      add_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 25);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast_1 + add_cast_2;
      sub_cast_1 := resize(x_re_dly, 25);
      sub_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 25);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast_1 - sub_cast_2;
      add_cast_5 := resize(x_im_dly, 25);
      add_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 25);
      Radix22ButterflyG2_btf2_im_reg_next <= add_cast_5 + add_cast_6;
      sub_cast_5 := resize(x_im_dly, 25);
      sub_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 25);
      Radix22ButterflyG2_btf1_im_reg_next <= sub_cast_5 - sub_cast_6;
    ELSE 
      add_cast := resize(x_re_dly, 25);
      add_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 25);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast + add_cast_0;
      sub_cast := resize(x_re_dly, 25);
      sub_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 25);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast - sub_cast_0;
      add_cast_3 := resize(x_im_dly, 25);
      add_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 25);
      Radix22ButterflyG2_btf1_im_reg_next <= add_cast_3 + add_cast_4;
      sub_cast_3 := resize(x_im_dly, 25);
      sub_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 25);
      Radix22ButterflyG2_btf2_im_reg_next <= sub_cast_3 - sub_cast_4;
    END IF;
    Radix22ButterflyG2_dinXTwdl_re_dly2_next <= Radix22ButterflyG2_dinXTwdl_re_dly1;
    Radix22ButterflyG2_dinXTwdl_im_dly2_next <= Radix22ButterflyG2_dinXTwdl_im_dly1;
    Radix22ButterflyG2_dinXTwdl_re_dly1_next <= btfin_re;
    Radix22ButterflyG2_dinXTwdl_im_dly1_next <= btfin_im;
    Radix22ButterflyG2_multiply_J_dly1_next <= multiply_8_J;
    xf_re <= Radix22ButterflyG2_x_re_dly;
    xf_im <= Radix22ButterflyG2_x_im_dly;
    xf_vld <= Radix22ButterflyG2_x_vld_dly;
    dinf_re <= Radix22ButterflyG2_din_re_dly;
    dinf_im <= Radix22ButterflyG2_din_im_dly;
    dinf_vld <= Radix22ButterflyG2_din_vld_dly;
    btf1_re <= Radix22ButterflyG2_btf1_re_reg(23 DOWNTO 0);
    btf1_im <= Radix22ButterflyG2_btf1_im_reg(23 DOWNTO 0);
    btf2_re <= Radix22ButterflyG2_btf2_re_reg(23 DOWNTO 0);
    btf2_im <= Radix22ButterflyG2_btf2_im_reg(23 DOWNTO 0);
    btfout_vld <= Radix22ButterflyG2_procEnb_dly2;
  END PROCESS Radix22ButterflyG2_output;


  dout_8_1_re <= dout_8_1_re_tmp;

  dout_8_1_im <= dout_8_1_im_tmp;

  dinXTwdl_8_1_vld <= btfin_vld;

END rtl;

