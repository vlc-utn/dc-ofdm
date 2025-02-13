// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125.v
// Created: 2024-09-14 22:22:59
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: -1
// Target subsystem base rate: -1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125
// Source Path: tx_125
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125
          (IPCORE_CLK,
           IPCORE_RESETN,
           new_frame_in,
           reg0,
           reg1,
           reg2,
           reg3,
           data_in,
           valid_in,
           last_frame,
           data_out,
           valid_out,
           ready);


  input   IPCORE_CLK;  // ufix1
  input   IPCORE_RESETN;  // ufix1
  input   new_frame_in;  // ufix1
  input   [31:0] reg0;  // ufix32
  input   [31:0] reg1;  // ufix32
  input   [31:0] reg2;  // ufix32
  input   [31:0] reg3;  // ufix32
  input   [7:0] data_in;  // ufix8
  input   valid_in;  // ufix1
  input   last_frame;  // ufix1
  output  [15:0] data_out;  // ufix16
  output  valid_out;  // ufix1
  output  ready;  // ufix1


  wire reset_x;
  wire dut_enable;  // ufix1
  wire reset_cm;  // ufix1
  wire ce_out_0_sig;  // ufix1
  wire ce_out_1_sig;  // ufix1
  wire signed [15:0] data_out_sig;  // sfix16_En12
  wire valid_out_sig;  // ufix1
  wire ready_sig;  // ufix1
  wire debug_payload_sig;  // ufix1
  wire debug_payload_ctrl_start_sig;  // ufix1
  wire debug_payload_ctrl_end_sig;  // ufix1
  wire debug_payload_ctrl_valid_sig;  // ufix1


  assign dut_enable = 1'b1;



  assign reset_cm =  ~ IPCORE_RESETN;



  tx_125_reset_sync u_tx_125_reset_sync_inst (.clk(IPCORE_CLK),  // ufix1
                                              .reset_in(reset_cm),  // ufix1
                                              .reset_out(reset_x)
                                              );

  tx_125_dut u_tx_125_dut_inst (.clk(IPCORE_CLK),  // ufix1
                                .reset_x(reset_x),
                                .dut_enable(dut_enable),  // ufix1
                                .new_frame_in(new_frame_in),  // ufix1
                                .reg0(reg0),  // ufix32
                                .reg1(reg1),  // ufix32
                                .reg2(reg2),  // ufix32
                                .reg3(reg3),  // ufix32
                                .data_in(data_in),  // ufix8
                                .valid_in(valid_in),  // ufix1
                                .last_frame(last_frame),  // ufix1
                                .ce_out_0(ce_out_0_sig),  // ufix1
                                .ce_out_1(ce_out_1_sig),  // ufix1
                                .data_out(data_out_sig),  // sfix16_En12
                                .valid_out(valid_out_sig),  // ufix1
                                .ready(ready_sig),  // ufix1
                                .debug_payload(debug_payload_sig),  // ufix1
                                .debug_payload_ctrl_start(debug_payload_ctrl_start_sig),  // ufix1
                                .debug_payload_ctrl_end(debug_payload_ctrl_end_sig),  // ufix1
                                .debug_payload_ctrl_valid(debug_payload_ctrl_valid_sig)  // ufix1
                                );

  assign data_out = data_out_sig;



  assign valid_out = valid_out_sig;

  assign ready = ready_sig;

endmodule  // tx_125

