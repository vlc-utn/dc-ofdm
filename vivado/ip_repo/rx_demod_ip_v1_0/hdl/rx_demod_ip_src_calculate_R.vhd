-- -------------------------------------------------------------
-- 
-- File Name: hdl_prj/hdlsrc/HDLRxDemodulator/rx_demod_ip_src_calculate_R.vhd
-- Created: 2024-09-22 18:53:33
-- 
-- Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: rx_demod_ip_src_calculate_R
-- Source Path: HDLRxDemodulator/rx_demodulator_full/ofdm_symbol_sync/m_cox/calculate_R
-- Hierarchy Level: 3
-- Model version: 1.58
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.rx_demod_ip_src_rx_demodulator_full_pac.ALL;

ENTITY rx_demod_ip_src_calculate_R IS
  PORT( clk                               :   IN    std_logic;
        reset_x                           :   IN    std_logic;
        enb_1_2_0                         :   IN    std_logic;
        enb                               :   IN    std_logic;
        enb_1_2_1                         :   IN    std_logic;
        r_d_re                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        r_d_im                            :   IN    std_logic_vector(31 DOWNTO 0);  -- sfix32_En24
        Rf2                               :   OUT   std_logic_vector(31 DOWNTO 0)  -- sfix32_En24
        );
END rx_demod_ip_src_calculate_R;


ARCHITECTURE rtl OF rx_demod_ip_src_calculate_R IS

  -- Component Declarations
  COMPONENT rx_demod_ip_src_SimpleDualPortRAM_generic_block1
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
  FOR ALL : rx_demod_ip_src_SimpleDualPortRAM_generic_block1
    USE ENTITY work.rx_demod_ip_src_SimpleDualPortRAM_generic_block1(rtl);

  -- Signals
  SIGNAL r_d_re_signed                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL r_d_im_signed                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay6_reg                       : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay6_out1                      : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay6_out1_1                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL HwModeRegister2_reg              : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay6_out1_2                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL HwModeRegister3_reg              : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay6_out1_3                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Product1_mul_temp                : signed(63 DOWNTO 0);  -- sfix64_En48
  SIGNAL Product1_out1                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL crp_out_delay3_reg               : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Product1_out1_1                  : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay12_bypass_reg               : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Delay12_out1                     : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay12_out1_1                   : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay12_out1_2                   : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay3_reg                       : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay3_out1                      : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay3_out1_1                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL HwModeRegister4_reg              : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay3_out1_2                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL HwModeRegister5_reg              : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay3_out1_3                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Product_mul_temp                 : signed(63 DOWNTO 0);  -- sfix64_En48
  SIGNAL Product_out1                     : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL crp_out_delay4_reg               : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Product_out1_1                   : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay11_bypass_reg               : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Delay11_out1                     : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay11_out1_1                   : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay11_out1_2                   : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Add1_out1                        : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Add1_out1_1                      : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay4_bypass_reg                : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL alphar_d_2L_2                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL alphar_d_2L_2_1                  : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay_regin                      : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay_waddr                      : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Delay_wrenb                      : std_logic;  -- ufix1
  SIGNAL Delay_raddr                      : unsigned(11 DOWNTO 0);  -- ufix12
  SIGNAL Delay_regout                     : std_logic_vector(31 DOWNTO 0);  -- ufix32
  SIGNAL Delay_regout_signed              : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL alphar_d_2L_2_2                  : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL alphar_d_2                       : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL alphar_d_2_1                     : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Subtract_out1                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Subtract_out1_1                  : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay1_out1                      : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay1_out1_1                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay1_out1_2                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Add_out1                         : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Add_out1_1                       : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay1_bypass_reg                : signed(31 DOWNTO 0);  -- sfix32
  SIGNAL Delay1_out1_3                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay1_out1_4                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Divide_by_2_out1                 : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Divide_by_2_out1_1               : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Divide_by_2_out1_2               : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay5_out1                      : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay5_out1_1                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL HwModeRegister_reg               : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay5_out1_2                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL HwModeRegister1_reg              : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay5_out1_3                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Product2_mul_temp                : signed(63 DOWNTO 0);  -- sfix64_En48
  SIGNAL Product2_out1                    : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL crp_out_delay2_reg               : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Product2_out1_1                  : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Product2_out1_2                  : signed(31 DOWNTO 0);  -- sfix32_En24
  SIGNAL Delay2_reg                       : vector_of_signed32(0 TO 1);  -- sfix32 [2]
  SIGNAL Delay2_out1                      : signed(31 DOWNTO 0);  -- sfix32_En24

