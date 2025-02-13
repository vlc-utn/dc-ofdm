-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLTx/full_tx_raw_src_RAM.vhd
-- Created: 2024-08-31 20:20:58
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: full_tx_raw_src_RAM
-- Source Path: HDLTx/full_tx/store_frame_in_ram/RAM
-- Hierarchy Level: 2
-- Model version: 4.99
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY full_tx_raw_src_RAM IS
  PORT( clk                               :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        new_din                           :   IN    std_logic_vector(11 DOWNTO 0);  -- ufix12
        new_wr_addr                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        new_we                            :   IN    std_logic;
        new_rd_addr                       :   IN    std_logic_vector(15 DOWNTO 0);  -- uint16
        dout_new                          :   OUT   std_logic_vector(11 DOWNTO 0)  -- ufix12
        );
END full_tx_raw_src_RAM;


ARCHITECTURE rtl OF full_tx_raw_src_RAM IS

  -- Component Declarations
  COMPONENT full_tx_raw_src_SimpleDualPortRAM_generic
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

  -- Component Configuration Statements
  FOR ALL : full_tx_raw_src_SimpleDualPortRAM_generic
    USE ENTITY work.full_tx_raw_src_SimpleDualPortRAM_generic(rtl);

  -- Signals
  SIGNAL dout_new_tmp                     : std_logic_vector(11 DOWNTO 0);  -- ufix12

BEGIN
  u_Simple_Dual_Port_RAM_System : full_tx_raw_src_SimpleDualPortRAM_generic
    GENERIC MAP( AddrWidth => 16,
                 DataWidth => 12
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => new_din,
              wr_addr => new_wr_addr,
              wr_en => new_we,
              rd_addr => new_rd_addr,
              dout => dout_new_tmp
              );

  dout_new <= dout_new_tmp;

END rtl;

