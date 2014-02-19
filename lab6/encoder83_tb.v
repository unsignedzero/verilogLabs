// Encoder Test Bench
// Created by David Tran
// Last Modified 02-19-2014

// Extras
`timescale 1 ms /1 us
`include "encoder83.v"

// Testbench Module
module encoder83_tb (D);

  output [0:7] D;
  reg D;

  wire V;
  wire [0:2] Y;

  encoder83 I1 (D, Y, V);

  initial
    begin
      D=8'h88;
      #100
      D=8'h80;
      #100
      D=8'h40;
      #100
      D=8'h20;
      #100
      D=8'h10;
      #100
      D=8'h08;
      #100
      D=8'h04;
      #100
      D=8'h02;
      #100
      D=8'h01;
      #100
      D=8'h00;
    end

  initial
  begin
    $monitor("time=%03d", $time,, "A=%h B=%d F=%d", D, Y, V);
  end

initial #900 $finish;

endmodule

