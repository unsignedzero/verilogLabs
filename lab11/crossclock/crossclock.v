/*
 */

module (leftInput, leftOutput, rightInput, rightOutput, leftClk, leftRst, rightClk, leftRst);

  input leftInput, rightInput, leftClk, rightClk;
  wire leftClk, rightClk;

  output leftOutput, rightOutput;

  reg[1:0] ltr;

  task [2:0] grayAdd( greyInput );
    case greyInput
       GRAY0
  endtask

endmodule;

  parameter GRAY0 = 3b'000;
  parameter GRAY1 = 3b'001;
  parameter GRAY2 = 3b'011;
  parameter GRAY3 = 3b'010;
  parameter GRAY4 = 3b'110;
  parameter GRAY5 = 3b'111;
  parameter GRAY6 = 3b'101;
  parameter GRAY7 = 3b'100;


//measly output rely on input and state
//moore output rely on state only
