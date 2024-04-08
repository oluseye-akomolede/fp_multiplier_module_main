`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2024 04:32:34 AM
// Design Name: 
// Module Name: top_adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

import tb_pkg::*;
module top_mult(

    );
    
    logic clk;
    initial begin
        clk = 0;
        #5ns clk = 1;
        #5ns clk = 0;
        forever
            #5ns clk = ~clk;
        
    end
    
    mult_ifc rx(clk);
    mult_ifc tx(clk);
    fp_mult_sig fpm(
                         .i_clk(rx.DUT.i_clk),
                         .s_axis_a_tvalid(rx.DUT.s_axis_a_tvalid),
                         .s_axis_a_tready(rx.DUT.s_axis_a_tready),
                         .s_axis_a_tdata(rx.DUT.s_axis_a_tdata),
                         .s_axis_b_tvalid(rx.DUT.s_axis_b_tvalid),
                         .s_axis_b_tready(rx.DUT.s_axis_b_tready),
                         .s_axis_b_tdata(rx.DUT.s_axis_b_tdata),
                         .m_axis_result_tvalid(rx.DUT.m_axis_result_tvalid),
                         .m_axis_result_tready(rx.DUT.m_axis_result_tready),
                         .m_axis_result_tdata(rx.DUT.m_axis_result_tdata)
                     );
    test t1(rx,rx);
                     
endmodule: top_mult
