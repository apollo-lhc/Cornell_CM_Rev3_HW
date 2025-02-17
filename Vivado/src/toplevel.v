
`default_nettype none
`define C_GTY_REFCLKS_USED 14

module top (
    input  wire p_clk_200,
    input  wire n_clk_200,
    input  wire p_lf_x12_r0_clk,
    input  wire n_lf_x12_r0_clk,
    input  wire p_lf_x4_r0_clk,
    input  wire n_lf_x4_r0_clk,
    input  wire p_rt_x12_r0_clk,
    input  wire n_rt_x12_r0_clk,
    input  wire p_rt_x4_r0_clk,
    input  wire n_rt_x4_r0_clk,
    //input  wire fpga_identity,
    output wire led_f1_blue,
    output wire led_f1_green,
    output wire led_f1_red,
    output wire led_f2_blue,
    output wire led_f2_green,
    output wire led_f2_red,
    input  wire mcu_to_f,
    output wire f_to_mcu,
    //output wire c2c_ok,
    inout  wire i2c_scl_f_sysmon,
    inout  wire i2c_sda_f_sysmon,
    inout  wire i2c_scl_f_generic,
    inout  wire i2c_sda_f_generic,
    // input  wire p_tcds_in,
    // input  wire n_tcds_in,
    // output wire p_tcds_out,
    // output wire n_tcds_out,
    // input  wire p_tcds_from_zynq_a,
    // input  wire n_tcds_from_zynq_a,
    // output wire p_tcds_to_zynq_a,
    // output wire n_tcds_to_zynq_a,
    // input  wire p_tcds_cross_recv_a,
    // input  wire n_tcds_cross_recv_a,
    // output wire p_tcds_cross_xmit_a,
    // output wire n_tcds_cross_xmit_a,
    // output wire p_tcds_recov_clk,
    // output wire n_tcds_recov_clk,
    input  wire p_tcds40_clk,
    input  wire n_tcds40_clk,
    input  wire p_lhc_clk,
    input  wire n_lhc_clk,

    input  wire p_rt_r0_l,
    input  wire n_rt_r0_l,
    input  wire p_rt_r1_l,
    input  wire n_rt_r1_l,
    //input  wire p_mgt_sm_to_f_1,
    //input  wire n_mgt_sm_to_f_1,
    // output wire p_mgt_f_to_sm_1,
    // output wire n_mgt_f_to_sm_1,
    // input  wire p_mgt_sm_to_f_2,
    // input  wire n_mgt_sm_to_f_2,
    // // output wire p_mgt_f_to_sm_2,
    // output wire n_mgt_f_to_sm_2,
    // input  wire p_c2c_cross_recv_b,
    // input  wire n_c2c_cross_recv_b,
    // // output wire p_c2c_cross_xmit_b,
    // output wire n_c2c_cross_xmit_b,
    input  wire p_lf_r0_ad,
    input  wire p_lf_r0_ab,
    input  wire n_lf_r0_ab,
    input  wire n_lf_r0_ad,
    input  wire p_lf_r1_ad,
    input  wire n_lf_r1_ad,
    input  wire p_lf_r1_ab,
    input  wire n_lf_r1_ab,
    input  wire p_lf_r0_r,
    input  wire n_lf_r0_r,
    input  wire p_lf_r1_r,
    input  wire n_lf_r1_r,
    input  wire p_lf_r0_u,
    input  wire n_lf_r0_u,
    input  wire p_lf_r1_u,
    input  wire n_lf_r1_u,
    input  wire p_lf_r0_y,
    input  wire n_lf_r0_y,
    input  wire p_lf_r1_y,
    input  wire n_lf_r1_y,
    input  wire p_lf_r0_af,
    input  wire n_lf_r0_af,
    input  wire p_lf_r1_af,
    input  wire n_lf_r1_af,
    input  wire p_lf_r0_w,
    input  wire n_lf_r0_w,
    input  wire p_lf_r1_w,
    input  wire n_lf_r1_w,
    input  wire p_rt_r0_n,
    input  wire n_rt_r0_n,
    input  wire p_rt_r1_n,
    input  wire n_rt_r1_n,
    input  wire p_rt_r0_b,
    input  wire n_rt_r0_b,
    input  wire p_rt_r1_b,
    input  wire n_rt_r1_b,
    input  wire p_rt_r0_e,
    input  wire n_rt_r0_e,
    input  wire p_rt_r1_e,
    input  wire n_rt_r1_e,
    input  wire p_rt_r0_g,
    input  wire n_rt_r0_g,
    input  wire p_rt_r1_g,
    input  wire n_rt_r1_g,
    input  wire p_rt_r0_p,
    input  wire n_rt_r0_p,
    input  wire p_rt_r1_p,
    input  wire n_rt_r1_p,
    input  wire p_rt_r0_i,
    input  wire n_rt_r0_i,
    input  wire p_rt_r1_i,
    input  wire n_rt_r1_i,

    // input  wire p_ff1_recv[11:0],
    // input  wire n_ff1_recv[11:0],
    // output wire p_ff1_xmit[11:0],
    // output wire n_ff1_xmit[11:0],
    // input  wire p_ff2_recv[11:0],
    // input  wire n_ff2_recv[11:0],
    // output wire p_ff2_xmit[11:0],
    // output wire n_ff2_xmit[11:0],
    // input  wire p_ff3_recv[11:0],
    // input  wire n_ff3_recv[11:0],
    // output wire p_ff3_xmit[11:0],
    // output wire n_ff3_xmit[11:0],
    // input  wire p_ff4_recv[11:0],
    // input  wire n_ff4_recv[11:0],
    // output wire p_ff4_xmit[11:0],
    // output wire n_ff4_xmit[11:0],
    // input  wire p_ff5_recv[3:0],
    // input  wire n_ff5_recv[3:0],
    // output wire p_ff5_xmit[3:0],
    // output wire n_ff5_xmit[3:0],
    // input  wire p_ff6_recv[3:0],
    // input  wire n_ff6_recv[3:0],
    // output wire p_ff6_xmit[3:0],
    // output wire n_ff6_xmit[3:0],
    // input  wire p_a_recv[3:0],
    // input  wire n_a_recv[3:0],
    // output wire p_a_xmit[3:0],
    // output wire n_a_xmit[3:0],
    // input  wire p_b_recv[3:0],
    // input  wire n_b_recv[3:0],
    // output wire p_b_xmit[3:0],
    // output wire n_b_xmit[3:0],
    // input  wire p_c_recv[3:0],
    // input  wire n_c_recv[3:0],
    // output wire p_c_xmit[3:0],
    // output wire n_c_xmit[3:0],
    // input  wire p_d_recv[3:0],
    // input  wire n_d_recv[3:0],
    // output wire p_d_xmit[3:0],
    // output wire n_d_xmit[3:0],
    // input  wire p_e_recv[3:0],
    // input  wire n_e_recv[3:0],
    // output wire p_e_xmit[3:0],
    // output wire n_e_xmit[3:0],
    // input  wire p_f_recv[3:0],
    // input  wire n_f_recv[3:0],
    // output wire p_f_xmit[3:0],
    // output wire n_f_xmit[3:0],
    // input  wire p_g_recv[3:0],
    // input  wire n_g_recv[3:0],
    // output wire p_g_xmit[3:0],
    // output wire n_g_xmit[3:0],
    // input  wire p_h_recv[3:0],
    // input  wire n_h_recv[3:0],
    // output wire p_h_xmit[3:0],
    // output wire n_h_xmit[3:0],
    // input  wire p_i_recv[3:0],
    // input  wire n_i_recv[3:0],
    // output wire p_i_xmit[3:0],
    // output wire n_i_xmit[3:0],
    // input  wire p_j_recv[3:0],
    // input  wire n_j_recv[3:0],
    // output wire p_j_xmit[3:0],
    // output wire n_j_xmit[3:0],
    // input  wire p_m_recv[3:0],
    // input  wire n_m_recv[3:0],
    // output wire p_m_xmit[3:0],
    // output wire n_m_xmit[3:0],
    // input  wire p_n_recv[3:0],
    // input  wire n_n_recv[3:0],
    // output wire p_n_xmit[3:0],
    // output wire n_n_xmit[3:0],
    // input  wire p_o_recv[3:0],
    // input  wire n_o_recv[3:0],
    // output wire p_o_xmit[3:0],
    // output wire n_o_xmit[3:0],
    // input  wire p_p_recv[3:0],
    // input  wire n_p_recv[3:0],
    // output wire p_p_xmit[3:0],
    // output wire n_p_xmit[3:0],
       input  wire p_test_conn_0,
       input  wire n_test_conn_0,
       output wire p_test_conn_1,
       output wire n_test_conn_1
    // input  wire p_test_conn_2,
    // input  wire n_test_conn_2,
    // input  wire p_test_conn_3,
    // input  wire n_test_conn_3,
    // input  wire p_test_conn_4,
    // input  wire n_test_conn_4,
    // input  wire test_conn_5,
    // output wire test_conn_6//,
    // input  wire p_in_spare[2:0],
    // input  wire n_in_spare[2:0],
    // output wire p_out_spare[2:0],
    // output wire n_out_spare[2:0],
    //input  wire hdr1,
    //output  wire hdr2
    // input  wire hdr3,
    // input  wire hdr4,
    // input  wire hdr5,
    // input  wire hdr6,
    // input  wire hdr7,
    // input  wire hdr8,
    // input  wire hdr9,
    // input  wire hdr10
);
    // Differential clock input buffers -- logic clocks
    wire clk_200, lf_x12_r0_clk, lf_x4_r0_clk, rt_x12_r0_clk, rt_x4_r0_clk, tcds40_clk, lhc_clk;

    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("TRUE")
    ) IBUFDS_clk_200 (
        .I(p_clk_200),
        .IB(n_clk_200),
        .O(clk_200)
    );

    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("TRUE")
    ) IBUFDS_lf_x12_r0_clk (
        .I(p_lf_x12_r0_clk),
        .IB(n_lf_x12_r0_clk),
        .O(lf_x12_r0_clk)
    );

    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("TRUE")
    ) IBUFDS_lf_x4_r0_clk (
        .I(p_lf_x4_r0_clk),
        .IB(n_lf_x4_r0_clk),
        .O(lf_x4_r0_clk)
    );

    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("TRUE")
    ) IBUFDS_rt_x12_r0_clk (
        .I(p_rt_x12_r0_clk),
        .IB(n_rt_x12_r0_clk),
        .O(rt_x12_r0_clk)
    );

    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("TRUE")
    ) IBUFDS_rt_x4_r0_clk (
        .I(p_rt_x4_r0_clk),
        .IB(n_rt_x4_r0_clk),
        .O(rt_x4_r0_clk)
    );

    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("TRUE")
    ) IBUFDS_tcds40_clk (
        .I(p_tcds40_clk),
        .IB(n_tcds40_clk),
        .O(tcds40_clk)
    );

    IBUFDS #(
        .DIFF_TERM("TRUE"),
        .IBUF_LOW_PWR("TRUE")
    ) IBUFDS_lhc_clk (
        .I(p_lhc_clk),
        .IB(n_lhc_clk),
        .O(lhc_clk)
    );

    // UART
    wire uart_tx, uart_rx;
    IBUFDS IBUFDS_uart_rx (
        .I(p_test_conn_0),
        .IB(n_test_conn_0),
        .O(uart_rx)
    );
    OBUFDS OBUFDS_uart_tx (
        .O(p_test_conn_1),
        .OB(n_test_conn_1),
        .I(uart_tx)
    );
    

    wire reset;
    assign reset = mcu_to_f;    
    
    // Instantiate frequency counters
    // lf_x12_r0_clk
    wire [31:0] freq_lf_x12_r0_clk;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_lf_x12_r0_clk (
        .ref_clk(clk_200),
        .reset(reset),
        .f(lf_x12_r0_clk),
        .freq(freq_lf_x12_r0_clk)
    );
    // lhc_clk
    wire [31:0] freq_lhc_clk;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_lhc_clk (
        .ref_clk(clk_200),
        .reset(reset),
        .f(lhc_clk),
        .freq(freq_lhc_clk)
    );
    // tcds40_clk
    wire [31:0] freq_tcds40_clk;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_tcds40_clk (
        .ref_clk(clk_200),
        .reset(reset),
        .f(tcds40_clk),
        .freq(freq_tcds40_clk)
    );

    // refclocks

    wire [`C_GTY_REFCLKS_USED-1:0] refclkp [1:0];
    wire [`C_GTY_REFCLKS_USED-1:0] refclkn [1:0];
    wire [`C_GTY_REFCLKS_USED-1:0] refclk [1:0];

    assign refclkp[0] = {p_lf_r0_r, p_lf_r0_ab, p_lf_r0_ad, p_lf_r0_u, p_lf_r0_y, p_lf_r0_af, p_lf_r0_w,
                         p_rt_r0_l, p_rt_r0_n, p_rt_r0_b, p_rt_r0_e, p_rt_r0_g, p_rt_r0_p, p_rt_r0_i};
    assign refclkn[0] = {n_lf_r0_r, n_lf_r0_ab, n_lf_r0_ad, n_lf_r0_u, n_lf_r0_y, n_lf_r0_af, n_lf_r0_w,
                         n_rt_r0_l, n_rt_r0_n, n_rt_r0_b, n_rt_r0_e, n_rt_r0_g, n_rt_r0_p, n_rt_r0_i};

    assign refclkp[1] = {p_lf_r1_r, p_lf_r1_ab, p_lf_r1_ad, p_lf_r1_u, p_lf_r1_y, p_lf_r1_af, p_lf_r1_w,
                         p_rt_r1_l, p_rt_r1_n, p_rt_r1_b, p_rt_r1_e, p_rt_r1_g, p_rt_r1_p, p_rt_r1_i};
    assign refclkn[1] = {n_lf_r1_r, n_lf_r1_ab, n_lf_r1_ad, n_lf_r1_u, n_lf_r1_y, n_lf_r1_af, n_lf_r1_w,
                         n_rt_r1_l, n_rt_r1_n, n_rt_r1_b, n_rt_r1_e, n_rt_r1_g, n_rt_r1_p, n_rt_r1_i};

    wire  [`C_GTY_REFCLKS_USED-1:0] clk_odiv2 [1:0];
    wire  [`C_GTY_REFCLKS_USED-1:0] clk_odiv2_b [1:0];

    wire [31:0] freqs0 [`C_GTY_REFCLKS_USED-1:0];
    wire [31:0] freqs1 [`C_GTY_REFCLKS_USED-1:0];


    genvar gi;
    generate
        for (gi = 0; gi < `C_GTY_REFCLKS_USED; gi++)
        begin
            IBUFDS_GTE4 u_buf_q1_clk0
            (
                .O            (refclk      [0][gi]),
                .ODIV2        (clk_odiv2_b [0][gi]),
                .CEB          (1'b0),
                .I            (refclkp [0][gi]),
                .IB           (refclkn [0][gi])
            );
        
            IBUFDS_GTE4 u_buf_q1_clk1
            (
                .O            (refclk      [1][gi]),
                .ODIV2        (clk_odiv2_b [1][gi]),
                .CEB          (1'b0),
                .I            (refclkp [1][gi]),
                .IB           (refclkn [1][gi])
            );
            BUFG_GT odiv2_buf0
            (
                .I        (clk_odiv2_b [0][gi]),
                .O        (clk_odiv2   [0][gi]),
                .CE       (1'b1),
                .CEMASK   (1'b0),
                .CLR      (1'b0),
                .CLRMASK  (1'b0),
                .DIV      (3'b000)
            );
            BUFG_GT odiv2_buf1
            (
                .I        (clk_odiv2_b [1][gi]),
                .O        (clk_odiv2   [1][gi]),
                .CE       (1'b1),
                .CEMASK   (1'b0),
                .CLR      (1'b0),
                .CLRMASK  (1'b0),
                .DIV      (3'b000)
            );

            frequency_counter #(
                .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
            ) freq_counter_refclk0 (
                .ref_clk(clk_200),
                .reset(reset),
                .f(clk_odiv2[0][gi]),
                .freq(freqs0[gi])
            );

            frequency_counter #(
                .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
            ) freq_counter_refclk1 (
                .ref_clk(clk_200),
                .reset(reset),
                .f(clk_odiv2[1][gi]),
                .freq(freqs1[gi])
            );
        end
    endgenerate
    // ...existing code...
    wire [31:0] freq;
    wire [7:0] address;

    reg_map #(
        .NUM_RW(2),
        .NUM_RO(2*`C_GTY_REFCLKS_USED+8)
    ) rmap (
        .clk(clk_200),
        .rst(reset),
        .addr(address[6:2]),
        .wdata(longword),
        .write_en(i2c_dout_dv_delayed),
        .rdata(freq),
        .status({freq_clk_325, freq_lhc_clk, freq_tcds40_clk, freq_lf_x12_r0_clk, freq_rt_x4_r0_clk, freq_rt_x12_r0_clk, freq_lf_x4_r0_clk, freq_clk_100, 
                 freqs0[13], freqs0[12], freqs0[11], freqs0[10],
                 freqs0[9], freqs0[8], freqs0[7], freqs0[6], freqs0[5], freqs0[4], freqs0[3], freqs0[2], freqs0[1], freqs0[0],
                 freqs1[13], freqs1[12], freqs1[11], freqs1[10],
                 freqs1[9], freqs1[8], freqs1[7], freqs1[6], freqs1[5], freqs1[4], freqs1[3], freqs1[2], freqs1[1], freqs1[0]
                })
    );
    // One-to-four demux that puts an input byte into the right position in a longword
    reg [31:0] longword;
    reg [7:0] i2c_byte;
    reg i2c_dout_dv_delayed;
    wire i2c_dout_dv;

    always @(posedge clk_200 or posedge reset) begin
        if (reset) begin
            longword <= 32'b0; // Initialize longword to zero on reset
        end else if (i2c_dout_dv) begin
            case (address[1:0])
                2'b00: longword[7:0] <= i2c_byte;
                2'b01: longword[15:8] <= i2c_byte;
                2'b10: longword[23:16] <= i2c_byte;
                2'b11: longword[31:24] <= i2c_byte;
                default: longword <= 32'b0;
            endcase
        end
    end
    // Delayed version of i2c_dout_dv
    always @(posedge clk_200 or posedge reset) begin
        if (reset) begin
            i2c_dout_dv_delayed <= 1'b0;
        end else begin
            i2c_dout_dv_delayed <= i2c_dout_dv;
        end
    end

    // rt_x4_r0_clk
    wire [31:0] freq_rt_x4_r0_clk;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_rt_x4_r0_clk (
        .ref_clk(clk_200),
        .reset(reset),
        .f(rt_x4_r0_clk),
        .freq(freq_rt_x4_r0_clk)
    );
    // rt_x12_r0_clk
    wire [31:0] freq_rt_x12_r0_clk;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_rt_x12_r0_clk (
        .ref_clk(clk_200),
        .reset(reset),
        .f(rt_x12_r0_clk),
        .freq(freq_rt_x12_r0_clk)
    );
    // lf_x4_r0_clk
    wire [31:0] freq_lf_x4_r0_clk;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_lf_x4_r0_clk (
        .ref_clk(clk_200),
        .reset(reset),
        .f(lf_x4_r0_clk),
        .freq(freq_lf_x4_r0_clk)
    );

    // clk_100
    wire [31:0] freq_clk_100;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_clk_100 (
        .ref_clk(clk_200),
        .reset(reset),
        .f(clk_100),
        .freq(freq_clk_100)
    );
    
    // clk_325
    wire [31:0] freq_clk_325;
    frequency_counter #(
        .CLOCK_FREQ(200_000_000) // Set clock frequency to 200 MHz
    ) freq_counter_clk_325 (
        .ref_clk(clk_200),
        .reset(reset),
        .f(clk_325),
        .freq(freq_clk_325)
    );


    wire i2c_scl_f_generic_o, i2c_scl_f_generic_i, i2c_scl_f_generic_t;
    IOBUF IOBUF_i2c_scl_f_generic (
        .O(i2c_scl_f_generic_i),
        .I(1'b0),
        .T(1'b1),
        .IO(i2c_scl_f_generic)
    );
    wire i2c_sda_f_generic_o, i2c_sda_f_generic_i, i2c_sda_f_generic_t;
    IOBUF IOBUF_i2c_sda_f_generic (
        .O(i2c_sda_f_generic_i),
        .I(i2c_sda_f_generic_o),
        .T(~i2c_sda_f_generic_t),
        .IO(i2c_sda_f_generic)
    );
    // instantiate i2c slave
    wire [6:0] i2c_address ;
    wire [7:0] i2c_dout;

    
    assign i2c_address = 7'h2b;
    i2c_slave  #(
        .REGISTER_COUNT_BIT_SIZE(8)
    ) i2c_slave_f_generic (
        .reset(reset),
        .clk(clk_7),
        .sda_in(i2c_sda_f_generic_i),
        .sda_out(i2c_sda_f_generic_o),
        .sda_en(i2c_sda_f_generic_t),
        .scl(i2c_scl_f_generic_i),
        .address(i2c_address),
        .data_out(i2c_dout),
        .data_out_dv(i2c_dout_dv),
        .data_in(freq_byte),
        .register_address(address)
    );

    always @(posedge clk_200 or posedge reset) begin
        if (reset) begin
            i2c_byte <= 8'b0;
        end else if (i2c_dout_dv) begin
            i2c_byte <= i2c_dout;
        end
    end

//    // create a mux to address the frequency counters
//    reg [31:0] freq;
//    always @* begin
//        case (address[4:2])
//            3'b000: freq = freq_lf_x12_r0_clk;
//            3'b001: freq = freq_lhc_clk;
//            3'b010: freq = freq_tcds40_clk;
//            3'b011: freq = freq_rt_x4_r0_clk;
//            3'b100: freq = freq_rt_x12_r0_clk;
//            3'b101: freq = freq_lf_x4_r0_clk;
//            3'b110: freq = freq_clk_100;
//            3'b111: freq = freq_clk_325;
//            default: freq = 32'h5a5a5a5a;
//        endcase
//    end
    // mux to select byte within freq bus
    reg [7:0] freq_byte;
    always @* begin
        case (address[1:0])
            2'b00: freq_byte = freq[7:0];
            2'b01: freq_byte = freq[15:8];
            2'b10: freq_byte = freq[23:16];
            2'b11: freq_byte = freq[31:24];
            default: freq_byte = 8'b0; // not needed -- all cases specified
        endcase
    end
    
//    mux m(
//        .data(freq),
//        .out(freq_byte),
//        .sel(address[1:0])
//        );

    vio_freq (
        .clk(clk_200),
        .probe_in0(freq_lf_x12_r0_clk),
        .probe_in1(1'b0),
        .probe_in2(1'b0),
        .probe_in3(freq_rt_x4_r0_clk),
        .probe_in4(freq_rt_x12_r0_clk),
        .probe_in5(freq_lf_x4_r0_clk),
        .probe_in6(freq_clk_100),
        .probe_in7(freq_clk_325),
        .probe_out0()
    );


    wire i2c_scl_f_sysmon_o, i2c_scl_f_sysmon_i, i2c_scl_f_sysmon_t;
    IOBUF I2C_SCLK_inst (
        .O(i2c_scl_f_sysmon_i), // Buffer output
        .IO(i2c_scl_f_sysmon), // Buffer inout port (connect directly to top-level port)
        .I(1'b0), // Buffer input
        .T(i2c_scl_f_sysmon_t) // 3-state enable input, high=input, low=output
    );
    wire i2c_sda_f_sysmon_o, i2c_sda_f_sysmon_i, i2c_sda_f_sysmon_t;
    IOBUF I2C_SDA_inst (
        .O(i2c_sda_f_sysmon_i), // Buffer output
        .IO(i2c_sda_f_sysmon), // Buffer inout port (connect directly to top-level port)
        .I(1'b0), // Buffer input
        .T(i2c_sda_f_sysmon_t) // 3-state enable input, high=input, low=output
    );

//  SYSMONE4   : In order to incorporate this function into the design,
//   Verilog   : the following instance declaration needs to be placed
//  instance   : in the body of the design code.  The instance name
// declaration : (SYSMONE4_inst) and/or the port declarations within the
//    code     : parenthesis may be changed to properly reference and
//             : connect this function to the design.  All inputs
//             : and outputs must be connected.

//  <-----Cut code below this line---->

   // SYSMONE4: AMD Analog-to-Digital Converter and System Monitor
   //           Virtex UltraScale+
   // Xilinx HDL Language Template, version 2023.2

   SYSMONE4 #(
      // INIT_40 - INIT_44: SYSMON configuration registers
      .INIT_40(16'h0000),
      .INIT_41(16'h0000),
      .INIT_42(16'h0000),
      .INIT_43(16'h4680), // enable I2C, really only bit 7 matters
      .INIT_44(16'h0000),
      .INIT_45(16'h0000),              // Analog Bus Register.
      // INIT_46 - INIT_4F: Sequence Registers
      .INIT_46(16'h0000),
      .INIT_47(16'h0000),
      .INIT_48(16'h0000),
      .INIT_49(16'h0000),
      .INIT_4A(16'h0000),
      .INIT_4B(16'h0000),
      .INIT_4C(16'h0000),
      .INIT_4D(16'h0000),
      .INIT_4E(16'h0000),
      .INIT_4F(16'h0000),
      // INIT_50 - INIT_5F: Alarm Limit Registers
      .INIT_50(16'h0000),
      .INIT_51(16'h0000),
      .INIT_52(16'h0000),
      .INIT_53(16'h0000),
      .INIT_54(16'h0000),
      .INIT_55(16'h0000),
      .INIT_56(16'h0000),
      .INIT_57(16'h0000),
      .INIT_58(16'h0000),
      .INIT_59(16'h0000),
      .INIT_5A(16'h0000),
      .INIT_5B(16'h0000),
      .INIT_5C(16'h0000),
      .INIT_5D(16'h0000),
      .INIT_5E(16'h0000),
      .INIT_5F(16'h0000),
      // INIT_60 - INIT_6F: User Supply Alarms
      .INIT_60(16'h0000),
      .INIT_61(16'h0000),
      .INIT_62(16'h0000),
      .INIT_63(16'h0000),
      .INIT_64(16'h0000),
      .INIT_65(16'h0000),
      .INIT_66(16'h0000),
      .INIT_67(16'h0000),
      .INIT_68(16'h0000),
      .INIT_69(16'h0000),
      .INIT_6A(16'h0000),
      .INIT_6B(16'h0000),
      .INIT_6C(16'h0000),
      .INIT_6D(16'h0000),
      .INIT_6E(16'h0000),
      .INIT_6F(16'h0000),
      // Primitive attributes: Primitive Attributes
      .COMMON_N_SOURCE(16'hffff),      // Sets the auxiliary analog input that is used for the Common-N input.
      // Programmable Inversion Attributes: Specifies the use of the built-in programmable inversion on
      // specific pins
      .IS_CONVSTCLK_INVERTED(1'b0),    // Optional inversion for CONVSTCLK, 0-1
      .IS_DCLK_INVERTED(1'b0),         // Optional inversion for DCLK, 0-1
      // Simulation attributes: Set for proper simulation behavior
      .SIM_DEVICE("ULTRASCALE_PLUS"),  // Sets the correct target device for simulation functionality.
      .SIM_MONITOR_FILE("design.txt"), // Analog simulation data file name
      // User Voltage Monitor: SYSMON User voltage monitor
      .SYSMON_VUSER0_BANK(0),          // Specify IO Bank for User0
      .SYSMON_VUSER0_MONITOR("NONE"),  // Specify Voltage for User0
      .SYSMON_VUSER1_BANK(0),          // Specify IO Bank for User1
      .SYSMON_VUSER1_MONITOR("NONE"),  // Specify Voltage for User1
      .SYSMON_VUSER2_BANK(0),          // Specify IO Bank for User2
      .SYSMON_VUSER2_MONITOR("NONE"),  // Specify Voltage for User2
      .SYSMON_VUSER3_MONITOR("NONE")   // Specify Voltage for User3
   )
   SYSMONE4_inst (
      // ALARMS outputs: ALM, OT
      .ALM(),                   // 16-bit output: Output alarm for temp, Vccint, Vccaux and Vccbram
      .OT(),                     // 1-bit output: Over-Temperature alarm
      // Direct Data Out outputs: ADC_DATA
      .ADC_DATA(),         // 16-bit output: Direct Data Out
      // Dynamic Reconfiguration Port (DRP) outputs: Dynamic Reconfiguration Ports
      .DO(),                     // 16-bit output: DRP output data bus
      .DRDY(),                 // 1-bit output: DRP data ready
      // I2C Interface outputs: Ports used with the I2C DRP interface
      .I2C_SCLK_TS(i2c_scl_f_sysmon_t),   // 1-bit output: I2C_SCLK output port
      .I2C_SDA_TS(i2c_sda_f_sysmon_t),     // 1-bit output: I2C_SDA_TS output port
      .SMBALERT_TS(),   // 1-bit output: Output control signal for SMBALERT.
      // STATUS outputs: SYSMON status ports
      .BUSY(),                 // 1-bit output: System Monitor busy output
      .CHANNEL(),           // 6-bit output: Channel selection outputs
      .EOC(),                   // 1-bit output: End of Conversion
      .EOS(),                   // 1-bit output: End of Sequence
      .JTAGBUSY(),         // 1-bit output: JTAG DRP transaction in progress output
      .JTAGLOCKED(),     // 1-bit output: JTAG requested DRP port lock
      .JTAGMODIFIED(), // 1-bit output: JTAG Write to the DRP has occurred
      .MUXADDR(),           // 5-bit output: External MUX channel decode
      // Auxiliary Analog-Input Pairs inputs: VAUXP[15:0], VAUXN[15:0]
      .VAUXN(),               // 16-bit input: N-side auxiliary analog input
      .VAUXP(),               // 16-bit input: P-side auxiliary analog input
      // CONTROL and CLOCK inputs: Reset, conversion start and clock inputs
      .CONVST(),             // 1-bit input: Convert start input
      .CONVSTCLK(),       // 1-bit input: Convert start input
      .RESET(reset),               // 1-bit input: Active-High reset
      // Dedicated Analog Input Pair inputs: VP/VN
      .VN(),                     // 1-bit input: N-side analog input
      .VP(),                     // 1-bit input: P-side analog input
      // Dynamic Reconfiguration Port (DRP) inputs: Dynamic Reconfiguration Ports
      .DADDR(),               // 8-bit input: DRP address bus
      .DCLK(),                 // 1-bit input: DRP clock
      .DEN(),                   // 1-bit input: DRP enable signal
      .DI(),                     // 16-bit input: DRP input data bus
      .DWE(),                   // 1-bit input: DRP write enable
      // I2C Interface inputs: Ports used with the I2C DRP interface
      .I2C_SCLK(i2c_scl_f_sysmon_i), // 1-bit input: I2C_SCLK input port
      .I2C_SDA(i2c_sda_f_sysmon_i)   // 1-bit input: I2C_SDA input port
   );

   // End of SYSMONE4_inst instantiation
					
    // counter
    reg [31:0] counter;

    always @(posedge clk_200 or posedge reset) begin
        if (reset) begin
            counter <= 32'b0;
        end else begin
            counter <= counter + 1;
        end
    end

    // Assign the most significant bit of the counter to led_f1_red
    assign led_f1_red = counter[29];
    assign led_f1_blue = counter[28];
    
    wire [31:0] gpio_rtl_1_tri_o;
    wire clk_100, clk_325, clk_7;
    clk_wiz_0 clkwizard(
        .clk_200_in(clk_200),
        .clk_100(clk_100),
        .clk_325(clk_325),
        .clk_7(clk_7),
        .reset(reset)
    );


//module block_top_wrapper
//   (clk_100MHz,
//    gpio_rtl_0_tri_i,
//    gpio_rtl_1_tri_o,
//    reset_rtl_0,
//    uart_rtl_0_rxd,
//    uart_rtl_0_txd);

    // block design
    block_top_wrapper bd(
        .clk_100MHz(clk_100),
        .gpio_rtl_0_tri_i(freq),
        .gpio_rtl_1_tri_o(gpio_rtl_1_tri_o),
        .reset_rtl_0(reset),
        .uart_rtl_0_rxd(uart_rx),
        .uart_rtl_0_txd(uart_tx)
        );

//    assign led_f1_green = gpio_rtl_1_tri_o[0];
    assign led_f1_green = reset;
endmodule