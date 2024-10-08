// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_full_ofdm_modulator.v
// Created: 2024-09-14 22:22:21
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_full_ofdm_modulator
// Source Path: HDLTx/full_tx/full_ofdm_modulator
// Hierarchy Level: 1
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_full_ofdm_modulator
          (clk,
           reset_x,
           enb_1_2_0,
           enb,
           data_in,
           valid_in,
           bits_per_subcarrier,
           init_0,
           init_1,
           init_2,
           init_3,
           init_4,
           init_5,
           init_6,
           init_7,
           init_8,
           init_9,
           init_10,
           init_11,
           init_12,
           new_ofdm_sym,
           cp_len,
           data_out,
           valid_out,
           ready);


  input   clk;
  input   reset_x;
  input   enb_1_2_0;
  input   enb;
  input   [11:0] data_in;  // ufix12
  input   valid_in;
  input   [3:0] bits_per_subcarrier;  // ufix4
  input   init_0;  // boolean
  input   init_1;  // boolean
  input   init_2;  // boolean
  input   init_3;  // boolean
  input   init_4;  // boolean
  input   init_5;  // boolean
  input   init_6;  // boolean
  input   init_7;  // boolean
  input   init_8;  // boolean
  input   init_9;  // boolean
  input   init_10;  // boolean
  input   init_11;  // boolean
  input   init_12;  // boolean
  input   new_ofdm_sym;
  input   [7:0] cp_len;  // uint8
  output  signed [15:0] data_out;  // sfix16_En12
  output  valid_out;
  output  ready;


  wire stateControl;
  reg  stateControl_1;
  wire enb_1_2_0_gated;
  wire stateControl_2;
  reg  stateControl_3;
  wire enb_1_2_0_gated_1;
  wire stateControl_5;
  reg  stateControl_6;
  wire enb_1_2_0_gated_2;
  wire stateControl_7;
  reg  stateControl_8;
  wire enb_1_2_0_gated_3;
  wire [7:0] enabled_qam_and_scrambler_out3;  // uint8
  reg [7:0] Delay9_out1;  // uint8
  wire valid_new;
  reg  Delay1_out1;
  wire ready_out;
  reg  ready_out_1;
  wire signed [15:0] out_new_re;  // sfix16_En14
  wire signed [15:0] out_new_im;  // sfix16_En14
  reg signed [15:0] Delay8_out1_re;  // sfix16_En14
  reg signed [15:0] Delay8_out1_im;  // sfix16_En14
  wire signed [15:0] ofdm_modulator_out1_re;  // sfix16_En14
  wire signed [15:0] ofdm_modulator_out1_im;  // sfix16_En14
  wire ofdm_modulator_out2;
  wire stateControl_9;
  reg  stateControl_10;
  wire enb_1_2_0_gated_4;
  reg signed [15:0] Delay7_reg_re [0:1];  // sfix16_En14 [2]
  reg signed [15:0] Delay7_reg_im [0:1];  // sfix16_En14 [2]
  wire signed [15:0] Delay7_reg_next_re [0:1];  // sfix16_En14 [2]
  wire signed [15:0] Delay7_reg_next_im [0:1];  // sfix16_En14 [2]
  wire signed [15:0] Delay7_out1_re;  // sfix16_En14
  wire signed [15:0] Delay7_out1_im;  // sfix16_En14
  wire stateControl_11;
  reg  stateControl_12;
  wire enb_1_2_0_gated_5;
  reg  [1:0] Delay11_reg;  // ufix1 [2]
  wire Delay11_out1;
  wire signed [15:0] interpolator_out1_re;  // sfix16_En12
  wire signed [15:0] interpolator_out1_im;  // sfix16_En12
  wire interpolator_out2;
  wire rising_edge_detector_out1;
  wire signed [15:0] frequency_upshift_out1;  // sfix16_En12
  wire frequency_upshift_out2;
  reg signed [31:0] Delay7_t_0_0;  // int32
  reg signed [31:0] Delay7_t_1;  // int32


  assign stateControl = 1'b1;



  always @(posedge clk)
    begin : delayMatch2_process
      if (reset_x == 1'b1) begin
        stateControl_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          stateControl_1 <= stateControl;
        end
      end
    end



  assign enb_1_2_0_gated = stateControl_1 && enb_1_2_0;

  assign stateControl_2 = 1'b1;



  always @(posedge clk)
    begin : delayMatch4_process
      if (reset_x == 1'b1) begin
        stateControl_3 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          stateControl_3 <= stateControl_2;
        end
      end
    end



  assign enb_1_2_0_gated_1 = stateControl_3 && enb_1_2_0;

  assign stateControl_5 = 1'b1;



  always @(posedge clk)
    begin : delayMatch_process
      if (reset_x == 1'b1) begin
        stateControl_6 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          stateControl_6 <= stateControl_5;
        end
      end
    end



  assign enb_1_2_0_gated_2 = stateControl_6 && enb_1_2_0;

  assign stateControl_7 = 1'b1;



  always @(posedge clk)
    begin : delayMatch5_process
      if (reset_x == 1'b1) begin
        stateControl_8 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          stateControl_8 <= stateControl_7;
        end
      end
    end



  assign enb_1_2_0_gated_3 = stateControl_8 && enb_1_2_0;

  always @(posedge clk)
    begin : Delay9_process
      if (reset_x == 1'b1) begin
        Delay9_out1 <= 8'b00000000;
      end
      else begin
        if (enb_1_2_0_gated_3) begin
          Delay9_out1 <= enabled_qam_and_scrambler_out3;
        end
      end
    end



  always @(posedge clk)
    begin : Delay1_process
      if (reset_x == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0_gated_2) begin
          Delay1_out1 <= valid_new;
        end
      end
    end



  always @(posedge clk)
    begin : Delay12_process
      if (reset_x == 1'b1) begin
        ready_out_1 <= 1'b0;
      end
      else begin
        if (enb_1_2_0_gated) begin
          ready_out_1 <= ready_out;
        end
      end
    end



  tx_125_src_enabled_qam_and_scrambler u_enabled_qam_and_scrambler (.clk(clk),
                                                                    .reset_x(reset_x),
                                                                    .enb_1_2_0(enb_1_2_0),
                                                                    .data_in(data_in),  // ufix12
                                                                    .valid_in(valid_in),
                                                                    .bits_per_subcarrier(bits_per_subcarrier),  // ufix4
                                                                    .init_0(init_0),  // boolean
                                                                    .init_1(init_1),  // boolean
                                                                    .init_2(init_2),  // boolean
                                                                    .init_3(init_3),  // boolean
                                                                    .init_4(init_4),  // boolean
                                                                    .init_5(init_5),  // boolean
                                                                    .init_6(init_6),  // boolean
                                                                    .init_7(init_7),  // boolean
                                                                    .init_8(init_8),  // boolean
                                                                    .init_9(init_9),  // boolean
                                                                    .init_10(init_10),  // boolean
                                                                    .init_11(init_11),  // boolean
                                                                    .init_12(init_12),  // boolean
                                                                    .new_rsvd(new_ofdm_sym),
                                                                    .cp_len(cp_len),  // uint8
                                                                    .ofdm_en(ready_out_1),
                                                                    .Enable(ready_out_1),
                                                                    .data_out_re(out_new_re),  // sfix16_En14
                                                                    .data_out_im(out_new_im),  // sfix16_En14
                                                                    .valid_out(valid_new),
                                                                    .cp_len_out(enabled_qam_and_scrambler_out3)  // uint8
                                                                    );

  always @(posedge clk)
    begin : Delay8_process
      if (reset_x == 1'b1) begin
        Delay8_out1_re <= 16'sb0000000000000000;
        Delay8_out1_im <= 16'sb0000000000000000;
      end
      else begin
        if (enb_1_2_0_gated_1) begin
          Delay8_out1_re <= out_new_re;
          Delay8_out1_im <= out_new_im;
        end
      end
    end



  tx_125_src_ofdm_modulator_block u_ofdm_modulator (.clk(clk),
                                                    .reset_x(reset_x),
                                                    .enb_1_2_0(enb_1_2_0),
                                                    .data_in_re(Delay8_out1_re),  // sfix16_En14
                                                    .data_in_im(Delay8_out1_im),  // sfix16_En14
                                                    .valid_in(Delay1_out1),
                                                    .cp_len(Delay9_out1),  // uint8
                                                    .data_out_re(ofdm_modulator_out1_re),  // sfix16_En14
                                                    .data_out_im(ofdm_modulator_out1_im),  // sfix16_En14
                                                    .valid_out(ofdm_modulator_out2),
                                                    .ready(ready_out)
                                                    );

  assign stateControl_9 = 1'b1;



  always @(posedge clk)
    begin : delayMatch3_process
      if (reset_x == 1'b1) begin
        stateControl_10 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          stateControl_10 <= stateControl_9;
        end
      end
    end



  assign enb_1_2_0_gated_4 = stateControl_10 && enb_1_2_0;

  always @(posedge clk)
    begin : Delay7_process
      if (reset_x == 1'b1) begin
        for(Delay7_t_1 = 32'sd0; Delay7_t_1 <= 32'sd1; Delay7_t_1 = Delay7_t_1 + 32'sd1) begin
          Delay7_reg_re[Delay7_t_1] <= 16'sb0000000000000000;
          Delay7_reg_im[Delay7_t_1] <= 16'sb0000000000000000;
        end
      end
      else begin
        if (enb_1_2_0_gated_4) begin
          for(Delay7_t_0_0 = 32'sd0; Delay7_t_0_0 <= 32'sd1; Delay7_t_0_0 = Delay7_t_0_0 + 32'sd1) begin
            Delay7_reg_re[Delay7_t_0_0] <= Delay7_reg_next_re[Delay7_t_0_0];
            Delay7_reg_im[Delay7_t_0_0] <= Delay7_reg_next_im[Delay7_t_0_0];
          end
        end
      end
    end

  assign Delay7_out1_re = Delay7_reg_re[1];
  assign Delay7_out1_im = Delay7_reg_im[1];
  assign Delay7_reg_next_re[0] = ofdm_modulator_out1_re;
  assign Delay7_reg_next_im[0] = ofdm_modulator_out1_im;
  assign Delay7_reg_next_re[1] = Delay7_reg_re[0];
  assign Delay7_reg_next_im[1] = Delay7_reg_im[0];



  assign stateControl_11 = 1'b1;



  always @(posedge clk)
    begin : delayMatch1_process
      if (reset_x == 1'b1) begin
        stateControl_12 <= 1'b0;
      end
      else begin
        if (enb_1_2_0) begin
          stateControl_12 <= stateControl_11;
        end
      end
    end



  assign enb_1_2_0_gated_5 = stateControl_12 && enb_1_2_0;

  always @(posedge clk)
    begin : Delay11_process
      if (reset_x == 1'b1) begin
        Delay11_reg <= {2{1'b0}};
      end
      else begin
        if (enb_1_2_0_gated_5) begin
          Delay11_reg[0] <= ofdm_modulator_out2;
          Delay11_reg[1] <= Delay11_reg[0];
        end
      end
    end

  assign Delay11_out1 = Delay11_reg[1];



  tx_125_src_interpolator u_interpolator (.clk(clk),
                                          .reset_x(reset_x),
                                          .enb_1_2_0(enb_1_2_0),
                                          .enb(enb),
                                          .data_in_re(Delay7_out1_re),  // sfix16_En14
                                          .data_in_im(Delay7_out1_im),  // sfix16_En14
                                          .valid_in(Delay11_out1),
                                          .data_out_re(interpolator_out1_re),  // sfix16_En12
                                          .data_out_im(interpolator_out1_im),  // sfix16_En12
                                          .valid_out(interpolator_out2)
                                          );

  tx_125_src_rising_edge_detector_block u_rising_edge_detector (.clk(clk),
                                                                .reset_x(reset_x),
                                                                .enb(enb),
                                                                .In(interpolator_out2),
                                                                .Out(rising_edge_detector_out1)
                                                                );

  tx_125_src_frequency_upshift u_frequency_upshift (.clk(clk),
                                                    .reset_x(reset_x),
                                                    .enb(enb),
                                                    .data_in_re(interpolator_out1_re),  // sfix16_En12
                                                    .data_in_im(interpolator_out1_im),  // sfix16_En12
                                                    .valid_in(interpolator_out2),
                                                    .reset(rising_edge_detector_out1),
                                                    .data_out(frequency_upshift_out1),  // sfix16_En12
                                                    .valid_out(frequency_upshift_out2)
                                                    );

  assign data_out = frequency_upshift_out1;

  assign valid_out = frequency_upshift_out2;

  assign ready = ready_out_1;

endmodule  // tx_125_src_full_ofdm_modulator

