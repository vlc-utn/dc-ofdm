-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_positiveRealNormalizer_block1.vhd
-- Created: 2024-10-05 22:40:32
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_rx_ip_src_positiveRealNormalizer_block1
-- Source Path: HDLRx/full_rx/rx_demodulator_full/channel_estimation_and_equalization/Channel Equalization/equalizer/Real 
-- Divide HDL Optimized1/ForEach - Real Divide/Normalize numerator/positiveRealNormalize
-- Hierarchy Level: 8
-- Model version: 1.125
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_rx_ip_src_full_rx_pac.ALL;

ENTITY full_rx_ip_src_positiveRealNormalizer_block1 IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        u                                 :   IN    std_logic_vector(17 DOWNTO 0);  -- sfix18_En12
        validIn                           :   IN    std_logic;
        x                                 :   OUT   std_logic_vector(17 DOWNTO 0);  -- sfix18_En16
        e                                 :   OUT   std_logic_vector(31 DOWNTO 0);  -- int32
        isNegative                        :   OUT   std_logic
        );
END full_rx_ip_src_positiveRealNormalizer_block1;


ARCHITECTURE rtl OF full_rx_ip_src_positiveRealNormalizer_block1 IS

  -- Signals
  SIGNAL u_signed                         : signed(17 DOWNTO 0);  -- sfix18_En12
  SIGNAL x_tmp                            : signed(17 DOWNTO 0);  -- sfix18_En16
  SIGNAL e_tmp                            : signed(31 DOWNTO 0);  -- int32
  SIGNAL validOut                         : std_logic;
  SIGNAL validReg                         : std_logic_vector(5 DOWNTO 0);  -- boolean [6]
  SIGNAL tReg                             : vector_of_unsigned5(0 TO 5);  -- ufix5 [6]
  SIGNAL xReg                             : vector_of_unsigned18(0 TO 5);  -- ufix18 [6]
  SIGNAL isNegativeReg                    : std_logic_vector(5 DOWNTO 0);  -- boolean [6]
  SIGNAL validReg_next                    : std_logic_vector(5 DOWNTO 0);  -- boolean [6]
  SIGNAL tReg_next                        : vector_of_unsigned5(0 TO 5);  -- ufix5 [6]
  SIGNAL xReg_next                        : vector_of_unsigned18(0 TO 5);  -- ufix18 [6]
  SIGNAL isNegativeReg_next               : std_logic_vector(5 DOWNTO 0);  -- boolean [6]

