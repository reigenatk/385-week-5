module datapath(
	input logic Clk, Reset,
	input logic LD_MAR, LD_MDR, LD_IR, LD_BEN, LD_CC, LD_REG, LD_PC, LD_LED,
	input logic GatePC, GateMDR, GateALU, GateMARMUX,
	input logic SR2MUX, ADDR1MUX, MARMUX,
	input logic BEN, MIO_EN, DRMUX, SR1MUX,
	input logic [1:0] PCMUX, ADDR2MUX, ALUK,
	input logic [15:0] MDR_In,
	output logic [15:0] IR_out, MAR_out, MDR_out, PC_out
);

logic [15:0] Bus; // this is driven by a MUX (4-1)

logic [15:0] PC_mux_out, PC_reg_out;
logic [15:0] IR_reg_out;
logic [15:0] MDR_mux_out, MDR_reg_out;
logic [15:0] MAR_reg_out;
logic [15:0] ALU_out;
logic [15:0] Add_out;

assign IR_out = IR_reg_out;
assign MAR_out = MAR_reg_out;
assign MDR_out = MDR_reg_out;
assign PC_out = PC_reg_out;

// Bus Mux
bus_mux bmux(.A(ALU_out), .B(PC_reg_out), .C(MDR_reg_out), .D(Add_out), .S({GateALU, GatePC, GateMDR, GateMARMUX}), .Out(Bus));

// PC
four_to_one_mux PC_mux(.A(Bus), .B(), .C(PC_reg_out+1'b1), .D(), .S(PCMUX), .Out(PC_mux_out));
reg_16 PC(.Clk, .Reset, .Load(LD_PC), .D(PC_mux_out), .Data_Out(PC_reg_out)); 

// IR
reg_16 IR(.Clk, .Reset, .Load(LD_IR), .D(Bus), .Data_Out(IR_reg_out)); 


// MDR
two_to_one_mux MDR_mux(.A(Bus), .B(MDR_In), .S(MIO_EN), .D(MDR_mux_out));
reg_16 MDR(.Clk, .Reset, .Load(LD_MDR), .D(MDR_mux_out), .Data_Out(MDR_reg_out)); 


// MAR
reg_16 MAR(.Clk, .Reset, .Load(LD_MAR), .D(Bus), .Data_Out(MAR_reg_out)); 

endmodule
