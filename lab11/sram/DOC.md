## Design ##

For this async sram FIFO we have six I/Os. For this module a packet is defined
to be one byte (8 bits).

The two input mode bits (readMode and writeMode) are independent. Should both
be high, the SRAM module itself will error out.

InputPacket is a packet that will be written into the FIFO, if writeMode is high.
outputPacket is a packet that will contain the output of the FIFO, if readMode is
high. If the FIFO is overflowed, the address will reset to 0 and the
last value will be overwritten. Similarly the address will be in a bad position
if we are reading before the first position. This acts much like a circular
buffer without knowledge of writing over something already. This is left for
the programmer to be aware of.

The last two are the clock and reset respectively. Both trigger the FIFO
on the positive edge.

The FIFO is designed to hold at most 8 different packet. Any extra bit added will
override the last bit and pointer position as well.

## Test ##

Case I:
The test bench "resets" the FIFO and then fills it completely and empties it
after. This can executed by compiling and running the test bench. With an
equal amount of writes and reads, not overflowing, a "Pass" message is outputted.

This tests the read and write features under normal circumstances.

