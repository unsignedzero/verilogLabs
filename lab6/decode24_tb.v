// Decoder Test Bench
// Created by David Tran
// Last Modified 02-20-2014

// Extras
`timescale 1 ms /1 us
`include "decode24.v"

// Testbench Module
module decode24_tb (A, B);

  output A, B;
  reg A, B;

  wire [0:3] Y;

  integer fp;

  decode24 I1 (A, B, Y);

  initial
    begin
      A = 1'b0; B= 1'b0;
      #100
      A = 1'b1; B= 1'b0;
      #100
      A = 1'b0; B= 1'b1;
      #100
      A = 1'b1; B= 1'b1;
    end

  initial
    begin
      //fp=$fopen("decode24.out");
      //$fmonitor(fp, "time=%0d", $time,, "A=%b B=%b Y=%b", A, B, Y);
      $monitor("time=%0d", $time,, "A=%b B=%b Y=%b", A, B, Y);
      //$fclose(fp);
    end

  initial #400 $finish;

endmodule

