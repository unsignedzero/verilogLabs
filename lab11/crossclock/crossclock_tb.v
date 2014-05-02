/* Cross Clock Test Bench Module
 */

`include "crossclock.v"

module crossclock_tb(
    readMode,   // Specifies if we want to read to the FIFO
    writeMode,  // Specifies if we want to write to the FIFO
    inputPacket // The input packet
);

  parameter bits = 8;
  parameter ad_length = 3;
  parameter length = 1<<3;

  output readMode, writeMode;
  reg readMode, writeMode;

  output [bits-1:0] inputPacket;
  reg [bits-1:0] inputPacket;

  reg clkA, clkB, rst;

  output [bits-1:0] outputPacket;
  wire [bits-1:0] outputPacket;

  reg writeEnable;

  crossclock FIFO(.wrEnable(writeEnable),
                  .inputData(inputPacket),
                  .outputData(outputPacket),
                  .clkA(clkA),
                  .clkB(clkB),
                  .rst(rst)
                  );

  initial
  begin
    clkA=0;
    forever #5 clkA=~clkA;
  end

  initial
  begin
    clkB=0;
    forever #7 clkB=~clkB;
  end

  initial
  begin
    forever begin
      @(posedge clkA or posedge clkB); begin // Only output on positive edge
        $display("time=%04d RWE=%b%b%b I=%h O=%h clkA=%b clkB=%b", $time,
            readMode, writeMode, writeEnable, inputPacket, outputPacket, clkA, clkB);
      end
    end
  end

  initial
  begin
    // Test Case I: Write to capacity and empty
    $display("Resetting cross clock FIFO");
    rst = 1;
    writeEnable = 0;
    readMode = 0;
    writeMode = 0;
    inputPacket = {length{1'b0}};
    #20 rst = 0;
    #40
    #20 writeEnable = 1; writeMode = 1; inputPacket = {length{1'b1}};
    $display("Writing");
    #80 writeEnable = 0; writeMode = 0; readMode = 1; inputPacket = {length{1'b0}};
    $display("Reading");
    #80 readMode = 0;
    if (outputPacket === {bits{1'b1}}) begin
      $display("Pass");
    end else begin
      $display("Fail");
    end
    $finish;
  end

endmodule
