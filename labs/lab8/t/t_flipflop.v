// T Flip Flop
// Created by David Tran
// Last Modified: 03-14-2014

`include "jk_flipflop.v"

module t_ff (q, t, clk, reset);

  input t, clk, reset;
  wire t, clk, reset;

  output q;
  wire q;

  wire qb;

  jk_ff Instance1 (reset?1'b0:t, reset?1'b1:t, clk, q, qb);

endmodule

