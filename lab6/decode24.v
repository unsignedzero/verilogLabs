// Lab 6 Decoder 2 -> 4
// Created by David Tran
// Last Modified 02/20/2014

module decode24 (A, B, Y);

  input A, B;
  wire A, B;

  output [0:3] Y;
  wire [0:3] Y;

  // Using or gate.
  //assign Y[0] =  A |  B;
  //assign Y[1] = !A |  B;
  //assign Y[2] =  A | !B;
  //assign Y[3] = !A | !B;

  assign Y[0] = ~((~A)&(~B));
  assign Y[1] = ~(( A)&(~B));
  assign Y[2] = ~((~A)&( B));
  assign Y[3] = ~(( A)&( B));

endmodule

