/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_PWM (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  // All output pins must be assigned. If not used, assign to 0.

PWM_module c1 (
    .clock(clk), 
    .enable(ui_in[3]), 
    .speed(ui_in[2:0]), 
    .PWM(uo_out[0])
);

    assign uio_oe = 8'b0; 
    assign uio_out = 8'b0; 
    assign uo_out [7:1] = 0;    

  // List all unused inputs to prevent warnings
    wire _unused = &{uio_in[7:0], ui_in[7:4], ena, rst_n};

endmodule
