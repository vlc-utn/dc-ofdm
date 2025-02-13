-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_CheckNodeRAM.vhd
-- Created: 2024-11-23 11:22:01
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_CheckNodeRAM
-- Source Path: HDLRx/full_rx/LDPC_shared/LDPC Decoder/DecoderCore/CheckNodeRAM
-- Hierarchy Level: 4
-- Model version: 1.147
-- 
-- BetaMemory
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_CheckNodeRAM IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb                               :   IN    std_logic;
        bdecomp1                          :   IN    vector_of_std_logic_vector7(0 TO 13);  -- ufix7 [14]
        bdecomp2                          :   IN    vector_of_std_logic_vector4(0 TO 13);  -- ufix4 [14]
        bdecomp3                          :   IN    vector_of_std_logic_vector6(0 TO 13);  -- ufix6 [14]
        countlayer                        :   IN    std_logic_vector(3 DOWNTO 0);  -- ufix4
        enbread                           :   IN    std_logic;  -- ufix1
        bvalid                            :   IN    std_logic;  -- ufix1
        bdecomp1Out                       :   OUT   vector_of_std_logic_vector7(0 TO 13);  -- ufix7 [14]
        bdecomp2Out                       :   OUT   vector_of_std_logic_vector4(0 TO 13);  -- ufix4 [14]
        bdecomp3Out                       :   OUT   vector_of_std_logic_vector6(0 TO 13);  -- ufix6 [14]
        bvalidOut                         :   OUT   std_logic  -- ufix1
        );
END IEEE_8021513_RX_src_CheckNodeRAM;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_CheckNodeRAM IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  COMPONENT IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb                             :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    USE ENTITY work.IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block(rtl);

  FOR ALL : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    USE ENTITY work.IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1(rtl);

  -- Signals
  SIGNAL bdecomp1Out_tmp                  : vector_of_std_logic_vector7(0 TO 13);  -- ufix7 [14]
  SIGNAL bdecomp2Out_tmp                  : vector_of_std_logic_vector4(0 TO 13);  -- ufix4 [14]
  SIGNAL bdecomp3Out_tmp                  : vector_of_std_logic_vector6(0 TO 13);  -- ufix6 [14]

BEGIN
  u_CheckNodeRAM1_generic_bank0 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(0),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(0)
              );

  u_CheckNodeRAM1_generic_bank1 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(1),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(1)
              );

  u_CheckNodeRAM1_generic_bank2 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(2),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(2)
              );

  u_CheckNodeRAM1_generic_bank3 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(3),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(3)
              );

  u_CheckNodeRAM1_generic_bank4 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(4),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(4)
              );

  u_CheckNodeRAM1_generic_bank5 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(5),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(5)
              );

  u_CheckNodeRAM1_generic_bank6 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(6),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(6)
              );

  u_CheckNodeRAM1_generic_bank7 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(7),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(7)
              );

  u_CheckNodeRAM1_generic_bank8 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(8),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(8)
              );

  u_CheckNodeRAM1_generic_bank9 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(9),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(9)
              );

  u_CheckNodeRAM1_generic_bank10 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(10),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(10)
              );

  u_CheckNodeRAM1_generic_bank11 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(11),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(11)
              );

  u_CheckNodeRAM1_generic_bank12 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(12),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(12)
              );

  u_CheckNodeRAM1_generic_bank13 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 7
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp1(13),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp1Out_tmp(13)
              );

  u_CheckNodeRAM2_generic_bank0 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(0),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(0)
              );

  u_CheckNodeRAM2_generic_bank1 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(1),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(1)
              );

  u_CheckNodeRAM2_generic_bank2 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(2),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(2)
              );

  u_CheckNodeRAM2_generic_bank3 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(3),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(3)
              );

  u_CheckNodeRAM2_generic_bank4 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(4),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(4)
              );

  u_CheckNodeRAM2_generic_bank5 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(5),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(5)
              );

  u_CheckNodeRAM2_generic_bank6 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(6),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(6)
              );

  u_CheckNodeRAM2_generic_bank7 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(7),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(7)
              );

  u_CheckNodeRAM2_generic_bank8 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(8),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(8)
              );

  u_CheckNodeRAM2_generic_bank9 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(9),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(9)
              );

  u_CheckNodeRAM2_generic_bank10 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(10),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(10)
              );

  u_CheckNodeRAM2_generic_bank11 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(11),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(11)
              );

  u_CheckNodeRAM2_generic_bank12 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(12),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(12)
              );

  u_CheckNodeRAM2_generic_bank13 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 4
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp2(13),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp2Out_tmp(13)
              );

  u_CheckNodeRAM3_generic_bank0 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(0),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(0)
              );

  u_CheckNodeRAM3_generic_bank1 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(1),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(1)
              );

  u_CheckNodeRAM3_generic_bank2 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(2),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(2)
              );

  u_CheckNodeRAM3_generic_bank3 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(3),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(3)
              );

  u_CheckNodeRAM3_generic_bank4 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(4),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(4)
              );

  u_CheckNodeRAM3_generic_bank5 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(5),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(5)
              );

  u_CheckNodeRAM3_generic_bank6 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(6),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(6)
              );

  u_CheckNodeRAM3_generic_bank7 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(7),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(7)
              );

  u_CheckNodeRAM3_generic_bank8 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(8),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(8)
              );

  u_CheckNodeRAM3_generic_bank9 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(9),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(9)
              );

  u_CheckNodeRAM3_generic_bank10 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(10),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(10)
              );

  u_CheckNodeRAM3_generic_bank11 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(11),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(11)
              );

  u_CheckNodeRAM3_generic_bank12 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(12),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(12)
              );

  u_CheckNodeRAM3_generic_bank13 : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 4,
                 DataWidth => 6
                 )
    PORT MAP( clk => clk,
              enb => enb,
              wr_din => bdecomp3(13),
              wr_addr => countlayer,
              wr_en => bvalid,  -- ufix1
              rd_addr => countlayer,
              dout => bdecomp3Out_tmp(13)
              );




  valid_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        bvalidOut <= '0';
      ELSIF enb = '1' THEN
        bvalidOut <= enbread;
      END IF;
    END IF;
  END PROCESS valid_process;


  bdecomp1Out <= bdecomp1Out_tmp;

  bdecomp2Out <= bdecomp2Out_tmp;

  bdecomp3Out <= bdecomp3Out_tmp;

END rtl;

