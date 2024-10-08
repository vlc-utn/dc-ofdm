// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_General_CRC_Generator_HDL_Optimized.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_General_CRC_Generator_HDL_Optimized
// Source Path: HDLTx/full_tx/header_full/h_crc/General CRC Generator HDL Optimized
// Hierarchy Level: 3
// Model version: 4.114
// 
// CRC Generator HDL Optimized
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_General_CRC_Generator_HDL_Optimized
          (clk,
           reset_x,
           enb,
           dataIn,
           startIn,
           endIn,
           validIn,
           dataOut,
           startOut,
           endOut,
           validOut);


  input   clk;
  input   reset_x;
  input   enb;
  input   dataIn;
  input   startIn;
  input   endIn;
  input   validIn;
  output  dataOut;
  output  startOut;
  output  endOut;
  output  validOut;


  wire startIn_vld;
  wire endIn_vld;
  wire tstartout;
  wire processMsg;
  wire padZero;
  wire outputCRC;
  wire lastfout;
  wire validdata;
  wire [3:0] counter;  // ufix4
  wire [3:0] counter_opcrc;  // ufix4
  wire const0;  // ufix1
  wire msgenb;
  reg  datainReg;
  reg  [15:0] alpha_reg;  // ufix1 [16]
  wire dataBuffer;  // ufix1
  wire crcCheckSum_0;
  wire crcCheckSum_1;
  wire crcCheckSum_2;
  wire crcCheckSum_3;
  wire crcCheckSum_4;
  wire crcCheckSum_5;
  wire crcCheckSum_6;
  wire crcCheckSum_7;
  wire crcCheckSum_8;
  wire crcCheckSum_9;
  wire crcCheckSum_10;
  wire crcCheckSum_11;
  wire crcCheckSum_12;
  wire crcCheckSum_13;
  wire crcCheckSum_14;
  wire crcCheckSum_15;
  wire crcOut;  // ufix1
  wire msgcrc;  // ufix1
  wire tdataout;  // ufix1
  reg  dataOut_1;
  reg  startOut_1;
  reg  endOut_1;
  reg  validOut_1;


  assign startIn_vld = startIn & validIn;



  assign endIn_vld = endIn & validIn;



  tx_125_src_CRCGenControl u_Controlsignal_inst (.clk(clk),
                                                 .reset_x(reset_x),
                                                 .enb(enb),
                                                 .startIn(startIn_vld),
                                                 .endIn(endIn_vld),
                                                 .validIn(validIn),
                                                 .startOut(tstartout),
                                                 .processMsg(processMsg),
                                                 .padZero(padZero),
                                                 .outputCRC(outputCRC),
                                                 .endOut(lastfout),
                                                 .validOut(validdata),
                                                 .counter(counter),  // ufix4
                                                 .counter_outputCRC(counter_opcrc)  // ufix4
                                                 );

  // Constant Zero
  assign const0 = 1'b0;



  assign msgenb = processMsg | padZero;



  always @(posedge clk)
    begin : datainput_register_process
      if (reset_x == 1'b1) begin
        datainReg <= 1'b0;
      end
      else begin
        if (enb) begin
          datainReg <= dataIn;
        end
      end
    end



  // Buffer Input Data
  always @(posedge clk)
    begin : c_process
      if (reset_x == 1'b1) begin
        alpha_reg <= {16{1'b0}};
      end
      else begin
        if (enb && msgenb) begin
          alpha_reg[0] <= datainReg;
          alpha_reg[32'sd15:32'sd1] <= alpha_reg[32'sd14:32'sd0];
        end
      end
    end

  assign dataBuffer = alpha_reg[15];



  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  // Select CRC output bits
  tx_125_src_CRCGenCompute u_ComputeCRC_inst (.clk(clk),
                                              .reset_x(reset_x),
                                              .enb(enb),
                                              .datainReg(datainReg),
                                              .validIn(validIn),
                                              .processMsg(processMsg),
                                              .padZero(padZero),
                                              .counter(counter),  // ufix4
                                              .crcChecksum_0(crcCheckSum_0),  // boolean
                                              .crcChecksum_1(crcCheckSum_1),  // boolean
                                              .crcChecksum_2(crcCheckSum_2),  // boolean
                                              .crcChecksum_3(crcCheckSum_3),  // boolean
                                              .crcChecksum_4(crcCheckSum_4),  // boolean
                                              .crcChecksum_5(crcCheckSum_5),  // boolean
                                              .crcChecksum_6(crcCheckSum_6),  // boolean
                                              .crcChecksum_7(crcCheckSum_7),  // boolean
                                              .crcChecksum_8(crcCheckSum_8),  // boolean
                                              .crcChecksum_9(crcCheckSum_9),  // boolean
                                              .crcChecksum_10(crcCheckSum_10),  // boolean
                                              .crcChecksum_11(crcCheckSum_11),  // boolean
                                              .crcChecksum_12(crcCheckSum_12),  // boolean
                                              .crcChecksum_13(crcCheckSum_13),  // boolean
                                              .crcChecksum_14(crcCheckSum_14),  // boolean
                                              .crcChecksum_15(crcCheckSum_15)  // boolean
                                              );

  assign crcOut = (counter_opcrc == 4'b0000 ? crcCheckSum_0 :
              (counter_opcrc == 4'b0001 ? crcCheckSum_1 :
              (counter_opcrc == 4'b0010 ? crcCheckSum_2 :
              (counter_opcrc == 4'b0011 ? crcCheckSum_3 :
              (counter_opcrc == 4'b0100 ? crcCheckSum_4 :
              (counter_opcrc == 4'b0101 ? crcCheckSum_5 :
              (counter_opcrc == 4'b0110 ? crcCheckSum_6 :
              (counter_opcrc == 4'b0111 ? crcCheckSum_7 :
              (counter_opcrc == 4'b1000 ? crcCheckSum_8 :
              (counter_opcrc == 4'b1001 ? crcCheckSum_9 :
              (counter_opcrc == 4'b1010 ? crcCheckSum_10 :
              (counter_opcrc == 4'b1011 ? crcCheckSum_11 :
              (counter_opcrc == 4'b1100 ? crcCheckSum_12 :
              (counter_opcrc == 4'b1101 ? crcCheckSum_13 :
              (counter_opcrc == 4'b1110 ? crcCheckSum_14 :
              crcCheckSum_15)))))))))))))));



  assign msgcrc = (outputCRC == 1'b0 ? dataBuffer :
              crcOut);



  // Output data and CRC CheckSum
  assign tdataout = (validdata == 1'b0 ? const0 :
              msgcrc);



  // Data output register
  always @(posedge clk)
    begin : dataOut_register_process
      if (reset_x == 1'b1) begin
        dataOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          dataOut_1 <= tdataout;
        end
      end
    end



  // startOut output register
  always @(posedge clk)
    begin : startOut_register_process
      if (reset_x == 1'b1) begin
        startOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          startOut_1 <= tstartout;
        end
      end
    end



  // endOut output register
  always @(posedge clk)
    begin : endout_register_process
      if (reset_x == 1'b1) begin
        endOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          endOut_1 <= lastfout;
        end
      end
    end



  // validOut output register
  always @(posedge clk)
    begin : validout_register_process
      if (reset_x == 1'b1) begin
        validOut_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          validOut_1 <= validdata;
        end
      end
    end



  assign dataOut = dataOut_1;

  assign startOut = startOut_1;

  assign endOut = endOut_1;

  assign validOut = validOut_1;

endmodule  // tx_125_src_General_CRC_Generator_HDL_Optimized

