// Decoder 4 -> 16 from 5 2-> 4
// Created by David Tran
// Last Modified 02/21/2014

// Extras
`timescale 1 ms /1 us
`include "decode24_enable.v"

module decode416 (in, out);

  input [0:3] in;
  wire [0:3] in;

  output [0:15] out;
  wire [0:15] out;

  wire [0:3] enableLine;

  decode24_enable selector (in[2], in[3], enableLine, 1'b0);
  decode24_enable gate0 (in[0], in[1], out[0:3]  , enableLine[0]);
  decode24_enable gate1 (in[0], in[1], out[4:7]  , enableLine[1]);
  decode24_enable gate2 (in[0], in[1], out[8:11] , enableLine[2]);
  decode24_enable gate3 (in[0], in[1], out[12:15], enableLine[3]);

endmodule

