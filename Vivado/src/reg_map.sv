// register map. internal (r/w) and external (r/o) registers.

module reg_map #(
  // Number of read/write registers (e.g., control registers)
  parameter int NUM_RW    = 6,
  // Number of read-only registers (e.g., status registers)
  parameter int NUM_RO    = 2,
  // Bit-width of each register
  parameter int REG_WIDTH = 32,
  // Total number of registers = NUM_RW + NUM_RO
  parameter int NUM_REGS  = NUM_RW + NUM_RO,
  // Address width calculated from total registers
  parameter int ADDR_WIDTH = $clog2(NUM_REGS)
)(
  input  wire                   clk,
  input  wire                   rst,
  input  wire [ADDR_WIDTH-1:0]  addr,    // Address selects one of NUM_REGS registers
  input  wire [REG_WIDTH-1:0]   wdata,   // Data to write
  input  wire                   write_en,// Write enable signal
  output logic [REG_WIDTH-1:0]  rdata,   // Data read out
  // External status inputs for read-only registers (one per status reg)
  input  wire [REG_WIDTH-1:0] status [0:NUM_RO-1]
);

  //-------------------------------------------------------------------------
  // Internal Register Arrays:
  // - regs_rw: holds control registers that software can write.
  // - regs_ro: holds status registers updated from status signals.
  //-------------------------------------------------------------------------
  logic [REG_WIDTH-1:0] regs_rw [0:NUM_RW-1];
  logic [REG_WIDTH-1:0] regs_ro [0:NUM_RO-1];

  //-------------------------------------------------------------------------
  // Write Logic for Read/Write Registers:
  // Only addresses in the range [0, NUM_RW-1] are allowed to be written.
  //-------------------------------------------------------------------------
  always_ff @(posedge clk or posedge rst) begin
    if (rst) begin
      for (int i = 0; i < NUM_RW; i++) begin
        regs_rw[i] <= '0;
      end
    end else if (write_en && (addr < NUM_RW)) begin
      regs_rw[addr] <= wdata;
    end
  end

  //-------------------------------------------------------------------------
  // Update Read-Only (Status) Registers:
  // These registers capture status from external signals (or internal logic).
  //-------------------------------------------------------------------------
  integer i;

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      for (i = 0; i < NUM_RO; i = i + 1) begin
        regs_ro[i] <= {REG_WIDTH{1'b0}};
      end
    end else begin
      for (i = 0; i < NUM_RO; i = i + 1) begin
        regs_ro[i] <= status[i]; // Directly index the status port array
      end
    end
  end

  //-------------------------------------------------------------------------
  // Read Mux:
  // If the address is within the RW range, select from regs_rw.
  // Otherwise, select from regs_ro (with adjusted indexing).
  //-------------------------------------------------------------------------
  always_comb begin
    if (addr < NUM_RW)
      rdata = regs_rw[addr];
    else
      rdata = regs_ro[addr - NUM_RW];
  end

endmodule
