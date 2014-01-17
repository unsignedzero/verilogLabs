// Sample Verilog Code
// Created by David Tran
// Last Modified 01-17-2014

// Extras
`timescale 1 ms /1 us

// Testbench Module
module fig3p37_tb (A,B,C);
  output A,B,C;
  reg A,B,C;

  // Create instance
  fig3p37 I1 (A,B,C,D,E);

  initial
    begin
      // Set timeline events
      $stop;
      A=1'b0; B=1'b0; C=1'b0;
      #100
      A=1'b1; B=1'b1; C=1'b1;
      #100
      $stop;
    end

endmodule

// External Module
module fig3p37 (A,B,C,D,E);
  output D,E;
  input A,B,C;
  wire w1;

  and G1(w1,A,B);
  not G2(E,C);
  xor G3(D,w1,E);

endmodule
