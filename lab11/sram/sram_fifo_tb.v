/* SRAM Test Bench
 *
 * Case I:
 * Tests the FIFO by writing the FF byte and reading them back.
 *
 * Created By: David Tran
 * Last Modified: 05-01-2014
 */

`include "sram_fifo.v"

module sram_fifo_tb (
    readMode,   // Specifies if we want to read to the FIFO
    writeMode,  // Specifies if we want to write to the FIFO
    inputPacket // The input packet
  );

  parameter bits = 8;

  output readMode, writeMode;
  reg readMode, writeMode;
  reg readModeQ;

  output [bits-1:0] inputPacket;
  reg [bits-1:0] inputPacket;

  reg clk, rst;
  wire [bits-1:0] outputPacket;

  SRAM_fifo SRAM (readMode, writeMode, inputPacket, outputPacket, clk, rst);

  initial
  begin
    clk=0;
    forever #5 clk=~clk;
  end

  initial
  begin
    forever begin
      @(posedge clk); begin // Only output on positive edge
        $display("time=%04d RW=%b%b I=%h O=%h clk=%b", $time,
            readModeQ, writeMode, inputPacket, outputPacket, clk);
        readModeQ = readMode;
      end
    end
  end

  initial
  begin
    // Test Case I: Write to capacity and empty
    rst = 1;
    readMode = 0;
    readModeQ = 0;
    writeMode = 0;
    #5 rst = 0;
    #5 inputPacket = {bits{1'b1}}; writeMode = 1;
    #80 writeMode = 0; readMode = 1; inputPacket = {bits{1'b0}};
    #90 readMode = 0;
    if (outputPacket === {bits{1'b1}}) begin
      $display("Pass");
    end else begin
      $display("Fail");
    end
    $finish;
  end

endmodule
