-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_ip_fir_reduced_src_Calculate_Parity_block.vhd
-- Created: 2024-08-10 09:35:20
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_ip_fir_reduced_src_Calculate_Parity_block
-- Source Path: HDLTx/full_tx/payload_full/reduced_ldpc/Hc_12S-B80/Calculate Parity
-- Hierarchy Level: 4
-- Model version: 4.90
-- 
-- Calculate Parity
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.full_tx_ip_fir_reduced_src_full_tx_pac.ALL;

ENTITY full_tx_ip_fir_reduced_src_Calculate_Parity_block IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        reset                             :   IN    std_logic;  -- ufix1
        alpha                             :   IN    std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
        alphaValid                        :   IN    std_logic;  -- ufix1
        alphaAddr                         :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        parity1                           :   IN    std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
        parityOut                         :   OUT   std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
        parityValid                       :   OUT   std_logic;  -- ufix1
        parityAddr                        :   OUT   std_logic_vector(3 DOWNTO 0)  -- ufix4
        );
END full_tx_ip_fir_reduced_src_Calculate_Parity_block;


ARCHITECTURE rtl OF full_tx_ip_fir_reduced_src_Calculate_Parity_block IS

  -- Functions
  -- HDLCODER_TO_SIGNED
  FUNCTION hdlcoder_to_signed(arg: boolean; width: integer) RETURN signed IS
  BEGIN
    IF arg THEN
      RETURN to_signed(1, width);
    ELSE
      RETURN to_signed(0, width);
    END IF;
  END FUNCTION;


  -- Signals
  SIGNAL alphaReg                         : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL alphaValidReg                    : std_logic;  -- ufix1
  SIGNAL alphaAddr_unsigned               : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL alphaAddrReg                     : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL parity1_1                        : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL parity1Reg                       : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sParity                          : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL sParityReg                       : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL parityControllerDual_pOut        : std_logic_vector(79 DOWNTO 0);  -- boolean [80]
  SIGNAL parityControllerDual_pValid      : std_logic;
  SIGNAL parityControllerDual_pAddr       : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL parityControllerDual_alphaReg    : std_logic_vector(79 DOWNTO 0);  -- boolean [80]
  SIGNAL parityControllerDual_pOut_next   : std_logic_vector(79 DOWNTO 0);  -- boolean [80]
  SIGNAL parityControllerDual_pValid_next : std_logic;
  SIGNAL parityControllerDual_pAddr_next  : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL parityControllerDual_alphaReg_next : std_logic_vector(79 DOWNTO 0);  -- boolean [80]
  SIGNAL pOut                             : std_logic_vector(79 DOWNTO 0);  -- ufix1 [80]
  SIGNAL pValid                           : std_logic;  -- ufix1
  SIGNAL pAddr                            : unsigned(3 DOWNTO 0);  -- ufix4
  SIGNAL parityAddr_tmp                   : unsigned(3 DOWNTO 0);  -- ufix4

