-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/full_rx_ip_src_full_rx_pac.vhd
-- Created: 2024-08-11 11:00:06
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE full_rx_ip_src_full_rx_pac IS
  TYPE vector_of_signed24 IS ARRAY (NATURAL RANGE <>) OF signed(23 DOWNTO 0);
  TYPE vector_of_signed48 IS ARRAY (NATURAL RANGE <>) OF signed(47 DOWNTO 0);
  TYPE vector_of_signed49 IS ARRAY (NATURAL RANGE <>) OF signed(48 DOWNTO 0);
  TYPE vector_of_signed63 IS ARRAY (NATURAL RANGE <>) OF signed(62 DOWNTO 0);
  TYPE vector_of_signed111 IS ARRAY (NATURAL RANGE <>) OF signed(110 DOWNTO 0);
  TYPE vector_of_signed16 IS ARRAY (NATURAL RANGE <>) OF signed(15 DOWNTO 0);
  TYPE vector_of_unsigned8 IS ARRAY (NATURAL RANGE <>) OF unsigned(7 DOWNTO 0);
  TYPE vector_of_signed25 IS ARRAY (NATURAL RANGE <>) OF signed(24 DOWNTO 0);
  TYPE vector_of_unsigned17 IS ARRAY (NATURAL RANGE <>) OF unsigned(16 DOWNTO 0);
  TYPE vector_of_unsigned9 IS ARRAY (NATURAL RANGE <>) OF unsigned(8 DOWNTO 0);
  TYPE vector_of_signed11 IS ARRAY (NATURAL RANGE <>) OF signed(10 DOWNTO 0);
  TYPE vector_of_unsigned4 IS ARRAY (NATURAL RANGE <>) OF unsigned(3 DOWNTO 0);
  TYPE vector_of_unsigned5 IS ARRAY (NATURAL RANGE <>) OF unsigned(4 DOWNTO 0);
  TYPE vector_of_signed30 IS ARRAY (NATURAL RANGE <>) OF signed(29 DOWNTO 0);
  TYPE vector_of_std_logic_vector28 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(27 DOWNTO 0);
  TYPE vector_of_signed28 IS ARRAY (NATURAL RANGE <>) OF signed(27 DOWNTO 0);
  TYPE vector_of_signed56 IS ARRAY (NATURAL RANGE <>) OF signed(55 DOWNTO 0);
  TYPE vector_of_signed29 IS ARRAY (NATURAL RANGE <>) OF signed(28 DOWNTO 0);
  TYPE vector_of_signed3 IS ARRAY (NATURAL RANGE <>) OF signed(2 DOWNTO 0);
  TYPE vector_of_std_logic_vector16 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(15 DOWNTO 0);
  TYPE vector_of_signed8 IS ARRAY (NATURAL RANGE <>) OF signed(7 DOWNTO 0);
  TYPE vector_of_signed32 IS ARRAY (NATURAL RANGE <>) OF signed(31 DOWNTO 0);
  TYPE vector_of_unsigned32 IS ARRAY (NATURAL RANGE <>) OF unsigned(31 DOWNTO 0);
  TYPE vector_of_signed34 IS ARRAY (NATURAL RANGE <>) OF signed(33 DOWNTO 0);
  TYPE vector_of_signed18 IS ARRAY (NATURAL RANGE <>) OF signed(17 DOWNTO 0);
  TYPE vector_of_signed20 IS ARRAY (NATURAL RANGE <>) OF signed(19 DOWNTO 0);
  TYPE vector_of_signed22 IS ARRAY (NATURAL RANGE <>) OF signed(21 DOWNTO 0);
  TYPE vector_of_unsigned10 IS ARRAY (NATURAL RANGE <>) OF unsigned(9 DOWNTO 0);
  TYPE vector_of_std_logic_vector10 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(9 DOWNTO 0);
  TYPE vector_of_signed10 IS ARRAY (NATURAL RANGE <>) OF signed(9 DOWNTO 0);
  TYPE vector_of_std_logic_vector3 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(2 DOWNTO 0);
  TYPE vector_of_std_logic_vector8 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(7 DOWNTO 0);
  TYPE vector_of_unsigned3 IS ARRAY (NATURAL RANGE <>) OF unsigned(2 DOWNTO 0);
  TYPE vector_of_signed9 IS ARRAY (NATURAL RANGE <>) OF signed(8 DOWNTO 0);
  TYPE vector_of_std_logic_vector7 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(6 DOWNTO 0);
  TYPE vector_of_std_logic_vector4 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(3 DOWNTO 0);
  TYPE vector_of_std_logic_vector14 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(13 DOWNTO 0);
  TYPE vector_of_unsigned7 IS ARRAY (NATURAL RANGE <>) OF unsigned(6 DOWNTO 0);
  TYPE vector_of_unsigned14 IS ARRAY (NATURAL RANGE <>) OF unsigned(13 DOWNTO 0);
  TYPE vector_of_std_logic_vector18 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(17 DOWNTO 0);
  TYPE vector_of_unsigned16 IS ARRAY (NATURAL RANGE <>) OF unsigned(15 DOWNTO 0);
  TYPE vector_of_signed17 IS ARRAY (NATURAL RANGE <>) OF signed(16 DOWNTO 0);
  TYPE vector_of_std_logic_vector30 IS ARRAY (NATURAL RANGE <>) OF std_logic_vector(29 DOWNTO 0);
  TYPE vector_of_unsigned30 IS ARRAY (NATURAL RANGE <>) OF unsigned(29 DOWNTO 0);
  TYPE vector_of_unsigned15 IS ARRAY (NATURAL RANGE <>) OF unsigned(14 DOWNTO 0);
  TYPE vector_of_signed19 IS ARRAY (NATURAL RANGE <>) OF signed(18 DOWNTO 0);
END full_rx_ip_src_full_rx_pac;
