// Lab 4
// Created by David Tran
// Last Modified 02-05-2014

// extras
`timescale 1 ms /1 us
`include "four_bit_adder.v"

// Testbench Module

module four_bit_adder_tb (A0, A1, A2, A3, B0, B1, B2, B3,

  output A0, A1, A2, A3, B0, B1, B2, B3, C0;
  reg A0, A1, A2, A3, B0, B1, B2, B3, C0;

  wire D0, D1, D2, D3, D4;

  reg t_A0 [5000:0];
  reg t_A1 [5000:0];
  reg t_A2 [5000:0];
  reg t_A3 [5000:0];
  reg t_B0 [5000:0];
  reg t_B1 [5000:0];
  reg t_B2 [5000:0];
  reg t_B3 [5000:0];
  reg t_C0 [5000:0];

  reg t_clock;
  reg [31:0] vectornum; //Values from 0 -> 2^31

  integer fp;

  four_bit_adder I1 (A0, A1, A2, A3, B0, B1, B2, B3, C0, D0, D1, D2, D3, D4);

  //initial #1000 $finish;

  initial
  begin
    t_clock=0;
    forever #5 t_clock=~t_clock;
  end

  initial
  begin
    $readmemb("./bit_str_a_0.txt",t_A0);
    $readmemb("./bit_str_a_1.txt",t_A1);
    $readmemb("./bit_str_a_2.txt",t_A2);
    $readmemb("./bit_str_a_3.txt",t_A3);
    $readmemb("./bit_str_b_0.txt",t_B0);
    $readmemb("./bit_str_b_1.txt",t_B1);
    $readmemb("./bit_str_b_2.txt",t_B2);
    $readmemb("./bit_str_b_3.txt",t_B3);
    $readmemb("./bit_str_c_0.txt",t_C0);
    vectornum=0; // Set test vector 0
  end

  always @(posedge t_clock)
  begin
    A0<=t_A0[vectornum];
    A1<=t_A1[vectornum];
    A2<=t_A2[vectornum];
    A3<=t_A3[vectornum];
    B0<=t_B0[vectornum];
    B1<=t_B1[vectornum];
    B2<=t_B2[vectornum];
    B3<=t_B3[vectornum];
    C0<=t_C0[vectornum];
    vectornum<=vectornum+1;
  end

  initial
  begin
    //fp=$fopen("four_bit_adder_tb.out");
    //$fmonitor(fp, "time=%0d", $time,, "A=%b B=%b D=%b S=%b C=%b", A, B, D, S, C);
    $monitor("time=%03d", $time,,
      //"A0=%b, A1=%b, A2=%b, A3=%b, B0=%b, B1=%b, B2=%b, B3=%b, C0=%b | D0=%b, D1=%b, D2=%b, D3=%b, D4=%b",
      //"A=%b%b%b%b B=%b%b%b%b, C0=%b | D0=%b, D1=%b, D2=%b, D3=%b, D4=%b",
      "A=%b%b%b%b B=%b%b%b%b, C=%b | D=%b%b%b%b%b",
      A3, A2, A1, A0,
      B3, B2, B1, B0,
      C0,
      D4, D3, D2, D1, D0,
      );
    $dumpfile("fulladder.vcd");
    $dumpvars;
    #1000
    //$fclose(fp);
    $finish;
  end

endmodule
