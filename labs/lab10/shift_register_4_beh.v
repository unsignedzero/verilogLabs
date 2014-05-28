// Universal Shift Register
// Created by David Tran
// Version 0.0.0.0
// Last Modified 04-03-2014

`timescale 1 ns / 1 ps

//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {shift_register_4_beh}}
module shift_register_4_beh (a_par ,i_par ,s1 ,s0 ,msb_in ,lsb_in ,clk ,clear);

  output [3:0] a_par;
  reg [3:0] a_par;

  input [3:0] i_par;
  wire [3:0] i_par;
  input s0, s1;
  wire s0, s1;

  input lsb_in, msb_in;
  wire lsb_in, msb_in;
  input clk, clear;
  wire clk, clear;

//}} End of automatically maintained section

// -- Enter your statements here -- //

  always @(posedge clk or negedge clear)
    if (~clear)
      a_par<=4'b0000;
    else
      case ({s1,s0})
        2'b00:a_par<=a_par;
        2'b01:a_par<={msb_in, a_par[3:1]};
        2'b10:a_par<={a_par[2:0], lsb_in};
        2'b11:a_par<=i_par;
      endcase

endmodule
