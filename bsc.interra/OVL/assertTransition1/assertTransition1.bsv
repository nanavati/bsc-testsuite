/*************************************************************************************************************
Assertion-Checker: assert_transition

Description: test_expr transitions from start_state to next_state. 

Status: simulation should pass

Author: pktiwari@noida.interrasystems.com

Date: 03-06-2006 

*************************************************************************************************************/

import OVLAssertions::*;

typedef enum {First_State, Second_State, Third_State, Fourth_State, Fifth_State, Sixth_State, Seventh_State} FSM_State deriving (Eq, Bits);

(* synthesize *)
module assertTransition1 (Empty);

Reg#(FSM_State) state <- mkRegA(First_State);
Reg#(Bit#(3)) test_expr <- mkRegA(0);

let defaults = mkOVLDefaults;

AssertTransitionTest_IFC#(Bit#(3)) assertTran <- bsv_assert_transition(defaults);   

rule test(True);
    assertTran.test(test_expr);//test_expr : test_expr 
	assertTran.start(3'b010); // start_state : 3'b010
	assertTran.next(3'b011); //next_state : 3'b011
	
endrule

rule every (True);
    case (state)
    First_State:
	begin
	    state <= Second_State;
		test_expr  <= 3'b100;
	end
	Second_State:
	begin
	    state <= Third_State;
		test_expr  <= 3'b010;
	end
	Third_State:
	begin
	    state <= Fourth_State;
		test_expr  <= 3'b011;
	end
	Fourth_State:
	begin
	    state <= Fifth_State;
		test_expr <= 3'b100;
	end
	Fifth_State:
	begin
	    state <= Sixth_State;
		test_expr  <= 3'b110;
	end
	Sixth_State:
	begin
	     state <= Seventh_State;
	end
	Seventh_State:
	begin
	    state <= First_State;
	    $finish(0);
	end	
    endcase
endrule
endmodule
