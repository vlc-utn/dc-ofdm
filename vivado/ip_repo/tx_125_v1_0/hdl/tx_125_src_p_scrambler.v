// -------------------------------------------------------------
// 
// File Name: hdl_prj/hdlsrc/HDLTx/tx_125_src_p_scrambler.v
// Created: 2024-09-14 22:22:20
// 
// Generated by MATLAB 24.1, HDL Coder 24.1, and Simulink 24.1
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: tx_125_src_p_scrambler
// Source Path: HDLTx/full_tx/payload_full/p_scrambler
// Hierarchy Level: 2
// Model version: 4.114
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module tx_125_src_p_scrambler
          (clk,
           reset_x,
           enb,
           data_in,
           ctrl_in_start,
           ctrl_in_end,
           ctrl_in_valid,
           SI_0,
           SI_1,
           SI_2,
           SI_3,
           data_out,
           ctrl_out_start,
           ctrl_out_end,
           ctrl_out_valid);


  input   clk;
  input   reset_x;
  input   enb;
  input   data_in;  // ufix1
  input   ctrl_in_start;
  input   ctrl_in_end;
  input   ctrl_in_valid;
  input   SI_0;  // boolean
  input   SI_1;  // boolean
  input   SI_2;  // boolean
  input   SI_3;  // boolean
  output  data_out;
  output  ctrl_out_start;
  output  ctrl_out_end;
  output  ctrl_out_valid;


  reg  Delay1_out1;  // ufix1
  wire Logical_Operator1_out1;
  wire Switch_out1;
  reg  Unit_Delay_Enabled_Synchronous3_out1;
  wire Switch1_out1;
  reg  Unit_Delay_Enabled_Synchronous_out1;
  wire Switch2_out1;
  reg  Unit_Delay_Enabled_Synchronous1_out1;
  wire Switch3_out1;
  reg  Unit_Delay_Enabled_Synchronous2_out1;
  reg  C5_out1;
  reg  C6_out1;
  reg  C7_out1;
  reg  C8_out1;
  reg  C9_out1;
  reg  C10_out1;
  reg  C11_out1;
  reg  C12_out1;
  reg  C13_out1;
  reg  C14_out1;
  reg  C15_out1;
  reg  C16_out1;
  reg  C17_out1;
  reg  C18_out1;
  reg  C19_out1;
  reg  C20_out1;
  reg  C21_out1;
  reg  C22_out1;
  reg  C23_out1;
  wire Logical_Operator_out1;
  wire start;
  reg  Delay3_out1;
  wire end_rsvd;
  reg  Delay4_out1;
  wire valid;
  reg  Delay5_out1;
  wire Sample_Control_Bus_Creator_out1_start;
  wire Sample_Control_Bus_Creator_out1_end;
  wire Sample_Control_Bus_Creator_out1_valid;


  always @(posedge clk)
    begin : Delay1_process
      if (reset_x == 1'b1) begin
        Delay1_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= data_in;
        end
      end
    end



  assign Switch_out1 = (ctrl_in_start == 1'b0 ? Logical_Operator1_out1 :
              SI_0);



  always @(posedge clk)
    begin : Unit_Delay_Enabled_Synchronous3_process
      if (reset_x == 1'b1) begin
        Unit_Delay_Enabled_Synchronous3_out1 <= 1'b1;
      end
      else begin
        if (enb && ctrl_in_valid) begin
          Unit_Delay_Enabled_Synchronous3_out1 <= Switch_out1;
        end
      end
    end



  assign Switch1_out1 = (ctrl_in_start == 1'b0 ? Unit_Delay_Enabled_Synchronous3_out1 :
              SI_1);



  always @(posedge clk)
    begin : Unit_Delay_Enabled_Synchronous_process
      if (reset_x == 1'b1) begin
        Unit_Delay_Enabled_Synchronous_out1 <= 1'b1;
      end
      else begin
        if (enb && ctrl_in_valid) begin
          Unit_Delay_Enabled_Synchronous_out1 <= Switch1_out1;
        end
      end
    end



  assign Switch2_out1 = (ctrl_in_start == 1'b0 ? Unit_Delay_Enabled_Synchronous_out1 :
              SI_2);



  always @(posedge clk)
    begin : Unit_Delay_Enabled_Synchronous1_process
      if (reset_x == 1'b1) begin
        Unit_Delay_Enabled_Synchronous1_out1 <= 1'b1;
      end
      else begin
        if (enb && ctrl_in_valid) begin
          Unit_Delay_Enabled_Synchronous1_out1 <= Switch2_out1;
        end
      end
    end



  assign Switch3_out1 = (ctrl_in_start == 1'b0 ? Unit_Delay_Enabled_Synchronous1_out1 :
              SI_3);



  always @(posedge clk)
    begin : Unit_Delay_Enabled_Synchronous2_process
      if (reset_x == 1'b1) begin
        Unit_Delay_Enabled_Synchronous2_out1 <= 1'b1;
      end
      else begin
        if (enb && ctrl_in_valid) begin
          Unit_Delay_Enabled_Synchronous2_out1 <= Switch3_out1;
        end
      end
    end



  always @(posedge clk)
    begin : C5_process
      if (reset_x == 1'b1) begin
        C5_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C5_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C5_out1 <= Unit_Delay_Enabled_Synchronous2_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C6_process
      if (reset_x == 1'b1) begin
        C6_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C6_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C6_out1 <= C5_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C7_process
      if (reset_x == 1'b1) begin
        C7_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C7_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C7_out1 <= C6_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C8_process
      if (reset_x == 1'b1) begin
        C8_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C8_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C8_out1 <= C7_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C9_process
      if (reset_x == 1'b1) begin
        C9_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C9_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C9_out1 <= C8_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C10_process
      if (reset_x == 1'b1) begin
        C10_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C10_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C10_out1 <= C9_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C11_process
      if (reset_x == 1'b1) begin
        C11_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C11_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C11_out1 <= C10_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C12_process
      if (reset_x == 1'b1) begin
        C12_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C12_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C12_out1 <= C11_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C13_process
      if (reset_x == 1'b1) begin
        C13_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C13_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C13_out1 <= C12_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C14_process
      if (reset_x == 1'b1) begin
        C14_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C14_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C14_out1 <= C13_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C15_process
      if (reset_x == 1'b1) begin
        C15_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C15_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C15_out1 <= C14_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C16_process
      if (reset_x == 1'b1) begin
        C16_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C16_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C16_out1 <= C15_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C17_process
      if (reset_x == 1'b1) begin
        C17_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C17_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C17_out1 <= C16_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C18_process
      if (reset_x == 1'b1) begin
        C18_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C18_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C18_out1 <= C17_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C19_process
      if (reset_x == 1'b1) begin
        C19_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C19_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C19_out1 <= C18_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C20_process
      if (reset_x == 1'b1) begin
        C20_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C20_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C20_out1 <= C19_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C21_process
      if (reset_x == 1'b1) begin
        C21_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C21_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C21_out1 <= C20_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C22_process
      if (reset_x == 1'b1) begin
        C22_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C22_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C22_out1 <= C21_out1;
            end
          end
        end
      end
    end



  always @(posedge clk)
    begin : C23_process
      if (reset_x == 1'b1) begin
        C23_out1 <= 1'b1;
      end
      else begin
        if (enb) begin
          if (ctrl_in_start == 1'b1) begin
            C23_out1 <= 1'b1;
          end
          else begin
            if (ctrl_in_valid) begin
              C23_out1 <= C22_out1;
            end
          end
        end
      end
    end



  assign Logical_Operator1_out1 = C23_out1 ^ C18_out1;



  assign Logical_Operator_out1 = Delay1_out1 ^ Logical_Operator1_out1;



  assign data_out = Logical_Operator_out1;

  assign start = ctrl_in_start;

  always @(posedge clk)
    begin : Delay3_process
      if (reset_x == 1'b1) begin
        Delay3_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= start;
        end
      end
    end



  assign end_rsvd = ctrl_in_end;

  always @(posedge clk)
    begin : Delay4_process
      if (reset_x == 1'b1) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= end_rsvd;
        end
      end
    end



  assign valid = ctrl_in_valid;

  always @(posedge clk)
    begin : Delay5_process
      if (reset_x == 1'b1) begin
        Delay5_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= valid;
        end
      end
    end



  tx_125_src_Sample_Control_Bus_Creator_block6 u_Sample_Control_Bus_Creator (.In1(Delay3_out1),
                                                                             .In2(Delay4_out1),
                                                                             .In3(Delay5_out1),
                                                                             .Out1_start(Sample_Control_Bus_Creator_out1_start),
                                                                             .Out1_end(Sample_Control_Bus_Creator_out1_end),
                                                                             .Out1_valid(Sample_Control_Bus_Creator_out1_valid)
                                                                             );

  assign ctrl_out_start = Sample_Control_Bus_Creator_out1_start;

  assign ctrl_out_end = Sample_Control_Bus_Creator_out1_end;

  assign ctrl_out_valid = Sample_Control_Bus_Creator_out1_valid;

endmodule  // tx_125_src_p_scrambler

