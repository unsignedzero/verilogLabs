// Lab 4
// Created by David Tran
// Last Modified 02-05-2014
`include "half_adder.v"

module full_adder(x, y, z, s, c);

  input x, y, z;
  wire x, y, z;

  output s, c;
  wire s, c;

  wire ws, wc1, wc2;

  half_adder M1 (x, y, ws, wc1);
  half_adder M2 (ws, z, s, wc2);

  assign c=wc1|wc2;

endmodule
