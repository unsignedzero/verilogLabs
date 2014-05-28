// Lab 4
// Created by David Tran
// Last Modified 02-05-2014

// extras
`timescale 1 ms /1 us
`include "full_adder.v"

// Testbench Module

module full_adder_tb (A, B, D);

  output A, B, D;
  reg A, B, D;

  wire S, C;

  reg t_A [5000:0];
  reg t_B [5000:0];
  reg t_D [5000:0];
  reg t_clock;
  reg [31:0] vectornum; //Values from 0 -> 2^31

  integer fp;

  full_adder I1 (A, B, D, S, C);

  //initial #1000 $finish;

  initial
  begin
    t_clock=0;
    forever #5 t_clock=~t_clock;
  end

  initial
  begin
    $readmemb("./bit_str_a_0.txt",t_A);
    $readmemb("./bit_str_a_1.txt",t_B);
    $readmemb("./bit_str_a_2.txt",t_D);
    vectornum=0; // Set test vector 0
  end

  always @(negedge t_clock)
  begin
    A<=t_A[vectornum];
    B<=t_B[vectornum];
    D<=t_D[vectornum];
    vectornum<=vectornum+1;
  end

  initial
  begin
    fp=$fopen("full_adder_tb.out");
    //$fmonitor(fp, "time=%0d", $time,, "A=%b B=%b D=%b S=%b C=%b", A, B, D, S, C);
    $monitor("time=%0d", $time,, "A=%b B=%b D=%b S=%b C=%b", A, B, D, S, C);
    #1000
    $fclose(fp);
    $finish;
  end

endmodule
