--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2023.2 (lin64) Build 4029153 Fri Oct 13 20:13:54 MDT 2023
--Date        : Sat Sep 14 22:27:08 2024
--Host        : cotti-machine running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target tx_125.bd
--Design      : tx_125
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tx_125 is
  port (
    clk_100MHz : in STD_LOGIC;
    data_in_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    data_out_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    last_frame_0 : in STD_LOGIC;
    new_frame_in_0 : in STD_LOGIC;
    ready_0 : out STD_LOGIC;
    reg0_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg1_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg2_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg3_0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reset_rtl : in STD_LOGIC;
    valid_in_0 : in STD_LOGIC;
    valid_out_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of tx_125 : entity is "tx_125,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=tx_125,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=3,numReposBlks=3,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=3,da_clkrst_cnt=2,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of tx_125 : entity is "tx_125.hwdef";
end tx_125;

architecture STRUCTURE of tx_125 is
  component tx_125_clk_wiz_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component tx_125_clk_wiz_0;
  component tx_125_rst_clk_wiz_100M_0 is
  port (
    slowest_sync_clk : in STD_LOGIC;
    ext_reset_in : in STD_LOGIC;
    aux_reset_in : in STD_LOGIC;
    mb_debug_sys_rst : in STD_LOGIC;
    dcm_locked : in STD_LOGIC;
    mb_reset : out STD_LOGIC;
    bus_struct_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_reset : out STD_LOGIC_VECTOR ( 0 to 0 );
    interconnect_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 );
    peripheral_aresetn : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component tx_125_rst_clk_wiz_100M_0;
  component tx_125_tx_125_0_1 is
  port (
    IPCORE_CLK : in STD_LOGIC;
    IPCORE_RESETN : in STD_LOGIC;
    new_frame_in : in STD_LOGIC;
    reg0 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg1 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg2 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    reg3 : in STD_LOGIC_VECTOR ( 31 downto 0 );
    data_in : in STD_LOGIC_VECTOR ( 7 downto 0 );
    valid_in : in STD_LOGIC;
    last_frame : in STD_LOGIC;
    data_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    valid_out : out STD_LOGIC;
    ready : out STD_LOGIC
  );
  end component tx_125_tx_125_0_1;
  signal clk_100MHz_1 : STD_LOGIC;
  signal clk_wiz_clk_out1 : STD_LOGIC;
  signal clk_wiz_locked : STD_LOGIC;
  signal data_in_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal last_frame_0_1 : STD_LOGIC;
  signal new_frame_in_0_1 : STD_LOGIC;
  signal reg0_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg1_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg2_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg3_0_1 : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reset_rtl_1 : STD_LOGIC;
  signal rst_clk_wiz_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal tx_125_0_data_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal tx_125_0_ready : STD_LOGIC;
  signal tx_125_0_valid_out : STD_LOGIC;
  signal valid_in_0_1 : STD_LOGIC;
  signal NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_100MHz : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_100MHZ CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_100MHz : signal is "XIL_INTERFACENAME CLK.CLK_100MHZ, CLK_DOMAIN tx_125_clk_100MHz, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of reset_rtl : signal is "xilinx.com:signal:reset:1.0 RST.RESET_RTL RST";
  attribute X_INTERFACE_PARAMETER of reset_rtl : signal is "XIL_INTERFACENAME RST.RESET_RTL, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
begin
  clk_100MHz_1 <= clk_100MHz;
  data_in_0_1(7 downto 0) <= data_in_0(7 downto 0);
  data_out_0(15 downto 0) <= tx_125_0_data_out(15 downto 0);
  last_frame_0_1 <= last_frame_0;
  new_frame_in_0_1 <= new_frame_in_0;
  ready_0 <= tx_125_0_ready;
  reg0_0_1(31 downto 0) <= reg0_0(31 downto 0);
  reg1_0_1(31 downto 0) <= reg1_0(31 downto 0);
  reg2_0_1(31 downto 0) <= reg2_0(31 downto 0);
  reg3_0_1(31 downto 0) <= reg3_0(31 downto 0);
  reset_rtl_1 <= reset_rtl;
  valid_in_0_1 <= valid_in_0;
  valid_out_0 <= tx_125_0_valid_out;
clk_wiz: component tx_125_clk_wiz_0
     port map (
      clk_in1 => clk_100MHz_1,
      clk_out1 => clk_wiz_clk_out1,
      locked => clk_wiz_locked,
      reset => reset_rtl_1
    );
rst_clk_wiz_100M: component tx_125_rst_clk_wiz_100M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_clk_wiz_100M_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_locked,
      ext_reset_in => reset_rtl_1,
      interconnect_aresetn(0) => NLW_rst_clk_wiz_100M_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_clk_wiz_100M_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_clk_wiz_100M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_clk_wiz_100M_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_clk_out1
    );
tx_125_0: component tx_125_tx_125_0_1
     port map (
      IPCORE_CLK => clk_wiz_clk_out1,
      IPCORE_RESETN => rst_clk_wiz_100M_peripheral_aresetn(0),
      data_in(7 downto 0) => data_in_0_1(7 downto 0),
      data_out(15 downto 0) => tx_125_0_data_out(15 downto 0),
      last_frame => last_frame_0_1,
      new_frame_in => new_frame_in_0_1,
      ready => tx_125_0_ready,
      reg0(31 downto 0) => reg0_0_1(31 downto 0),
      reg1(31 downto 0) => reg1_0_1(31 downto 0),
      reg2(31 downto 0) => reg2_0_1(31 downto 0),
      reg3(31 downto 0) => reg3_0_1(31 downto 0),
      valid_in => valid_in_0_1,
      valid_out => tx_125_0_valid_out
    );
end STRUCTURE;