-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRx/IEEE_8021513_RX_src_calculate_R.vhd
-- Created: 2024-11-23 11:22:02
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: IEEE_8021513_RX_src_calculate_R
-- Source Path: HDLRx/full_rx/rx_demodulator_full/ofdm_symbol_sync/m_cox/calculate_R
-- Hierarchy Level: 4
-- Model version: 1.147
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.IEEE_8021513_RX_src_full_rx_pac.ALL;

ENTITY IEEE_8021513_RX_src_calculate_R IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        r_d_re                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        r_d_im                            :   IN    std_logic_vector(15 DOWNTO 0);  -- sfix16_En10
        Rf2                               :   OUT   std_logic_vector(42 DOWNTO 0)  -- sfix43_En23
        );
END IEEE_8021513_RX_src_calculate_R;


ARCHITECTURE rtl OF IEEE_8021513_RX_src_calculate_R IS

  -- Component Declarations
  COMPONENT IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3
    GENERIC( AddrWidth                    : integer;
             DataWidth                    : integer
             );
    PORT( clk                             :   IN    std_logic;
          enb_1_2_0                       :   IN    std_logic;
          wr_din                          :   IN    std_logic_vector(DataWidth - 1 DOWNTO 0);  -- generic width
          wr_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          wr_en                           :   IN    std_logic;  -- ufix1
          rd_addr                         :   IN    std_logic_vector(AddrWidth - 1 DOWNTO 0);  -- generic width
          dout                            :   OUT   std_logic_vector(DataWidth - 1 DOWNTO 0)  -- generic width
          );
  END COMPONENT;

  -- Component Configuration Statements
  FOR ALL : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3
    USE ENTITY work.IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3(rtl);

  -- Signals
  SIGNAL r_d_re_signed                    : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL r_d_im_signed                    : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Delay6_reg                       : vector_of_signed16(0 TO 1);  -- sfix16 [2]
  SIGNAL Delay6_out1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Product1_out1                    : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Delay12_reg                      : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay12_out1                     : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Delay3_reg                       : vector_of_signed16(0 TO 1);  -- sfix16 [2]
  SIGNAL Delay3_out1                      : signed(15 DOWNTO 0);  -- sfix16_En10
  SIGNAL Product_out1                     : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Delay11_reg                      : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay11_out1                     : signed(31 DOWNTO 0);  -- sfix32_En20
  SIGNAL Add1_add_cast                    : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL Add1_add_cast_1                  : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL Add1_out1                        : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL alphar_d_2L_2                    : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL Divide_by_2_out1                 : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL Delay8_out1                      : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL Delay_regin                      : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL Delay_waddr                      : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Delay_wrenb                      : std_logic;  -- ufix1
  SIGNAL Delay_raddr                      : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Delay_regout                     : std_logic_vector(32 DOWNTO 0);  -- ufix33
  SIGNAL Delay_regout_signed              : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL alphar_d_2                       : signed(32 DOWNTO 0);  -- sfix33_En20
  SIGNAL Subtract_sub_cast                : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL Subtract_sub_cast_1              : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL Subtract_out1                    : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL xxx                              : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL Add_out1                         : signed(33 DOWNTO 0);  -- sfix34_En20
  SIGNAL Data_Type_Conversion_out1        : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Delay5_reg                       : vector_of_signed25(0 TO 1);  -- sfix25 [2]
  SIGNAL Delay5_out1                      : signed(24 DOWNTO 0);  -- sfix25_En15
  SIGNAL Data_Type_Conversion1_out1       : signed(17 DOWNTO 0);  -- sfix18_En8
  SIGNAL Delay7_reg                       : vector_of_signed18(0 TO 1);  -- sfix18 [2]
  SIGNAL Delay7_out1                      : signed(17 DOWNTO 0);  -- sfix18_En8
  SIGNAL Product2_out1                    : signed(42 DOWNTO 0);  -- sfix43_En23
  SIGNAL Delay2_reg                       : vector_of_signed43(0 TO 1);  -- sfix43 [2]
  SIGNAL Delay2_out1                      : signed(42 DOWNTO 0);  -- sfix43_En23

