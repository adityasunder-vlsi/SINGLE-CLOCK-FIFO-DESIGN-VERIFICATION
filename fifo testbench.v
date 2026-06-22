`timescale 1ns / 1ps

module fifo_tb;

    reg clk;
    reg rst;
    reg wr_en;
    reg rd_en;
    reg [7:0] buf_in;

    wire [7:0] buf_out;
    wire buf_empty;
    wire buf_full;
    wire [7:0] fifo_counter;

    fifo uut (
        .clk(clk),
        .rst(rst),
        .wr_en(wr_en),
        .rd_en(rd_en),
        .buf_in(buf_in),
        .buf_out(buf_out),
        .buf_empty(buf_empty),
        .buf_full(buf_full),
        .fifo_counter(fifo_counter)
    );


    always #5 clk = ~clk;

    initial begin

        clk = 0;
        rst = 1;
        wr_en = 0;
        rd_en = 0;
        buf_in = 0;

     
        #10;
        rst = 0;

 
        #10;
        wr_en = 1;
        buf_in = 8'd11;

        #10;
        buf_in = 8'd22;

        #10;
        buf_in = 8'd33;

        #10;
        wr_en = 0;

       
        #10;
        rd_en = 1;

        #10;
        #10;
        #10;

        rd_en = 0;

        #20;
        $finish;

    end

endmodule