BEGIN
  u_signed <= signed(u);

  embreciprocals_c3_spIjQTB3LDhbBDKeAOeGV2B_positiveRealNormalize_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        validReg <= (OTHERS => '0');
        tReg <= (OTHERS => to_unsigned(16#00#, 5));
        xReg <= (OTHERS => to_unsigned(16#00000#, 18));
        isNegativeReg <= (OTHERS => '0');
      ELSIF enb_1_2_0 = '1' THEN
        validReg <= validReg_next;
        tReg <= tReg_next;
        xReg <= xReg_next;
        isNegativeReg <= isNegativeReg_next;
      END IF;
    END IF;
  END PROCESS embreciprocals_c3_spIjQTB3LDhbBDKeAOeGV2B_positiveRealNormalize_process;

  embreciprocals_c3_spIjQTB3LDhbBDKeAOeGV2B_positiveRealNormalize_output : PROCESS (isNegativeReg, tReg, u_signed, validIn, validReg, xReg)
    VARIABLE u1 : signed(17 DOWNTO 0);
    VARIABLE isNegative1 : std_logic;
    VARIABLE a : unsigned(17 DOWNTO 0);
    VARIABLE c : unsigned(17 DOWNTO 0);
    VARIABLE xfi_stripped : unsigned(17 DOWNTO 0);
    VARIABLE yfi_trivial_scaling : signed(17 DOWNTO 0);
    VARIABLE a_0 : unsigned(17 DOWNTO 0);
    VARIABLE c_0 : unsigned(17 DOWNTO 0);
    VARIABLE a_1 : unsigned(17 DOWNTO 0);
    VARIABLE c_1 : unsigned(17 DOWNTO 0);
    VARIABLE a_2 : unsigned(17 DOWNTO 0);
    VARIABLE c_2 : unsigned(17 DOWNTO 0);
    VARIABLE a_3 : unsigned(17 DOWNTO 0);
    VARIABLE c_3 : unsigned(17 DOWNTO 0);
    VARIABLE a_4 : unsigned(17 DOWNTO 0);
    VARIABLE c_4 : unsigned(17 DOWNTO 0);
    VARIABLE cast : signed(18 DOWNTO 0);
    VARIABLE cast_0 : signed(18 DOWNTO 0);
    VARIABLE sub_cast : signed(31 DOWNTO 0);
  BEGIN
    c_4 := to_unsigned(16#00000#, 18);
    c_3 := to_unsigned(16#00000#, 18);
    c_2 := to_unsigned(16#00000#, 18);
    c_1 := to_unsigned(16#00000#, 18);
    c_0 := to_unsigned(16#00000#, 18);
    a_4 := to_unsigned(16#00000#, 18);
    a_3 := to_unsigned(16#00000#, 18);
    a_2 := to_unsigned(16#00000#, 18);
    a_1 := to_unsigned(16#00000#, 18);
    a_0 := to_unsigned(16#00000#, 18);
    cast_0 := to_signed(16#00000#, 19);
    cast := to_signed(16#00000#, 19);
    --realNormalizer Normalize real values.
    -- Given real scalar u ~= 0, this block produces x such that
    --    1 <= x < 2,
    -- e such that
    --    x = (2^e)*|u|,
    -- and isNegative = u<0.
    --
    --   When u = 0 and u is fixed-point or scaled-double, then x = 0 and
    --   e = (2^nextpow2(x.WordLength)) - x.WordLength - x.FractionLength.
    --
    --   When u = 0 and u is floating-point, then x = 0 and e = 1.
    --   Copyright 2019 The MathWorks, Inc.
    -- This function only works on scalars.
    -- Only operate on the real part
    -- Normalize in unsigned type.
    u1 := u_signed;
    IF u_signed < to_signed(16#00000#, 18) THEN 
      isNegative1 := '1';
    ELSE 
      isNegative1 := '0';
    END IF;
    IF isNegative1 = '1' THEN 
      cast := resize(u_signed, 19);
      cast_0 :=  - (cast);
      IF (cast_0(18) = '0') AND (cast_0(17) /= '0') THEN 
        u1 := "011111111111111111";
      ELSIF (cast_0(18) = '1') AND (cast_0(17) /= '1') THEN 
        u1 := "100000000000000000";
      ELSE 
        u1 := cast_0(17 DOWNTO 0);
      END IF;
    END IF;
    -- Normalize fixed-point values
    -- Normalize fixed-point values.
    -- For fixed-point types, the normalization uses a binary search of
    -- length log2 of the word length of the input.
    validReg_next(5) <= validReg(4);
    validReg_next(4) <= validReg(3);
    validReg_next(3) <= validReg(2);
    validReg_next(2) <= validReg(1);
    validReg_next(1) <= validReg(0);
    validReg_next(0) <= validIn;
    IF (xReg(4) AND to_unsigned(16#20000#, 18)) = to_unsigned(16#00000#, 18) THEN 
      tReg_next(5) <= tReg(4) OR to_unsigned(16#01#, 5);
      a_0 := xReg(4);
      c_0 := a_0 sll 1;
      xReg_next(5) <= c_0;
    ELSE 
      tReg_next(5) <= tReg(4);
      xReg_next(5) <= xReg(4);
    END IF;
    IF (xReg(3) AND to_unsigned(16#30000#, 18)) = to_unsigned(16#00000#, 18) THEN 
      tReg_next(4) <= tReg(3) OR to_unsigned(16#02#, 5);
      a_1 := xReg(3);
      c_1 := a_1 sll 2;
      xReg_next(4) <= c_1;
    ELSE 
      tReg_next(4) <= tReg(3);
      xReg_next(4) <= xReg(3);
    END IF;
    IF (xReg(2) AND to_unsigned(16#3C000#, 18)) = to_unsigned(16#00000#, 18) THEN 
      tReg_next(3) <= tReg(2) OR to_unsigned(16#04#, 5);
      a_2 := xReg(2);
      c_2 := a_2 sll 4;
      xReg_next(3) <= c_2;
    ELSE 
      tReg_next(3) <= tReg(2);
      xReg_next(3) <= xReg(2);
    END IF;
    IF (xReg(1) AND to_unsigned(16#3FC00#, 18)) = to_unsigned(16#00000#, 18) THEN 
      tReg_next(2) <= tReg(1) OR to_unsigned(16#08#, 5);
      a_3 := xReg(1);
      c_3 := a_3 sll 8;
      xReg_next(2) <= c_3;
    ELSE 
      tReg_next(2) <= tReg(1);
      xReg_next(2) <= xReg(1);
    END IF;
    IF (xReg(0) AND to_unsigned(16#3FFFC#, 18)) = to_unsigned(16#00000#, 18) THEN 
      tReg_next(1) <= tReg(0) OR to_unsigned(16#10#, 5);
      a_4 := xReg(0);
      c_4 := a_4 sll 16;
      xReg_next(1) <= c_4;
    ELSE 
      tReg_next(1) <= tReg(0);
      xReg_next(1) <= xReg(0);
    END IF;
    tReg_next(0) <= to_unsigned(16#00#, 5);
    xReg_next(0) <= unsigned(u1);
    --  % Persistent
    -- Assign outputs from states
    -- Update isNegative states
    isNegativeReg_next(5) <= isNegativeReg(4);
    isNegativeReg_next(4) <= isNegativeReg(3);
    isNegativeReg_next(3) <= isNegativeReg(2);
    isNegativeReg_next(2) <= isNegativeReg(1);
    isNegativeReg_next(1) <= isNegativeReg(0);
    isNegativeReg_next(0) <= isNegative1;
    -- Cast the output to signed if the input was signed.
    a := xReg(5);
    c := SHIFT_RIGHT(a, 1);
    xfi_stripped := c;
    yfi_trivial_scaling := signed(xfi_stripped);
    -- Convert the normalized shift value based on the data type of the
    -- input U so that the output of the normalizer X is in real-world
    -- scale and X = (2^N)*U.
    x_tmp <= yfi_trivial_scaling;
    sub_cast := signed(resize(tReg(5), 32));
    e_tmp <= sub_cast - 5;
    isNegative <= isNegativeReg(5);
    validOut <= validReg(5);
  END PROCESS embreciprocals_c3_spIjQTB3LDhbBDKeAOeGV2B_positiveRealNormalize_output;


  x <= std_logic_vector(x_tmp);

  e <= std_logic_vector(e_tmp);

END rtl;
