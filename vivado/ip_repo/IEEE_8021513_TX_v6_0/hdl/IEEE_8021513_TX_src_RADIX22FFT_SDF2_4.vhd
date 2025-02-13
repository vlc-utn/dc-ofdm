-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/IEEE_8021513_TX_src_RADIX22FFT_SDF2_4.vhd
-- Created: 2024-11-21 09:59:26
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_TX_src_RADIX22FFT_SDF2_4
-- Source Path: HDLTx/full_tx/full_ofdm_modulator/ofdm_modulator/OFDM Modulator/dsphdl.IFFT/RADIX22FFT_SDF2_4
-- Hierarchy Level: 5
-- Model version: 4.222
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_TX_src_full_tx_pac.ALL;

ENTITY IEEE_8021513_TX_src_RADIX22FFT_SDF2_4 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        dout_3_1_re                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dout_3_1_im                       :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dout_3_1_vld                      :   IN    std_logic;
        rd_4_Addr                         :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        rd_4_Enb                          :   IN    std_logic;
        proc_4_enb                        :   IN    std_logic;
        multiply_4_J                      :   IN    std_logic;
        syncReset                         :   IN    std_logic;
        dout_4_1_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dout_4_1_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
        dout_4_1_vld                      :   OUT   std_logic;
        dinXTwdl_4_1_vld                  :   OUT   std_logic
        );
END IEEE_8021513_TX_src_RADIX22FFT_SDF2_4;


