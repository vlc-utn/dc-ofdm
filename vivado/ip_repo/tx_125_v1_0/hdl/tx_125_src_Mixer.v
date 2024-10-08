// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_Mixer.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_Mixer
// Source Path: HDLTx/full_tx/full_ofdm_modulator/frequency_upshift/Mixer
// Hierarchy Level: 3
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_Mixer
          (clk,
           reset_x,
           enb,
           dataIn_re,
           dataIn_im,
           ncoIn_re,
           ncoIn_im,
           mixedOut);


  input   clk;
  input   reset_x;
  input   enb;
  input   signed [15:0] dataIn_re;  // sfix16_En12
  input   signed [15:0] dataIn_im;  // sfix16_En12
  input   signed [15:0] ncoIn_re;  // sfix16_En14
  input   signed [15:0] ncoIn_im;  // sfix16_En14
  output  signed [15:0] mixedOut;  // sfix16_En12


  wire stateControl;
  reg  [1:0] delayMatch6_reg;  // ufix1 [2]
  wire stateControl_1;
  wire enb_gated;
  reg signed [15:0] Delay5_out1_re;  // sfix16_En12
  reg signed [15:0] Delay5_out1_im;  // sfix16_En12
  wire stateControl_2;
  reg  [1:0] delayMatch1_reg;  // ufix1 [2]
  wire stateControl_3;
  wire enb_gated_1;
  reg signed [15:0] Delay1_reg [0:2];  // sfix16 [3]
  reg signed [15:0] Delay1_reg_next [0:2];  // sfix16_En12 [3]
  reg signed [15:0] Delay1_out1;  // sfix16_En12
  wire stateControl_5;
  reg  [1:0] delayMatch_reg;  // ufix1 [2]
  wire stateControl_6;
  wire enb_gated_2;
  reg signed [15:0] Delay_out1_re;  // sfix16_En14
  reg signed [15:0] Delay_out1_im;  // sfix16_En14
  wire stateControl_7;
  reg  [1:0] delayMatch4_reg;  // ufix1 [2]
  wire stateControl_8;
  wire enb_gated_3;
  reg signed [15:0] Delay3_reg [0:2];  // sfix16 [3]
  reg signed [15:0] Delay3_reg_next [0:2];  // sfix16_En14 [3]
  reg signed [15:0] Delay3_out1;  // sfix16_En14
  wire signed [31:0] Product1_mul_temp;  // sfix32_En26
  wire signed [15:0] Product1_out1;  // sfix16_En12
  wire stateControl_9;
  reg  [1:0] delayMatch7_reg;  // ufix1 [2]
  wire stateControl_10;
  wire enb_gated_4;
  reg signed [15:0] Delay6_reg [0:2];  // sfix16 [3]
  reg signed [15:0] Delay6_reg_next [0:2];  // sfix16_En12 [3]
  reg signed [15:0] Delay6_out1;  // sfix16_En12
  wire stateControl_11;
  reg  [1:0] delayMatch3_reg;  // ufix1 [2]
  wire stateControl_12;
  wire enb_gated_5;
  reg signed [15:0] Delay2_reg [0:2];  // sfix16 [3]
  reg signed [15:0] Delay2_reg_next [0:2];  // sfix16_En12 [3]
  reg signed [15:0] Delay2_out1;  // sfix16_En12
  wire stateControl_13;
  reg  [1:0] delayMatch5_reg;  // ufix1 [2]
  wire stateControl_14;
  wire enb_gated_6;
  reg signed [15:0] Delay4_reg [0:2];  // sfix16 [3]
  reg signed [15:0] Delay4_reg_next [0:2];  // sfix16_En14 [3]
  reg signed [15:0] Delay4_out1;  // sfix16_En14
  wire signed [31:0] Product2_mul_temp;  // sfix32_En26
  wire signed [15:0] Product2_out1;  // sfix16_En12
  wire stateControl_15;
  reg  [1:0] delayMatch8_reg;  // ufix1 [2]
  wire stateControl_16;
  wire enb_gated_7;
  reg signed [15:0] Delay7_reg [0:2];  // sfix16 [3]
  reg signed [15:0] Delay7_reg_next [0:2];  // sfix16_En12 [3]
  reg signed [15:0] Delay7_out1;  // sfix16_En12
  wire signed [15:0] Add_out1;  // sfix16_En12
  wire stateControl_17;
  reg  [1:0] delayMatch2_reg;  // ufix1 [2]
  wire stateControl_18;
  wire enb_gated_8;
  reg signed [15:0] Delay12_reg [0:1];  // sfix16 [2]
  wire signed [15:0] Delay12_reg_next [0:1];  // sfix16_En12 [2]
  wire signed [15:0] Delay12_out1;  // sfix16_En12
  reg signed [31:0] Delay1_t_0_0;  // int32
  reg signed [31:0] Delay1_t_0_1;  // int32
  reg signed [31:0] Delay1_t_1;  // int32
  reg signed [31:0] Delay3_t_0_0;  // int32
  reg signed [31:0] Delay3_t_0_1;  // int32
  reg signed [31:0] Delay3_t_1;  // int32
  reg signed [31:0] Delay6_t_0_0;  // int32
  reg signed [31:0] Delay6_t_0_1;  // int32
  reg signed [31:0] Delay6_t_1;  // int32
  reg signed [31:0] Delay2_t_0_0;  // int32
  reg signed [31:0] Delay2_t_0_1;  // int32
  reg signed [31:0] Delay2_t_1;  // int32
  reg signed [31:0] Delay4_t_0_0;  // int32
  reg signed [31:0] Delay4_t_0_1;  // int32
  reg signed [31:0] Delay4_t_1;  // int32
  reg signed [31:0] Delay7_t_0_0;  // int32
  reg signed [31:0] Delay7_t_0_1;  // int32
  reg signed [31:0] Delay7_t_1;  // int32
  reg signed [31:0] Delay12_t_0_0;  // int32
  reg signed [31:0] Delay12_t_1;  // int32

  initial begin

    for(Delay1_t_1 = 32'sd0; Delay1_t_1 <= 32'sd2; Delay1_t_1 = Delay1_t_1 + 32'sd1) begin
      Delay1_reg[Delay1_t_1] = 16'sb0000000000000000;
    end


    for(Delay3_t_1 = 32'sd0; Delay3_t_1 <= 32'sd2; Delay3_t_1 = Delay3_t_1 + 32'sd1) begin
      Delay3_reg[Delay3_t_1] = 16'sb0000000000000000;
    end


    for(Delay6_t_1 = 32'sd0; Delay6_t_1 <= 32'sd2; Delay6_t_1 = Delay6_t_1 + 32'sd1) begin
      Delay6_reg[Delay6_t_1] = 16'sb0000000000000000;
    end


    for(Delay2_t_1 = 32'sd0; Delay2_t_1 <= 32'sd2; Delay2_t_1 = Delay2_t_1 + 32'sd1) begin
      Delay2_reg[Delay2_t_1] = 16'sb0000000000000000;
    end


    for(Delay4_t_1 = 32'sd0; Delay4_t_1 <= 32'sd2; Delay4_t_1 = Delay4_t_1 + 32'sd1) begin
      Delay4_reg[Delay4_t_1] = 16'sb0000000000000000;
    end


    for(Delay7_t_1 = 32'sd0; Delay7_t_1 <= 32'sd2; Delay7_t_1 = Delay7_t_1 + 32'sd1) begin
      Delay7_reg[Delay7_t_1] = 16'sb0000000000000000;
    end


    for(Delay12_t_1 = 32'sd0; Delay12_t_1 <= 32'sd1; Delay12_t_1 = Delay12_t_1 + 32'sd1) begin
      Delay12_reg[Delay12_t_1] = 16'sb0000000000000000;
    end

  end

  assign stateControl = 1'b1;



  always @(posedge clk)
    begin : delayMatch6_process
      if (reset_x == 1'b1) begin
        delayMatch6_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch6_reg[0] <= stateControl;
          delayMatch6_reg[1] <= delayMatch6_reg[0];
        end
      end
    end

  assign stateControl_1 = delayMatch6_reg[1];



  assign enb_gated = stateControl_1 && enb;

  always @(posedge clk)
    begin : Delay5_process
      if (reset_x == 1'b1) begin
        Delay5_out1_re <= 16'sb0000000000000000;
        Delay5_out1_im <= 16'sb0000000000000000;
      end
      else begin
        if (enb_gated) begin
          Delay5_out1_re <= dataIn_re;
          Delay5_out1_im <= dataIn_im;
        end
      end
    end



  assign stateControl_2 = 1'b1;



  always @(posedge clk)
    begin : delayMatch1_process
      if (reset_x == 1'b1) begin
        delayMatch1_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch1_reg[0] <= stateControl_2;
          delayMatch1_reg[1] <= delayMatch1_reg[0];
        end
      end
    end

  assign stateControl_3 = delayMatch1_reg[1];



  assign enb_gated_1 = stateControl_3 && enb;

  always @(posedge clk)
    begin : Delay1_process
      if (enb_gated_1) begin
        for(Delay1_t_0_1 = 32'sd0; Delay1_t_0_1 <= 32'sd2; Delay1_t_0_1 = Delay1_t_0_1 + 32'sd1) begin
          Delay1_reg[Delay1_t_0_1] <= Delay1_reg_next[Delay1_t_0_1];
        end
      end
    end

  always @* begin
    Delay1_out1 = Delay1_reg[2];
    Delay1_reg_next[0] = Delay5_out1_re;

    for(Delay1_t_0_0 = 32'sd0; Delay1_t_0_0 <= 32'sd1; Delay1_t_0_0 = Delay1_t_0_0 + 32'sd1) begin
      Delay1_reg_next[Delay1_t_0_0 + 32'sd1] = Delay1_reg[Delay1_t_0_0];
    end

  end



  assign stateControl_5 = 1'b1;



  always @(posedge clk)
    begin : delayMatch_process
      if (reset_x == 1'b1) begin
        delayMatch_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch_reg[0] <= stateControl_5;
          delayMatch_reg[1] <= delayMatch_reg[0];
        end
      end
    end

  assign stateControl_6 = delayMatch_reg[1];



  assign enb_gated_2 = stateControl_6 && enb;

  always @(posedge clk)
    begin : Delay_process
      if (reset_x == 1'b1) begin
        Delay_out1_re <= 16'sb0000000000000000;
        Delay_out1_im <= 16'sb0000000000000000;
      end
      else begin
        if (enb_gated_2) begin
          Delay_out1_re <= ncoIn_re;
          Delay_out1_im <= ncoIn_im;
        end
      end
    end



  assign stateControl_7 = 1'b1;



  always @(posedge clk)
    begin : delayMatch4_process
      if (reset_x == 1'b1) begin
        delayMatch4_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch4_reg[0] <= stateControl_7;
          delayMatch4_reg[1] <= delayMatch4_reg[0];
        end
      end
    end

  assign stateControl_8 = delayMatch4_reg[1];



  assign enb_gated_3 = stateControl_8 && enb;

  always @(posedge clk)
    begin : Delay3_process
      if (enb_gated_3) begin
        for(Delay3_t_0_1 = 32'sd0; Delay3_t_0_1 <= 32'sd2; Delay3_t_0_1 = Delay3_t_0_1 + 32'sd1) begin
          Delay3_reg[Delay3_t_0_1] <= Delay3_reg_next[Delay3_t_0_1];
        end
      end
    end

  always @* begin
    Delay3_out1 = Delay3_reg[2];
    Delay3_reg_next[0] = Delay_out1_re;

    for(Delay3_t_0_0 = 32'sd0; Delay3_t_0_0 <= 32'sd1; Delay3_t_0_0 = Delay3_t_0_0 + 32'sd1) begin
      Delay3_reg_next[Delay3_t_0_0 + 32'sd1] = Delay3_reg[Delay3_t_0_0];
    end

  end



  assign Product1_mul_temp = Delay1_out1 * Delay3_out1;
  assign Product1_out1 = Product1_mul_temp[29:14];



  assign stateControl_9 = 1'b1;



  always @(posedge clk)
    begin : delayMatch7_process
      if (reset_x == 1'b1) begin
        delayMatch7_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch7_reg[0] <= stateControl_9;
          delayMatch7_reg[1] <= delayMatch7_reg[0];
        end
      end
    end

  assign stateControl_10 = delayMatch7_reg[1];



  assign enb_gated_4 = stateControl_10 && enb;

  always @(posedge clk)
    begin : Delay6_process
      if (enb_gated_4) begin
        for(Delay6_t_0_1 = 32'sd0; Delay6_t_0_1 <= 32'sd2; Delay6_t_0_1 = Delay6_t_0_1 + 32'sd1) begin
          Delay6_reg[Delay6_t_0_1] <= Delay6_reg_next[Delay6_t_0_1];
        end
      end
    end

  always @* begin
    Delay6_out1 = Delay6_reg[2];
    Delay6_reg_next[0] = Product1_out1;

    for(Delay6_t_0_0 = 32'sd0; Delay6_t_0_0 <= 32'sd1; Delay6_t_0_0 = Delay6_t_0_0 + 32'sd1) begin
      Delay6_reg_next[Delay6_t_0_0 + 32'sd1] = Delay6_reg[Delay6_t_0_0];
    end

  end



  assign stateControl_11 = 1'b1;



  always @(posedge clk)
    begin : delayMatch3_process
      if (reset_x == 1'b1) begin
        delayMatch3_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch3_reg[0] <= stateControl_11;
          delayMatch3_reg[1] <= delayMatch3_reg[0];
        end
      end
    end

  assign stateControl_12 = delayMatch3_reg[1];



  assign enb_gated_5 = stateControl_12 && enb;

  always @(posedge clk)
    begin : Delay2_process
      if (enb_gated_5) begin
        for(Delay2_t_0_1 = 32'sd0; Delay2_t_0_1 <= 32'sd2; Delay2_t_0_1 = Delay2_t_0_1 + 32'sd1) begin
          Delay2_reg[Delay2_t_0_1] <= Delay2_reg_next[Delay2_t_0_1];
        end
      end
    end

  always @* begin
    Delay2_out1 = Delay2_reg[2];
    Delay2_reg_next[0] = Delay5_out1_im;

    for(Delay2_t_0_0 = 32'sd0; Delay2_t_0_0 <= 32'sd1; Delay2_t_0_0 = Delay2_t_0_0 + 32'sd1) begin
      Delay2_reg_next[Delay2_t_0_0 + 32'sd1] = Delay2_reg[Delay2_t_0_0];
    end

  end



  assign stateControl_13 = 1'b1;



  always @(posedge clk)
    begin : delayMatch5_process
      if (reset_x == 1'b1) begin
        delayMatch5_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch5_reg[0] <= stateControl_13;
          delayMatch5_reg[1] <= delayMatch5_reg[0];
        end
      end
    end

  assign stateControl_14 = delayMatch5_reg[1];



  assign enb_gated_6 = stateControl_14 && enb;

  always @(posedge clk)
    begin : Delay4_process
      if (enb_gated_6) begin
        for(Delay4_t_0_1 = 32'sd0; Delay4_t_0_1 <= 32'sd2; Delay4_t_0_1 = Delay4_t_0_1 + 32'sd1) begin
          Delay4_reg[Delay4_t_0_1] <= Delay4_reg_next[Delay4_t_0_1];
        end
      end
    end

  always @* begin
    Delay4_out1 = Delay4_reg[2];
    Delay4_reg_next[0] = Delay_out1_im;

    for(Delay4_t_0_0 = 32'sd0; Delay4_t_0_0 <= 32'sd1; Delay4_t_0_0 = Delay4_t_0_0 + 32'sd1) begin
      Delay4_reg_next[Delay4_t_0_0 + 32'sd1] = Delay4_reg[Delay4_t_0_0];
    end

  end



  assign Product2_mul_temp = Delay2_out1 * Delay4_out1;
  assign Product2_out1 = Product2_mul_temp[29:14];



  assign stateControl_15 = 1'b1;



  always @(posedge clk)
    begin : delayMatch8_process
      if (reset_x == 1'b1) begin
        delayMatch8_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch8_reg[0] <= stateControl_15;
          delayMatch8_reg[1] <= delayMatch8_reg[0];
        end
      end
    end

  assign stateControl_16 = delayMatch8_reg[1];



  assign enb_gated_7 = stateControl_16 && enb;

  always @(posedge clk)
    begin : Delay7_process
      if (enb_gated_7) begin
        for(Delay7_t_0_1 = 32'sd0; Delay7_t_0_1 <= 32'sd2; Delay7_t_0_1 = Delay7_t_0_1 + 32'sd1) begin
          Delay7_reg[Delay7_t_0_1] <= Delay7_reg_next[Delay7_t_0_1];
        end
      end
    end

  always @* begin
    Delay7_out1 = Delay7_reg[2];
    Delay7_reg_next[0] = Product2_out1;

    for(Delay7_t_0_0 = 32'sd0; Delay7_t_0_0 <= 32'sd1; Delay7_t_0_0 = Delay7_t_0_0 + 32'sd1) begin
      Delay7_reg_next[Delay7_t_0_0 + 32'sd1] = Delay7_reg[Delay7_t_0_0];
    end

  end



  assign Add_out1 = Delay6_out1 - Delay7_out1;



  assign stateControl_17 = 1'b1;



  always @(posedge clk)
    begin : delayMatch2_process
      if (reset_x == 1'b1) begin
        delayMatch2_reg <= {2{1'b0}};
      end
      else begin
        if (enb) begin
          delayMatch2_reg[0] <= stateControl_17;
          delayMatch2_reg[1] <= delayMatch2_reg[0];
        end
      end
    end

  assign stateControl_18 = delayMatch2_reg[1];



  assign enb_gated_8 = stateControl_18 && enb;

  always @(posedge clk)
    begin : Delay12_process
      if (enb_gated_8) begin
        for(Delay12_t_0_0 = 32'sd0; Delay12_t_0_0 <= 32'sd1; Delay12_t_0_0 = Delay12_t_0_0 + 32'sd1) begin
          Delay12_reg[Delay12_t_0_0] <= Delay12_reg_next[Delay12_t_0_0];
        end
      end
    end

  assign Delay12_out1 = Delay12_reg[1];
  assign Delay12_reg_next[0] = Add_out1;
  assign Delay12_reg_next[1] = Delay12_reg[0];



  assign mixedOut = Delay12_out1;

endmodule  // tx_125_src_Mixer

