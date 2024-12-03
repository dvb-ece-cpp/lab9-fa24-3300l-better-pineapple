`timescale 1ns / 1ps

module tb_lab5();

   reg clk;
   reg prog_sw, clr_button, up_button, dn_button, lf_button, rt_button;
   
   wire	      led1_r, led1_g, led1_b;
   wire [3:0] fsm_state;
   
   combo_lock dut0 (
		    // Outputs
		    .led1_r		(led1_r),
		    .led1_g		(led1_g),
		    .led1_b		(led1_b),
		    .fsm_state		(fsm_state[3:0]),
		    // Inputs
		    .clk		(clk),
		    .prog_sw		(prog_sw),
		    .clr_button		(clr_button),
		    .up_button		(up_button),
		    .dn_button		(dn_button),
		    .lf_button		(lf_button),
		    .rt_button		(rt_button));
   
   sim_ledcolor tb_u2(
		      .clk		(clk),
		      .led_r		(led1_r),
		      .led_g		(led1_g),
		      .led_b		(led1_b),
		      .lednum		(1));

   always #(5) clk = ~clk;
   
   initial
     begin
        clk = 1'b0;
	prog_sw = 1'b0;
	clr_button = 1'b0;
	up_button = 1'b0;
	dn_button = 1'b0;
	lf_button = 1'b0;
	rt_button = 1'b0;

	// correct code (initial value is up-up-up-up)
	#1000;
	clr_button = 1'b1;
	#1000;
	clr_button = 1'b0;
	#1000;

	#100000;  // wait to detect if LED color changes
	
	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;
	
	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;

	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;

	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;

	// wrong code
	#1000;
	clr_button = 1'b1;
	#1000;
	clr_button = 1'b0;
	#1000;

	#100000;

	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;
	
	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;

	dn_button = 1'b1;
	#1000;
	dn_button = 1'b0;
	#1000;

	#100000;

	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;


	// program
	prog_sw = 1'b1;
	#1000;
	clr_button = 1'b1;
	#1000;
	clr_button = 1'b0;
	#1000;

	#100000;
	
	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;
	
	dn_button = 1'b1;
	#1000;
	dn_button = 1'b0;
	#1000;

	#100000;

	up_button = 1'b1;
	#1000;
	up_button = 1'b0;
	#1000;

	#100000;

	rt_button = 1'b1;
	#1000;
	rt_button = 1'b0;
	#1000;

	#100000;

	prog_sw = 1'b0;

//
// now add tests to make sure programmed code works,
//  and old code does not.	
//

        #1000;
        $finish;
     end

   initial
     begin
	$monitor("time = %0t, state = %d", $time, fsm_state);
     end
   
endmodule
