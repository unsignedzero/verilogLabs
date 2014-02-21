// Decoder 2 -> 4 with enable
// Created by David Tran
// Last Modified 02/21/2014

module decode24_enable (A, B, Y, enable);

  input A, B, enable;
  wire A, B, enable;

  output [0:3] Y;
  wire [0:3] Y;

  assign Y[0] = ~((~A)&(~B)) | enable;
  assign Y[1] = ~(( A)&(~B)) | enable;
  assign Y[2] = ~((~A)&( B)) | enable;
  assign Y[3] = ~(( A)&( B)) | enable;

endmodule

