//-----------------------------------------------------
// Design Name : dff_sync_reset
// File Name   : dff_sync_reset.v
// Function    : D flip-flop sync reset
// Coder       : Deepak Kumar Tala
//-----------------------------------------------------
module dff_sync_reset (
    data   , // Data Input
    clk    , // Clock Input
    reset  , // Reset input
    q        // Q output
  );

  input data, clk, reset ;

  output q;

  reg q;

  always @ ( posedge clk)
  if (~reset) begin
    q <= 1'b0;
  end  else begin
    q <= data;
  end

endmodule
