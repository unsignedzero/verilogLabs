/* SRAM FIFO
 *
 * A "wrapper" around the SRAM, converting it to a FIFO. Note that this is a
 * "dump" FIFO that does not CHECK if it is full or empty before reading, to
 * reduce logic on the data path. This means that one can read old data if one
 * falls off or writes over previous data if landing on there.
 *
 * Created By David Tran
 * Version 0.1.0.0
 * Last Modified:05-01-2014
 */

`include "sram.v"

module SRAM_fifo(
    readMode,     // Specifies if we want to read from the FIFO
    writeMode,    // Specifies if we want to write form the FIFO
    inputPacket,  // The input bit to write to the shift-register (8bits)
    outputPacket, // The output bit to read from the shift-register (8bits)
    clk,          // Clock input
    rst           // Reset input
  );

  parameter bits = 8;
  parameter depth = 3;
  parameter ad_length = 1<<depth;

  input readMode, writeMode, clk, rst;

  reg readModeQ, writeModeQ;

  input [bits-1:0] inputPacket;
  wire [bits-1:0] inputPacket;

  reg [bits-1:0] inputPacketQ;

  output [bits-1:0] outputPacket;
  wire [bits-1:0] outputPacket;

  reg [2:0] readPtr;   // This is the current read pointer of the queue.
  reg [2:0] writePtr;  // This is the current write pointer of the queue.
  reg [2:0] address;   // This will be the address used to access the SRAM
  reg [2:0] nextReadPtr, nextWritePtr; // Sets the next pointer, to be used in the address.


  SRAM sram (.read(readModeQ),
             .write(writeModeQ),
             .address(address),
             .dataIn(inputPacketQ),
             .dataOut(outputPacket),
             .clk(clk)
  );

  always @(posedge clk or posedge rst)
    if (rst) begin
      readPtr <= 3'h0;
      writePtr <= 3'h0;
      address <= 3'h0;
      inputPacketQ <= {bits{1'b0}};
      nextReadPtr <= 3'h0;
      nextWritePtr <= 3'h0;
    end else begin

      // Stores the next value as current for the next iteration.
      readPtr = nextReadPtr;
      writePtr = nextWritePtr;

      if (readModeQ) begin
        address <= nextReadPtr;
      end else if (writeModeQ) begin
        address <= nextWritePtr;
      end

      // Updates the values in the queue.
      readModeQ = readMode;
      writeModeQ = writeMode;
      inputPacketQ = inputPacket;
    end

  // Moves the increment operation one cycle ahead.
  always @(readPtr or writePtr or readMode or writeMode) begin
    nextReadPtr <= readMode ? readPtr + 1: readPtr;
    nextWritePtr <= writeMode ? writePtr + 1: writePtr;
  end

endmodule

