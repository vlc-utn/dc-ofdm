// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_Addressable_Delay_Line_block8.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_Addressable_Delay_Line_block8
// Source Path: HDLTx/full_tx/full_ofdm_modulator/interpolator/FIR Interpolator/HDLTx/full_tx/full_ofdm_modulator/interpolator/FIR 
// Interpolator/FIRFilter1/Addressable_Delay_Lin
// Hierarchy Level: 5
// Model version: 4.114
// 
// Addressable Delay Line
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_Addressable_Delay_Line_block8
          (clk,
           reset_x,
           enb,
           dataIn,
           validIn,
           rdAddr,
           delayLineEnd,
           dataOut);


  input   clk;
  input   reset_x;
  input   enb;
  input   signed [15:0] dataIn;  // sfix16_En14
  input   validIn;
  input   rdAddr;  // ufix1
  output  signed [15:0] delayLineEnd;  // sfix16_En14
  output  signed [15:0] dataOut;  // sfix16_En14


  reg signed [15:0] delayedSignals0;  // sfix16_En14
  reg signed [15:0] delayedSignals1;  // sfix16_En14
  wire signed [15:0] switchDataOut;  // sfix16_En14
  reg signed [15:0] dataOut_1;  // sfix16_En14


  always @(posedge clk)
    begin : delay0_process
      if (reset_x == 1'b1) begin
        delayedSignals0 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals0 <= dataIn;
        end
      end
    end



  always @(posedge clk)
    begin : delay1_process
      if (reset_x == 1'b1) begin
        delayedSignals1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb && validIn) begin
          delayedSignals1 <= delayedSignals0;
        end
      end
    end



  assign delayLineEnd = delayedSignals1;

  assign switchDataOut = (rdAddr == 1'b0 ? delayedSignals1 :
              (rdAddr == 1'b1 ? delayedSignals0 :
              delayedSignals0));



  always @(posedge clk)
    begin : dataOutReg_process
      if (reset_x == 1'b1) begin
        dataOut_1 <= 16'sb0000000000000000;
      end
      else begin
        if (enb) begin
          dataOut_1 <= switchDataOut;
        end
      end
    end



  assign dataOut = dataOut_1;

endmodule  // tx_125_src_Addressable_Delay_Line_block8
