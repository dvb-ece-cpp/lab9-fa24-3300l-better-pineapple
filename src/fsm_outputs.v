`timescale 1ns / 1ps

module fsm_outputs(
		  input [3:0]  state,
		  output reg     enable_store,
		  output reg [1:0] location,
		  output reg [1:0] color_out
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

   localparam		       RED = 0;
   localparam		       YELLOW = 1;
   localparam		       GREEN = 2;
   localparam		       BLUE = 3;

   // write verilog here to create these signals:
   //
   //    enable_store, location[1:0], and color_out[1:0] 
   // 
   // from the current state.  You can use multiple always blocks or assign statements.
   //
   // Make sure a value is determined for every possible state, since this is a combinatorial module.
   
   always @(*)
   begin
    case(state)
        PROGRAM_MODE:
        begin
            color_out = YELLOW;
            location = 0;
            enable_store = 1;
        end
            
        ONE_CORRECT:
        begin
            color_out = YELLOW;
            location = 0;
            enable_store = 0;
        end
        
        TWO_CORRECT:
        begin
            color_out = YELLOW;
            location = 0;
            enable_store = 0;
        end
        
        THREE_CORRECT:
        begin
            color_out = YELLOW;
            location = 0;
            enable_store = 0;
        end
        
        FOUR_CORRECT:
        begin
            color_out = GREEN;
            location = 0;
            enable_store = 0;
        end
        
        ONE_WRONG:
        begin
            color_out = YELLOW;
            location = 0;
            enable_store = 0;
        end
        
        TWO_WRONG:
        begin
            color_out = YELLOW;
            enable_store = 0;
        end
        
        THREE_WRONG:
        begin
            color_out = YELLOW;
            location = 0;
            enable_store = 0;
        end
        
        FOUR_WRONG:
        begin
            color_out = RED;
            location = 0;
            enable_store = 0;
        end
        
        ONE_SET:
        begin
            color_out = YELLOW;
            enable_store = 1;
            location = 1;
        end
        
        TWO_SET:
        begin
            color_out = YELLOW;
            enable_store = 1;
            location = 2;
        end
        
        THREE_SET:
        begin
            color_out = YELLOW;
            enable_store = 1;
            location = 3;
        end
        
        FOUR_SET:
        begin
            color_out = BLUE;
            enable_store = 0; 
            location = 3;     
        end
        
        default: 
        begin
            color_out = YELLOW;
            location = 0;
            enable_store = 0;
        end
     endcase
   end
   
endmodule
   
