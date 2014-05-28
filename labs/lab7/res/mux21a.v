
module mux21a (a,b,s,y);

  //module declaration
  input a,b,s;
  wire a,b,s;
  output y;
  wire y;
  wire sb, w1, w2;

  //program body
  and A1(w1,a,sb);
  and A2(w2,s,b);
  not N1(sb,s);
  or O1(y,w1,w2);

endmodule

