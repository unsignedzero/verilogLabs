/* The test bench for an 8 bit shift-register FIFO.
 *
 * Created by David Tran
 */

`include "shift_fifo.v"

module shift_fifo_tb (
    readMode,  // Specifies if we want to read
    writeMode, // Specifies if we want to write
    inputData  // The input bits to write to the shift-register
  );

  output readMode, writeMode, inputData;
  reg readMode, writeMode, inputData;

  wire outputData;
  reg clk, rst;

  shift_fifo fifoInstance (readMode, writeMode, inputData,
      outputData, clk, rst);

  initial
  begin
    clk=0;
    forever #5 clk=~clk;
  end

  initial
  begin
    forever begin
      @(posedge clk);
        $display("time=%04d RW=%b%b IO=%b%b clk=%b", $time,
            readMode, writeMode, inputData, outputData, clk);
    end
  end

  initial
  begin
    readMode = 0;
    writeMode = 0;
    inputData = 0;
    #5 rst = 1;
    #5 rst = 0;
    #5 inputData = 1; writeMode = 1;
    #80 readMode = 1; writeMode = 0; inputData = 0;
    #80 readMode = 0;
    if (1'b1 === outputData) begin // Check if last value is 1
      $display("Pass");
    end else begin
      $display("Fail");
    end
    #10 $finish;
  end

endmodule

