`timescale 1ns / 1ps

module store_combo(
		  input	       clk,
		  output [3:0] combo_1,
		  output [3:0] combo_2,
		  output [3:0] combo_3,
		  output [3:0] combo_4,
		  input [3:0]  combo_press,
		  input	       pressed,
		  input	       enable_store,
		  input [1:0]  location
		  );

   reg [3:0]		       combo_1_store = 4'b1000;
   reg [3:0]		       combo_2_store = 4'b1000;
   reg [3:0]		       combo_3_store = 4'b1000;
   reg [3:0]		       combo_4_store = 4'b1000;

   assign combo_1 = combo_1_store;
   assign combo_2 = combo_2_store;
   assign combo_3 = combo_3_store;
   assign combo_4 = combo_4_store;
   
   always @(posedge clk)
     begin
	if (enable_store & pressed) begin
	   case (location)
	     0: combo_1_store <= combo_press;
	     1: combo_2_store <= combo_press;
	     2: combo_3_store <= combo_press;
	     3: combo_4_store <= combo_press;
	   endcase 
	end
     end

endmodule
   
