module fifo(
input clk,
input reset,
input write,
input read,
input [7:0] data_in,
output reg [7:0] data_out,
output full,
output empty
);

reg [7:0] mem [0:7];
reg [2:0] write_ptr;
reg [2:0] read_ptr;
reg [3:0] count;

assign full = (count == 8);
assign empty = (count == 0);

always @(posedge clk or posedge reset)
begin

if(reset) begin
write_ptr <= 0;
read_ptr <= 0;
count <= 0;
end

else begin

if(write && !full) begin
mem[write_ptr] <= data_in;
write_ptr <= write_ptr + 1;
count <= count + 1;
end

if(read && !empty) begin
data_out <= mem[read_ptr];
read_ptr <= read_ptr + 1;
count <= count - 1;
end

end

end

endmodule
