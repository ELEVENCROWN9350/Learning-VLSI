`timescale 1ns / 1ps

module tb_register_4bit;

    // Inputs (declared as reg)
    reg [3:0] d;
    reg clk;

    // Outputs (declared as wire)
    wire [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    register_4bit uut (
        .d(d),
        .clk(clk),
        .q(q)
    );

    // 1. Clock Generation Logic
    // Generates a 100MHz clock signal (period = 10ns)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggles every 5ns
    end

    // 2. Stimulus Process
    initial begin
        // Print header to the simulator console
        $display("Time\t clk  d   |  q");
        $display("---------------------");
        $monitor("%0dt\t  %b  %b | %b (Hex: d=%h, q=%h)", $time, clk, d, q, d, q);

        // Initialize inputs
        d = 4'b0000;
        #12; // Wait past the first posedge clk to stabilize

        // Test Case 1: Load decimal 5 (4'b0101)
        d = 4'b0101; 
        #10; // Hold for a full clock cycle

        // Test Case 2: Load decimal 10 (4'b1010)
        d = 4'b1010; 
        #10;

        // Test Case 3: Load maximum value 15 (4'b1111)
        d = 4'b1111; 
        #10;

        // Test Case 4: Change data mid-cycle (Register should ignore it until next posedge)
        d = 4'b0011; 
        #3;
        d = 4'b0110; // This value hits the active clock edge
        #7;

        // Test Case 5: Clear register back to 0
        d = 4'b0000;
        #10;

        // Stop the simulation
        $finish;
    end

endmodule
