module alu(
    input [31:0] a,
    input [31:0] b,
    input [3:0] alu_op,
    output reg [31:0] result
);

always @(*) begin //allows for rerun when any input changes
    case(alu_op)
    default: result = 32'b0
        4'b0000:result = a+b; // use 4'b0000 because ADD is assigned to 0_10 
        4'b0001: result = a+(~b+1); //4'b0001 because SUB is assigned to 1_10

    endcase
end 

endmodule