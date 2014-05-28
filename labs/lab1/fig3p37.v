// External Module
module fig3p37 (A,B,C,D,E);
  output D,E;
  input A,B,C;
  wire w1;

  and G1(w1,A,B);
  not G2(E,C);
  xor G3(D,w1,E);

endmodule
