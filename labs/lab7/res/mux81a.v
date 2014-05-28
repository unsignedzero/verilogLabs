`include "mux21a.v"
`include "mux21.v"

module mux81a (I,S,Y);
  input [0:7] I;
  wire [0:7] I;

  input [0:2] S; //S[0]=A, S[1]=B, S[2]=C
  wire [0:2] S;
  output Y;
  wire Y;

  wire A,B,C;
  wire W01, W23, W45, W67, W5, W6;
  mux21 I1 (I[0], I[1],S[2], W01);
  mux21 I2 (I[2], I[3],S[2], W23);
  mux21 I3 (I[4], I[5],S[2], W45);
  mux21 I4 (I[6], I[7],S[2], W67);
  mux21 I5 (W01, W23,S[1], W5);
  mux21 I6 (W45, W67,S[1], W6);
  mux21 I7 (W5, W6,S[0], Y);

  //mux21a I1 (I[0], I[1],S[2], W01);
  //mux21a I2 (I[2], I[3],S[2], W23);
  //mux21a I3 (I[4], I[5],S[2], W45);
  //mux21a I4 (I[6], I[7],S[2], W67);
  //mux21a I5 (W01, W23,S[1], W5);
  //mux21a I6 (W45, W67,S[1], W6);
  //mux21a I7 (W5, W6,S[0], Y);

endmodule

