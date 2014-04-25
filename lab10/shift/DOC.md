## Design ##

For this async shift-register we have six different I/O bits.

The two input mode bits (readMode and writeMode) are independent and read
has greater precedence then write so if both are set to high, then the FIFO
will read. If neither is on, the last value will be held on the output.

InputData is a bit that will be written into the FIFO, if writeMode is high.
outputData is a bit that will contain the output of the FIFO, if readMode is
high. If the FIFO is overflowed, the topPtr will reset to 0 and the
last value will be overwritten. Similarly the topPtr will be in a bad position
if we are reading before the first position. A zero bit will be returned if the
shift-register is empty but torPtr will be to seven, the end of the queue.
This acts like a circular buffer with a pointer on writing but we will always
read at the zeroth position.

The last two are the clock and reset respectively. Both trigger the FIFO
on the positive edge.

The FIFO is designed to hold at most 8 different bits. Any extra bit added will
override the last bit and pointer position as well.

## Test ##

Case I:
The test bench resets the FIFO and then fills it completely and empties it
after. This can executed by compiling and running the test bench. With an
equal amount of writes and reads, not overflowing, a "Pass" message is outputted.

This tests the read and write features under normal circumstances.