BEGIN
  u_ShiftRegisterRAM : rx_demod_ip_src_SimpleDualPortRAM_generic_block1
    GENERIC MAP( AddrWidth => 12,
                 DataWidth => 32
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
        Delay6_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb_1_2_0 = '1' THEN
        Delay6_reg(0) <= r_d_re_signed;
        Delay6_reg(1) <= Delay6_reg(0);
      END IF;
    END IF;
  END PROCESS Delay6_process;

  Delay6_out1 <= Delay6_reg(1);

  Delay6_out1_1 <= Delay6_out1;

  HwModeRegister2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister2_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        HwModeRegister2_reg(0) <= Delay6_out1_1;
        HwModeRegister2_reg(1) <= HwModeRegister2_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister2_process;

  Delay6_out1_2 <= HwModeRegister2_reg(1);

  HwModeRegister3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister3_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        HwModeRegister3_reg(0) <= Delay6_out1_1;
        HwModeRegister3_reg(1) <= HwModeRegister3_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister3_process;

  Delay6_out1_3 <= HwModeRegister3_reg(1);

  Product1_mul_temp <= Delay6_out1_2 * Delay6_out1_3;
  Product1_out1 <= Product1_mul_temp(55 DOWNTO 24);

  crp_out_delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        crp_out_delay3_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        crp_out_delay3_reg(0) <= Product1_out1;
        crp_out_delay3_reg(1) <= crp_out_delay3_reg(0);
      END IF;
    END IF;
  END PROCESS crp_out_delay3_process;

  Product1_out1_1 <= crp_out_delay3_reg(1);

  Delay12_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_bypass_reg <= to_signed(0, 32);
      ELSIF enb_1_2_1 = '1' THEN
        Delay12_bypass_reg <= Product1_out1_1;
      END IF;
    END IF;
  END PROCESS Delay12_bypass_process;

  
  Delay12_out1 <= Product1_out1_1 WHEN enb_1_2_1 = '1' ELSE
      Delay12_bypass_reg;

  Delay12_out1_1 <= Delay12_out1;

  rd_0_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay12_out1_2 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay12_out1_2 <= Delay12_out1_1;
      END IF;
    END IF;
  END PROCESS rd_0_process;


  r_d_im_signed <= signed(r_d_im);

  Delay3_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay3_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb_1_2_0 = '1' THEN
        Delay3_reg(0) <= r_d_im_signed;
        Delay3_reg(1) <= Delay3_reg(0);
      END IF;
    END IF;
  END PROCESS Delay3_process;

  Delay3_out1 <= Delay3_reg(1);

  Delay3_out1_1 <= Delay3_out1;

  HwModeRegister4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister4_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        HwModeRegister4_reg(0) <= Delay3_out1_1;
        HwModeRegister4_reg(1) <= HwModeRegister4_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister4_process;

  Delay3_out1_2 <= HwModeRegister4_reg(1);

  HwModeRegister5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister5_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        HwModeRegister5_reg(0) <= Delay3_out1_1;
        HwModeRegister5_reg(1) <= HwModeRegister5_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister5_process;

  Delay3_out1_3 <= HwModeRegister5_reg(1);

  Product_mul_temp <= Delay3_out1_2 * Delay3_out1_3;
  Product_out1 <= Product_mul_temp(55 DOWNTO 24);

  crp_out_delay4_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        crp_out_delay4_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        crp_out_delay4_reg(0) <= Product_out1;
        crp_out_delay4_reg(1) <= crp_out_delay4_reg(0);
      END IF;
    END IF;
  END PROCESS crp_out_delay4_process;

  Product_out1_1 <= crp_out_delay4_reg(1);

  Delay11_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_bypass_reg <= to_signed(0, 32);
      ELSIF enb_1_2_1 = '1' THEN
        Delay11_bypass_reg <= Product_out1_1;
      END IF;
    END IF;
  END PROCESS Delay11_bypass_process;

  
  Delay11_out1 <= Product_out1_1 WHEN enb_1_2_1 = '1' ELSE
      Delay11_bypass_reg;

  Delay11_out1_1 <= Delay11_out1;

  rd_1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay11_out1_2 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay11_out1_2 <= Delay11_out1_1;
      END IF;
    END IF;
  END PROCESS rd_1_process;


  Add1_out1 <= Delay12_out1_2 + Delay11_out1_2;

  crp_out_delay_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Add1_out1_1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Add1_out1_1 <= Add1_out1;
      END IF;
    END IF;
  END PROCESS crp_out_delay_process;


  Delay4_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay4_bypass_reg <= to_signed(0, 32);
      ELSIF enb_1_2_1 = '1' THEN
        Delay4_bypass_reg <= Add1_out1_1;
      END IF;
    END IF;
  END PROCESS Delay4_bypass_process;

  
  alphar_d_2L_2 <= Add1_out1_1 WHEN enb_1_2_1 = '1' ELSE
      Delay4_bypass_reg;

  alphar_d_2L_2_1 <= alphar_d_2L_2;

  -- Input register for RAM-based shift register Delay
  Delay_reginc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_regin <= to_signed(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        Delay_regin <= alphar_d_2L_2_1;
      END IF;
    END IF;
  END PROCESS Delay_reginc_process;


  -- Count limited, Unsigned Counter
  --  initial value   = 0
  --  step value      = 1
  --  count to value  = 2577
  -- Write address counter for RAM-based shift register Delay
  Delay_wr_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_waddr <= to_unsigned(16#000#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        IF Delay_waddr >= to_unsigned(16#A11#, 12) THEN 
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
  --  count to value  = 2577
  -- Read address counter for RAM-based shift register Delay
  Delay_rd_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay_raddr <= to_unsigned(16#001#, 12);
      ELSIF enb_1_2_0 = '1' THEN
        IF Delay_raddr >= to_unsigned(16#A11#, 12) THEN 
          Delay_raddr <= to_unsigned(16#000#, 12);
        ELSE 
          Delay_raddr <= Delay_raddr + to_unsigned(16#001#, 12);
        END IF;
      END IF;
    END IF;
  END PROCESS Delay_rd_process;


  Delay_regout_signed <= signed(Delay_regout);

  alphar_d_2L_2_2 <= alphar_d_2L_2;

  -- Output register for RAM-based shift register Delay
  Delay_regoutc_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        alphar_d_2 <= to_signed(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        alphar_d_2 <= Delay_regout_signed;
      END IF;
    END IF;
  END PROCESS Delay_regoutc_process;


  alphar_d_2_1 <= alphar_d_2;

  Subtract_out1 <= alphar_d_2L_2_2 - alphar_d_2_1;

  rd_04_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Subtract_out1_1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Subtract_out1_1 <= Subtract_out1;
      END IF;
    END IF;
  END PROCESS rd_04_process;


  Delay1_out1_1 <= Delay1_out1;

  rd_13_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_2 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay1_out1_2 <= Delay1_out1_1;
      END IF;
    END IF;
  END PROCESS rd_13_process;


  Add_out1 <= Subtract_out1_1 + Delay1_out1_2;

  crp_out_delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Add_out1_1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Add_out1_1 <= Add_out1;
      END IF;
    END IF;
  END PROCESS crp_out_delay5_process;


  Delay1_bypass_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_bypass_reg <= to_signed(0, 32);
      ELSIF enb_1_2_1 = '1' THEN
        Delay1_bypass_reg <= Add_out1_1;
      END IF;
    END IF;
  END PROCESS Delay1_bypass_process;

  
  Delay1_out1 <= Add_out1_1 WHEN enb_1_2_1 = '1' ELSE
      Delay1_bypass_reg;

  Delay1_out1_3 <= Delay1_out1;

  rd_01_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay1_out1_4 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Delay1_out1_4 <= Delay1_out1_3;
      END IF;
    END IF;
  END PROCESS rd_01_process;


  Divide_by_2_out1 <= SHIFT_RIGHT(Delay1_out1_4, 1);

  crp_out_delay1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Divide_by_2_out1_1 <= to_signed(0, 32);
      ELSIF enb = '1' THEN
        Divide_by_2_out1_1 <= Divide_by_2_out1;
      END IF;
    END IF;
  END PROCESS crp_out_delay1_process;


  Delay51_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Divide_by_2_out1_2 <= to_signed(0, 32);
      ELSIF enb_1_2_1 = '1' THEN
        Divide_by_2_out1_2 <= Divide_by_2_out1_1;
      END IF;
    END IF;
  END PROCESS Delay51_output_process;


  Delay5_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay5_out1 <= to_signed(0, 32);
      ELSIF enb_1_2_0 = '1' THEN
        Delay5_out1 <= Divide_by_2_out1_2;
      END IF;
    END IF;
  END PROCESS Delay5_process;


  Delay5_out1_1 <= Delay5_out1;

  HwModeRegister_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        HwModeRegister_reg(0) <= Delay5_out1_1;
        HwModeRegister_reg(1) <= HwModeRegister_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister_process;

  Delay5_out1_2 <= HwModeRegister_reg(1);

  HwModeRegister1_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        HwModeRegister1_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        HwModeRegister1_reg(0) <= Delay5_out1_1;
        HwModeRegister1_reg(1) <= HwModeRegister1_reg(0);
      END IF;
    END IF;
  END PROCESS HwModeRegister1_process;

  Delay5_out1_3 <= HwModeRegister1_reg(1);

  Product2_mul_temp <= Delay5_out1_2 * Delay5_out1_3;
  Product2_out1 <= Product2_mul_temp(55 DOWNTO 24);

  crp_out_delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        crp_out_delay2_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb = '1' THEN
        crp_out_delay2_reg(0) <= Product2_out1;
        crp_out_delay2_reg(1) <= crp_out_delay2_reg(0);
      END IF;
    END IF;
  END PROCESS crp_out_delay2_process;

  Product2_out1_1 <= crp_out_delay2_reg(1);

  Delay21_output_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Product2_out1_2 <= to_signed(0, 32);
      ELSIF enb_1_2_1 = '1' THEN
        Product2_out1_2 <= Product2_out1_1;
      END IF;
    END IF;
  END PROCESS Delay21_output_process;


  Delay2_process : PROCESS (clk)
  BEGIN
    IF clk'EVENT AND clk = '1' THEN
      IF reset_x = '1' THEN
        Delay2_reg <= (OTHERS => to_signed(0, 32));
      ELSIF enb_1_2_0 = '1' THEN
        Delay2_reg(0) <= Product2_out1_2;
        Delay2_reg(1) <= Delay2_reg(0);
      END IF;
    END IF;
  END PROCESS Delay2_process;

  Delay2_out1 <= Delay2_reg(1);

  Rf2 <= std_logic_vector(Delay2_out1);

END rtl;
