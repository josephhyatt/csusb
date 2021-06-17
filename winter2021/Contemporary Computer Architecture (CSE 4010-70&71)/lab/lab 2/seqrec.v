//Mealy finite state machine for locating a sequence of "110."
module seqrec(Y, X, RST, CLK);
input X, RST, CLK;
output Y;
reg Y;
reg [1:0] Prstate, Nxtstate;

//Reset, clock
always @ (posedge CLK or negedge RST)
	if(~RST) Prstate = 2'b00;
	else Prstate = Nxtstate;
	
//State Transitions
always @ (Prstate or X)
	case (Prstate)
	2'b00: if(X) Nxtstate = 2'b01; //Initial state
				else Nxtstate = 2'b00;
	2'b01: if(X) Nxtstate = 2'b10;
				else Nxtstate = 2'b00;
	2'b10: if(X) Nxtstate = 2'b10; //Loop if we encounter many 1 bits.
				else Nxtstate = 2'b00;
	endcase

//Handles output
always @ (Prstate or X)
	case (Prstate)
	2'b00: Y = 0;
	2'b01: Y = 0;
	2'b10: if(X) Y = 0; else Y = 1;
	endcase
endmodule
