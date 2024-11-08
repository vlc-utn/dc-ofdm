// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_batid_to_bits_per_subcarrier.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_batid_to_bits_per_subcarrier
// Source Path: HDLTx/full_tx/payload_full/batid_to_bits_per_subcarrier
// Hierarchy Level: 2
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_batid_to_bits_per_subcarrier
          (bat_id_0,
           bat_id_1,
           bat_id_2,
           bat_id_3,
           bits_per_subcarrier);


  input   bat_id_0;  // boolean
  input   bat_id_1;  // boolean
  input   bat_id_2;  // boolean
  input   bat_id_3;  // boolean
  output  [3:0] bits_per_subcarrier;  // ufix4


  wire [3:0] y;  // ufix4

  // Remember that "bat_id" is LSB first.
  // De momento, el valor de BATID va a coincidir con el valor de la cantidad de bits por subcarrier.


  assign y = {bat_id_3, bat_id_2, bat_id_1, bat_id_0};



  assign bits_per_subcarrier = y;

endmodule  // tx_125_src_batid_to_bits_per_subcarrier

