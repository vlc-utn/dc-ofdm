--Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
--Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2024.1 (lin64) Build 5076996 Wed May 22 18:36:09 MDT 2024
--Date        : Thu Nov 21 10:17:57 2024
--Host        : cotti-machine running 64-bit Ubuntu 22.04.3 LTS
--Command     : generate_target tx_v10.bd
--Design      : tx_v10
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity tx_v10 is
  port (
    clk_dac : in STD_LOGIC;
    clk_tx : out STD_LOGIC;
    data_out_0 : out STD_LOGIC_VECTOR ( 15 downto 0 );
    new_frame_in_0 : in STD_LOGIC;
    new_msg_ready_0 : out STD_LOGIC;
    rst : in STD_LOGIC;
    s_axis_tdata_0 : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tready_0 : out STD_LOGIC;
    s_axis_tvalid_0 : in STD_LOGIC;
    valid_out_0 : out STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of tx_v10 : entity is "tx_v10,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=tx_v10,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=8,numReposBlks=8,numNonXlnxBlks=1,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=0,numPkgbdBlks=0,bdsource=USER,da_board_cnt=4,da_clkrst_cnt=1,synth_mode=Hierarchical}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of tx_v10 : entity is "tx_v10.hwdef";
end tx_v10;

architecture STRUCTURE of tx_v10 is
  component tx_v10_clk_wiz_0 is
  port (
    clk_in1 : in STD_LOGIC;
    clk_tx : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component tx_v10_clk_wiz_0;
  component tx_v10_rst_clk_wiz_100M_0 is
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
  end component tx_v10_rst_clk_wiz_100M_0;
  component tx_v10_axis_data_fifo_0_0 is
  port (
    s_axis_aresetn : in STD_LOGIC;
    s_axis_aclk : in STD_LOGIC;
    s_axis_tvalid : in STD_LOGIC;
    s_axis_tready : out STD_LOGIC;
    s_axis_tdata : in STD_LOGIC_VECTOR ( 7 downto 0 );
    s_axis_tlast : in STD_LOGIC;
    m_axis_tvalid : out STD_LOGIC;
    m_axis_tready : in STD_LOGIC;
    m_axis_tdata : out STD_LOGIC_VECTOR ( 7 downto 0 );
    m_axis_tlast : out STD_LOGIC
  );
  end component tx_v10_axis_data_fifo_0_0;
  component tx_v10_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component tx_v10_xlconstant_0_0;
  component tx_v10_reg0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component tx_v10_reg0_0;
  component tx_v10_reg1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component tx_v10_reg1_0;
  component tx_v10_reg1_1 is
  port (
    dout : out STD_LOGIC_VECTOR ( 31 downto 0 )
  );
  end component tx_v10_reg1_1;
  component tx_v10_IEEE_8021513_TX_0_1 is
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
    data_out : out STD_LOGIC_VECTOR ( 15 downto 0 );
    valid_out : out STD_LOGIC;
    new_msg_ready : out STD_LOGIC;
    ready : out STD_LOGIC
  );
  end component tx_v10_IEEE_8021513_TX_0_1;
  signal IEEE_8021513_TX_0_data_out : STD_LOGIC_VECTOR ( 15 downto 0 );
  signal IEEE_8021513_TX_0_new_msg_ready : STD_LOGIC;
  signal IEEE_8021513_TX_0_ready : STD_LOGIC;
  signal IEEE_8021513_TX_0_valid_out : STD_LOGIC;
  signal axis_data_fifo_0_m_axis_tdata : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal axis_data_fifo_0_m_axis_tvalid : STD_LOGIC;
  signal axis_data_fifo_0_s_axis_tready : STD_LOGIC;
  signal clk_100MHz_1 : STD_LOGIC;
  signal clk_wiz_clk_out1 : STD_LOGIC;
  signal clk_wiz_locked : STD_LOGIC;
  signal new_frame_in_0_1 : STD_LOGIC;
  signal reg0_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg1_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg2_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reg3_dout : STD_LOGIC_VECTOR ( 31 downto 0 );
  signal reset_rtl_1 : STD_LOGIC;
  signal rst_clk_wiz_100M_peripheral_aresetn : STD_LOGIC_VECTOR ( 0 to 0 );
  signal s_axis_tdata_0_1 : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal s_axis_tvalid_0_1 : STD_LOGIC;
  signal NLW_axis_data_fifo_0_m_axis_tlast_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_tx_mb_reset_UNCONNECTED : STD_LOGIC;
  signal NLW_rst_tx_bus_struct_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_tx_interconnect_aresetn_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_rst_tx_peripheral_reset_UNCONNECTED : STD_LOGIC_VECTOR ( 0 to 0 );
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_dac : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_DAC CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_dac : signal is "XIL_INTERFACENAME CLK.CLK_DAC, CLK_DOMAIN tx_v10_clk_100MHz, FREQ_HZ 125000000, FREQ_TOLERANCE_HZ 0, INSERT_VIP 0, PHASE 0.0";
  attribute X_INTERFACE_INFO of rst : signal is "xilinx.com:signal:reset:1.0 RST.RST RST";
  attribute X_INTERFACE_PARAMETER of rst : signal is "XIL_INTERFACENAME RST.RST, INSERT_VIP 0, POLARITY ACTIVE_LOW";
begin
  clk_100MHz_1 <= clk_dac;
  clk_tx <= clk_wiz_clk_out1;
  data_out_0(15 downto 0) <= IEEE_8021513_TX_0_data_out(15 downto 0);
  new_frame_in_0_1 <= new_frame_in_0;
  new_msg_ready_0 <= IEEE_8021513_TX_0_new_msg_ready;
  reset_rtl_1 <= rst;
  s_axis_tdata_0_1(7 downto 0) <= s_axis_tdata_0(7 downto 0);
  s_axis_tready_0 <= axis_data_fifo_0_s_axis_tready;
  s_axis_tvalid_0_1 <= s_axis_tvalid_0;
  valid_out_0 <= IEEE_8021513_TX_0_valid_out;
IEEE_8021513_TX_0: component tx_v10_IEEE_8021513_TX_0_1
     port map (
      IPCORE_CLK => clk_wiz_clk_out1,
      IPCORE_RESETN => rst_clk_wiz_100M_peripheral_aresetn(0),
      data_in(7 downto 0) => axis_data_fifo_0_m_axis_tdata(7 downto 0),
      data_out(15 downto 0) => IEEE_8021513_TX_0_data_out(15 downto 0),
      new_frame_in => new_frame_in_0_1,
      new_msg_ready => IEEE_8021513_TX_0_new_msg_ready,
      ready => IEEE_8021513_TX_0_ready,
      reg0(31 downto 0) => reg0_dout(31 downto 0),
      reg1(31 downto 0) => reg1_dout(31 downto 0),
      reg2(31 downto 0) => reg2_dout(31 downto 0),
      reg3(31 downto 0) => reg3_dout(31 downto 0),
      valid_in => axis_data_fifo_0_m_axis_tvalid,
      valid_out => IEEE_8021513_TX_0_valid_out
    );
axis_data_fifo_0: component tx_v10_axis_data_fifo_0_0
     port map (
      m_axis_tdata(7 downto 0) => axis_data_fifo_0_m_axis_tdata(7 downto 0),
      m_axis_tlast => NLW_axis_data_fifo_0_m_axis_tlast_UNCONNECTED,
      m_axis_tready => IEEE_8021513_TX_0_ready,
      m_axis_tvalid => axis_data_fifo_0_m_axis_tvalid,
      s_axis_aclk => clk_wiz_clk_out1,
      s_axis_aresetn => rst_clk_wiz_100M_peripheral_aresetn(0),
      s_axis_tdata(7 downto 0) => s_axis_tdata_0_1(7 downto 0),
      s_axis_tlast => '0',
      s_axis_tready => axis_data_fifo_0_s_axis_tready,
      s_axis_tvalid => s_axis_tvalid_0_1
    );
clk_wiz: component tx_v10_clk_wiz_0
     port map (
      clk_in1 => clk_100MHz_1,
      clk_tx => clk_wiz_clk_out1,
      locked => clk_wiz_locked
    );
reg0: component tx_v10_xlconstant_0_0
     port map (
      dout(31 downto 0) => reg0_dout(31 downto 0)
    );
reg1: component tx_v10_reg0_0
     port map (
      dout(31 downto 0) => reg1_dout(31 downto 0)
    );
reg2: component tx_v10_reg1_0
     port map (
      dout(31 downto 0) => reg2_dout(31 downto 0)
    );
reg3: component tx_v10_reg1_1
     port map (
      dout(31 downto 0) => reg3_dout(31 downto 0)
    );
rst_tx: component tx_v10_rst_clk_wiz_100M_0
     port map (
      aux_reset_in => '1',
      bus_struct_reset(0) => NLW_rst_tx_bus_struct_reset_UNCONNECTED(0),
      dcm_locked => clk_wiz_locked,
      ext_reset_in => reset_rtl_1,
      interconnect_aresetn(0) => NLW_rst_tx_interconnect_aresetn_UNCONNECTED(0),
      mb_debug_sys_rst => '0',
      mb_reset => NLW_rst_tx_mb_reset_UNCONNECTED,
      peripheral_aresetn(0) => rst_clk_wiz_100M_peripheral_aresetn(0),
      peripheral_reset(0) => NLW_rst_tx_peripheral_reset_UNCONNECTED(0),
      slowest_sync_clk => clk_wiz_clk_out1
    );
end STRUCTURE;
