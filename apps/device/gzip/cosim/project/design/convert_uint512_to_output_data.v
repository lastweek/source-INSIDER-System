// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2017.4.op
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module convert_uint512_to_output_data (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_continue,
        ap_idle,
        ap_ready,
        outStream512_V_V_dout,
        outStream512_V_V_empty_n,
        outStream512_V_V_read,
        app_output_data_V_data_V_din,
        app_output_data_V_data_V_full_n,
        app_output_data_V_data_V_write,
        app_output_data_V_len_din,
        app_output_data_V_len_full_n,
        app_output_data_V_len_write,
        app_output_data_V_eop_din,
        app_output_data_V_eop_full_n,
        app_output_data_V_eop_write
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state4 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
input   ap_continue;
output   ap_idle;
output   ap_ready;
input  [511:0] outStream512_V_V_dout;
input   outStream512_V_V_empty_n;
output   outStream512_V_V_read;
output  [511:0] app_output_data_V_data_V_din;
input   app_output_data_V_data_V_full_n;
output   app_output_data_V_data_V_write;
output  [15:0] app_output_data_V_len_din;
input   app_output_data_V_len_full_n;
output   app_output_data_V_len_write;
output   app_output_data_V_eop_din;
input   app_output_data_V_eop_full_n;
output   app_output_data_V_eop_write;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg outStream512_V_V_read;

reg    ap_done_reg;
(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg    app_output_data_V_data_V_blk_n;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp0_stage0;
reg   [0:0] empty_n_reg_131;
reg    app_output_data_V_len_blk_n;
reg    app_output_data_V_eop_blk_n;
wire   [0:0] empty_n_fu_109_p1;
wire    ap_block_state2_pp0_stage0_iter0;
wire    app_output_data_V_len1_status;
reg    ap_block_state3_pp0_stage0_iter1;
reg    ap_block_pp0_stage0_11001;
reg   [511:0] tmp_V_reg_135;
wire   [0:0] tmp_eop_fu_117_p2;
reg   [0:0] tmp_eop_reg_140;
reg    ap_enable_reg_pp0_iter0;
reg    ap_block_state1;
reg    ap_block_pp0_stage0_subdone;
reg    ap_predicate_tran3to4_state2;
reg    app_output_data_V_len1_update;
reg    ap_block_pp0_stage0_01001;
wire    ap_CS_fsm_state4;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;

// power-on initialization
initial begin
#0 ap_done_reg = 1'b0;
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_done_reg <= 1'b0;
    end else begin
        if ((ap_continue == 1'b1)) begin
            ap_done_reg <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state4)) begin
            ap_done_reg <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_predicate_tran3to4_state2 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_n_reg_131 <= outStream512_V_V_empty_n;
        tmp_V_reg_135 <= outStream512_V_V_dout;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_fu_109_p1 == 1'd1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_eop_reg_140 <= tmp_eop_fu_117_p2;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_done = 1'b1;
    end else begin
        ap_done = ap_done_reg;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((empty_n_reg_131 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        app_output_data_V_data_V_blk_n = app_output_data_V_data_V_full_n;
    end else begin
        app_output_data_V_data_V_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((empty_n_reg_131 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        app_output_data_V_eop_blk_n = app_output_data_V_eop_full_n;
    end else begin
        app_output_data_V_eop_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (empty_n_reg_131 == 1'd1) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        app_output_data_V_len1_update = 1'b1;
    end else begin
        app_output_data_V_len1_update = 1'b0;
    end
end

always @ (*) begin
    if (((empty_n_reg_131 == 1'd1) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        app_output_data_V_len_blk_n = app_output_data_V_len_full_n;
    end else begin
        app_output_data_V_len_blk_n = 1'b1;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0) & (outStream512_V_V_empty_n == 1'b1))) begin
        outStream512_V_V_read = 1'b1;
    end else begin
        outStream512_V_V_read = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if ((~((ap_start == 1'b0) | (ap_done_reg == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_pp0_stage0_01001 = ((empty_n_reg_131 == 1'd1) & (app_output_data_V_len1_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_11001 = ((empty_n_reg_131 == 1'd1) & (app_output_data_V_len1_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_pp0_stage0_subdone = ((empty_n_reg_131 == 1'd1) & (app_output_data_V_len1_status == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1));
end

always @ (*) begin
    ap_block_state1 = ((ap_start == 1'b0) | (ap_done_reg == 1'b1));
end

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_block_state3_pp0_stage0_iter1 = ((empty_n_reg_131 == 1'd1) & (app_output_data_V_len1_status == 1'b0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

always @ (*) begin
    ap_predicate_tran3to4_state2 = ((tmp_eop_fu_117_p2 == 1'd1) & (empty_n_fu_109_p1 == 1'd1));
end

assign app_output_data_V_data_V_din = tmp_V_reg_135;

assign app_output_data_V_data_V_write = app_output_data_V_len1_update;

assign app_output_data_V_eop_din = tmp_eop_reg_140;

assign app_output_data_V_eop_write = app_output_data_V_len1_update;

assign app_output_data_V_len1_status = (app_output_data_V_len_full_n & app_output_data_V_eop_full_n & app_output_data_V_data_V_full_n);

assign app_output_data_V_len_din = ((tmp_eop_reg_140[0:0] === 1'b1) ? 16'd0 : 16'd64);

assign app_output_data_V_len_write = app_output_data_V_len1_update;

assign empty_n_fu_109_p1 = outStream512_V_V_empty_n;

assign tmp_eop_fu_117_p2 = ((outStream512_V_V_dout == 512'd0) ? 1'b1 : 1'b0);

endmodule //convert_uint512_to_output_data