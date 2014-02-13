// Lab 4
// Created by David Tran
// Last Modified 02-05-2014

// extras
`timescale 1 ms /1 us
`include "half_adder.v"

// Testbench Module

module four_bit_multiplier_tb (
  output reg A0,
  output reg A1,
  output reg B0,
  output reg B1);

  wire W0, W1, W2, W3;
  wire C0, C1, C2, C3;

  reg t_A0 [5000:0];
  reg t_A1 [5000:0];
  reg t_B0 [5000:0];
  reg t_B1 [5000:0];

  reg t_clock;
  reg [31:0] vectornum; //Values from 0 -> 2^31

  integer fp;

  assign C0=B0&A0;
  assign W0=A0&B1;
  assign W1=A1&B0;
  assign W3=A1&B1;

  half_adder HA0 (W0, W1, C1, W2);
  half_adder HA1 (W3, W2, C2, C3);

  initial begin
    t_clock=0;
    forever #5 t_clock=~t_clock;
  end

  initial begin
    $readmemb("./bit_str_a_0.txt",t_A0);
    $readmemb("./bit_str_a_1.txt",t_A1);
    $readmemb("./bit_str_b_0.txt",t_B0);
    $readmemb("./bit_str_b_1.txt",t_B1);
    vectornum=0; // Set test vector 0
  end

  always @(posedge t_clock)
  begin
    A0<=t_A0[vectornum];
    A1<=t_A1[vectornum];
    B0<=t_B0[vectornum];
    B1<=t_B1[vectornum];
    vectornum<=vectornum+1;
  end

  initial
  begin
    //fp=$fopen("two_bit_multiplier_tb.out");
    //$fmonitor(fp, "time=%0d", $time,, "A=%b B=%b D=%b S=%b C=%b", A, B, D, S, C);
    $monitor("time=%03d", $time,,
      "A=%b%b B=%b%b | C=%b%b%b%b",
      A1, A0,
      B1, B0,
      C3, C2, C1, C0
      );

    $dumpfile("two_bit_multipler.vcd");
    $dumpvars;
    #1000
    //$fclose(fp);
    $finish;
  end

endmodule
