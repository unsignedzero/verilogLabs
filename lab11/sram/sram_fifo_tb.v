/* SRAM Test Bench
 *
 * Case I:
 * Tests the FIFO by writing eight 1s and reading them back.
 *
 * Created By: david Tran
 * Last Modified: 04-24-2014
 */

`include "sram_fifo.v"

module sram_fifo_tb (
    readMode,   // Specifies if we want to read to the FIFO
    writeMode,  // Specifies if we want to write to the FIFO
    inputPacket
  );

  parameter bits = 8;

  output readMode, writeMode;
  reg readMode, writeMode;

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
      @(posedge clk); // Only output on positive edge
        $display("time=%04d RW=%b%b I=%h O=%h clk=%b", $time,
            readMode, writeMode, inputPacket, outputPacket, clk);
    end
  end

  initial
  begin
    // Test Case I: Write to capacity and empty
    rst = 1;
    readMode = 0;
    writeMode = 0;
    #5 rst = 0;
    #5 inputPacket = {bits{1'b1}}; writeMode = 1;
    #80 writeMode = 0; readMode = 1; inputPacket = 0'h00;
    #80 readMode = 0;
    if (outputPacket === {bits{1'b1}}) begin
      $display("Pass");
    end else begin
       $display("Fail");
    end
    $finish;
  end

endmodule
