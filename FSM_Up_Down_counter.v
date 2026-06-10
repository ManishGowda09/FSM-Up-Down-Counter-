`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 28.05.2026 13:26:23
// Design Name: 
// Module Name: FSM_Up_Down_counter
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


module FSM_Up_Down_counter( clk,rst,dir,z );

    input wire clk, rst, dir;
    output reg [1:0]z;
    reg [1:0]state;
    parameter s0=2'b00, s1=2'b01, s2=2'b10, s3=2'b11;
    
    always@( posedge clk ) begin
     if( rst == 1 )
       state <= s0;
       else
       state <= state;
     end
     
     always@( posedge clk ) begin
     case( state )
     s0 : begin
          if ( dir == 1 )
          #10 state <= s3;
          else #10 state <= s1;
          z <= 2'b00;
          end 
     
     s1 : begin
          if ( dir == 1 )
          #10 state <= s0;
          else #10 state <= s2;
          z <= 2'b01;
          end 
          
     s2 : begin
               if ( dir == 1 )
               #10 state <= s1;
               else #10 state <= s3;
               z <= 2'b10;
               end 
               
     s3 : begin
                    if ( dir == 1 )
                    #10 state <= s2;
                    else #10 state <= s0;
                    z <= 2'b11;
                    end 
     endcase
     end 
endmodule


module FSM_Up_Down_counter_tb();
reg clk,rst,dir;
wire [1:0]z;

FSM_Up_Down_counter u0(.clk(clk), .rst(rst), .dir(dir), .z(z));
initial begin
clk=1'b0;
#50;
forever #50 clk=~clk;
end

initial begin
rst=1'b1;
#100;
dir=1'b0;
#100; 
rst=1'b0;
#600;
dir=1'b1;
#600;
$finish;
end
endmodule