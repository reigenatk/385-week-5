// this file was taken from lab 3 and made 16-bit wide

module two_to_one_mux(
	input logic [15:0] A, 
	input logic [15:0] B, 
	input logic S, 
	output logic [15:0] D
);

always_comb
	begin
		if (S == 1'b0)
			D = A;
		else
			D = B;
	end
endmodule

module four_to_one_mux(
	input logic [15:0] A, 
	input logic [15:0] B, 
	input logic [15:0] C, 
	input logic [15:0] D, 
	input logic [1:0] S, 
	output logic [15:0] Out
);

always_comb
	begin
		unique case (S)
			2'b00 : Out = A;
			2'b01 : Out = B;
			2'b10 : Out = C;
			2'b11 : Out = D;
		endcase
	end
endmodule

module bus_mux(
	input logic [15:0] A, 
	input logic [15:0] B, 
	input logic [15:0] C, 
	input logic [15:0] D, 
	input logic [3:0] S, 
	output logic [15:0] Out
);

always_comb
	begin
		unique case (S)
			4'b1000 : Out = A;
			4'b0100 : Out = B;
			4'b0010 : Out = C;
			4'b0001 : Out = D;
		endcase
	end
endmodule