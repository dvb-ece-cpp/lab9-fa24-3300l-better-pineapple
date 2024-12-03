`timescale 1ns / 1ps

module pwm_counter(clk, pwm_cnt);

   input  clk;
   output reg [11:0] pwm_cnt = 0;
		 
   always @(posedge clk)
     begin
	pwm_cnt <= pwm_cnt + 1;
     end

endmodule

