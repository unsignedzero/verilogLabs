// Lab 2
// Created by David Tran
// Last Modified 01-23-2014

//Verilog HDL for "es210",

module nor_with_nand (A, B, F);

  input A, B;
  output F;

  wire C, D, E;

  nand G1(C, A, A);
  nand G2(D, B, B);
  nand G3(E, D, C);
  nand G4(F, E, E);

endmodule
