`timescale 1ns / 1ps

module master_fsm(
		  input	       clk,
		  input	       prog_sw, 
		  input	       clr,
		  input [3:0]  combo_1,
		  input [3:0]  combo_2,
		  input [3:0]  combo_3,
		  input [3:0]  combo_4,
		  input [3:0]  combo_press,
		  input	       pressed,
		  input envdone,
		  output [3:0] state_out,
		  output reg note_start,
		  output reg [7:0] note_out
		  );

   localparam		       IDLE = 0;
   localparam		       ONE_CORRECT = 1;
   localparam		       TWO_CORRECT = 2;
   localparam		       THREE_CORRECT = 3;
   localparam		       FOUR_CORRECT = 4;
   localparam		       ONE_WRONG = 5;
   localparam		       TWO_WRONG = 6;
   localparam		       THREE_WRONG = 7;
   localparam		       FOUR_WRONG = 8;
   localparam		       PROGRAM_MODE = 9;
   localparam		       ONE_SET = 10;
   localparam		       TWO_SET = 11;
   localparam		       THREE_SET = 12;
   localparam		       FOUR_SET = 13;
   localparam              PLAY = 14;
   localparam              PLAY_END = 15;

   reg [3:0]		       state = IDLE;
   reg [3:0]		       next_state;

   assign state_out = state;
   
   always @(posedge clk)
     begin
	state <= next_state;
	if (state == FOUR_WRONG)
	note_out <="G";
	else if (state == FOUR_CORRECT) 
	note_out <= "A";
     end

   always @(*)
     begin
	next_state = state;

	case (state)
	  IDLE:
	    if (prog_sw) begin
	       next_state = PROGRAM_MODE;
	    end else if (pressed) begin
	       if (combo_press == combo_1)
		 next_state = ONE_CORRECT;
	       else
		 next_state = ONE_WRONG;
	    end

	  PROGRAM_MODE:
	    if (~prog_sw) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = ONE_SET;
	    end
	    
	  ONE_SET:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = TWO_SET;
	    end
	    
	    TWO_SET:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = THREE_SET;
	    end
	    
	    THREE_SET:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = FOUR_SET;
	    end
	    
	    FOUR_SET:
	    if (clr) begin
	       next_state = IDLE;
	    end
	    
	    ONE_CORRECT:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       if (combo_press == combo_2)
		 next_state = TWO_CORRECT;
	       else
		 next_state = TWO_WRONG;
	    end
	    
	    TWO_CORRECT:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       if (combo_press == combo_3)
		 next_state = THREE_CORRECT;
	       else
		 next_state = THREE_WRONG;
	    end
	    
	    THREE_CORRECT:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       if (combo_press == combo_4)
		 next_state = FOUR_CORRECT;
	       else
		 next_state = FOUR_WRONG;
	    end
	    
	    FOUR_CORRECT:
        begin
           note_start = 1;
	       next_state=PLAY;
	    end
	    
	  ONE_WRONG:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = TWO_WRONG;
	    end
	    
	  TWO_WRONG:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = THREE_WRONG;
	    end

	  THREE_WRONG:
	    if (clr) begin
	       next_state = IDLE;
	    end else if (pressed) begin
	       next_state = FOUR_WRONG;
	    end
	    
	  FOUR_WRONG:
	  begin
           note_start = 1;
	       next_state=PLAY;
	  end

	  PLAY:
	  if(envdone) begin
	  note_start = 0;
	  next_state = PLAY_END;
	  end
	  
	  PLAY_END:
	    if (clr) begin
	       next_state = IDLE;
	    end
	    
	  default:
	      next_state = IDLE;
	      
	endcase
     end

endmodule
   
