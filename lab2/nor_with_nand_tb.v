// Lab 2
// Created by David Tran
// Last Modified 01-22-2014

// extras
`timescale 1 ms /1 us
`include "nor_with_nand.v"

// Testbench Module

module flip_me_tb (A, B);

  output A, B;
  reg A, B;

  wire F;

  reg t_A[10000:0];
  reg t_B[10000:0];
  reg t_clock;
  reg vectornum[31:0]; //Values from 0 -> 2^31

  nor_with_nand I1 (A, B, F);

  initial #1000 $finish;

  initial
    begin
      t_clock=0;
      forever #5; t_clock=~t_clock;
    end

  initial
    begin $readmemb("/dir", t_A);
    begin $readmemb("/dir", t_B);
      vectornum=0; // Set test vector 0
    end

  always @(negedge t_clock)
    begin
      A<=t_A[vectornum];
      B<=t_B[vectornum];
      vectornum<=vectornum+1;
    end

  initial
    begin
      $monitor("time=%05d", $time,, "A=%b B=%b F=%b", A, B, F);
    end

endmodule
