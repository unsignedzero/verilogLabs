/* SRAM FIFO
 *
 * A "wrapper" around the SRAM, converting it to a FIFO. Note that this is a
 * "dump" FIFO that does not CHECK if it is full or empty before reading, to
 * reduce the data path. This means that one can read old data if one
 * falls off or writes over previous data if falling off there.
 *
 * Created By: David Tran
 * Last Modified: 04-24-2014
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

  input [bits-1:0] inputPacket;
  wire [bits-1:0] inputPacket;

  output [bits-1:0] outputPacket;
  wire [bits-1:0] outputPacket;

  reg [2:0] readPtr;   // This is the current read pointer of the queue.
  reg [2:0] writePtr;  // This is the current write pointer of the queue.
  reg [2:0] address;   // This will be the address used to access the SRAM


  SRAM sram (.read(readMode),
             .write(writeMode),
             .address(address),
             .dataIn(inputPacket),
             .dataOut(outputPacket),
             .clk(clk)
  );

  always @(posedge rst)
    if (rst) begin
      readPtr <= 3'h0;
      writePtr <= 3'h0;
      address <= 3'h0;
    end

  always @(readMode or writeMode)
    if (readMode) begin
      address = readPtr;
      readPtr = readPtr + 1;
    end else if (writeMode) begin
      address = writePtr;
      writePtr = writePtr + 1;
    end

endmodule

