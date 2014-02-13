// Lab 6
// Created by David Tran
// Last Modified 02-13-2014

`include "half_adder.v"

// Testbench Module

module mult_2_2_4(
  input wire A0,
  input wire A1,
  input wire B0,
  input wire B1,
  output wire C0,
  output wire C1,
  output wire C2,
  output wire C3);

  wire W0, W1, W2, W3;

  assign C0=B0&A0;
  assign W0=A0&B1;
  assign W1=A1&B0;
  assign W3=A1&B1;

  half_adder HA0 (W0, W1, C1, W2);
  half_adder HA1 (W3, W2, C2, C3);

endmodule
