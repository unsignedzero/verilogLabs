// Lab 6 Encoder 8 -> 3
// Created by David Tran
// Last Modified 02/19/2014

module encoder83 (D, outputWire, V);

  input [0:7] D;
  wire [0:7] D;

  output [0:2] outputWire;
  wire [0:2] outputWire;

  output V;

  //assign outputWire[0] = D[4] | D[5] | D[6] | D[7];
  assign outputWire[0] = |D[4:7];
  assign outputWire[1] = D[2] | D[3] | D[6] | D[7];
  assign outputWire[2] = D[1] | D[3] | D[5] | D[7];

  assign V = |D;

endmodule