BEGIN
  u_ShiftRegisterRAM : IEEE_8021513_RX_src_SimpleDualPortRAM_generic_block3
    GENERIC MAP( AddrWidth => 12,
                 DataWidth => 33
                 )
    PORT MAP( clk => clk,
              enb_1_2_0 => enb_1_2_0,
              wr_din => std_logic_vector(Delay_regin),
              wr_addr => std_logic_vector(Delay_waddr),
              wr_en => Delay_wrenb,  -- ufix1
              rd_addr => std_logic_vector(Delay_raddr),
              dout => Delay_regout
              );

  r_d_re_signed <= signed(r_d_re);

  Delay6_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay6_reg <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        Delay6_reg(0) <= r_d_re_signed;
        Delay6_reg(1) <= Delay6_reg(0);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1 <= Delay6_reg(1);

  Product1_out1 <= Delay6_out1 * Delay6_out1;

  Delay12_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb_1_2_0 = '1' THEN
        Delay12_reg(0) <= Product1_out1;
        Delay12_reg(1) <= Delay12_reg(0);
      END IF;
    END IF;
  END PROCESS Delay12_process;

  Delay12_out1 <= Delay12_reg(1);

  r_d_im_signed <= signed(r_d_im);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_reg <= (OTHERS => to_signed(16#0000#, 16));
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_reg(0) <= r_d_im_signed;
        Delay3_reg(1) <= Delay3_reg(0);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1 <= Delay3_reg(1);

  Product_out1 <= Delay3_out1 * Delay3_out1;

  Delay11_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb_1_2_0 = '1' THEN
        Delay11_reg(0) <= Product_out1;
        Delay11_reg(1) <= Delay11_reg(0);
      END IF;
    END IF;
  END PROCESS Delay11_process;

  Delay11_out1 <= Delay11_reg(1);

  Add1_add_cast <= resize(Delay12_out1, 33);
  Add1_add_cast_1 <= resize(Delay11_out1, 33);
  Add1_out1 <= Add1_add_cast + Add1_add_cast_1;

  Delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alphar_d_2L_2 <= to_signed(0, 33);
      ELSIF enb_1_2_0 = '1' THEN
        alphar_d_2L_2 <= Add1_out1;
      END IF;
    END IF;
  END PROCESS Delay4_process;


  Divide_by_2_out1 <= SHIFT_RIGHT(alphar_d_2L_2, 1);

  Delay8_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay8_out1 <= to_signed(0, 33);
      ELSIF enb_1_2_0 = '1' THEN
        Delay8_out1 <= Divide_by_2_out1;
      END IF;
    END IF;
  END PROCESS Delay8_process;


  -- Input register for RAM-based shift register Delay
  Delay_reginc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_regin <= to_signed(0, 33);
      ELSIF enb_1_2_0 = '1' THEN
        Delay_regin <= Delay8_out1;
      END IF;
    END IF;
  END PROCESS Delay_reginc_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 2557
  -- Write address counter for RAM-based shift register Delay
  Delay_wr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_waddr <= to_unsigned(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        IF Delay_waddr >= to_unsigned(16#9FD#, 12) THEN 
          Delay_waddr <= to_unsigned(16#000#, 12);
        ELSE 
          Delay_waddr <= Delay_waddr + to_unsigned(16#001#, 12);
        END IF;
      END IF;
    END IF;
  END PROCESS Delay_wr_process;


  Delay_wrenb <= '1';

  -- Count limited, Unsigned Counter
  --  initial value   = 1
  --  step value      = 1
  --  count to value  = 2557
  -- Read address counter for RAM-based shift register Delay
  Delay_rd_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_raddr <= to_unsigned(16#001#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        IF Delay_raddr >= to_unsigned(16#9FD#, 12) THEN 
          Delay_raddr <= to_unsigned(16#000#, 12);
        ELSE 
          Delay_raddr <= Delay_raddr + to_unsigned(16#001#, 12);
        END IF;
      END IF;
    END IF;
  END PROCESS Delay_rd_process;


  Delay_regout_signed <= signed(Delay_regout);

  -- Output register for RAM-based shift register Delay
  Delay_regoutc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alphar_d_2 <= to_signed(0, 33);
      ELSIF enb_1_2_0 = '1' THEN
        alphar_d_2 <= Delay_regout_signed;
      END IF;
    END IF;
  END PROCESS Delay_regoutc_process;


  Subtract_sub_cast <= resize(Delay8_out1, 34);
  Subtract_sub_cast_1 <= resize(alphar_d_2, 34);
  Subtract_out1 <= Subtract_sub_cast - Subtract_sub_cast_1;

  Add_out1 <= Subtract_out1 + xxx;

  Delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        xxx <= to_signed(0, 34);
      ELSIF enb_1_2_0 = '1' THEN
        xxx <= Add_out1;
      END IF;
    END IF;
  END PROCESS Delay1_process;


  Data_Type_Conversion_out1 <= xxx(29 DOWNTO 5);

  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_reg <= (OTHERS => to_signed(16#0000000#, 25));
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_reg(0) <= Data_Type_Conversion_out1;
        Delay5_reg(1) <= Delay5_reg(0);
      END IF;
    END IF;
  END PROCESS Delay5_process;

  Delay5_out1 <= Delay5_reg(1);

  Data_Type_Conversion1_out1 <= xxx(29 DOWNTO 12);

  Delay7_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay7_reg <= (OTHERS => to_signed(16#00000#, 18));
      ELSIF enb_1_2_0 = '1' THEN
        Delay7_reg(0) <= Data_Type_Conversion1_out1;
        Delay7_reg(1) <= Delay7_reg(0);
      END IF;
    END IF;
  END PROCESS Delay7_process;

  Delay7_out1 <= Delay7_reg(1);

  Product2_out1 <= Delay5_out1 * Delay7_out1;

  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_reg <= (OTHERS => to_signed(0, 43));
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_reg(0) <= Product2_out1;
        Delay2_reg(1) <= Delay2_reg(0);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(1);

  Rf2 <= std_logic_vector(Delay2_out1);

END rtl;

