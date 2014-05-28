// Mux 2 -> 1
// Created by David Tran
// Last Modified: 02-27-2014

module mux81 (a, b, c, d, y);

  input a, b, c, d;
  wire a, b, c, d;

  output y;
  wire y;

  wire w1, w2, w3, w4, w5, w6;

  mux21 I1 (~d, ~d, c, w1);
  mux21 I2 ( d,  d, c, w2);
  mux21 I3 ( 0,  d, c, w3);
  mux21 I4 ( 0, ~d, c, w4);
  mux21 I5 (w1, w2, b, w5);
  mux21 I6 (w3, w4, b, w6);
  mux21 I7 (w5, w6, a,  y);

endmodule
