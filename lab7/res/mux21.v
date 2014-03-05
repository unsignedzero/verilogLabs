// Mux 2 -> 1
// Created by David Tran
// Last Modified: 02-27-2014

module mux21 (a, b, select, y);

  input a, b, select;
  wire a, b, select;

  output y;
  wire y;

  wire w1, w2;

  assign w1=a&(~select);
  assign w2=b&(select);

  assign y=w1|w2;

endmodule
