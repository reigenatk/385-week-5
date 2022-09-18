module testbench();

timeunit 10ns;  // Half clock cycle at 50 MHz
            // This is the amount of time represented by #1 
timeprecision 1ns;


logic [9:0] SW;
logic	Clk, Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;

slc3_testtop s(
	.*
);


// Toggle the clock
// #1 means wait for a delay of 1 timeunit
always begin : CLOCK_GENERATION
#1 Clk = ~Clk;
end

initial begin: CLOCK_INITIALIZATION
    Clk = 0;
end 

initial begin: TEST_VECTORS

// Reset the state machine (buttons are active low, and reset is pressing both continue and run)
Run = 0;
Continue = 0;

#2 Run = 1;
#2 Continue = 1;

// press the Run button to run the cycle once
#5 Run = 0;
#2 Run = 1;

// we should now be at PauseIR2 state, press continue to load next instruction
#10 Continue = 0;
#2 Continue = 1;


end

endmodule