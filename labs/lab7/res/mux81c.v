//mux81, dataflow style

module mux81c (I,S,Y);
  input [0:7] I;
  wire [0:7] I;

  input [0:2] S; //S[0]=A, S[1]=B, S[2]=C
  wire [0:2] S;
  output Y;
  reg Y;

  wire A,B,C;

  //assign A=S[0]; // time consuming error
  //assign B=S[1]; // Why was this incorrect?
  //assign C=S[2];

  always @(S or I)
  begin
    //if (A==1)
    if(S[0]==1)
    begin
      if(S[1]==1)
      begin
        if(S[2]==1)
          Y=I[7];
        else
          Y=I[6];
      end
      else
      begin
      if(S[2]==1)
        Y=I[5];
      else
        Y=I[4];
      end
    end
    else
    begin
      if(S[1]==1)
      begin
        if(S[2]==1)
          Y=I[3];
        else
        begin
          $display("time=%0d,S=%b,I2=%b, Y=%b",$time,S,I[2],Y);
          Y=I[2];
          $display("time=%0d,S=%b,I2=%b, Y=%b",$time,S,I[2],Y);
        end
      end
      else
        begin
        if(S[2]==1)
          Y=I[1];
        else
          Y=I[0];
      end
    end
  end

endmodule

