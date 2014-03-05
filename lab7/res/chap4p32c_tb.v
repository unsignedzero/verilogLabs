//`timescale 1 ms /1 us
`include "mux81c.v"

module chap4p32c_tb (S);
  // module declaration
  output [0:3] S;
  reg [0:3] S;

  //S[0]=A, S[1]=B, S[2]=C, S[3]=D

  wire [0:7] I;
  wire Y;

  integer fp;

  // program body
  assign I[0]=~S[3];
  assign I[1]=~S[3];
  assign I[2]=S[3];
  assign I[3]=S[3];
  assign I[4]=1'b0;
  assign I[5]=S[3];
  assign I[6]=1'b0;
  assign I[7]=~S[3];

  mux81c I1 (I,S[0:2],Y);

  initial
    begin
      fp=$fopen("./chap4p32c_tb.out");
      $fmonitor(fp,"time=%0d",$time,,"I=%b S=%b Y=%b",I,S,Y);
      #2000
      $fclose(fp);
      $finish;
    end

  initial
    begin
      S=4'b0000;
      #100
      S=4'b0001;
      #100
      S=4'b0010;
      #100
      S=4'b0011;
      #100
      S=4'b0100;
      #100
      S=4'b0101;
      #100
      S=4'b0110;
      #100
      S=4'b0111;
      #100
      S=4'b1000;
      #100
      S=4'b1001;
      #100
      S=4'b1010;
      #100
      S=4'b1011;
      #100
      S=4'b1100;
      #100
      S=4'b1101;
      #100
      S=4'b1110;
      #100
      S=4'b1111;
    end

  initial #4000 $finish;

endmodule

