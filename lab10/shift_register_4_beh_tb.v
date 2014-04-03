// Universal Shift Register
// Created by David Tran
// Version 0.0.0.0
// Last Modified 04-03-2014

`include "shift_register_4_beh.v"
`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {shift_register_4_beh_tb}}
module shift_register_4_beh_tb (clear);

  //input s1 ;
  //wire s1 ;
  //input s0 ;
  //wire s0 ;
  //input msb_in ;
  //wire msb_in ;
  //input lsb_in ;
  //wire lsb_in ;
  //input clk ;
  //wire clk ;
  input clear ;
  wire clear ;
  //output [3:0] a_par ;
  //wire [3:0] a_par ;
  //input [3:0] i_par ;
  //wire [3:0] i_par ;

  wire [3:0] a_par;
  reg [3:0] i_par;
  reg msb_in;
  reg lsb_in;
  reg [0:0] t_i_par_0[10000:0];  //10000 rows should be more than sufficient
  reg [0:0] t_i_par_1[10000:0];  //10000 rows should be more than sufficient
  reg [0:0] t_i_par_2[10000:0];  //10000 rows should be more than sufficient
  reg [0:0] t_i_par_3[10000:0];  //10000 rows should be more than sufficient
  reg [0:0] t_msb_in[10000:0];  //10000 rows should be more than sufficient
  reg [0:0] t_lsb_in[10000:0];  //10000 rows should be more than sufficient
  reg t_clock,s0,s1;
  reg [31:0] vectornum;

//}} End of automatically maintained section

// -- Enter your statements here -- //

  initial #20000 $finish;

  initial
    begin
      t_clock=0;
      forever #5 t_clock=~t_clock;
    end

  initial
    begin
      s1=0;
      forever  #100 s1=~s1;
    end

  initial
    begin
      s0=0;
      forever  #200 s0=~s0;
    end

  initial
    begin
      //$readmemb("C:\Users\ouj\Documents\Sonoma\tunnel\basys2\es210\gate2\src\1b_str.txt",testvector);
      //$readmemb("C:/\Users/\ouj/\Documents/\Sonoma/\tunnel/\basys2/\es210/\gate2/\src/\b_str.txt",testvector);

      $readmemb("bit_str_i_par_0.txt",t_i_par_0);
      $readmemb("bit_str_i_par_1.txt",t_i_par_1);
      $readmemb("bit_str_i_par_2.txt",t_i_par_2);
      $readmemb("bit_str_i_par_3.txt",t_i_par_3);
      $readmemb("bit_str_msb_in.txt",t_msb_in);
      $readmemb("bit_str_lsb_in.txt",t_lsb_in);

      vectornum=0; //initialize the index of testvector to 0
    end

  always @(negedge t_clock)
    begin
      i_par[0]<=t_i_par_0[vectornum];
      i_par[1]<=t_i_par_1[vectornum];
      i_par[2]<=t_i_par_2[vectornum];
      i_par[3]<=t_i_par_3[vectornum];

      msb_in<=t_msb_in[vectornum];
      lsb_in<=t_lsb_in[vectornum];

      vectornum<=vectornum+1;
    end

  shift_register_4_beh M0 (a_par, i_par, s1, s0, msb_in, lsb_in, t_clock, clear);

endmodule
