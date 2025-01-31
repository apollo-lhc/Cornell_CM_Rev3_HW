module frequency_counter #(
    parameter CLOCK_FREQ = 100_000_000 // Default clock frequency is 100 MHz
)(
    input wire clk,        // Input clock
    input wire reset,      // Reset signal
    input wire signal_in,  // Signal whose frequency is to be measured
    output reg [31:0] freq // Frequency count
);

    reg [31:0] counter;    // Counter for clock cycles
    reg [31:0] signal_count; // Counter for signal edges

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            counter <= 32'b0;
            signal_count <= 32'b0;
            freq <= 32'b0;
        end else begin
            counter <= counter + 1;
            if (signal_in) begin
                signal_count <= signal_count + 1;
            end
            if (counter == CLOCK_FREQ) begin // Count for 1 second
                freq <= signal_count;
                counter <= 32'b0;
                signal_count <= 32'b0;
            end
        end
    end

endmodule