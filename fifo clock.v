module fifo (
    clk, rst, wr_en, rd_en,
    buf_in, buf_out,
    buf_empty, buf_full, fifo_counter
);

input clk, rst, wr_en, rd_en;
input [7:0] buf_in;
output [7:0] buf_out;
output buf_empty, buf_full;
output [7:0] fifo_counter;

reg [7:0] buf_out;
reg buf_empty, buf_full;
reg [7:0] fifo_counter;

reg [5:0] rd_ptr, wr_ptr;
reg [7:0] buf_mem [63:0];  

always @(fifo_counter) begin
    buf_empty = (fifo_counter == 0);
    buf_full  = (fifo_counter == 64);
end

always @(posedge clk or posedge rst) begin
    if (rst)
        fifo_counter <= 0;
    else begin
        case ({wr_en, rd_en})
            2'b10: if (!buf_full)  fifo_counter <= fifo_counter + 1;
            2'b01: if (!buf_empty) fifo_counter <= fifo_counter - 1;
            default: fifo_counter <= fifo_counter;
        endcase
    end
end

always @(posedge clk or posedge rst) begin
    if (rst)
        wr_ptr <= 0;
    else if (wr_en && !buf_full) begin
        buf_mem[wr_ptr] <= buf_in;
        wr_ptr <= wr_ptr + 1;
    end
end

always @(posedge clk or posedge rst) begin
    if (rst) begin
        rd_ptr <= 0;
        buf_out <= 0;
    end
    else if (rd_en && !buf_empty) begin
        buf_out <= buf_mem[rd_ptr];
        rd_ptr <= rd_ptr + 1;
    end
end

endmodule
