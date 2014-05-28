/* An 8 clock of latency shift-register FIFO. (8bit queue)
 *
 * This really is an 8 bit circular array with a write pointer that moves but
 * it will always read from position zero. Reading empty values will
 * return zero.
 *
 * Created by David Tran
 * Version 0.1.0.0
 * Last Modified:04-24-2014
 */

module shift_fifo (
    readMode,  // Specifies if we want to read from the FIFO
    writeMode, // Specifies if we want to write form the FIFO
    inputBit,  // The input bit to write to the shift-register
    outputBit, // The output bit to read from the shift-register
    clk,       // Clock input
    rst        // Reset input
  );

  input readMode, writeMode, clk, rst;
  input inputBit;

  output outputBit;
  reg outputBit;

  reg [7:0] curData; // This contains the full queue.
  reg [2:0] topPtr;  // This is the current write pointer (top) of the queue.

  always @(posedge clk or posedge rst)
    if (rst) begin
      topPtr  <= 3'h0;
      curData <= 8'h00;
    end else begin
      if (readMode) begin
        {curData, outputBit} <= {1'b0, curData}; // Read out "zeroth" bit
        topPtr <= topPtr - 1;                    // Change pointer location
      end else if (writeMode) begin
        curData[topPtr] <= inputBit; // Write in new bit
        topPtr <= topPtr + 1;        // Change pointer location
      end
    end

endmodule

