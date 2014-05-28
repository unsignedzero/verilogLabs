//-----------------------------------------------------
// Design Name : dff_async_reset
// File Name   : dff_async_reset.v
// Function    : D flip-flop async reset
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module dff_async_reset (
    data   , // Data Input
    clk    , // Clock Input
    reset  , // Reset input
    q         // Q output
    );

  input data, clk, reset ;

  output q;

  reg q;

  always @ ( posedge clk or negedge reset)
  if (~reset) begin
    q <= 1'b0;
  end  else begin
    q <= data;
  end

endmodule
