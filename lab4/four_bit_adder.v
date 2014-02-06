// Lab 4
// Created by David Tran
// Last Modified 02-05-2014

`include "full_adder.v"

module four_bit_adder(a0, a1, a2, a3, b0, b1, b2, b3, c0,
    d0, d1, d2, d3, d4);

  input a0, a1, a2, a3, b0, b1, b2, b3, c0;
  wire a0, a1, a2, a3, b0, b1, b2, b3, c0;

  output d0, d1, d2, d3, d4;
  wire d0, d1, d2, d3, d4;

  wire c1, c2, c3;

  full_adder M1 (a0, b0, c0, d0, c1);
  full_adder M2 (a1, b1, c1, d1, c2);
  full_adder M3 (a2, b2, c2, d2, c3);
  full_adder M4 (a3, b3, c3, d3, d4);

endmodule
