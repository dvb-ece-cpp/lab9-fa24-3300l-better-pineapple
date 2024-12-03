`timescale 1ns / 1ps

// each instance of pwm_gen can be programmed with the parameter PWM_PERCENT to 
// output a different duty cycle.

module pwm_gen #(parameter PWM_PERCENT = 25) (
		 input [11:0] pwm_cnt,
		 output pwm_out
		 );

   // the 12-bit counter goes from 0 to 4095
   //  we want to check if pwm_cnt < (PWM_PERCENT / 100) * 4096
   //  to avoid division and fractions, we use:
   assign pwm_out = pwm_cnt < (PWM_PERCENT * 41);
   
endmodule

