## Design ##

For this async shift-register we have six different I/O bits.

The two input mode bits (readMode and writeMode) are independent but read
has greater presidence then write so if both are set to high, then the FIFO
will read. If neither is on, the last value will be held on the output.

InputData is a bit that will be written into the FIFO, if writeMode is high.
outputData is a bit that will contain the output of the FIFO, if readMode is
high. If the FIFO is overflowed, the topPtr will be in a bad position and the
last value will be overwritten. Similarly the topPtr will be in a bad position
if we are reading before the first position. 1'b0 will return when returning
"unknown" values but the topPtr will have a non-zero value. This acts much like
a circular buffer with the same read/write pointers position and no notion
of full or empty.

The last two are the clock and reset respectively. Both trigger the FIFO
on the positive edge.

The FIFO is designed to hold at most 8 different bits. Any bit added will
override the last bit.

## Test ##

Case I:
The test bench resets the FIFO and then fills it completely and empties it
after. This can executed by compiling and running the test bench. If an equal amount
of writes and reads returns the correct value a "Pass" message is outputted.

This tests the read and write features under normal circumstances.

