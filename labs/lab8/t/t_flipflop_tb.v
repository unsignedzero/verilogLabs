// JK Flipflop TestBench
// Created by David Tran
// Last Modified: 03-14-2014

// Extras
`timescale 1 ms /1 us
`include "t_flipflop.v"

// Testbench Module

module t_ff_tb (T, REset);

  output T, REset;
  reg T, REset;

  wire q;

  reg t_T [5000:0];
  reg t_REset [5000:0];
  reg t_clock;
  reg [31:0] vectornum; //Values from 0 -> 2^31

  t_ff I0 (q, T, t_clock, REset);

  initial #1000 $finish;

  initial
  begin
    t_clock=0;
    forever #5 t_clock=~t_clock;
  end

  initial
  begin
    $readmemb("./bit_str_a_0.txt",t_T);
    $readmemb("./bit_str_a_1.txt",t_REset);
    vectornum=0; // Set test vector 0
  end

  always @(negedge t_clock)
  begin
    T<=t_T[vectornum];
    REset<=t_REset[vectornum];
    vectornum<=vectornum+1;
  end

  initial
  begin
    $monitor("time=%0d", $time,, "T=%b REset=%b q=%b", T, REset, q);
    $dumpfile("t_flipflop.vcd");
    $dumpvars;
  end

endmodule
