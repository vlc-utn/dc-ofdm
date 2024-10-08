// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_h_gen.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_h_gen
// Source Path: HDLTx/full_tx/header_full/h_gen
// Hierarchy Level: 2
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_h_gen
          (clk,
           reset_x,
           enb_1_8_0,
           enb,
           new_frame,
           psdu_size_0,
           psdu_size_1,
           psdu_size_2,
           psdu_size_3,
           psdu_size_4,
           psdu_size_5,
           psdu_size_6,
           psdu_size_7,
           psdu_size_8,
           psdu_size_9,
           psdu_size_10,
           psdu_size_11,
           psdu_size_12,
           psdu_size_13,
           psdu_size_14,
           psdu_size_15,
           psdu_size_16,
           psdu_size_17,
           psdu_size_18,
           psdu_size_19,
           psdu_size_20,
           psdu_size_21,
           psdu_size_22,
           psdu_size_23,
           msg_duration_0,
           msg_duration_1,
           msg_duration_2,
           msg_duration_3,
           msg_duration_4,
           msg_duration_5,
           msg_duration_6,
           msg_duration_7,
           msg_duration_8,
           msg_duration_9,
           msg_duration_10,
           msg_duration_11,
           msg_duration_12,
           msg_duration_13,
           msg_duration_14,
           msg_duration_15,
           block_size_0,
           block_size_1,
           fec_rate_0,
           fec_rate_1,
           fec_rate_2,
           rep_number_0,
           rep_number_1,
           rep_number_2,
           concat_factor_0,
           concat_factor_1,
           concat_factor_2,
           scrambler_init_0,
           scrambler_init_1,
           scrambler_init_2,
           scrambler_init_3,
           bat_id_0,
           bat_id_1,
           bat_id_2,
           bat_id_3,
           bat_id_4,
           cp_id_0,
           cp_id_1,
           cp_id_2,
           mimo_spacing_0,
           mimo_spacing_1,
           mimo_spacing_2,
           mimo_number_0,
           mimo_number_1,
           mimo_number_2,
           data_out,
           ctrl_out_start,
           ctrl_out_end,
           ctrl_out_valid);


  input   clk;
  input   reset_x;
  input   enb_1_8_0;
  input   enb;
  input   new_frame;
  input   psdu_size_0;  // boolean
  input   psdu_size_1;  // boolean
  input   psdu_size_2;  // boolean
  input   psdu_size_3;  // boolean
  input   psdu_size_4;  // boolean
  input   psdu_size_5;  // boolean
  input   psdu_size_6;  // boolean
  input   psdu_size_7;  // boolean
  input   psdu_size_8;  // boolean
  input   psdu_size_9;  // boolean
  input   psdu_size_10;  // boolean
  input   psdu_size_11;  // boolean
  input   psdu_size_12;  // boolean
  input   psdu_size_13;  // boolean
  input   psdu_size_14;  // boolean
  input   psdu_size_15;  // boolean
  input   psdu_size_16;  // boolean
  input   psdu_size_17;  // boolean
  input   psdu_size_18;  // boolean
  input   psdu_size_19;  // boolean
  input   psdu_size_20;  // boolean
  input   psdu_size_21;  // boolean
  input   psdu_size_22;  // boolean
  input   psdu_size_23;  // boolean
  input   msg_duration_0;  // boolean
  input   msg_duration_1;  // boolean
  input   msg_duration_2;  // boolean
  input   msg_duration_3;  // boolean
  input   msg_duration_4;  // boolean
  input   msg_duration_5;  // boolean
  input   msg_duration_6;  // boolean
  input   msg_duration_7;  // boolean
  input   msg_duration_8;  // boolean
  input   msg_duration_9;  // boolean
  input   msg_duration_10;  // boolean
  input   msg_duration_11;  // boolean
  input   msg_duration_12;  // boolean
  input   msg_duration_13;  // boolean
  input   msg_duration_14;  // boolean
  input   msg_duration_15;  // boolean
  input   block_size_0;  // boolean
  input   block_size_1;  // boolean
  input   fec_rate_0;  // boolean
  input   fec_rate_1;  // boolean
  input   fec_rate_2;  // boolean
  input   rep_number_0;  // boolean
  input   rep_number_1;  // boolean
  input   rep_number_2;  // boolean
  input   concat_factor_0;  // boolean
  input   concat_factor_1;  // boolean
  input   concat_factor_2;  // boolean
  input   scrambler_init_0;  // boolean
  input   scrambler_init_1;  // boolean
  input   scrambler_init_2;  // boolean
  input   scrambler_init_3;  // boolean
  input   bat_id_0;  // boolean
  input   bat_id_1;  // boolean
  input   bat_id_2;  // boolean
  input   bat_id_3;  // boolean
  input   bat_id_4;  // boolean
  input   cp_id_0;  // boolean
  input   cp_id_1;  // boolean
  input   cp_id_2;  // boolean
  input   mimo_spacing_0;  // boolean
  input   mimo_spacing_1;  // boolean
  input   mimo_spacing_2;  // boolean
  input   mimo_number_0;  // boolean
  input   mimo_number_1;  // boolean
  input   mimo_number_2;  // boolean
  output  data_out;
  output  ctrl_out_start;
  output  ctrl_out_end;
  output  ctrl_out_valid;


  wire [4:0] count_step;  // ufix5
  wire [4:0] count_from;  // ufix5
  wire HDL_Counter1_out2;
  wire Logical_Operator1_out1;
  reg [4:0] HDL_Counter1_out1;  // ufix5
  wire range_hit;
  wire [4:0] count;  // ufix5
  wire need_to_wrap;
  wire [4:0] count_value;  // ufix5
  reg  Unit_Delay_Enabled_Synchronous_out1;
  wire [4:0] count_1;  // ufix5
  wire Logical_Operator_out1;
  wire control_in_2;
  reg [2:0] Serializer1D_contl_cnt;  // ufix3
  wire Serializer1D_invldSignal;
  wire Serializer1D_out2;
  wire [7:0] Constant1_out1;  // boolean [8]
  wire [7:0] Demux_out1;  // boolean [8]
  wire [7:0] Demux_out2;  // boolean [8]
  wire [7:0] Demux_out3;  // boolean [8]
  wire [7:0] Demux1_out1;  // boolean [8]
  wire [7:0] Demux1_out2;  // boolean [8]
  wire [7:0] Vector_Concatenate_out1;  // boolean [8]
  wire Constant_out1;
  wire [7:0] Vector_Concatenate1_out1;  // boolean [8]
  wire Constant2_out1;
  wire Constant3_out1;
  wire Constant4_out1;
  wire [7:0] Vector_Concatenate2_out1;  // boolean [8]
  wire Constant5_out1;
  wire Constant6_out1;
  wire [7:0] Vector_Concatenate3_out1;  // boolean [8]
  wire [7:0] Constant7_out1;  // boolean [8]
  wire [7:0] Constant8_out1;  // boolean [8]
  wire [7:0] Constant9_out1;  // boolean [8]
  wire Constant10_out1;
  wire Constant11_out1;
  wire Constant12_out1;
  wire Constant13_out1;
  wire Constant14_out1;
  wire [7:0] Vector_Concatenate4_out1;  // boolean [8]
  wire [7:0] Constant15_out1;  // boolean [8]
  wire [7:0] Constant16_out1;  // boolean [8]
  wire [7:0] Constant17_out1;  // boolean [8]
  wire [7:0] Constant18_out1;  // boolean [8]
  wire [7:0] Constant19_out1;  // boolean [8]
  reg  [7:0] Multiport_Switch1_out1;  // boolean [8]
  wire [7:0] serial_in_1;  // boolean [8]
  reg  [6:0] Serializer1D_data;  // ufix1 [7]
  reg  [6:0] Serializer1D_data_next;  // ufix1 [7]
  reg  serializer_PostProcessed;
  reg  Delay1_out1;
  wire valid_to_ctrl_out1_start;
  wire valid_to_ctrl_out1_end;
  wire valid_to_ctrl_out1_valid;


  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 18
  assign count_step = 5'b00001;



  assign count_from = 5'b00000;



  assign Logical_Operator1_out1 =  ~ HDL_Counter1_out2;



  assign range_hit = HDL_Counter1_out1 > 5'b11110;



  assign count = HDL_Counter1_out1 + count_step;



  assign count_value = (need_to_wrap == 1'b0 ? count :
              count_from);



  assign count_1 = (Unit_Delay_Enabled_Synchronous_out1 == 1'b0 ? HDL_Counter1_out1 :
              count_value);



  always @(posedge clk)
    begin : HDL_Counter1_process
      if (reset_x == 1'b1) begin
        HDL_Counter1_out1 <= 5'b00000;
      end
      else begin
        if (enb_1_8_0) begin
          HDL_Counter1_out1 <= count_1;
        end
      end
    end



  assign need_to_wrap = HDL_Counter1_out1 == 5'b10010;



  assign HDL_Counter1_out2 = need_to_wrap | range_hit;



  assign Logical_Operator_out1 = new_frame | HDL_Counter1_out2;



  always @(posedge clk)
    begin : Unit_Delay_Enabled_Synchronous_process
      if (reset_x == 1'b1) begin
        Unit_Delay_Enabled_Synchronous_out1 <= 1'b0;
      end
      else begin
        if (enb_1_8_0 && Logical_Operator_out1) begin
          Unit_Delay_Enabled_Synchronous_out1 <= Logical_Operator1_out1;
        end
      end
    end



  assign control_in_2 = Unit_Delay_Enabled_Synchronous_out1;

  always @(posedge clk)
    begin : Serializer1D_contl_process
      if (reset_x == 1'b1) begin
        Serializer1D_contl_cnt <= 3'b000;
      end
      else begin
        if (enb) begin
          if (Serializer1D_contl_cnt == 3'b111) begin
            Serializer1D_contl_cnt <= 3'b000;
          end
          else begin
            Serializer1D_contl_cnt <= Serializer1D_contl_cnt + 3'b001;
          end
        end
      end
    end

  assign Serializer1D_out2 = control_in_2 != 1'b0;
  assign Serializer1D_invldSignal = Serializer1D_contl_cnt == 3'b000;



  assign Constant1_out1[0] = 1'b0;
  assign Constant1_out1[1] = 1'b0;
  assign Constant1_out1[2] = 1'b1;
  assign Constant1_out1[3] = 1'b1;
  assign Constant1_out1[4] = 1'b0;
  assign Constant1_out1[5] = 1'b0;
  assign Constant1_out1[6] = 1'b0;
  assign Constant1_out1[7] = 1'b0;



  assign Demux_out1[0] = psdu_size_0;
  assign Demux_out1[1] = psdu_size_1;
  assign Demux_out1[2] = psdu_size_2;
  assign Demux_out1[3] = psdu_size_3;
  assign Demux_out1[4] = psdu_size_4;
  assign Demux_out1[5] = psdu_size_5;
  assign Demux_out1[6] = psdu_size_6;
  assign Demux_out1[7] = psdu_size_7;

  assign Demux_out2[0] = psdu_size_8;
  assign Demux_out2[1] = psdu_size_9;
  assign Demux_out2[2] = psdu_size_10;
  assign Demux_out2[3] = psdu_size_11;
  assign Demux_out2[4] = psdu_size_12;
  assign Demux_out2[5] = psdu_size_13;
  assign Demux_out2[6] = psdu_size_14;
  assign Demux_out2[7] = psdu_size_15;

  assign Demux_out3[0] = psdu_size_16;
  assign Demux_out3[1] = psdu_size_17;
  assign Demux_out3[2] = psdu_size_18;
  assign Demux_out3[3] = psdu_size_19;
  assign Demux_out3[4] = psdu_size_20;
  assign Demux_out3[5] = psdu_size_21;
  assign Demux_out3[6] = psdu_size_22;
  assign Demux_out3[7] = psdu_size_23;

  assign Demux1_out1[0] = msg_duration_0;
  assign Demux1_out1[1] = msg_duration_1;
  assign Demux1_out1[2] = msg_duration_2;
  assign Demux1_out1[3] = msg_duration_3;
  assign Demux1_out1[4] = msg_duration_4;
  assign Demux1_out1[5] = msg_duration_5;
  assign Demux1_out1[6] = msg_duration_6;
  assign Demux1_out1[7] = msg_duration_7;

  assign Demux1_out2[0] = msg_duration_8;
  assign Demux1_out2[1] = msg_duration_9;
  assign Demux1_out2[2] = msg_duration_10;
  assign Demux1_out2[3] = msg_duration_11;
  assign Demux1_out2[4] = msg_duration_12;
  assign Demux1_out2[5] = msg_duration_13;
  assign Demux1_out2[6] = msg_duration_14;
  assign Demux1_out2[7] = msg_duration_15;

  assign Vector_Concatenate_out1[0] = block_size_0;
  assign Vector_Concatenate_out1[1] = block_size_1;
  assign Vector_Concatenate_out1[2] = fec_rate_0;
  assign Vector_Concatenate_out1[3] = fec_rate_1;
  assign Vector_Concatenate_out1[4] = fec_rate_2;
  assign Vector_Concatenate_out1[5] = rep_number_0;
  assign Vector_Concatenate_out1[6] = rep_number_1;
  assign Vector_Concatenate_out1[7] = rep_number_2;

  assign Constant_out1 = 1'b0;



  assign Vector_Concatenate1_out1[0] = concat_factor_0;
  assign Vector_Concatenate1_out1[1] = concat_factor_1;
  assign Vector_Concatenate1_out1[2] = concat_factor_2;
  assign Vector_Concatenate1_out1[3] = scrambler_init_0;
  assign Vector_Concatenate1_out1[4] = scrambler_init_1;
  assign Vector_Concatenate1_out1[5] = scrambler_init_2;
  assign Vector_Concatenate1_out1[6] = scrambler_init_3;
  assign Vector_Concatenate1_out1[7] = Constant_out1;

  assign Constant2_out1 = 1'b0;



  assign Constant3_out1 = 1'b0;



  assign Constant4_out1 = 1'b0;



  assign Vector_Concatenate2_out1[0] = bat_id_0;
  assign Vector_Concatenate2_out1[1] = bat_id_1;
  assign Vector_Concatenate2_out1[2] = bat_id_2;
  assign Vector_Concatenate2_out1[3] = bat_id_3;
  assign Vector_Concatenate2_out1[4] = bat_id_4;
  assign Vector_Concatenate2_out1[5] = Constant2_out1;
  assign Vector_Concatenate2_out1[6] = Constant3_out1;
  assign Vector_Concatenate2_out1[7] = Constant4_out1;

  assign Constant5_out1 = 1'b0;



  assign Constant6_out1 = 1'b0;



  assign Vector_Concatenate3_out1[0] = cp_id_0;
  assign Vector_Concatenate3_out1[1] = cp_id_1;
  assign Vector_Concatenate3_out1[2] = cp_id_2;
  assign Vector_Concatenate3_out1[3] = mimo_spacing_0;
  assign Vector_Concatenate3_out1[4] = mimo_spacing_1;
  assign Vector_Concatenate3_out1[5] = mimo_spacing_2;
  assign Vector_Concatenate3_out1[6] = Constant5_out1;
  assign Vector_Concatenate3_out1[7] = Constant6_out1;

  assign Constant7_out1 = {8{1'b0}};



  assign Constant8_out1 = {8{1'b0}};



  assign Constant9_out1 = {8{1'b0}};



  assign Constant10_out1 = 1'b0;



  assign Constant11_out1 = 1'b0;



  assign Constant12_out1 = 1'b0;



  assign Constant13_out1 = 1'b0;



  assign Constant14_out1 = 1'b0;



  assign Vector_Concatenate4_out1[0] = Constant10_out1;
  assign Vector_Concatenate4_out1[1] = Constant11_out1;
  assign Vector_Concatenate4_out1[2] = mimo_number_0;
  assign Vector_Concatenate4_out1[3] = mimo_number_1;
  assign Vector_Concatenate4_out1[4] = mimo_number_2;
  assign Vector_Concatenate4_out1[5] = Constant12_out1;
  assign Vector_Concatenate4_out1[6] = Constant13_out1;
  assign Vector_Concatenate4_out1[7] = Constant14_out1;

  assign Constant15_out1 = {8{1'b0}};



  assign Constant16_out1 = {8{1'b0}};



  assign Constant17_out1 = {8{1'b0}};



  assign Constant18_out1 = {8{1'b0}};



  assign Constant19_out1 = {8{1'b0}};



  always @* begin
    if (HDL_Counter1_out1 == 5'b00000) begin
      Multiport_Switch1_out1 = Constant1_out1;
    end
    else if (HDL_Counter1_out1 == 5'b00001) begin
      Multiport_Switch1_out1 = Demux_out1;
    end
    else if (HDL_Counter1_out1 == 5'b00010) begin
      Multiport_Switch1_out1 = Demux_out2;
    end
    else if (HDL_Counter1_out1 == 5'b00011) begin
      Multiport_Switch1_out1 = Demux_out3;
    end
    else if (HDL_Counter1_out1 == 5'b00100) begin
      Multiport_Switch1_out1 = Demux1_out1;
    end
    else if (HDL_Counter1_out1 == 5'b00101) begin
      Multiport_Switch1_out1 = Demux1_out2;
    end
    else if (HDL_Counter1_out1 == 5'b00110) begin
      Multiport_Switch1_out1 = Vector_Concatenate_out1;
    end
    else if (HDL_Counter1_out1 == 5'b00111) begin
      Multiport_Switch1_out1 = Vector_Concatenate1_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01000) begin
      Multiport_Switch1_out1 = Vector_Concatenate2_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01001) begin
      Multiport_Switch1_out1 = Vector_Concatenate3_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01010) begin
      Multiport_Switch1_out1 = Constant7_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01011) begin
      Multiport_Switch1_out1 = Constant8_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01100) begin
      Multiport_Switch1_out1 = Constant9_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01101) begin
      Multiport_Switch1_out1 = Vector_Concatenate4_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01110) begin
      Multiport_Switch1_out1 = Constant15_out1;
    end
    else if (HDL_Counter1_out1 == 5'b01111) begin
      Multiport_Switch1_out1 = Constant16_out1;
    end
    else if (HDL_Counter1_out1 == 5'b10000) begin
      Multiport_Switch1_out1 = Constant17_out1;
    end
    else if (HDL_Counter1_out1 == 5'b10001) begin
      Multiport_Switch1_out1 = Constant18_out1;
    end
    else begin
      Multiport_Switch1_out1 = Constant19_out1;
    end
  end



  assign serial_in_1[0] = Multiport_Switch1_out1[0];
  assign serial_in_1[1] = Multiport_Switch1_out1[1];
  assign serial_in_1[2] = Multiport_Switch1_out1[2];
  assign serial_in_1[3] = Multiport_Switch1_out1[3];
  assign serial_in_1[4] = Multiport_Switch1_out1[4];
  assign serial_in_1[5] = Multiport_Switch1_out1[5];
  assign serial_in_1[6] = Multiport_Switch1_out1[6];
  assign serial_in_1[7] = Multiport_Switch1_out1[7];

  always @(posedge clk)
    begin : Serializer1D_process
      if (reset_x == 1'b1) begin
        Serializer1D_data <= {7{1'b0}};
      end
      else begin
        if (enb) begin
          Serializer1D_data <= Serializer1D_data_next;
        end
      end
    end

  always @* begin
    Serializer1D_data_next = Serializer1D_data;
    if (Serializer1D_invldSignal != 1'b0) begin
      serializer_PostProcessed = serial_in_1[0];
    end
    else begin
      serializer_PostProcessed = Serializer1D_data[0];
    end
    if (Serializer1D_invldSignal != 1'b0) begin
      Serializer1D_data_next[32'sd6:32'sd0] = serial_in_1[32'sd7:32'sd1];
    end
    else begin
      Serializer1D_data_next[32'sd5:32'sd0] = Serializer1D_data[32'sd6:32'sd1];
      Serializer1D_data_next[6] = serial_in_1[7];
    end
  end



  always @(posedge clk)
    begin : Delay1_process
      if (reset_x == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= serializer_PostProcessed;
        end
      end
    end



  assign data_out = Delay1_out1;

  tx_125_src_valid_to_ctrl_block u_valid_to_ctrl (.clk(clk),
                                                  .reset_x(reset_x),
                                                  .enb(enb),
                                                  .validIn(Serializer1D_out2),
                                                  .ctrlOut_start(valid_to_ctrl_out1_start),
                                                  .ctrlOut_end(valid_to_ctrl_out1_end),
                                                  .ctrlOut_valid(valid_to_ctrl_out1_valid)
                                                  );

  assign ctrl_out_start = valid_to_ctrl_out1_start;

  assign ctrl_out_end = valid_to_ctrl_out1_end;

  assign ctrl_out_valid = valid_to_ctrl_out1_valid;

endmodule  // tx_125_src_h_gen

