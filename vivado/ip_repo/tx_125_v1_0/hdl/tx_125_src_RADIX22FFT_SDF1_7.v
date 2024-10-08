// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_RADIX22FFT_SDF1_7.v
// Created: 2024-09-14 22:22:21
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_RADIX22FFT_SDF1_7
// Source Path: HDLTx/full_tx/full_ofdm_modulator/ofdm_modulator/OFDM Modulator/dsphdl.IFFT/RADIX22FFT_SDF1_7
// Hierarchy Level: 5
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_RADIX22FFT_SDF1_7
          (clk,
           reset_x,
           enb_1_2_0,
           din_7_1_re_dly,
           din_7_1_im_dly,
           din_7_vld_dly,
           rd_7_Addr,
           rd_7_Enb,
           twdl_7_1_re,
           twdl_7_1_im,
           proc_7_enb,
           dout_7_1_re,
           dout_7_1_im,
           dout_7_1_vld,
           dinXTwdl_7_1_vld);


  input   clk;
  input   reset_x;
  input   enb_1_2_0;
  input   signed [15:0] din_7_1_re_dly;  // sfix16_En14
  input   signed [15:0] din_7_1_im_dly;  // sfix16_En14
  input   din_7_vld_dly;
  input   rd_7_Addr;  // ufix1
  input   rd_7_Enb;
  input   signed [15:0] twdl_7_1_re;  // sfix16_En14
  input   signed [15:0] twdl_7_1_im;  // sfix16_En14
  input   proc_7_enb;
  output  signed [15:0] dout_7_1_re;  // sfix16_En14
  output  signed [15:0] dout_7_1_im;  // sfix16_En14
  output  dout_7_1_vld;
  output  dinXTwdl_7_1_vld;


  wire signed [15:0] dinXTwdl_re;  // sfix16_En14
  wire signed [15:0] dinXTwdl_im;  // sfix16_En14
  reg  x_vld;
  wire signed [15:0] wrData_re;  // sfix16_En14
  wire signed [15:0] wrData_im;  // sfix16_En14
  wire wrAddr;  // ufix1
  wire wrEnb;
  reg signed [15:0] twoLocationReg_0_MEM_re_0;  // sfix16
  reg signed [15:0] twoLocationReg_0_MEM_im_0;  // sfix16
  reg signed [15:0] twoLocationReg_0_MEM_re_1;  // sfix16
  reg signed [15:0] twoLocationReg_0_MEM_im_1;  // sfix16
  reg signed [15:0] twoLocationReg_0_dout_re_reg;  // sfix16
  reg signed [15:0] twoLocationReg_0_dout_im_reg;  // sfix16
  reg signed [15:0] twoLocationReg_0_MEM_re_0_next;  // sfix16_En14
  reg signed [15:0] twoLocationReg_0_MEM_im_0_next;  // sfix16_En14
  reg signed [15:0] twoLocationReg_0_MEM_re_1_next;  // sfix16_En14
  reg signed [15:0] twoLocationReg_0_MEM_im_1_next;  // sfix16_En14
  reg signed [15:0] twoLocationReg_0_dout_re_reg_next;  // sfix16_En14
  reg signed [15:0] twoLocationReg_0_dout_im_reg_next;  // sfix16_En14
  reg signed [15:0] x_re;  // sfix16_En14
  reg signed [15:0] x_im;  // sfix16_En14
  reg signed [16:0] Radix22ButterflyG1_btf1_re_reg;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_btf1_im_reg;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_btf2_re_reg;  // sfix17
  reg signed [16:0] Radix22ButterflyG1_btf2_im_reg;  // sfix17
  reg signed [15:0] Radix22ButterflyG1_x_re_dly1;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_x_im_dly1;  // sfix16
  reg  Radix22ButterflyG1_x_vld_dly1;
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_re_dly1;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_im_dly1;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_re_dly2;  // sfix16
  reg signed [15:0] Radix22ButterflyG1_dinXtwdl_im_dly2;  // sfix16
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly1;
  reg  Radix22ButterflyG1_dinXtwdl_vld_dly2;
  wire signed [16:0] Radix22ButterflyG1_btf1_re_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_btf1_im_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_btf2_re_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_btf2_im_reg_next;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast_1;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast_1;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast_2;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_add_cast_3;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast_2;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sub_cast_3;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp_1;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp_2;  // sfix17_En14
  wire signed [16:0] Radix22ButterflyG1_sra_temp_3;  // sfix17_En14
  reg signed [15:0] xf_re;  // sfix16_En14
  reg signed [15:0] xf_im;  // sfix16_En14
  reg  xf_vld;
  wire signed [15:0] dinXTwdlf_re;  // sfix16_En14
  wire signed [15:0] dinXTwdlf_im;  // sfix16_En14
  wire dinxTwdlf_vld;
  wire signed [15:0] btf1_re;  // sfix16_En14
  wire signed [15:0] btf1_im;  // sfix16_En14
  wire signed [15:0] btf2_re;  // sfix16_En14
  wire signed [15:0] btf2_im;  // sfix16_En14
  reg  btf_vld;


  tx_125_src_Complex4Multiply_block1 u_MUL4 (.clk(clk),
                                             .reset_x(reset_x),
                                             .enb_1_2_0(enb_1_2_0),
                                             .din_7_1_re_dly(din_7_1_re_dly),  // sfix16_En14
                                             .din_7_1_im_dly(din_7_1_im_dly),  // sfix16_En14
                                             .din_7_vld_dly(din_7_vld_dly),
                                             .twdl_7_1_re(twdl_7_1_re),  // sfix16_En14
                                             .twdl_7_1_im(twdl_7_1_im),  // sfix16_En14
                                             .dinXTwdl_re(dinXTwdl_re),  // sfix16_En14
                                             .dinXTwdl_im(dinXTwdl_im),  // sfix16_En14
                                             .dinXTwdl_7_1_vld(dinXTwdl_7_1_vld)
                                             );

  always @(posedge clk)
    begin : intdelay_process
      if (reset_x == 1'b1) begin
        x_vld <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          x_vld <= rd_7_Enb;
        end
      end
    end



  // twoLocationReg_0
  always @(posedge clk)
    begin : twoLocationReg_0_process
      if (reset_x == 1'b1) begin
        twoLocationReg_0_MEM_re_0 <= 16'sb0000000000000000;
        twoLocationReg_0_MEM_im_0 <= 16'sb0000000000000000;
        twoLocationReg_0_MEM_re_1 <= 16'sb0000000000000000;
        twoLocationReg_0_MEM_im_1 <= 16'sb0000000000000000;
        twoLocationReg_0_dout_re_reg <= 16'sb0000000000000000;
        twoLocationReg_0_dout_im_reg <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          twoLocationReg_0_MEM_re_0 <= twoLocationReg_0_MEM_re_0_next;
          twoLocationReg_0_MEM_im_0 <= twoLocationReg_0_MEM_im_0_next;
          twoLocationReg_0_MEM_re_1 <= twoLocationReg_0_MEM_re_1_next;
          twoLocationReg_0_MEM_im_1 <= twoLocationReg_0_MEM_im_1_next;
          twoLocationReg_0_dout_re_reg <= twoLocationReg_0_dout_re_reg_next;
          twoLocationReg_0_dout_im_reg <= twoLocationReg_0_dout_im_reg_next;
        end
      end
    end

  always @(rd_7_Addr, twoLocationReg_0_MEM_im_0, twoLocationReg_0_MEM_im_1,
       twoLocationReg_0_MEM_re_0, twoLocationReg_0_MEM_re_1,
       twoLocationReg_0_dout_im_reg, twoLocationReg_0_dout_re_reg, wrAddr,
       wrData_im, wrData_re, wrEnb) begin
    twoLocationReg_0_MEM_re_0_next = twoLocationReg_0_MEM_re_0;
    twoLocationReg_0_MEM_im_0_next = twoLocationReg_0_MEM_im_0;
    twoLocationReg_0_MEM_re_1_next = twoLocationReg_0_MEM_re_1;
    twoLocationReg_0_MEM_im_1_next = twoLocationReg_0_MEM_im_1;
    if (rd_7_Addr == 1'b1) begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_1;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_1;
    end
    else begin
      twoLocationReg_0_dout_re_reg_next = twoLocationReg_0_MEM_re_0;
      twoLocationReg_0_dout_im_reg_next = twoLocationReg_0_MEM_im_0;
    end
    if (wrEnb) begin
      if (wrAddr == 1'b1) begin
        twoLocationReg_0_MEM_re_1_next = wrData_re;
        twoLocationReg_0_MEM_im_1_next = wrData_im;
      end
      else begin
        twoLocationReg_0_MEM_re_0_next = wrData_re;
        twoLocationReg_0_MEM_im_0_next = wrData_im;
      end
    end
    x_re = twoLocationReg_0_dout_re_reg;
    x_im = twoLocationReg_0_dout_im_reg;
  end



  // Radix22ButterflyG1
  always @(posedge clk)
    begin : Radix22ButterflyG1_process
      if (reset_x == 1'b1) begin
        Radix22ButterflyG1_btf1_re_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_btf1_im_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_btf2_re_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_btf2_im_reg <= 17'sb00000000000000000;
        Radix22ButterflyG1_x_re_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_x_im_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_x_vld_dly1 <= 1'b0;
        xf_re <= 16'sb0000000000000000;
        xf_im <= 16'sb0000000000000000;
        xf_vld <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_re_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly1 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_re_dly2 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_im_dly2 <= 16'sb0000000000000000;
        Radix22ButterflyG1_dinXtwdl_vld_dly1 <= 1'b0;
        Radix22ButterflyG1_dinXtwdl_vld_dly2 <= 1'b0;
        btf_vld <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          Radix22ButterflyG1_btf1_re_reg <= Radix22ButterflyG1_btf1_re_reg_next;
          Radix22ButterflyG1_btf1_im_reg <= Radix22ButterflyG1_btf1_im_reg_next;
          Radix22ButterflyG1_btf2_re_reg <= Radix22ButterflyG1_btf2_re_reg_next;
          Radix22ButterflyG1_btf2_im_reg <= Radix22ButterflyG1_btf2_im_reg_next;
          xf_re <= Radix22ButterflyG1_x_re_dly1;
          xf_im <= Radix22ButterflyG1_x_im_dly1;
          xf_vld <= Radix22ButterflyG1_x_vld_dly1;
          btf_vld <= Radix22ButterflyG1_dinXtwdl_vld_dly2;
          Radix22ButterflyG1_dinXtwdl_vld_dly2 <= Radix22ButterflyG1_dinXtwdl_vld_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly2 <= Radix22ButterflyG1_dinXtwdl_re_dly1;
          Radix22ButterflyG1_dinXtwdl_im_dly2 <= Radix22ButterflyG1_dinXtwdl_im_dly1;
          Radix22ButterflyG1_dinXtwdl_re_dly1 <= dinXTwdl_re;
          Radix22ButterflyG1_dinXtwdl_im_dly1 <= dinXTwdl_im;
          Radix22ButterflyG1_x_re_dly1 <= x_re;
          Radix22ButterflyG1_x_im_dly1 <= x_im;
          Radix22ButterflyG1_x_vld_dly1 <= x_vld;
          Radix22ButterflyG1_dinXtwdl_vld_dly1 <= proc_7_enb && dinXTwdl_7_1_vld;
        end
      end
    end

  assign dinxTwdlf_vld = ( ! proc_7_enb) && dinXTwdl_7_1_vld;
  assign Radix22ButterflyG1_add_cast = {Radix22ButterflyG1_x_re_dly1[15], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_add_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[15], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf1_re_reg_next = Radix22ButterflyG1_add_cast + Radix22ButterflyG1_add_cast_1;
  assign Radix22ButterflyG1_sub_cast = {Radix22ButterflyG1_x_re_dly1[15], Radix22ButterflyG1_x_re_dly1};
  assign Radix22ButterflyG1_sub_cast_1 = {Radix22ButterflyG1_dinXtwdl_re_dly2[15], Radix22ButterflyG1_dinXtwdl_re_dly2};
  assign Radix22ButterflyG1_btf2_re_reg_next = Radix22ButterflyG1_sub_cast - Radix22ButterflyG1_sub_cast_1;
  assign Radix22ButterflyG1_add_cast_2 = {Radix22ButterflyG1_x_im_dly1[15], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_add_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[15], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf1_im_reg_next = Radix22ButterflyG1_add_cast_2 + Radix22ButterflyG1_add_cast_3;
  assign Radix22ButterflyG1_sub_cast_2 = {Radix22ButterflyG1_x_im_dly1[15], Radix22ButterflyG1_x_im_dly1};
  assign Radix22ButterflyG1_sub_cast_3 = {Radix22ButterflyG1_dinXtwdl_im_dly2[15], Radix22ButterflyG1_dinXtwdl_im_dly2};
  assign Radix22ButterflyG1_btf2_im_reg_next = Radix22ButterflyG1_sub_cast_2 - Radix22ButterflyG1_sub_cast_3;
  assign dinXTwdlf_re = dinXTwdl_re;
  assign dinXTwdlf_im = dinXTwdl_im;
  assign Radix22ButterflyG1_sra_temp = Radix22ButterflyG1_btf1_re_reg >>> 8'd1;
  assign btf1_re = Radix22ButterflyG1_sra_temp[15:0];
  assign Radix22ButterflyG1_sra_temp_1 = Radix22ButterflyG1_btf1_im_reg >>> 8'd1;
  assign btf1_im = Radix22ButterflyG1_sra_temp_1[15:0];
  assign Radix22ButterflyG1_sra_temp_2 = Radix22ButterflyG1_btf2_re_reg >>> 8'd1;
  assign btf2_re = Radix22ButterflyG1_sra_temp_2[15:0];
  assign Radix22ButterflyG1_sra_temp_3 = Radix22ButterflyG1_btf2_im_reg >>> 8'd1;
  assign btf2_im = Radix22ButterflyG1_sra_temp_3[15:0];



  tx_125_src_SDFCommutator7 u_SDFCOMMUTATOR_7 (.clk(clk),
                                               .reset_x(reset_x),
                                               .enb_1_2_0(enb_1_2_0),
                                               .din_7_vld_dly(din_7_vld_dly),
                                               .xf_re(xf_re),  // sfix16_En14
                                               .xf_im(xf_im),  // sfix16_En14
                                               .xf_vld(xf_vld),
                                               .dinXTwdlf_re(dinXTwdlf_re),  // sfix16_En14
                                               .dinXTwdlf_im(dinXTwdlf_im),  // sfix16_En14
                                               .dinxTwdlf_vld(dinxTwdlf_vld),
                                               .btf1_re(btf1_re),  // sfix16_En14
                                               .btf1_im(btf1_im),  // sfix16_En14
                                               .btf2_re(btf2_re),  // sfix16_En14
                                               .btf2_im(btf2_im),  // sfix16_En14
                                               .btf_vld(btf_vld),
                                               .wrData_re(wrData_re),  // sfix16_En14
                                               .wrData_im(wrData_im),  // sfix16_En14
                                               .wrAddr(wrAddr),  // ufix1
                                               .wrEnb(wrEnb),
                                               .dout_7_1_re(dout_7_1_re),  // sfix16_En14
                                               .dout_7_1_im(dout_7_1_im),  // sfix16_En14
                                               .dout_7_1_vld(dout_7_1_vld)
                                               );

endmodule  // tx_125_src_RADIX22FFT_SDF1_7