ARCHITECTURE rtl OF IEEE_8021513_TX_src_RADIX22FFT_SDF2_4 IS

  -- Component Declarations
  COMPONENT IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_TX_src_SDFCommutator4
    PORT( clk                             :   IN    std_logic;
          reset_x                         :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          dout_3_1_vld                    :   IN    std_logic;
          xf_re                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          xf_im                           :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          xf_vld                          :   IN    std_logic;
          dinf_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dinf_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dinf_vld                        :   IN    std_logic;
          btf1_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          btf1_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          btf2_re                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          btf2_im                         :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          btfout_vld                      :   IN    std_logic;
          syncReset                       :   IN    std_logic;
          wrData_re                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          wrData_im                       :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          wrAddr                          :   OUT   std_logic_vector(3 DOWNTO 0);  -- ufix4
          wrEnb                           :   OUT   std_logic;
          dout_4_1_re                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dout_4_1_im                     :   OUT   std_logic_vector(15 DOWNTO 0);  -- sfix16_En14
          dout_4_1_vld                    :   OUT   std_logic
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block
    USE ENTITY work.IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block(rtl);

  FOR ALL : IEEE_8021513_TX_src_SDFCommutator4
    USE ENTITY work.IEEE_8021513_TX_src_SDFCommutator4(rtl);

  -- Signals
  SIGNAL dout_3_1_re_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dout_3_1_im_signed               : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL btfin_vld                        : std_logic;
  SIGNAL saveEnb                          : std_logic;
  SIGNAL dinVld                           : std_logic;
  SIGNAL x_vld                            : std_logic;
  SIGNAL x_vld_dly                        : std_logic;
  SIGNAL btf2_im                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL btf2_re                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL btf1_im                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL btf1_re                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dinf_im                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL dinf_re                          : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL xf_im                            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wrData_im                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL wrAddr                           : std_logic_vector(3 DOWNTO 0);  -- ufix4
  SIGNAL wrEnb                            : std_logic;
  SIGNAL x_im                             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL x_im_signed                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL x_im_dly                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL wrData_re                        : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL x_re                             : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL x_re_signed                      : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL x_re_dly                         : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_procEnb_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1  : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2  : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg   : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_btf1_im_reg   : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_btf2_re_reg   : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_btf2_im_reg   : signed(16 DOWNTO 0);  -- sfix17
  SIGNAL Radix22ButterflyG2_din_re_dly    : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_din_im_dly    : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_din_vld_dly   : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_x_im_dly      : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_x_vld_dly     : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1 : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1 : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2 : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2 : signed(15 DOWNTO 0);  -- sfix16
  SIGNAL Radix22ButterflyG2_multiply_J_dly1 : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly1_next : std_logic;
  SIGNAL Radix22ButterflyG2_procEnb_dly2_next : std_logic;
  SIGNAL Radix22ButterflyG2_btf1_re_reg_next : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Radix22ButterflyG2_btf1_im_reg_next : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Radix22ButterflyG2_btf2_re_reg_next : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Radix22ButterflyG2_btf2_im_reg_next : signed(16 DOWNTO 0);  -- sfix17_En14
  SIGNAL Radix22ButterflyG2_din_re_dly_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_din_im_dly_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_din_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_x_re_dly_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_x_im_dly_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_x_vld_dly_next : std_logic;
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly1_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly1_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_dinXTwdl_re_dly2_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_dinXTwdl_im_dly2_next : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Radix22ButterflyG2_multiply_J_dly1_next : std_logic;
  SIGNAL xf_re                            : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL xf_vld                           : std_logic;
  SIGNAL dinf_vld                         : std_logic;
  SIGNAL btfout_vld                       : std_logic;
  SIGNAL dout_4_1_re_tmp                  : std_logic_vector(15 DOWNTO 0);  -- ufix16
  SIGNAL dout_4_1_im_tmp                  : std_logic_vector(15 DOWNTO 0);  -- ufix16

BEGIN
  u_dataMEM_im_0_4 : IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 16
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => wrData_im,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_4_Addr,
              dout => x_im
              );

  u_dataMEM_re_0_4 : IEEE_8021513_TX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 16
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => wrData_re,
              wr_addr => wrAddr,
              wr_en => wrEnb,
              rd_addr => rd_4_Addr,
              dout => x_re
              );

  u_SDFCOMMUTATOR_4 : IEEE_8021513_TX_src_SDFCommutator4
    PORT MAP( clk => clk,
              reset_x => reset_x,
              enb_1_2_0 => enb_1_2_0,
              dout_3_1_vld => dout_3_1_vld,
              xf_re => std_logic_vector(xf_re),  -- sfix16_En14
              xf_im => std_logic_vector(xf_im),  -- sfix16_En14
              xf_vld => xf_vld,
              dinf_re => std_logic_vector(dinf_re),  -- sfix16_En14
              dinf_im => std_logic_vector(dinf_im),  -- sfix16_En14
              dinf_vld => dinf_vld,
              btf1_re => std_logic_vector(btf1_re),  -- sfix16_En14
              btf1_im => std_logic_vector(btf1_im),  -- sfix16_En14
              btf2_re => std_logic_vector(btf2_re),  -- sfix16_En14
              btf2_im => std_logic_vector(btf2_im),  -- sfix16_En14
              btfout_vld => btfout_vld,
              syncReset => syncReset,
              wrData_re => wrData_re,  -- sfix16_En14
              wrData_im => wrData_im,  -- sfix16_En14
              wrAddr => wrAddr,  -- ufix4
              wrEnb => wrEnb,
              dout_4_1_re => dout_4_1_re_tmp,  -- sfix16_En14
              dout_4_1_im => dout_4_1_im_tmp,  -- sfix16_En14
              dout_4_1_vld => dout_4_1_vld
              );

  dout_3_1_re_signed <= signed(dout_3_1_re);

  dout_3_1_im_signed <= signed(dout_3_1_im);

  btfin_vld <= dout_3_1_vld AND proc_4_enb;

  saveEnb <=  NOT btfin_vld;

  dinVld <= dout_3_1_vld AND saveEnb;

  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_vld <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_vld <= '0';
        ELSE 
          x_vld <= rd_4_Enb;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk)
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
  END PROCESS intdelay_1_process;


  x_im_signed <= signed(x_im);

  intdelay_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_im_dly <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_im_dly <= to_signed(16#0000#, 16);
        ELSE 
          x_im_dly <= x_im_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_2_process;


  x_re_signed <= signed(x_re);

  intdelay_3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        x_re_dly <= to_signed(16#0000#, 16);
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          x_re_dly <= to_signed(16#0000#, 16);
        ELSE 
          x_re_dly <= x_re_signed;
        END IF;
      END IF;
    END IF;
  END PROCESS intdelay_3_process;


  -- Radix22ButterflyG2
  Radix22ButterflyG2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Radix22ButterflyG2_procEnb_dly <= '0';
        Radix22ButterflyG2_procEnb_dly1 <= '0';
        Radix22ButterflyG2_procEnb_dly2 <= '0';
        Radix22ButterflyG2_btf1_re_reg <= to_signed(16#00000#, 17);
        Radix22ButterflyG2_btf1_im_reg <= to_signed(16#00000#, 17);
        Radix22ButterflyG2_btf2_re_reg <= to_signed(16#00000#, 17);
        Radix22ButterflyG2_btf2_im_reg <= to_signed(16#00000#, 17);
        Radix22ButterflyG2_din_re_dly <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_din_im_dly <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_din_vld_dly <= '0';
        Radix22ButterflyG2_x_re_dly <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_x_im_dly <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_x_vld_dly <= '0';
        Radix22ButterflyG2_dinXTwdl_re_dly1 <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_dinXTwdl_im_dly1 <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_dinXTwdl_re_dly2 <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_dinXTwdl_im_dly2 <= to_signed(16#0000#, 16);
        Radix22ButterflyG2_multiply_J_dly1 <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        IF syncReset = '1' THEN
          Radix22ButterflyG2_procEnb_dly <= '0';
          Radix22ButterflyG2_procEnb_dly1 <= '0';
          Radix22ButterflyG2_procEnb_dly2 <= '0';
          Radix22ButterflyG2_btf1_re_reg <= to_signed(16#00000#, 17);
          Radix22ButterflyG2_btf1_im_reg <= to_signed(16#00000#, 17);
          Radix22ButterflyG2_btf2_re_reg <= to_signed(16#00000#, 17);
          Radix22ButterflyG2_btf2_im_reg <= to_signed(16#00000#, 17);
          Radix22ButterflyG2_din_re_dly <= to_signed(16#0000#, 16);
          Radix22ButterflyG2_din_im_dly <= to_signed(16#0000#, 16);
          Radix22ButterflyG2_din_vld_dly <= '0';
          Radix22ButterflyG2_x_re_dly <= to_signed(16#0000#, 16);
          Radix22ButterflyG2_x_im_dly <= to_signed(16#0000#, 16);
          Radix22ButterflyG2_x_vld_dly <= '0';
          Radix22ButterflyG2_dinXTwdl_re_dly1 <= to_signed(16#0000#, 16);
          Radix22ButterflyG2_dinXTwdl_im_dly1 <= to_signed(16#0000#, 16);
          Radix22ButterflyG2_dinXTwdl_re_dly2 <= to_signed(16#0000#, 16);
          Radix22ButterflyG2_dinXTwdl_im_dly2 <= to_signed(16#0000#, 16);
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
       Radix22ButterflyG2_x_re_dly, Radix22ButterflyG2_x_vld_dly, btfin_vld,
       dinVld, dout_3_1_im_signed, dout_3_1_re_signed, multiply_4_J, x_im_dly,
       x_re_dly, x_vld_dly)
    VARIABLE add_cast : signed(16 DOWNTO 0);
    VARIABLE add_cast_0 : signed(16 DOWNTO 0);
    VARIABLE add_cast_1 : signed(16 DOWNTO 0);
    VARIABLE add_cast_2 : signed(16 DOWNTO 0);
    VARIABLE sub_cast : signed(16 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(16 DOWNTO 0);
    VARIABLE add_cast_3 : signed(16 DOWNTO 0);
    VARIABLE add_cast_4 : signed(16 DOWNTO 0);
    VARIABLE add_cast_5 : signed(16 DOWNTO 0);
    VARIABLE add_cast_6 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_4 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_5 : signed(16 DOWNTO 0);
    VARIABLE sub_cast_6 : signed(16 DOWNTO 0);
    VARIABLE sra_temp : signed(16 DOWNTO 0);
    VARIABLE sra_temp_0 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_1 : signed(16 DOWNTO 0);
    VARIABLE sra_temp_2 : signed(16 DOWNTO 0);
  BEGIN
    add_cast_1 := to_signed(16#00000#, 17);
    add_cast_2 := to_signed(16#00000#, 17);
    sub_cast_1 := to_signed(16#00000#, 17);
    sub_cast_2 := to_signed(16#00000#, 17);
    add_cast_5 := to_signed(16#00000#, 17);
    add_cast_6 := to_signed(16#00000#, 17);
    sub_cast_5 := to_signed(16#00000#, 17);
    sub_cast_6 := to_signed(16#00000#, 17);
    add_cast := to_signed(16#00000#, 17);
    add_cast_0 := to_signed(16#00000#, 17);
    sub_cast := to_signed(16#00000#, 17);
    sub_cast_0 := to_signed(16#00000#, 17);
    add_cast_3 := to_signed(16#00000#, 17);
    add_cast_4 := to_signed(16#00000#, 17);
    sub_cast_3 := to_signed(16#00000#, 17);
    sub_cast_4 := to_signed(16#00000#, 17);
    Radix22ButterflyG2_x_re_dly_next <= x_re_dly;
    Radix22ButterflyG2_x_im_dly_next <= x_im_dly;
    Radix22ButterflyG2_x_vld_dly_next <= x_vld_dly;
    Radix22ButterflyG2_din_re_dly_next <= dout_3_1_re_signed;
    Radix22ButterflyG2_din_im_dly_next <= dout_3_1_im_signed;
    Radix22ButterflyG2_din_vld_dly_next <= dinVld;
    Radix22ButterflyG2_procEnb_dly2_next <= Radix22ButterflyG2_procEnb_dly1;
    Radix22ButterflyG2_procEnb_dly1_next <= Radix22ButterflyG2_procEnb_dly;
    Radix22ButterflyG2_procEnb_dly_next <= btfin_vld;
    IF Radix22ButterflyG2_multiply_J_dly1 = '1' THEN 
      add_cast_1 := resize(x_re_dly, 17);
      add_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 17);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast_1 + add_cast_2;
      sub_cast_1 := resize(x_re_dly, 17);
      sub_cast_2 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 17);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast_1 - sub_cast_2;
      add_cast_5 := resize(x_im_dly, 17);
      add_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 17);
      Radix22ButterflyG2_btf2_im_reg_next <= add_cast_5 + add_cast_6;
      sub_cast_5 := resize(x_im_dly, 17);
      sub_cast_6 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 17);
      Radix22ButterflyG2_btf1_im_reg_next <= sub_cast_5 - sub_cast_6;
    ELSE 
      add_cast := resize(x_re_dly, 17);
      add_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 17);
      Radix22ButterflyG2_btf1_re_reg_next <= add_cast + add_cast_0;
      sub_cast := resize(x_re_dly, 17);
      sub_cast_0 := resize(Radix22ButterflyG2_dinXTwdl_re_dly2, 17);
      Radix22ButterflyG2_btf2_re_reg_next <= sub_cast - sub_cast_0;
      add_cast_3 := resize(x_im_dly, 17);
      add_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 17);
      Radix22ButterflyG2_btf1_im_reg_next <= add_cast_3 + add_cast_4;
      sub_cast_3 := resize(x_im_dly, 17);
      sub_cast_4 := resize(Radix22ButterflyG2_dinXTwdl_im_dly2, 17);
      Radix22ButterflyG2_btf2_im_reg_next <= sub_cast_3 - sub_cast_4;
    END IF;
    Radix22ButterflyG2_dinXTwdl_re_dly2_next <= Radix22ButterflyG2_dinXTwdl_re_dly1;
    Radix22ButterflyG2_dinXTwdl_im_dly2_next <= Radix22ButterflyG2_dinXTwdl_im_dly1;
    Radix22ButterflyG2_dinXTwdl_re_dly1_next <= dout_3_1_re_signed;
    Radix22ButterflyG2_dinXTwdl_im_dly1_next <= dout_3_1_im_signed;
    Radix22ButterflyG2_multiply_J_dly1_next <= multiply_4_J;
    xf_re <= Radix22ButterflyG2_x_re_dly;
    xf_im <= Radix22ButterflyG2_x_im_dly;
    xf_vld <= Radix22ButterflyG2_x_vld_dly;
    dinf_re <= Radix22ButterflyG2_din_re_dly;
    dinf_im <= Radix22ButterflyG2_din_im_dly;
    dinf_vld <= Radix22ButterflyG2_din_vld_dly;
    sra_temp := SHIFT_RIGHT(Radix22ButterflyG2_btf1_re_reg, 1);
    btf1_re <= sra_temp(15 DOWNTO 0);
    sra_temp_0 := SHIFT_RIGHT(Radix22ButterflyG2_btf1_im_reg, 1);
    btf1_im <= sra_temp_0(15 DOWNTO 0);
    sra_temp_1 := SHIFT_RIGHT(Radix22ButterflyG2_btf2_re_reg, 1);
    btf2_re <= sra_temp_1(15 DOWNTO 0);
    sra_temp_2 := SHIFT_RIGHT(Radix22ButterflyG2_btf2_im_reg, 1);
    btf2_im <= sra_temp_2(15 DOWNTO 0);
    btfout_vld <= Radix22ButterflyG2_procEnb_dly2;
  END PROCESS Radix22ButterflyG2_output;


  dout_4_1_re <= dout_4_1_re_tmp;

  dout_4_1_im <= dout_4_1_im_tmp;

  dinXTwdl_4_1_vld <= btfin_vld;

END rtl;

