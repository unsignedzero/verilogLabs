/* SRAM implementation
 *
 * Implements an SRAM with each entry holding eight bits and eight entries
 * total.
 *
 * Created By David Tran
 * Version 0.1.0.0
 * Last Modified:05-01-2014
 */

module SRAM(read,    // Specifies if we want to read from the FIFO
            write,   // Specifies if we want to write form the FIFO
            address, // Specifies the address for read/write
            dataIn,  // The input packet
            dataOut, // The output packet
            clk      // Clock input
);

  parameter bits = 8;
  parameter depth = 3;
  parameter ad_length = 1<<depth;

  input read;
  input write;

  input [depth-1:0] address; //2^depth = address

  input [bits-1:0] dataIn;
  output [bits-1:0] dataOut;
  reg [bits-1:0] dataOut;

  input clk;

  reg [bits-1:0] memArray [ad_length-1:0];

  always @(posedge clk) begin
    if(write)
      memArray[address] <= dataIn;
    if(read)
      dataOut <= memArray[address];
    if (read & write) begin
      $display("ERROR: simultaneous read and write to memory");
      dataOut <= {bits{1'bx}};
      $stop;
    end
  end

endmodule

