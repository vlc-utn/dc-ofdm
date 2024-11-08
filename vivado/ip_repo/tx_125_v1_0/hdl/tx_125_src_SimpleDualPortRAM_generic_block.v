// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_SimpleDualPortRAM_generic_block.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_SimpleDualPortRAM_generic_block
// Source Path: SimpleDualPortRAM_generic
// Hierarchy Level: 5
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_SimpleDualPortRAM_generic_block
          (clk,
           enb_1_2_0,
           wr_din_re,
           wr_din_im,
           wr_addr,
           wr_en,
           rd_addr,
           dout_re,
           dout_im);

  parameter integer AddrWidth  = 1;
  parameter integer DataWidth  = 1;

  input   clk;
  input   enb_1_2_0;
  input   signed [DataWidth - 1:0] wr_din_re;  // parameterized width
  input   signed [DataWidth - 1:0] wr_din_im;  // parameterized width
  input   [AddrWidth - 1:0] wr_addr;  // parameterized width
  input   wr_en;  // ufix1
  input   [AddrWidth - 1:0] rd_addr;  // parameterized width
  output  signed [DataWidth - 1:0] dout_re;  // parameterized width
  output  signed [DataWidth - 1:0] dout_im;  // parameterized width


  reg  [DataWidth*2 - 1:0] ram [2**AddrWidth - 1:0];
  reg  [DataWidth*2 - 1:0] data_int;
  integer i;

  initial begin
    for (i=0; i<=2**AddrWidth - 1; i=i+1) begin
      ram[i] = 0;
    end
    data_int = 0;
  end


  always @(posedge clk)
    begin : SimpleDualPortRAM_generic_process
      if (enb_1_2_0 == 1'b1) begin
        if (wr_en == 1'b1) begin
          ram[wr_addr] <= {wr_din_re, wr_din_im};
        end
        data_int <= ram[rd_addr];
      end
    end

  assign dout_re = data_int[DataWidth*2-1:DataWidth];
  assign dout_im = data_int[DataWidth-1:0];

endmodule  // tx_125_src_SimpleDualPortRAM_generic_block

