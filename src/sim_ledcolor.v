`timescale 1ns / 1ps

module sim_ledcolor(
    input clk,
    input led_r, led_g, led_b,
    input [31:0] lednum		    
    );

   reg [11:0]	 running_duty_cycle_r;
   reg [11:0]	 running_duty_cycle_g;
   reg [11:0]	 running_duty_cycle_b;

   reg [11:0]	 counter = 0;

   reg [2:0]	 led_state;
   
   always @(posedge clk)
     begin
	running_duty_cycle_r <= (led_r) ? (running_duty_cycle_r + 1) : running_duty_cycle_r;
	running_duty_cycle_g <= (led_g) ? (running_duty_cycle_g + 1) : running_duty_cycle_g;
	running_duty_cycle_b <= (led_b) ? (running_duty_cycle_b + 1) : running_duty_cycle_b;
	counter <= counter + 1;
	if (counter == 0) begin
	   led_state[2] <= (running_duty_cycle_r > 100) ? 1 : 0;
	   led_state[1] <= (running_duty_cycle_g > 100) ? 1 : 0;
	   led_state[0] <= (running_duty_cycle_b > 100) ? 1 : 0;
	   running_duty_cycle_r <= 0;
	   running_duty_cycle_g <= 0;
	   running_duty_cycle_b <= 0;
	end
     end

   always @(led_state)
     begin
	case (led_state)
	  3'b000: $display("LED %d OFF",lednum);
	  3'b001: $display("LED %d BLUE",lednum);
	  3'b010: $display("LED %d GREEN",lednum);
	  3'b011: $display("LED %d CYAN",lednum);
	  3'b100: $display("LED %d RED",lednum);
	  3'b101: $display("LED %d MAGENTA",lednum);
	  3'b110: $display("LED %d YELLOW",lednum);
	  3'b111: $display("LED %d WHITE",lednum);
	endcase
     end	  

endmodule
