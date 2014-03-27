
module fig5p16 ( y_out, x_in, clock, reset);

  output y_out;
  reg y_out;

  input x_in, clock, reset ;
  wire x_in, clock, reset ;


  reg[1:0] state;
  reg[1:0] next_state;

  parameter S0=2'b00;
  parameter S1=2'b01;
  parameter S2=2'b10;
  parameter S3=2'b11;

  always @(posedge clock or negedge reset)
    if (reset==0)
      state<=S0;
    else
      state<=next_state;

  always @(state or x_in)
    case(state)

    endcase

  always @(state or x_in)
    case (state)

    endcase

endmodule

