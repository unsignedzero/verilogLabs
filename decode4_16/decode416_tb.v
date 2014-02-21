// Decoder 4 -> 16 Test Bench
// Created by David Tran
// Last Modified 02/21/2014

// Extras
`timescale 1 ms /1 us
`include "decode416.v"

// Testbench Module
module decode416_tb (in);

  output [0:3] in;
  reg [0:3] in;

  wire [0:15] out;

  integer fp;

  decode416 I1 (in, out);

  initial
    begin
      // LSB is left, not right
      in=4'h0; #20
      in=4'h8; #20
      in=4'h4; #20
      in=4'hc; #20
      in=4'h2; #20
      in=4'ha; #20
      in=4'h6; #20
      in=4'he; #20
      in=4'h1; #20
      in=4'h9; #20
      in=4'h5; #20
      in=4'hd; #20
      in=4'h3; #20
      in=4'hb; #20
      in=4'h7; #20
      in=4'hf;
    end

  initial
    begin
      fp=$fopen("decode416.out");
      $fmonitor(fp, "time=%0d", $time,, "in=%b out=%b", in, out);
      $monitor("time=%0d", $time,, "in=%b out=%b", in, out);
        #400
      $fclose(fp);
    end

  initial #400 $finish;

endmodule

