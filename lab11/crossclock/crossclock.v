/* Cross Clock Module Untested
 *
 * Version 0.0.0.0
 * Last Modified: 05-02-2014
 * Created by David Tran
 */

module crossclock(wrEnable,
  inputData,
  outputData,
  clkA,
  clkB,
  rst);

  parameter bits = 8;
  parameter ad_length = 3;
  parameter length = 1<<3;

  parameter [2:0] GRAY0 = 3'b000;
  parameter [2:0] GRAY1 = 3'b001;
  parameter [2:0] GRAY2 = 3'b011;
  parameter [2:0] GRAY3 = 3'b010;
  parameter [2:0] GRAY4 = 3'b110;
  parameter [2:0] GRAY5 = 3'b111;
  parameter [2:0] GRAY6 = 3'b101;
  parameter [2:0] GRAY7 = 3'b100;

  input wrEnable, clkA, clkB, rst;
  input [bits-1:0] inputData;

  output [bits-1:0] outputData;
  wire [bits-1:0] outputData;

  wire wrEnable, rst;
  wire [bits-1:0] inputData;

  reg rstQA, rstA, rstQB, rstB;

  reg rdPtrAQQ, rdPtrAQ, wrPtrBQ, wrPtrBQQ;

  reg full;
  wire empty;

  reg [ad_length-1:0] wrPtrA, rdPtrA, wrPtrB, rdPtrB;

  reg [bits-1:0] FIFO [ad_length-1:0];

  always @(posedge clkA or negedge rstA)
    if(rstA)
      wrPtrA <= {ad_length{1'h0}};
    else if (wrEnable & !full)
      wrPtrA <= grayInc(wrPtrA);

  always @(posedge clkB or negedge rstB)
    if(!rstB)
      rdPtrB <= {ad_length{1'h0}};
    else if (!empty)
      rdPtrB <= grayInc(rdPtrB);

  always @(wrPtrA or rdPtrAQQ)
    case (wrPtrA)
      GRAY0: full = (rdPtrAQQ == GRAY1);
      GRAY1: full = (rdPtrAQQ == GRAY2);
      GRAY2: full = (rdPtrAQQ == GRAY3);
      GRAY3: full = (rdPtrAQQ == GRAY4);
      GRAY4: full = (rdPtrAQQ == GRAY5);
      GRAY5: full = (rdPtrAQQ == GRAY6);
      GRAY6: full = (rdPtrAQQ == GRAY7);
      GRAY7: full = (rdPtrAQQ == GRAY0);
    endcase

  always @(posedge clkA) begin
    if (wrEnable) begin
      FIFO[wrPtrA] <= inputData;
    end
    rdPtrAQQ <= rdPtrAQ;
  end

  always @(posedge clkB) begin
    wrPtrBQ <= wrPtrA;
    wrPtrBQQ <= wrPtrBQ;
  end

  // Dual Rank blocks
  always @(posedge clkA or negedge rst)
    if(!rst) begin
      rstQA <= 1'b0;
      rstA <= 1'b0;
    end else begin
      rstQA <= 1'b1;
      rstA <= rstQA;
    end

  always @(posedge clkB or negedge rst)
    if(!rst) begin
      rstQB <= 1'b0;
      rstB <= 1'b0;
    end else begin
      rstQB <= 1'b1;
      rstB <= rstQB;
    end

  // Reset Block
  always @(negedge rst) begin
    wrPtrA <= {ad_length{1'b0}};
    wrPtrB <= {ad_length{1'b0}};
    wrPtrBQ <= {ad_length{1'b0}};
    wrPtrBQQ <= {ad_length{1'b0}};

    rdPtrB <= {ad_length{1'b0}};
    rdPtrA <= {ad_length{1'b0}};
    rdPtrAQ <= {ad_length{1'b0}};
    rdPtrAQQ <= {ad_length{1'b0}};
  end


  assign empty = rdPtrB == wrPtrA;
  assign outputData = FIFO[rdPtrB];

  // Gray Add Function
  function [2:0] grayInc;
    input [2:0] greyInput;
    begin
      case (greyInput)
        GRAY0 : grayInc=GRAY1;
        GRAY1 : grayInc=GRAY2;
        GRAY2 : grayInc=GRAY3;
        GRAY3 : grayInc=GRAY4;
        GRAY4 : grayInc=GRAY5;
        GRAY5 : grayInc=GRAY6;
        GRAY6 : grayInc=GRAY7;
        GRAY7 : grayInc=GRAY0;
      endcase
    end
  endfunction

endmodule

//measly output rely on input and state
//moore output rely on state only
