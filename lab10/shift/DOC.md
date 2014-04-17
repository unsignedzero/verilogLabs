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
"unknown" values but the topPtr will have a non-zero value.

The last two are the clock and reset respectively. Both trigger the FIFO
on the positive edge.

## Test ##

The test bench resets the FIFO and then fills it completely and empties it
after.
