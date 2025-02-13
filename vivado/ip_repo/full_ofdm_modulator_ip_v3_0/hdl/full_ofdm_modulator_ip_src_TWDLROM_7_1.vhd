-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLModulatorFull/full_ofdm_modulator_ip_src_TWDLROM_7_1.vhd
-- Created: 2024-09-01 12:13:06
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_ofdm_modulator_ip_src_TWDLROM_7_1
-- Source Path: HDLModulatorFull/full_ofdm_modulator/ofdm_modulator/OFDM Modulator/dsphdl.IFFT/TWDLROM_7_1
-- Hierarchy Level: 4
-- Model version: 1.43
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_ofdm_modulator_ip_src_full_ofdm_modulator_pac.ALL;

ENTITY full_ofdm_modulator_ip_src_TWDLROM_7_1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        dout_6_1_vld                      :   IN    std_logic;
        twdl_7_1_re                       :   OUT   std_logic_vector(11 DOWNTO 0);  -- sfix12_En10
        twdl_7_1_im                       :   OUT   std_logic_vector(11 DOWNTO 0)  -- sfix12_En10
        );
END full_ofdm_modulator_ip_src_TWDLROM_7_1;


ARCHITECTURE rtl OF full_ofdm_modulator_ip_src_TWDLROM_7_1 IS

  -- Constants
  CONSTANT Twiddle_re_table_data          : vector_of_signed12(0 TO 31) := 
    (to_signed(16#400#, 12), to_signed(16#400#, 12), to_signed(16#3FF#, 12), to_signed(16#3FD#, 12),
     to_signed(16#3FB#, 12), to_signed(16#3F8#, 12), to_signed(16#3F5#, 12), to_signed(16#3F1#, 12),
     to_signed(16#3EC#, 12), to_signed(16#3E7#, 12), to_signed(16#3E1#, 12), to_signed(16#3DB#, 12),
     to_signed(16#3D4#, 12), to_signed(16#3CC#, 12), to_signed(16#3C4#, 12), to_signed(16#3BB#, 12),
     to_signed(16#3B2#, 12), to_signed(16#3A8#, 12), to_signed(16#39E#, 12), to_signed(16#393#, 12),
     to_signed(16#387#, 12), to_signed(16#37B#, 12), to_signed(16#36E#, 12), to_signed(16#361#, 12),
     to_signed(16#353#, 12), to_signed(16#345#, 12), to_signed(16#336#, 12), to_signed(16#327#, 12),
     to_signed(16#318#, 12), to_signed(16#307#, 12), to_signed(16#2F7#, 12), to_signed(16#2E6#, 12));  -- sfix12 [32]
  CONSTANT Twiddle_im_table_data          : vector_of_signed12(0 TO 31) := 
    (to_signed(16#000#, 12), to_signed(-16#019#, 12), to_signed(-16#032#, 12), to_signed(-16#04B#, 12),
     to_signed(-16#064#, 12), to_signed(-16#07D#, 12), to_signed(-16#096#, 12), to_signed(-16#0AF#, 12),
     to_signed(-16#0C8#, 12), to_signed(-16#0E0#, 12), to_signed(-16#0F9#, 12), to_signed(-16#111#, 12),
     to_signed(-16#129#, 12), to_signed(-16#141#, 12), to_signed(-16#159#, 12), to_signed(-16#171#, 12),
     to_signed(-16#188#, 12), to_signed(-16#19F#, 12), to_signed(-16#1B6#, 12), to_signed(-16#1CC#, 12),
     to_signed(-16#1E3#, 12), to_signed(-16#1F9#, 12), to_signed(-16#20E#, 12), to_signed(-16#224#, 12),
     to_signed(-16#239#, 12), to_signed(-16#24E#, 12), to_signed(-16#262#, 12), to_signed(-16#276#, 12),
     to_signed(-16#28A#, 12), to_signed(-16#29D#, 12), to_signed(-16#2B0#, 12), to_signed(-16#2C2#, 12));  -- sfix12 [32]

  -- Signals
  SIGNAL Radix22TwdlMapping_cnt           : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Radix22TwdlMapping_phase         : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_octantReg1    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Radix22TwdlMapping_twdlAddr_raw  : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Radix22TwdlMapping_twdlAddrMap   : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Radix22TwdlMapping_twdl45Reg     : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg1      : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg2      : std_logic;
  SIGNAL Radix22TwdlMapping_cnt_next      : unsigned(5 DOWNTO 0);  -- ufix6
  SIGNAL Radix22TwdlMapping_phase_next    : unsigned(1 DOWNTO 0);  -- ufix2
  SIGNAL Radix22TwdlMapping_octantReg1_next : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL Radix22TwdlMapping_twdlAddr_raw_next : unsigned(7 DOWNTO 0);  -- ufix8
  SIGNAL Radix22TwdlMapping_twdlAddrMap_next : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL Radix22TwdlMapping_twdl45Reg_next : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg1_next : std_logic;
  SIGNAL Radix22TwdlMapping_dvldReg2_next : std_logic;
  SIGNAL twdlAddr                         : unsigned(4 DOWNTO 0);  -- ufix5
  SIGNAL twdlAddrVld                      : std_logic;
  SIGNAL twdlOctant                       : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45                           : std_logic;
  SIGNAL twiddleS_re                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twiddleReg_re                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twiddleS_im                      : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twiddleReg_im                    : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdlOctantReg                    : unsigned(2 DOWNTO 0);  -- ufix3
  SIGNAL twdl45Reg                        : std_logic;
  SIGNAL twdl_7_1_re_tmp                  : signed(11 DOWNTO 0);  -- sfix12_En10
  SIGNAL twdl_7_1_im_tmp                  : signed(11 DOWNTO 0);  -- sfix12_En10

BEGIN
  -- Radix22TwdlMapping
  Radix22TwdlMapping_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Radix22TwdlMapping_octantReg1 <= to_unsigned(16#0#, 3);
        Radix22TwdlMapping_twdlAddr_raw <= to_unsigned(16#00#, 8);
        Radix22TwdlMapping_twdlAddrMap <= to_unsigned(16#00#, 5);
        Radix22TwdlMapping_twdl45Reg <= '0';
        Radix22TwdlMapping_dvldReg1 <= '0';
        Radix22TwdlMapping_dvldReg2 <= '0';
        Radix22TwdlMapping_cnt <= to_unsigned(16#00#, 6);
        Radix22TwdlMapping_phase <= to_unsigned(16#0#, 2);
      ELSIF enb_1_2_0 = '1' THEN
        Radix22TwdlMapping_cnt <= Radix22TwdlMapping_cnt_next;
        Radix22TwdlMapping_phase <= Radix22TwdlMapping_phase_next;
        Radix22TwdlMapping_octantReg1 <= Radix22TwdlMapping_octantReg1_next;
        Radix22TwdlMapping_twdlAddr_raw <= Radix22TwdlMapping_twdlAddr_raw_next;
        Radix22TwdlMapping_twdlAddrMap <= Radix22TwdlMapping_twdlAddrMap_next;
        Radix22TwdlMapping_twdl45Reg <= Radix22TwdlMapping_twdl45Reg_next;
        Radix22TwdlMapping_dvldReg1 <= Radix22TwdlMapping_dvldReg1_next;
        Radix22TwdlMapping_dvldReg2 <= Radix22TwdlMapping_dvldReg2_next;
      END IF;
    END IF;
  END PROCESS Radix22TwdlMapping_process;

  Radix22TwdlMapping_output : PROCESS (Radix22TwdlMapping_cnt, Radix22TwdlMapping_dvldReg1,
       Radix22TwdlMapping_dvldReg2, Radix22TwdlMapping_octantReg1,
       Radix22TwdlMapping_phase, Radix22TwdlMapping_twdl45Reg,
       Radix22TwdlMapping_twdlAddrMap, Radix22TwdlMapping_twdlAddr_raw,
       dout_6_1_vld)
    VARIABLE octant : unsigned(2 DOWNTO 0);
    VARIABLE cnt_cast : unsigned(7 DOWNTO 0);
    VARIABLE sub_cast : signed(17 DOWNTO 0);
    VARIABLE sub_temp : signed(17 DOWNTO 0);
    VARIABLE sub_cast_0 : signed(9 DOWNTO 0);
    VARIABLE sub_temp_0 : signed(9 DOWNTO 0);
    VARIABLE sub_cast_1 : signed(9 DOWNTO 0);
    VARIABLE sub_temp_1 : signed(9 DOWNTO 0);
    VARIABLE sub_cast_2 : signed(17 DOWNTO 0);
    VARIABLE sub_temp_2 : signed(17 DOWNTO 0);
    VARIABLE sub_cast_3 : signed(17 DOWNTO 0);
    VARIABLE sub_temp_3 : signed(17 DOWNTO 0);
  BEGIN
    sub_temp := to_signed(16#00000#, 18);
    sub_temp_0 := to_signed(16#000#, 10);
    sub_temp_1 := to_signed(16#000#, 10);
    sub_temp_2 := to_signed(16#00000#, 18);
    sub_temp_3 := to_signed(16#00000#, 18);
    sub_cast_3 := to_signed(16#00000#, 18);
    cnt_cast := to_unsigned(16#00#, 8);
    sub_cast_2 := to_signed(16#00000#, 18);
    sub_cast_1 := to_signed(16#000#, 10);
    sub_cast_0 := to_signed(16#000#, 10);
    sub_cast := to_signed(16#00000#, 18);
    Radix22TwdlMapping_cnt_next <= Radix22TwdlMapping_cnt;
    Radix22TwdlMapping_phase_next <= Radix22TwdlMapping_phase;
    Radix22TwdlMapping_dvldReg2_next <= Radix22TwdlMapping_dvldReg1;
    Radix22TwdlMapping_dvldReg1_next <= dout_6_1_vld;
    CASE Radix22TwdlMapping_twdlAddr_raw IS
      WHEN "00100000" =>
        octant := to_unsigned(16#0#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN "01000000" =>
        octant := to_unsigned(16#1#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
      WHEN "01100000" =>
        octant := to_unsigned(16#2#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN "10000000" =>
        octant := to_unsigned(16#3#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
      WHEN "10100000" =>
        octant := to_unsigned(16#4#, 3);
        Radix22TwdlMapping_twdl45Reg_next <= '1';
      WHEN OTHERS => 
        octant := Radix22TwdlMapping_twdlAddr_raw(7 DOWNTO 5);
        Radix22TwdlMapping_twdl45Reg_next <= '0';
    END CASE;
    Radix22TwdlMapping_octantReg1_next <= octant;
    CASE octant IS
      WHEN "000" =>
        Radix22TwdlMapping_twdlAddrMap_next <= Radix22TwdlMapping_twdlAddr_raw(4 DOWNTO 0);
      WHEN "001" =>
        sub_cast_0 := signed(resize(Radix22TwdlMapping_twdlAddr_raw, 10));
        sub_temp_0 := to_signed(16#040#, 10) - sub_cast_0;
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_0(4 DOWNTO 0));
      WHEN "010" =>
        sub_cast_1 := signed(resize(Radix22TwdlMapping_twdlAddr_raw, 10));
        sub_temp_1 := sub_cast_1 - to_signed(16#040#, 10);
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_1(4 DOWNTO 0));
      WHEN "011" =>
        sub_cast_2 := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0' & '0', 18));
        sub_temp_2 := to_signed(16#01000#, 18) - sub_cast_2;
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_2(9 DOWNTO 5));
      WHEN "100" =>
        sub_cast_3 := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0' & '0', 18));
        sub_temp_3 := sub_cast_3 - to_signed(16#01000#, 18);
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp_3(9 DOWNTO 5));
      WHEN OTHERS => 
        sub_cast := signed(resize(Radix22TwdlMapping_twdlAddr_raw & '0' & '0' & '0' & '0' & '0', 18));
        sub_temp := to_signed(16#01800#, 18) - sub_cast;
        Radix22TwdlMapping_twdlAddrMap_next <= unsigned(sub_temp(9 DOWNTO 5));
    END CASE;
    IF Radix22TwdlMapping_phase = to_unsigned(16#0#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= to_unsigned(16#00#, 8);
    ELSIF Radix22TwdlMapping_phase = to_unsigned(16#1#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= resize(Radix22TwdlMapping_cnt, 8) sll 1;
    ELSIF Radix22TwdlMapping_phase = to_unsigned(16#2#, 2) THEN 
      Radix22TwdlMapping_twdlAddr_raw_next <= resize(Radix22TwdlMapping_cnt, 8);
    ELSE 
      cnt_cast := resize(Radix22TwdlMapping_cnt, 8);
      Radix22TwdlMapping_twdlAddr_raw_next <= (cnt_cast sll 1) + cnt_cast;
    END IF;
    IF dout_6_1_vld = '1' AND (Radix22TwdlMapping_cnt > to_unsigned(16#2F#, 6)) THEN 
      Radix22TwdlMapping_phase_next <= Radix22TwdlMapping_phase + to_unsigned(16#1#, 2);
    END IF;
    IF dout_6_1_vld = '1' THEN 
      Radix22TwdlMapping_cnt_next <= Radix22TwdlMapping_cnt + to_unsigned(16#10#, 6);
    END IF;
    twdlAddr <= Radix22TwdlMapping_twdlAddrMap;
    twdlAddrVld <= Radix22TwdlMapping_dvldReg2;
    twdlOctant <= Radix22TwdlMapping_octantReg1;
    twdl45 <= Radix22TwdlMapping_twdl45Reg;
  END PROCESS Radix22TwdlMapping_output;


  -- Twiddle ROM1
  twiddleS_re <= Twiddle_re_table_data(to_integer(twdlAddr));

  TWIDDLEROM_RE_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twiddleReg_re <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        twiddleReg_re <= twiddleS_re;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_RE_process;


  -- Twiddle ROM2
  twiddleS_im <= Twiddle_im_table_data(to_integer(twdlAddr));

  TWIDDLEROM_IM_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twiddleReg_im <= to_signed(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        twiddleReg_im <= twiddleS_im;
      END IF;
    END IF;
  END PROCESS TWIDDLEROM_IM_process;


  intdelay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twdlOctantReg <= to_unsigned(16#0#, 3);
      ELSIF enb_1_2_0 = '1' THEN
        twdlOctantReg <= twdlOctant;
      END IF;
    END IF;
  END PROCESS intdelay_process;


  intdelay_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        twdl45Reg <= '0';
      ELSIF enb_1_2_0 = '1' THEN
        twdl45Reg <= twdl45;
      END IF;
    END IF;
  END PROCESS intdelay_1_process;


  -- Radix22TwdlOctCorr
  Radix22TwdlOctCorr_output : PROCESS (twdl45Reg, twdlOctantReg, twiddleReg_im, twiddleReg_re)
    VARIABLE twdlIn_re : signed(11 DOWNTO 0);
    VARIABLE twdlIn_im : signed(11 DOWNTO 0);
    VARIABLE cast : signed(12 DOWNTO 0);
    VARIABLE cast_0 : signed(12 DOWNTO 0);
    VARIABLE cast_1 : signed(12 DOWNTO 0);
    VARIABLE cast_2 : signed(12 DOWNTO 0);
    VARIABLE cast_3 : signed(12 DOWNTO 0);
    VARIABLE cast_4 : signed(12 DOWNTO 0);
    VARIABLE cast_5 : signed(12 DOWNTO 0);
    VARIABLE cast_6 : signed(12 DOWNTO 0);
    VARIABLE cast_7 : signed(12 DOWNTO 0);
    VARIABLE cast_8 : signed(12 DOWNTO 0);
    VARIABLE cast_9 : signed(12 DOWNTO 0);
    VARIABLE cast_10 : signed(12 DOWNTO 0);
  BEGIN
    cast_0 := to_signed(16#0000#, 13);
    cast_2 := to_signed(16#0000#, 13);
    cast_4 := to_signed(16#0000#, 13);
    cast_6 := to_signed(16#0000#, 13);
    cast_8 := to_signed(16#0000#, 13);
    cast_10 := to_signed(16#0000#, 13);
    cast_3 := to_signed(16#0000#, 13);
    cast_9 := to_signed(16#0000#, 13);
    cast_1 := to_signed(16#0000#, 13);
    cast_7 := to_signed(16#0000#, 13);
    cast := to_signed(16#0000#, 13);
    cast_5 := to_signed(16#0000#, 13);
    twdlIn_re := twiddleReg_re;
    twdlIn_im := twiddleReg_im;
    IF twdl45Reg = '1' THEN 
      CASE twdlOctantReg IS
        WHEN "000" =>
          twdlIn_re := to_signed(16#2D4#, 12);
          twdlIn_im := to_signed(-16#2D4#, 12);
        WHEN "010" =>
          twdlIn_re := to_signed(-16#2D4#, 12);
          twdlIn_im := to_signed(-16#2D4#, 12);
        WHEN "100" =>
          twdlIn_re := to_signed(-16#2D4#, 12);
          twdlIn_im := to_signed(16#2D4#, 12);
        WHEN OTHERS => 
          twdlIn_re := to_signed(16#2D4#, 12);
          twdlIn_im := to_signed(-16#2D4#, 12);
      END CASE;
    ELSE 
      CASE twdlOctantReg IS
        WHEN "000" =>
          NULL;
        WHEN "001" =>
          cast := resize(twiddleReg_im, 13);
          cast_0 :=  - (cast);
          twdlIn_re := cast_0(11 DOWNTO 0);
          cast_5 := resize(twiddleReg_re, 13);
          cast_6 :=  - (cast_5);
          twdlIn_im := cast_6(11 DOWNTO 0);
        WHEN "010" =>
          twdlIn_re := twiddleReg_im;
          cast_7 := resize(twiddleReg_re, 13);
          cast_8 :=  - (cast_7);
          twdlIn_im := cast_8(11 DOWNTO 0);
        WHEN "011" =>
          cast_1 := resize(twiddleReg_re, 13);
          cast_2 :=  - (cast_1);
          twdlIn_re := cast_2(11 DOWNTO 0);
          twdlIn_im := twiddleReg_im;
        WHEN "100" =>
          cast_3 := resize(twiddleReg_re, 13);
          cast_4 :=  - (cast_3);
          twdlIn_re := cast_4(11 DOWNTO 0);
          cast_9 := resize(twiddleReg_im, 13);
          cast_10 :=  - (cast_9);
          twdlIn_im := cast_10(11 DOWNTO 0);
        WHEN OTHERS => 
          twdlIn_re := twiddleReg_im;
          twdlIn_im := twiddleReg_re;
      END CASE;
    END IF;
    twdl_7_1_re_tmp <= twdlIn_re;
    twdl_7_1_im_tmp <= twdlIn_im;
  END PROCESS Radix22TwdlOctCorr_output;


  twdl_7_1_re <= std_logic_vector(twdl_7_1_re_tmp);

  twdl_7_1_im <= std_logic_vector(twdl_7_1_im_tmp);

END rtl;

