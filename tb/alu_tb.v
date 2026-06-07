module alu_tb;

reg [31:0] a; //all are reg because they are changing input from user
reg [31:0] b;
reg [3:0] alu_op;

wire [31:0] result;

alu dut(.a(a)
    ,.b(b)
    ,.alu_op(alu_op)
    ,.result(result));

    initial begin
        a= 10;
        b=5;
        alu_op = 4'b0000;
        #10;
        $display("result = %d", result);

        alu_op = 4'b0001;
        $display("result = %d", result);

        $finish;

    end

endmodule