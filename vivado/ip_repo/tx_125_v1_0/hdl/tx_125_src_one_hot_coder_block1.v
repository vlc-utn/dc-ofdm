// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_one_hot_coder_block1.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_one_hot_coder_block1
// Source Path: HDLTx/full_tx/store_frame_in_ram/read_frame_from_ram/init_selector/one_hot_coder
// Hierarchy Level: 4
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_one_hot_coder_block1
          (preamble,
           channel,
           header,
           cp_select);


  input   preamble;
  input   channel;
  input   header;
  output  [1:0] cp_select;  // ufix2


  wire Logical_Operator3_out1;
  wire Logical_Operator1_out1;
  wire Logical_Operator_out1;
  wire Logical_Operator4_out1;
  wire Logical_Operator2_out1;
  wire [1:0] Bit_Concat_out1;  // ufix2


  assign Logical_Operator3_out1 =  ~ preamble;



  assign Logical_Operator1_out1 = Logical_Operator3_out1 & channel;



  assign Logical_Operator_out1 =  ~ channel;



  assign Logical_Operator4_out1 =  ~ header;



  assign Logical_Operator2_out1 = Logical_Operator1_out1 | Logical_Operator4_out1;



  assign Bit_Concat_out1 = {Logical_Operator_out1, Logical_Operator2_out1};



  assign cp_select = Bit_Concat_out1;

endmodule  // tx_125_src_one_hot_coder_block1

