// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_DownSamplerMod.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_DownSamplerMod
// Source Path: 
// Hierarchy Level: 4
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_DownSamplerMod
          (clk,
           reset_x,
           enb_1_2_0,
           varargin_1_re,
           varargin_1_im,
           varargin_2,
           varargin_3,
           varargin_4,
           varargout_1_re,
           varargout_1_im,
           varargout_2,
           varargout_3,
           varargout_4);


  input   clk;
  input   reset_x;
  input   enb_1_2_0;
  input   signed [15:0] varargin_1_re;  // sfix16_En14
  input   signed [15:0] varargin_1_im;  // sfix16_En14
  input   varargin_2;
  input   [9:0] varargin_3;  // ufix10
  input   [9:0] varargin_4;  // ufix10
  output  signed [15:0] varargout_1_re;  // sfix16_En14
  output  signed [15:0] varargout_1_im;  // sfix16_En14
  output  varargout_2;
  output  [9:0] varargout_3;  // ufix10
  output  [9:0] varargout_4;  // ufix10


  wire obj_DownSamplerModObj_resetSig;
  reg  obj_DownSamplerModObj_resetSig_1;
  wire tmp;
  wire obj_DownSamplerModObj_validInReg;
  wire tmp_1;
  reg  obj_DownSamplerModObj_validInReg_1;
  wire obj_DownSamplerModObj_validInReg1;
  wire tmp_2;
  reg  obj_DownSamplerModObj_validInReg1_1;
  wire [8:0] obj_DownSamplerModObj_sampCount;  // ufix9
  wire [8:0] obj_DownSamplerModObj_sampCount_1;  // ufix9
  reg [8:0] obj_DownSamplerModObj_sampCount_2;  // ufix9
  wire [8:0] tmp_3;  // ufix9
  wire s;
  wire [9:0] p239_1;  // ufix10
  wire [8:0] tmp_4;  // ufix9
  wire [8:0] tmp_5;  // ufix9
  wire [8:0] tmp_6;  // ufix9
  wire s_1;
  wire [8:0] obj_DownSamplerModObj_FFTArr [0:7];  // ufix9 [8]
  wire [8:0] p200obj_DownSamplerModObj_FFTArr_1 [0:7];  // ufix9 [8]
  wire [8:0] obj_DownSamplerModObj_diffBits [0:7];  // ufix9 [8]
  wire [8:0] p201obj_DownSamplerModObj_diffBits_1 [0:7];  // ufix9 [8]
  wire [8:0] obj_DownSamplerModObj_FFTReg;  // ufix9
  wire [8:0] obj_DownSamplerModObj_count;  // ufix9
  reg [8:0] obj_DownSamplerModObj_count_1;  // ufix9
  reg [8:0] obj_DownSamplerModObj_count_2;  // ufix9
  wire [8:0] tmp_7;  // ufix9
  wire [7:0] k;  // uint8
  wire [8:0] p214k_cast;  // ufix9
  wire signed [9:0] p214k_1;  // sfix10
  wire signed [9:0] p214k_2;  // sfix10
  wire k_1;
  wire [8:0] tmp_8;  // ufix9
  wire [7:0] k_2;  // uint8
  wire k_3;
  wire [8:0] tmp_9;  // ufix9
  wire s_2;
  wire s_3;
  wire [8:0] y;  // ufix9
  wire [8:0] tmp_10;  // ufix9
  wire [8:0] y_1;  // ufix9
  wire [8:0] tmp_11;  // ufix9
  wire [8:0] tmp_12;  // ufix9
  wire [8:0] c;  // ufix9
  wire [8:0] tmp_13;  // ufix9
  wire [8:0] obj_DownSamplerModObj_upFac;  // ufix9
  reg [8:0] obj_DownSamplerModObj_upFac_1;  // ufix9
  wire [8:0] tmp_14;  // ufix9
  wire [8:0] tmp_15;  // ufix9
  wire s_4;
  wire s_5;
  wire [8:0] obj_DownSamplerModObj_upFacMinVec;  // ufix9
  wire s_6;
  wire [8:0] obj_DownSamplerModObj_upCount;  // ufix9
  wire [8:0] obj_DownSamplerModObj_upCount_1;  // ufix9
  wire [8:0] obj_DownSamplerModObj_upCount_2;  // ufix9
  wire [8:0] obj_DownSamplerModObj_upCount_3;  // ufix9
  reg [8:0] obj_DownSamplerModObj_upCount_4;  // ufix9
  wire [8:0] tmp_16;  // ufix9
  wire [8:0] tmp_17;  // ufix9
  wire s_7;
  wire [8:0] tmp_18;  // ufix9
  wire [8:0] tmp_19;  // ufix9
  wire [8:0] tmp_20;  // ufix9
  wire [8:0] tmp_21;  // ufix9
  wire s_8;
  wire signed [15:0] obj_DownSamplerModObj_dataReg_re;  // sfix16_En14
  wire signed [15:0] obj_DownSamplerModObj_dataReg_im;  // sfix16_En14
  wire signed [15:0] tmp_re;  // sfix16_En14
  wire signed [15:0] tmp_im;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_dataReg_re_1;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_dataReg_im_1;  // sfix16_En14
  wire signed [15:0] obj_DownSamplerModObj_dataInReg_re;  // sfix16_En14
  wire signed [15:0] obj_DownSamplerModObj_dataInReg_im;  // sfix16_En14
  wire signed [15:0] tmp_re_1;  // sfix16_En14
  wire signed [15:0] tmp_im_1;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_dataInReg_re_1;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_dataInReg_im_1;  // sfix16_En14
  wire signed [15:0] obj_DownSamplerModObj_buffer_re;  // sfix16_En14
  wire signed [15:0] obj_DownSamplerModObj_buffer_im;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_buffer_re_1;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_buffer_im_1;  // sfix16_En14
  wire signed [15:0] tmp_re_2;  // sfix16_En14
  wire signed [15:0] tmp_im_2;  // sfix16_En14
  wire signed [15:0] tmp_re_3;  // sfix16_En14
  wire signed [15:0] tmp_im_3;  // sfix16_En14
  wire signed [15:0] tmp_re_4;  // sfix16_En14
  wire signed [15:0] tmp_im_4;  // sfix16_En14
  wire signed [15:0] tmp_re_5;  // sfix16_En14
  wire signed [15:0] tmp_im_5;  // sfix16_En14
  wire signed [15:0] obj_DownSamplerModObj_dataOut_re;  // sfix16_En14
  wire signed [15:0] obj_DownSamplerModObj_dataOut_im;  // sfix16_En14
  wire signed [15:0] tmp_re_6;  // sfix16_En14
  wire signed [15:0] tmp_im_6;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_dataOut_re_1;  // sfix16_En14
  reg signed [15:0] obj_DownSamplerModObj_dataOut_im_1;  // sfix16_En14
  wire obj_DownSamplerModObj_validOutReg;
  wire obj_DownSamplerModObj_validOutReg_1;
  wire [8:0] obj_DownSamplerModObj_inCount;  // ufix9
  wire [8:0] obj_DownSamplerModObj_inCount_1;  // ufix9
  reg [8:0] obj_DownSamplerModObj_inCount_2;  // ufix9
  wire [8:0] tmp_22;  // ufix9
  wire s_9;
  wire [8:0] tmp_23;  // ufix9
  wire [8:0] tmp_24;  // ufix9
  wire [8:0] tmp_25;  // ufix9
  wire [8:0] tmp_26;  // ufix9
  wire [8:0] tmp_27;  // ufix9
  wire [9:0] p227_1;  // ufix10
  wire obj_DownSamplerModObj_validOutReg_2;
  wire obj_DownSamplerModObj_validOutReg_3;
  wire tmp_28;
  wire tmp_29;
  wire [8:0] obj_DownSamplerModObj_filledVecCnt;  // ufix9
  wire s_10;
  reg [8:0] obj_DownSamplerModObj_storedIdx;  // ufix9
  wire [8:0] tmp_30;  // ufix9
  reg [8:0] obj_DownSamplerModObj_filledVecCnt_1;  // ufix9
  wire [8:0] tmp_31;  // ufix9
  wire [8:0] tmp_32;  // ufix9
  wire [8:0] tmp_33;  // ufix9
  wire obj_DownSamplerModObj_validOutReg_4;
  wire obj_DownSamplerModObj_validOutReg_5;
  wire tmp_34;
  wire tmp_35;
  wire tmp_36;
  wire obj_DownSamplerModObj_validOutReg_6;
  wire tmp_37;
  reg  obj_DownSamplerModObj_validOutReg_7;
  wire obj_DownSamplerModObj_validOut;
  wire tmp_38;
  reg  obj_DownSamplerModObj_validOut_1;
  wire [8:0] obj_DownSamplerModObj_FFTReg_1;  // ufix9
  wire [8:0] tmp_39;  // ufix9
  reg [8:0] obj_DownSamplerModObj_FFTReg_2;  // ufix9
  wire [8:0] obj_DownSamplerModObj_FFTReg1;  // ufix9
  reg [8:0] obj_DownSamplerModObj_FFTReg1_1;  // ufix9
  wire [8:0] tmp_40;  // ufix9
  wire [8:0] tmp_41;  // ufix9
  wire [8:0] obj_DownSamplerModObj_outCount;  // ufix9
  wire [8:0] obj_DownSamplerModObj_outCount_1;  // ufix9
  reg [8:0] obj_DownSamplerModObj_outCount_2;  // ufix9
  wire [8:0] tmp_42;  // ufix9
  wire s_11;
  wire [8:0] tmp_43;  // ufix9
  wire [8:0] tmp_44;  // ufix9
  wire [8:0] tmp_45;  // ufix9
  wire s_12;
  wire [8:0] obj_DownSamplerModObj_FFTReg3;  // ufix9
  reg [8:0] obj_DownSamplerModObj_FFTReg3_1;  // ufix9
  wire [8:0] tmp_46;  // ufix9
  wire [8:0] tmp_47;  // ufix9
  wire [8:0] tmp_48;  // ufix9
  wire [9:0] obj_DownSamplerModObj_FFTLengthOut;  // ufix10
  wire [9:0] obj_DownSamplerModObj_FFTLengthOut_1;  // ufix10
  wire [9:0] tmp_49;  // ufix10
  reg [9:0] obj_DownSamplerModObj_FFTLengthOut_2;  // ufix10
  wire [9:0] obj_DownSamplerModObj_cpLen;  // ufix10
  wire [9:0] tmp_50;  // ufix10
  reg [9:0] obj_DownSamplerModObj_cpLen_1;  // ufix10
  wire [8:0] tmp_51;  // ufix9
  wire [8:0] obj_DownSamplerModObj_CPLenSampled;  // ufix9
  reg [8:0] obj_DownSamplerModObj_CPLenSampled_1;  // ufix9
  wire [8:0] tmp_52;  // ufix9
  wire [8:0] tmp_53;  // ufix9
  wire [8:0] obj_DownSamplerModObj_CPLenSampled2;  // ufix9
  reg [8:0] obj_DownSamplerModObj_CPLenSampled2_1;  // ufix9
  wire [8:0] tmp_54;  // ufix9
  wire [8:0] tmp_55;  // ufix9
  wire [8:0] tmp_56;  // ufix9
  wire [9:0] obj_DownSamplerModObj_CPLengthOut;  // ufix10
  wire [9:0] obj_DownSamplerModObj_CPLengthOut_1;  // ufix10
  wire [9:0] tmp_57;  // ufix10
  reg [9:0] obj_DownSamplerModObj_CPLengthOut_2;  // ufix10
  reg signed [31:0] p139_ind;  // int32
  reg [8:0] p139_obj_DownSamplerModObj_count;  // ufix9
  reg [8:0] p139_obj_DownSamplerModObj_count_0;  // ufix9


  assign obj_DownSamplerModObj_resetSig = 1'b0;



  assign tmp = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_resetSig_1 :
              obj_DownSamplerModObj_resetSig);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_resetSig_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_resetSig_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_resetSig_1 <= tmp;
        end
      end
    end



  assign obj_DownSamplerModObj_validInReg = 1'b0;



  assign tmp_1 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? varargin_2 :
              obj_DownSamplerModObj_validInReg);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_validInReg_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_validInReg_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_validInReg_1 <= tmp_1;
        end
      end
    end



  assign obj_DownSamplerModObj_validInReg1 = 1'b0;



  assign tmp_2 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_validInReg_1 :
              obj_DownSamplerModObj_validInReg1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_validInReg1_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_validInReg1_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_validInReg1_1 <= tmp_2;
        end
      end
    end



  assign obj_DownSamplerModObj_sampCount = 9'b000000000;



  assign obj_DownSamplerModObj_sampCount_1 = 9'b000000000;



  assign tmp_3 = obj_DownSamplerModObj_sampCount_2 + 9'b000000001;



  assign p239_1 = {1'b0, obj_DownSamplerModObj_sampCount_2};
  assign s = p239_1 == 10'b0011111111;



  assign tmp_4 = (s == 1'b0 ? tmp_3 :
              obj_DownSamplerModObj_sampCount);



  assign tmp_5 = (obj_DownSamplerModObj_validInReg_1 == 1'b0 ? obj_DownSamplerModObj_sampCount_2 :
              tmp_4);



  assign tmp_6 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_5 :
              obj_DownSamplerModObj_sampCount_1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_sampCount_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_sampCount_2 <= 9'b000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_sampCount_2 <= tmp_6;
        end
      end
    end



  assign s_1 = (obj_DownSamplerModObj_sampCount_2 == 9'b000000000) && obj_DownSamplerModObj_validInReg_1;



  assign p200obj_DownSamplerModObj_FFTArr_1[0] = 9'b000000010;
  assign p200obj_DownSamplerModObj_FFTArr_1[1] = 9'b000000100;
  assign p200obj_DownSamplerModObj_FFTArr_1[2] = 9'b000001000;
  assign p200obj_DownSamplerModObj_FFTArr_1[3] = 9'b000010000;
  assign p200obj_DownSamplerModObj_FFTArr_1[4] = 9'b000100000;
  assign p200obj_DownSamplerModObj_FFTArr_1[5] = 9'b001000000;
  assign p200obj_DownSamplerModObj_FFTArr_1[6] = 9'b010000000;
  assign p200obj_DownSamplerModObj_FFTArr_1[7] = 9'b100000000;

  genvar t_02;
  generate
    for(t_02 = 32'sd0; t_02 <= 32'sd7; t_02 = t_02 + 32'sd1) begin:obj_DownSamplerModObj_FFTArr_gen
      assign obj_DownSamplerModObj_FFTArr[t_02] = p200obj_DownSamplerModObj_FFTArr_1[t_02];
    end
  endgenerate




  assign p201obj_DownSamplerModObj_diffBits_1[0] = 9'b000000111;
  assign p201obj_DownSamplerModObj_diffBits_1[1] = 9'b000000110;
  assign p201obj_DownSamplerModObj_diffBits_1[2] = 9'b000000101;
  assign p201obj_DownSamplerModObj_diffBits_1[3] = 9'b000000100;
  assign p201obj_DownSamplerModObj_diffBits_1[4] = 9'b000000011;
  assign p201obj_DownSamplerModObj_diffBits_1[5] = 9'b000000010;
  assign p201obj_DownSamplerModObj_diffBits_1[6] = 9'b000000001;
  assign p201obj_DownSamplerModObj_diffBits_1[7] = 9'b000000000;

  genvar t_011;
  generate
    for(t_011 = 32'sd0; t_011 <= 32'sd7; t_011 = t_011 + 32'sd1) begin:obj_DownSamplerModObj_diffBits_gen
      assign obj_DownSamplerModObj_diffBits[t_011] = p201obj_DownSamplerModObj_diffBits_1[t_011];
    end
  endgenerate




  assign obj_DownSamplerModObj_FFTReg = varargin_3[8:0];



  assign obj_DownSamplerModObj_count = 9'b000000000;



  always @* begin
    p139_obj_DownSamplerModObj_count_0 = 9'b000000000;
    p139_obj_DownSamplerModObj_count = obj_DownSamplerModObj_count_1;

    for(p139_ind = 32'sd0; p139_ind <= 32'sd7; p139_ind = p139_ind + 32'sd1) begin
      if (obj_DownSamplerModObj_FFTArr[p139_ind] == obj_DownSamplerModObj_FFTReg) begin
        p139_obj_DownSamplerModObj_count_0 = obj_DownSamplerModObj_diffBits[p139_ind];
      end
      else begin
        p139_obj_DownSamplerModObj_count_0 = p139_obj_DownSamplerModObj_count;
      end
      p139_obj_DownSamplerModObj_count = p139_obj_DownSamplerModObj_count_0;
    end

    obj_DownSamplerModObj_count_2 = p139_obj_DownSamplerModObj_count;
  end



  assign tmp_7 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_count_2 :
              obj_DownSamplerModObj_count);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_count_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_count_1 <= 9'b000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_count_1 <= tmp_7;
        end
      end
    end



  assign p214k_1 = {1'b0, obj_DownSamplerModObj_count_1};
  assign p214k_2 =  - (p214k_1);
  assign p214k_cast = p214k_2[8:0];
  assign k = (p214k_cast[8] != 1'b0 ? 8'b11111111 :
              p214k_cast[7:0]);



  assign k_1 = k >= 8'd9;



  assign tmp_8 = 9'b000000001 >>> k;



  assign k_2 = (obj_DownSamplerModObj_count_1[8] != 1'b0 ? 8'b11111111 :
              obj_DownSamplerModObj_count_1[7:0]);



  assign k_3 = k_2 >= 8'd9;



  assign tmp_9 = 9'b000000001 <<< k_2;



  assign s_2 = obj_DownSamplerModObj_count_1 == 9'b000000000;



  assign s_3 = obj_DownSamplerModObj_count_1 > 9'b000000000;



  assign y = 9'b000000000;



  assign tmp_10 = (k_1 == 1'b0 ? tmp_8 :
              y);



  assign y_1 = 9'b000000000;



  assign tmp_11 = (k_3 == 1'b0 ? tmp_9 :
              y_1);



  assign tmp_12 = (s_3 == 1'b0 ? tmp_10 :
              tmp_11);



  assign c = 9'b000000001;



  assign tmp_13 = (s_2 == 1'b0 ? tmp_12 :
              c);



  assign obj_DownSamplerModObj_upFac = 9'b000000000;



  assign tmp_14 = (s_1 == 1'b0 ? obj_DownSamplerModObj_upFac_1 :
              tmp_13);



  assign tmp_15 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_14 :
              obj_DownSamplerModObj_upFac);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_upFac_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_upFac_1 <= 9'b000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_upFac_1 <= tmp_15;
        end
      end
    end



  assign s_4 = obj_DownSamplerModObj_upFac_1 < 9'b000000001;



  assign s_5 = obj_DownSamplerModObj_upFac_1 >= 9'b000000001;



  assign obj_DownSamplerModObj_upFacMinVec = obj_DownSamplerModObj_upFac_1 - 9'b000000001;



  assign s_6 = obj_DownSamplerModObj_upFac_1 == 9'b000000001;



  assign obj_DownSamplerModObj_upCount = 9'b000000000;



  assign obj_DownSamplerModObj_upCount_1 = 9'b000000000;



  assign obj_DownSamplerModObj_upCount_2 = 9'b000000000;



  assign obj_DownSamplerModObj_upCount_3 = 9'b000000000;



  assign tmp_16 = obj_DownSamplerModObj_upCount_4 + 9'b000000001;



  assign tmp_17 = (s_6 == 1'b0 ? tmp_16 :
              obj_DownSamplerModObj_upCount);



  assign s_7 = obj_DownSamplerModObj_upCount_4 == obj_DownSamplerModObj_upFacMinVec;



  assign tmp_18 = (s_7 == 1'b0 ? tmp_17 :
              obj_DownSamplerModObj_upCount_2);



  assign tmp_19 = (s_5 == 1'b0 ? obj_DownSamplerModObj_upCount_1 :
              tmp_18);



  assign tmp_20 = (obj_DownSamplerModObj_validInReg1_1 == 1'b0 ? obj_DownSamplerModObj_upCount_4 :
              tmp_19);



  assign tmp_21 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_20 :
              obj_DownSamplerModObj_upCount_3);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_upCount_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_upCount_4 <= 9'b000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_upCount_4 <= tmp_21;
        end
      end
    end



  assign s_8 = obj_DownSamplerModObj_upCount_4 == 9'b000000000;



  assign obj_DownSamplerModObj_dataReg_re = 16'sb0000000000000000;
  assign obj_DownSamplerModObj_dataReg_im = 16'sb0000000000000000;



  assign tmp_re = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? varargin_1_re :
              obj_DownSamplerModObj_dataReg_re);
  assign tmp_im = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? varargin_1_im :
              obj_DownSamplerModObj_dataReg_im);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_dataReg_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_dataReg_re_1 <= 16'sb0000000000000000;
        obj_DownSamplerModObj_dataReg_im_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_dataReg_re_1 <= tmp_re;
          obj_DownSamplerModObj_dataReg_im_1 <= tmp_im;
        end
      end
    end



  assign obj_DownSamplerModObj_dataInReg_re = 16'sb0000000000000000;
  assign obj_DownSamplerModObj_dataInReg_im = 16'sb0000000000000000;



  assign tmp_re_1 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_dataReg_re_1 :
              obj_DownSamplerModObj_dataInReg_re);
  assign tmp_im_1 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_dataReg_im_1 :
              obj_DownSamplerModObj_dataInReg_im);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_dataInReg_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_dataInReg_re_1 <= 16'sb0000000000000000;
        obj_DownSamplerModObj_dataInReg_im_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_dataInReg_re_1 <= tmp_re_1;
          obj_DownSamplerModObj_dataInReg_im_1 <= tmp_im_1;
        end
      end
    end



  assign obj_DownSamplerModObj_buffer_re = 16'sb0000000000000000;
  assign obj_DownSamplerModObj_buffer_im = 16'sb0000000000000000;



  assign tmp_re_2 = (s_8 == 1'b0 ? obj_DownSamplerModObj_buffer_re_1 :
              obj_DownSamplerModObj_dataInReg_re_1);
  assign tmp_im_2 = (s_8 == 1'b0 ? obj_DownSamplerModObj_buffer_im_1 :
              obj_DownSamplerModObj_dataInReg_im_1);



  assign tmp_re_3 = (s_4 == 1'b0 ? tmp_re_2 :
              obj_DownSamplerModObj_dataInReg_re_1);
  assign tmp_im_3 = (s_4 == 1'b0 ? tmp_im_2 :
              obj_DownSamplerModObj_dataInReg_im_1);



  assign tmp_re_4 = (obj_DownSamplerModObj_validInReg1_1 == 1'b0 ? obj_DownSamplerModObj_buffer_re_1 :
              tmp_re_3);
  assign tmp_im_4 = (obj_DownSamplerModObj_validInReg1_1 == 1'b0 ? obj_DownSamplerModObj_buffer_im_1 :
              tmp_im_3);



  assign tmp_re_5 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_re_4 :
              obj_DownSamplerModObj_buffer_re);
  assign tmp_im_5 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_im_4 :
              obj_DownSamplerModObj_buffer_im);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_buffer_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_buffer_re_1 <= 16'sb0000000000000000;
        obj_DownSamplerModObj_buffer_im_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_buffer_re_1 <= tmp_re_5;
          obj_DownSamplerModObj_buffer_im_1 <= tmp_im_5;
        end
      end
    end



  assign obj_DownSamplerModObj_dataOut_re = 16'sb0000000000000000;
  assign obj_DownSamplerModObj_dataOut_im = 16'sb0000000000000000;



  assign tmp_re_6 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_buffer_re_1 :
              obj_DownSamplerModObj_dataOut_re);
  assign tmp_im_6 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_buffer_im_1 :
              obj_DownSamplerModObj_dataOut_im);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_dataOut_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_dataOut_re_1 <= 16'sb0000000000000000;
        obj_DownSamplerModObj_dataOut_im_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_dataOut_re_1 <= tmp_re_6;
          obj_DownSamplerModObj_dataOut_im_1 <= tmp_im_6;
        end
      end
    end



  assign varargout_1_re = obj_DownSamplerModObj_dataOut_re_1;

  assign varargout_1_im = obj_DownSamplerModObj_dataOut_im_1;

  assign obj_DownSamplerModObj_validOutReg = 1'b0;



  assign obj_DownSamplerModObj_validOutReg_1 = 1'b0;



  assign obj_DownSamplerModObj_inCount = 9'b000000000;



  assign obj_DownSamplerModObj_inCount_1 = 9'b000000000;



  assign tmp_22 = obj_DownSamplerModObj_inCount_2 + 9'b000000001;



  assign tmp_23 = (s_9 == 1'b0 ? tmp_22 :
              obj_DownSamplerModObj_inCount);



  assign tmp_24 = (s_8 == 1'b0 ? obj_DownSamplerModObj_inCount_2 :
              tmp_23);



  assign tmp_25 = (s_4 == 1'b0 ? tmp_24 :
              obj_DownSamplerModObj_inCount_2);



  assign tmp_26 = (obj_DownSamplerModObj_validInReg1_1 == 1'b0 ? obj_DownSamplerModObj_inCount_2 :
              tmp_25);



  assign tmp_27 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_26 :
              obj_DownSamplerModObj_inCount_1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_inCount_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_inCount_2 <= 9'b000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_inCount_2 <= tmp_27;
        end
      end
    end



  assign p227_1 = {1'b0, obj_DownSamplerModObj_inCount_2};
  assign s_9 = p227_1 == 10'b0000000000;



  assign obj_DownSamplerModObj_validOutReg_2 = 1'b0;



  assign obj_DownSamplerModObj_validOutReg_3 = 1'b1;



  assign tmp_28 = (s_9 == 1'b0 ? obj_DownSamplerModObj_validOutReg_2 :
              obj_DownSamplerModObj_validOutReg_3);



  assign tmp_29 = (s_8 == 1'b0 ? obj_DownSamplerModObj_validOutReg_1 :
              tmp_28);



  assign obj_DownSamplerModObj_filledVecCnt = 9'b000000000;



  assign tmp_30 = (s_10 == 1'b0 ? obj_DownSamplerModObj_storedIdx :
              obj_DownSamplerModObj_filledVecCnt);



  assign tmp_31 = (s_4 == 1'b0 ? obj_DownSamplerModObj_filledVecCnt_1 :
              tmp_30);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_filledVecCnt_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_filledVecCnt_1 <= 9'b000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_filledVecCnt_1 <= tmp_32;
        end
      end
    end



  assign tmp_32 = (obj_DownSamplerModObj_validInReg1_1 == 1'b0 ? obj_DownSamplerModObj_filledVecCnt_1 :
              tmp_31);



  assign tmp_33 = tmp_32 + 9'b000000001;



  always @(posedge clk)
    begin : obj_DownSamplerModObj_storedIdx_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_storedIdx <= 9'b000000001;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_storedIdx <= tmp_33;
        end
      end
    end



  assign s_10 = obj_DownSamplerModObj_storedIdx == 9'b000000001;



  assign obj_DownSamplerModObj_validOutReg_4 = 1'b0;



  assign obj_DownSamplerModObj_validOutReg_5 = 1'b1;



  assign tmp_34 = (s_10 == 1'b0 ? obj_DownSamplerModObj_validOutReg_4 :
              obj_DownSamplerModObj_validOutReg_5);



  assign tmp_35 = (s_4 == 1'b0 ? tmp_29 :
              tmp_34);



  assign tmp_36 = (obj_DownSamplerModObj_validInReg1_1 == 1'b0 ? obj_DownSamplerModObj_validOutReg :
              tmp_35);



  assign obj_DownSamplerModObj_validOutReg_6 = 1'b0;



  assign tmp_37 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_36 :
              obj_DownSamplerModObj_validOutReg_6);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_validOutReg_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_validOutReg_7 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_validOutReg_7 <= tmp_37;
        end
      end
    end



  assign obj_DownSamplerModObj_validOut = 1'b0;



  assign tmp_38 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_validOutReg_7 :
              obj_DownSamplerModObj_validOut);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_validOut_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_validOut_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_validOut_1 <= tmp_38;
        end
      end
    end



  assign varargout_2 = obj_DownSamplerModObj_validOut_1;

  assign obj_DownSamplerModObj_FFTReg_1 = 9'b000010000;



  assign tmp_39 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_FFTReg :
              obj_DownSamplerModObj_FFTReg_1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_FFTReg_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_FFTReg_2 <= 9'b000010000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_FFTReg_2 <= tmp_39;
        end
      end
    end



  assign obj_DownSamplerModObj_FFTReg1 = 9'b000010000;



  assign tmp_40 = (s_1 == 1'b0 ? obj_DownSamplerModObj_FFTReg1_1 :
              obj_DownSamplerModObj_FFTReg_2);



  assign tmp_41 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_40 :
              obj_DownSamplerModObj_FFTReg1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_FFTReg1_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_FFTReg1_1 <= 9'b000010000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_FFTReg1_1 <= tmp_41;
        end
      end
    end



  assign obj_DownSamplerModObj_outCount = 9'b000000000;



  assign obj_DownSamplerModObj_outCount_1 = 9'b000000000;



  assign tmp_42 = obj_DownSamplerModObj_outCount_2 + 9'b000000001;



  assign s_11 = obj_DownSamplerModObj_outCount_2 == (obj_DownSamplerModObj_FFTReg1_1 - 9'b000000001);



  assign tmp_43 = (s_11 == 1'b0 ? tmp_42 :
              obj_DownSamplerModObj_outCount);



  assign tmp_44 = (tmp_36 == 1'b0 ? obj_DownSamplerModObj_outCount_2 :
              tmp_43);



  assign tmp_45 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_44 :
              obj_DownSamplerModObj_outCount_1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_outCount_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_outCount_2 <= 9'b000000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_outCount_2 <= tmp_45;
        end
      end
    end



  assign s_12 = obj_DownSamplerModObj_outCount_2 == 9'b000000000;



  assign obj_DownSamplerModObj_FFTReg3 = 9'b000010000;



  assign tmp_46 = (s_12 == 1'b0 ? obj_DownSamplerModObj_FFTReg3_1 :
              obj_DownSamplerModObj_FFTReg1_1);



  assign tmp_47 = (tmp_36 == 1'b0 ? obj_DownSamplerModObj_FFTReg3_1 :
              tmp_46);



  assign tmp_48 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_47 :
              obj_DownSamplerModObj_FFTReg3);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_FFTReg3_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_FFTReg3_1 <= 9'b000010000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_FFTReg3_1 <= tmp_48;
        end
      end
    end



  assign obj_DownSamplerModObj_FFTLengthOut = {1'b0, obj_DownSamplerModObj_FFTReg3_1};



  assign obj_DownSamplerModObj_FFTLengthOut_1 = 10'b0001000000;



  assign tmp_49 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_FFTLengthOut :
              obj_DownSamplerModObj_FFTLengthOut_1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_FFTLengthOut_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_FFTLengthOut_2 <= 10'b0001000000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_FFTLengthOut_2 <= tmp_49;
        end
      end
    end



  assign varargout_3 = obj_DownSamplerModObj_FFTLengthOut_2;

  assign obj_DownSamplerModObj_cpLen = 10'b0000000110;



  assign tmp_50 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? varargin_4 :
              obj_DownSamplerModObj_cpLen);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_cpLen_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_cpLen_1 <= 10'b0000000110;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_cpLen_1 <= tmp_50;
        end
      end
    end



  assign tmp_51 = obj_DownSamplerModObj_cpLen_1[8:0];



  assign obj_DownSamplerModObj_CPLenSampled = 9'b000001000;



  assign tmp_52 = (s_1 == 1'b0 ? obj_DownSamplerModObj_CPLenSampled_1 :
              tmp_51);



  assign tmp_53 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_52 :
              obj_DownSamplerModObj_CPLenSampled);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_CPLenSampled_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_CPLenSampled_1 <= 9'b000001000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_CPLenSampled_1 <= tmp_53;
        end
      end
    end



  assign obj_DownSamplerModObj_CPLenSampled2 = 9'b000001000;



  assign tmp_54 = (s_12 == 1'b0 ? obj_DownSamplerModObj_CPLenSampled2_1 :
              obj_DownSamplerModObj_CPLenSampled_1);



  assign tmp_55 = (tmp_36 == 1'b0 ? obj_DownSamplerModObj_CPLenSampled2_1 :
              tmp_54);



  assign tmp_56 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? tmp_55 :
              obj_DownSamplerModObj_CPLenSampled2);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_CPLenSampled2_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_CPLenSampled2_1 <= 9'b000001000;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_CPLenSampled2_1 <= tmp_56;
        end
      end
    end



  assign obj_DownSamplerModObj_CPLengthOut = {1'b0, obj_DownSamplerModObj_CPLenSampled2_1};



  assign obj_DownSamplerModObj_CPLengthOut_1 = 10'b0000000110;



  assign tmp_57 = (obj_DownSamplerModObj_resetSig_1 == 1'b0 ? obj_DownSamplerModObj_CPLengthOut :
              obj_DownSamplerModObj_CPLengthOut_1);



  always @(posedge clk)
    begin : obj_DownSamplerModObj_CPLengthOut_reg_process
      if (reset_x == 1'b1) begin
        obj_DownSamplerModObj_CPLengthOut_2 <= 10'b0000000110;
      end
      else begin
        if (enb_1_2_0) begin
          obj_DownSamplerModObj_CPLengthOut_2 <= tmp_57;
        end
      end
    end



  assign varargout_4 = obj_DownSamplerModObj_CPLengthOut_2;

endmodule  // tx_125_src_DownSamplerMod

