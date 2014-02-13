// Lab 6
// Created by David Tran
// Last Modified 02-13-2014

`include "half_adder.v"

// Testbench Module

module mult_2_2_4(A0, A1, B0, B1, C0, C1, C2, C3);

  input A0, A1, B0, B1;

  output C0, C1, C2, C3;
  wire C0, C1, C2, C3;

  wire W0, W1, W2, W3;

  assign C0=B0&A0;
  assign W0=A0&B1;
  assign W1=A1&B0;
  assign W3=A1&B1;

  half_adder HA0 (W0, W1, C1, W2);
  half_adder HA1 (W3, W2, C2, C3);

endmodule