BEGIN
  data_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alphaReg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        alphaReg <= alpha;
      END IF;
    END IF;
  END PROCESS data_register_process;


  valid_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alphaValidReg <= '0';
      ELSIF enb = '1' THEN
        alphaValidReg <= alphaValid;
      END IF;
    END IF;
  END PROCESS valid_register_process;


  alphaAddr_unsigned <= unsigned(alphaAddr);

  addr_register_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alphaAddrReg <= to_unsigned(16#0#, 4);
      ELSIF enb = '1' THEN
        alphaAddrReg <= alphaAddr_unsigned;
      END IF;
    END IF;
  END PROCESS addr_register_process;


  parity1_1(0) <= parity1(0);
  parity1_1(1) <= parity1(1);
  parity1_1(2) <= parity1(2);
  parity1_1(3) <= parity1(3);
  parity1_1(4) <= parity1(4);
  parity1_1(5) <= parity1(5);
  parity1_1(6) <= parity1(6);
  parity1_1(7) <= parity1(7);
  parity1_1(8) <= parity1(8);
  parity1_1(9) <= parity1(9);
  parity1_1(10) <= parity1(10);
  parity1_1(11) <= parity1(11);
  parity1_1(12) <= parity1(12);
  parity1_1(13) <= parity1(13);
  parity1_1(14) <= parity1(14);
  parity1_1(15) <= parity1(15);
  parity1_1(16) <= parity1(16);
  parity1_1(17) <= parity1(17);
  parity1_1(18) <= parity1(18);
  parity1_1(19) <= parity1(19);
  parity1_1(20) <= parity1(20);
  parity1_1(21) <= parity1(21);
  parity1_1(22) <= parity1(22);
  parity1_1(23) <= parity1(23);
  parity1_1(24) <= parity1(24);
  parity1_1(25) <= parity1(25);
  parity1_1(26) <= parity1(26);
  parity1_1(27) <= parity1(27);
  parity1_1(28) <= parity1(28);
  parity1_1(29) <= parity1(29);
  parity1_1(30) <= parity1(30);
  parity1_1(31) <= parity1(31);
  parity1_1(32) <= parity1(32);
  parity1_1(33) <= parity1(33);
  parity1_1(34) <= parity1(34);
  parity1_1(35) <= parity1(35);
  parity1_1(36) <= parity1(36);
  parity1_1(37) <= parity1(37);
  parity1_1(38) <= parity1(38);
  parity1_1(39) <= parity1(39);
  parity1_1(40) <= parity1(40);
  parity1_1(41) <= parity1(41);
  parity1_1(42) <= parity1(42);
  parity1_1(43) <= parity1(43);
  parity1_1(44) <= parity1(44);
  parity1_1(45) <= parity1(45);
  parity1_1(46) <= parity1(46);
  parity1_1(47) <= parity1(47);
  parity1_1(48) <= parity1(48);
  parity1_1(49) <= parity1(49);
  parity1_1(50) <= parity1(50);
  parity1_1(51) <= parity1(51);
  parity1_1(52) <= parity1(52);
  parity1_1(53) <= parity1(53);
  parity1_1(54) <= parity1(54);
  parity1_1(55) <= parity1(55);
  parity1_1(56) <= parity1(56);
  parity1_1(57) <= parity1(57);
  parity1_1(58) <= parity1(58);
  parity1_1(59) <= parity1(59);
  parity1_1(60) <= parity1(60);
  parity1_1(61) <= parity1(61);
  parity1_1(62) <= parity1(62);
  parity1_1(63) <= parity1(63);
  parity1_1(64) <= parity1(64);
  parity1_1(65) <= parity1(65);
  parity1_1(66) <= parity1(66);
  parity1_1(67) <= parity1(67);
  parity1_1(68) <= parity1(68);
  parity1_1(69) <= parity1(69);
  parity1_1(70) <= parity1(70);
  parity1_1(71) <= parity1(71);
  parity1_1(72) <= parity1(72);
  parity1_1(73) <= parity1(73);
  parity1_1(74) <= parity1(74);
  parity1_1(75) <= parity1(75);
  parity1_1(76) <= parity1(76);
  parity1_1(77) <= parity1(77);
  parity1_1(78) <= parity1(78);
  parity1_1(79) <= parity1(79);

  parity_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        parity1Reg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        parity1Reg <= parity1_1;
      END IF;
    END IF;
  END PROCESS parity_process;


  sParity(0) <= parity1(10);
  sParity(1) <= parity1(11);
  sParity(2) <= parity1(12);
  sParity(3) <= parity1(13);
  sParity(4) <= parity1(14);
  sParity(5) <= parity1(15);
  sParity(6) <= parity1(16);
  sParity(7) <= parity1(17);
  sParity(8) <= parity1(18);
  sParity(9) <= parity1(19);
  sParity(10) <= parity1(20);
  sParity(11) <= parity1(21);
  sParity(12) <= parity1(22);
  sParity(13) <= parity1(23);
  sParity(14) <= parity1(24);
  sParity(15) <= parity1(25);
  sParity(16) <= parity1(26);
  sParity(17) <= parity1(27);
  sParity(18) <= parity1(28);
  sParity(19) <= parity1(29);
  sParity(20) <= parity1(30);
  sParity(21) <= parity1(31);
  sParity(22) <= parity1(32);
  sParity(23) <= parity1(33);
  sParity(24) <= parity1(34);
  sParity(25) <= parity1(35);
  sParity(26) <= parity1(36);
  sParity(27) <= parity1(37);
  sParity(28) <= parity1(38);
  sParity(29) <= parity1(39);
  sParity(30) <= parity1(40);
  sParity(31) <= parity1(41);
  sParity(32) <= parity1(42);
  sParity(33) <= parity1(43);
  sParity(34) <= parity1(44);
  sParity(35) <= parity1(45);
  sParity(36) <= parity1(46);
  sParity(37) <= parity1(47);
  sParity(38) <= parity1(48);
  sParity(39) <= parity1(49);
  sParity(40) <= parity1(50);
  sParity(41) <= parity1(51);
  sParity(42) <= parity1(52);
  sParity(43) <= parity1(53);
  sParity(44) <= parity1(54);
  sParity(45) <= parity1(55);
  sParity(46) <= parity1(56);
  sParity(47) <= parity1(57);
  sParity(48) <= parity1(58);
  sParity(49) <= parity1(59);
  sParity(50) <= parity1(60);
  sParity(51) <= parity1(61);
  sParity(52) <= parity1(62);
  sParity(53) <= parity1(63);
  sParity(54) <= parity1(64);
  sParity(55) <= parity1(65);
  sParity(56) <= parity1(66);
  sParity(57) <= parity1(67);
  sParity(58) <= parity1(68);
  sParity(59) <= parity1(69);
  sParity(60) <= parity1(70);
  sParity(61) <= parity1(71);
  sParity(62) <= parity1(72);
  sParity(63) <= parity1(73);
  sParity(64) <= parity1(74);
  sParity(65) <= parity1(75);
  sParity(66) <= parity1(76);
  sParity(67) <= parity1(77);
  sParity(68) <= parity1(78);
  sParity(69) <= parity1(79);
  sParity(70) <= parity1(0);
  sParity(71) <= parity1(1);
  sParity(72) <= parity1(2);
  sParity(73) <= parity1(3);
  sParity(74) <= parity1(4);
  sParity(75) <= parity1(5);
  sParity(76) <= parity1(6);
  sParity(77) <= parity1(7);
  sParity(78) <= parity1(8);
  sParity(79) <= parity1(9);

  parity_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        sParityReg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        sParityReg <= sParity;
      END IF;
    END IF;
  END PROCESS parity_1_process;


  parityControllerDual_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        parityControllerDual_pValid <= '0';
        parityControllerDual_pAddr <= to_unsigned(16#1#, 4);
        parityControllerDual_pOut <= (OTHERS => '0');
        parityControllerDual_alphaReg <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        parityControllerDual_pValid <= parityControllerDual_pValid_next;
        parityControllerDual_pAddr <= parityControllerDual_pAddr_next;
        parityControllerDual_pOut <= parityControllerDual_pOut_next;
        parityControllerDual_alphaReg <= parityControllerDual_alphaReg_next;
      END IF;
    END IF;
  END PROCESS parityControllerDual_process;

  parityControllerDual_output : PROCESS (alphaAddrReg, alphaReg, alphaValidReg, parity1Reg,
       parityControllerDual_alphaReg, parityControllerDual_pAddr,
       parityControllerDual_pOut, parityControllerDual_pValid, reset,
       sParityReg)
    VARIABLE cast : vector_of_signed32(0 TO 79);
    VARIABLE cast_0 : vector_of_signed32(0 TO 79);
  BEGIN
    parityControllerDual_pOut_next <= parityControllerDual_pOut;
    IF reset /= '0' THEN 
      parityControllerDual_pOut_next <= (OTHERS => '0');
      parityControllerDual_pValid_next <= '0';
      parityControllerDual_pAddr_next <= to_unsigned(16#1#, 4);
    ELSIF alphaValidReg /= '0' THEN 
      parityControllerDual_pValid_next <= '1';
      parityControllerDual_pAddr_next <= alphaAddrReg;
      IF alphaAddrReg = to_unsigned(16#1#, 4) THEN 
        FOR t_0 IN 0 TO 79 LOOP
          parityControllerDual_pOut_next(t_0) <= parity1Reg(t_0);
        END LOOP;
      ELSIF alphaAddrReg <= to_unsigned(16#B#, 4) THEN 
        IF alphaAddrReg = to_unsigned(16#2#, 4) THEN 
          FOR t_5 IN 0 TO 79 LOOP
            cast_0(t_5) := '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & parityControllerDual_alphaReg(t_5);
            IF hdlcoder_to_signed(sParityReg(t_5) /= '0', 32) /= cast_0(t_5) THEN 
              parityControllerDual_pOut_next(t_5) <= '1';
            ELSE 
              parityControllerDual_pOut_next(t_5) <= '0';
            END IF;
          END LOOP;
        ELSE 
          FOR t_4 IN 0 TO 79 LOOP
            parityControllerDual_pOut_next(t_4) <= parityControllerDual_pOut(t_4) XOR parityControllerDual_alphaReg(t_4);
          END LOOP;
        END IF;
      ELSIF alphaAddrReg = to_unsigned(16#C#, 4) THEN 
        FOR t_3 IN 0 TO 79 LOOP
          IF (sParityReg(t_3) /= '0') /= (alphaReg(t_3) /= '0') THEN 
            parityControllerDual_pOut_next(t_3) <= '1';
          ELSE 
            parityControllerDual_pOut_next(t_3) <= '0';
          END IF;
        END LOOP;
      ELSE 
        FOR t_2 IN 0 TO 79 LOOP
          cast(t_2) := '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & parityControllerDual_pOut(t_2);
          IF cast(t_2) /= hdlcoder_to_signed(alphaReg(t_2) /= '0', 32) THEN 
            parityControllerDual_pOut_next(t_2) <= '1';
          ELSE 
            parityControllerDual_pOut_next(t_2) <= '0';
          END IF;
        END LOOP;
      END IF;
    ELSE 
      parityControllerDual_pOut_next <= (OTHERS => '0');
      parityControllerDual_pValid_next <= '0';
      parityControllerDual_pAddr_next <= to_unsigned(16#1#, 4);
    END IF;

    FOR t_1 IN 0 TO 79 LOOP
      parityControllerDual_alphaReg_next(t_1) <= alphaReg(t_1);
      pOut(t_1) <= parityControllerDual_pOut(t_1);
    END LOOP;

    pValid <= parityControllerDual_pValid;
    pAddr <= parityControllerDual_pAddr;
  END PROCESS parityControllerDual_output;


  parity_2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        parityOut <= (OTHERS => '0');
      ELSIF enb = '1' THEN
        parityOut <= pOut;
      END IF;
    END IF;
  END PROCESS parity_2_process;


  parity_valid_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        parityValid <= '0';
      ELSIF enb = '1' THEN
        parityValid <= pValid;
      END IF;
    END IF;
  END PROCESS parity_valid_process;


  parity_addr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        parityAddr_tmp <= to_unsigned(16#0#, 4);
      ELSIF enb = '1' THEN
        parityAddr_tmp <= pAddr;
      END IF;
    END IF;
  END PROCESS parity_addr_process;


  parityAddr <= std_logic_vector(parityAddr_tmp);

END rtl;
