// Lab 6
// Created by David Tran
// Last Modified 02-13-2014

// extras
`timescale 1 ms /1 us
`include "mult_2_2_4.v"

// Testbench Module

module four_bit_multiplier_tb (A0, A1, B0, B1);

  output A0, A1, B0, B1;
  reg A0, A1, B0, B1;

  wire C0, C1, C2, C3;

  reg t_A0 [5000:0];
  reg t_A1 [5000:0];
  reg t_B0 [5000:0];
  reg t_B1 [5000:0];

  reg t_clock;
  reg [31:0] vectornum; //Values from 0 -> 2^31

  integer fp;

  mult_2_2_4 I1 (A0, A1, B0, B1, C0, C1, C2, C3);

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
    fp=$fopen("mult_2_2_4.out");
    $fmonitor(fp, "time=%0d", $time,, "A=%b%b B=%b%b | C=%b%b%b%b", A1, A0, B1, B0, C3, C2, C1, C0);

    $monitor("time=%0d", $time,, "A=%b%b B=%b%b | C=%b%b%b%b", A1, A0, B1, B0, C3, C2, C1, C0);

    //$dumpfile("two_bit_multipler.vcd");
    //$dumpvars;
    #1000
    $fclose(fp);
    $finish;
  end

endmodule
