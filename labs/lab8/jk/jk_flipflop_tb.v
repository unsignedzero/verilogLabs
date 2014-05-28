// JK Flipflop TestBench
// Created by David Tran
// Last Modified: 03-14-2014

// Extras
`timescale 1 ms /1 us
`include "jk_flipflop.v"

// Testbench Module

module jk_ff_tb (J, K);

  output J, K;
  reg J, K;

  wire q, qb;

  reg t_J [5000:0];
  reg t_K [5000:0];
  reg t_clock;
  reg [31:0] vectornum; //Values from 0 -> 2^31

  jk_ff I1 (J, K, t_clock, q, qb);

  initial #1000 $finish;

  initial
  begin
    t_clock=0;
    forever #5 t_clock=~t_clock;
  end

  initial
  begin
    $readmemb("./bit_str_a_0.txt",t_J);
    $readmemb("./bit_str_a_1.txt",t_K);
    vectornum=0; // Set test vector 0
  end

  always @(negedge t_clock)
  begin
    J<=t_J[vectornum];
    K<=t_K[vectornum];
    vectornum<=vectornum+1;
  end

  initial
  begin
    $monitor("time=%0d", $time,, "J=%b K=%b q=%b qb=%b", J, K, q, qb);
    $dumpfile("jk_flipflop.vcd");
    $dumpvars;
  end

endmodule
