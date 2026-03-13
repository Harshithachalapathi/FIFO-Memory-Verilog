`timescale 1ns/1ps

module fifo_tb;

reg clk;
reg reset;
reg write;
reg read;
reg [7:0] data_in;

wire [7:0] data_out;
wire full;
wire empty;

fifo uut(
.clk(clk),
.reset(reset),
.write(write),
.read(read),
.data_in(data_in),
.data_out(data_out),
.full(full),
.empty(empty)
);

always #5 clk = ~clk;

initial begin

$dumpfile("dump.vcd");
$dumpvars(0,fifo_tb);

clk = 0;
reset = 1;

#10 reset = 0;

write = 1; data_in = 8'd10; #10;
data_in = 8'd20; #10;
data_in = 8'd30; #10;

write = 0;
read = 1; #10;
#10;
#10;

$finish;

end

endmodule
