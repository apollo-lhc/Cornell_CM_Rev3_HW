`timescale 1ns / 1ps
// based on code originally written by Alex Madorsky. 
// Lightly modified. Thanks Alex!

module frequency_counter #(parameter CLOCK_FREQ = 32'd100_000_000)
(
    input logic ref_clk,
    input logic f,
    input logic reset,
    output reg [31:0] freq
);

    (* async_reg *) reg [31:0] cnt;
    reg [31:0] ref_cnt;

    always @(posedge ref_clk or posedge reset)
    begin
        if (reset) begin
            ref_cnt <= 32'h0;
            freq <= 32'h0;
        end else if (ref_cnt == CLOCK_FREQ) begin // 1 second just ended
            freq <= cnt;
            ref_cnt <= 32'h0;
        end else begin
            ref_cnt <= ref_cnt + 1;
        end
    end

    wire cnt_rst = (ref_cnt[31:3] == 29'h0) ? 1'b1 : 1'b0;

    always @(posedge f or posedge reset) 
    begin
        if (reset) begin
            cnt <= 32'h0;
        end else if (cnt_rst) begin
            cnt <= 32'h0; 
        end else begin
            cnt <= cnt + 1;
        end
    end

endmodule