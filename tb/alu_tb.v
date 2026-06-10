`timescale 1ns/1ps

module alu_tb;

    reg [31:0] a;
    reg [31:0] b;
    reg [3:0] alu_op;

    wire [31:0] result;
    wire zero;

    alu dut (
        .a(a),
        .b(b),
        .alu_op(alu_op),
        .result(result),
        .zero(zero)
    );

    initial begin
        $dumpfile("alu.vcd");
        $dumpvars(0, alu_tb);

        // ADD
        a = 32'd10;
        b = 32'd5;
        alu_op = 4'b0000;
        #10;

        if (result !== 32'd15)
            $display("ADD FAILED: got %d expected 15", result);
        else
            $display("ADD PASSED");

        // SUB
        a = 32'd10;
        b = 32'd5;
        alu_op = 4'b0001;
        #10;

        if (result !== 32'd5)
            $display("SUB FAILED: got %d expected 5", result);
        else
            $display("SUB PASSED");

        // AND
        a = 32'hF0F0_F0F0;
        b = 32'h0F0F_0F0F;
        alu_op = 4'b0010;
        #10;

        if (result !== 32'h0000_0000)
            $display("AND FAILED: got %h expected 00000000", result);
        else
            $display("AND PASSED");

        // OR
        a = 32'hF0F0_F0F0;
        b = 32'h0F0F_0F0F;
        alu_op = 4'b0011;
        #10;

        if (result !== 32'hFFFF_FFFF)
            $display("OR FAILED: got %h expected FFFFFFFF", result);
        else
            $display("OR PASSED");

        // XOR
        a = 32'hAAAA_AAAA;
        b = 32'hFFFF_0000;
        alu_op = 4'b0100;
        #10;

        if (result !== 32'h5555_AAAA)
            $display("XOR FAILED: got %h expected 5555AAAA", result);
        else
            $display("XOR PASSED");

        // ZERO flag
        a = 32'd5;
        b = 32'd5;
        alu_op = 4'b0001;
        #10;

        if (zero !== 1'b1)
            $display("ZERO FLAG FAILED");
        else
            $display("ZERO FLAG PASSED");

        $display("Simulation Complete");
        $finish;
    end

endmodule