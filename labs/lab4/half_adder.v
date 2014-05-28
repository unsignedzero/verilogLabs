// Lab 4
// Created by David Tran
// Last Modified 02-06-2014

module half_adder(x, y, s, c);

  input x, y;

  output s, c;
  wire s, c;

  assign s=x^y;
  assign c=x&y;

endmodule
