
-- ----------------------------------------------
-- File Name: hdlverifier_dcram.vhd
-- Created:   30-Jun-2024 19:39:20
-- Copyright  2024 MathWorks, Inc.
-- ----------------------------------------------


LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use ieee.std_logic_unsigned.all;

ENTITY hdlverifier_dcram IS
   GENERIC(
      DATA_WIDTH:integer := 8;
      ADDR_WIDTH:integer := 5);
   PORT
   (
      wclk    : IN   std_logic;
      rclk    : IN   std_logic;
      wdata   : IN   std_logic_vector(DATA_WIDTH-1 downto 0);
      q       : OUT  std_logic_vector(DATA_WIDTH-1 downto 0);
      waddr   : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);
      raddr   : IN   std_logic_vector(ADDR_WIDTH-1 downto 0);
      wr      : IN   std_logic;
      rd      : IN   std_logic);
END hdlverifier_dcram;

ARCHITECTURE rtl OF hdlverifier_dcram IS
    TYPE ram_type IS ARRAY(2**ADDR_WIDTH-1 downto 0) of std_logic_vector(DATA_WIDTH-1 downto 0);
    SIGNAL ram : ram_type; 
BEGIN
    PROCESS (wclk)
    BEGIN
      IF (wclk'event AND wclk = '1') THEN
         IF (wr = '1') THEN
            ram(conv_integer(waddr)) <= wdata;
         END IF;
      END IF;
   END PROCESS;
   
   PROCESS (rclk)
   BEGIN
      IF (rclk'event AND rclk = '1') THEN
        IF (rd = '1') THEN
         q <= ram(conv_integer(raddr));
        END IF;
      END IF;
   END PROCESS;
   
END rtl;


