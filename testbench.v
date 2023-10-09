module testbench;

    reg clk, reset;
    wire [3:0] q, ctrl;
    wire [7:0] segment ;

    mod12counter dut(clk, reset, q, segment, ctrl);

    always #1 clk = ~clk;

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0,testbench);
        clk <= 1'b0;
        reset = 1;
        #1 reset = 0;
        $monitor("clk = %d , count = %d\n",clk,q);
    end

    initial #100000 $finish;

endmodule