// Lab 2
// Created by David Tran
// Last Modified 01-22-2014

// extras
`timescale 1 ms /1 us
`include flip_me.v

// Testbench Module

module flip_me_tb (A);

  output A;
  reg A;

  wire B;

  reg t_A[10000:0];
  reg t_clock;
  reg vectornum[31:0]; //Values from 0 -> 2^31

  flip_me I1 (A,B);

  initial #1000 $finish;

  initial
    begin
      t_clock=0;
      forever #5; t_clock=~t_clock;
    end

  initial
    begin $readmemb("/dir", t_A);
      vectornum=0; // Set test vector 0
    end

  always @(negedge t_clock)
    begin
      A<=t_A[vectornum];
      vectornum<=vectornum+1;
    end

  initial
    begin
      $monitor("time=%05d", $time,, "A=%b B=%b", A, B);
    end

endmodule
