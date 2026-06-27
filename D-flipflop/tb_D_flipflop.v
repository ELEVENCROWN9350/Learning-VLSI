`timescale 1ns / 1ps

module tb_D_flipflop;

    // Inputs (declared as reg)
    reg d;
    reg clk;

    // Outputs (declared as wire)
    wire q;

    // Instantiate the Unit Under Test (UUT)
    D_flipflop uut (
        .d(d),
        .clk(clk),
        .q(q)
    );

    // 1. Clock Generation Logic
    // Generates a 100MHz clock signal (period = 10ns)
    // Toggles every 5ns
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // 2. Stimulus Process
    initial begin
        // Print header to console
        $display("Time\t clk d | q");
        $display("-----------------");
        $monitor("%0dt\t  %b  %b | %b", $time, clk, d, q);

        // Initialize Data
        d = 0;
        #12; // Wait slightly past the first posedge clk to see behavior
        
        // Test Case 1: Set D to 1
        d = 1; 
        #10;  // Hold for a clock cycle
        
        // Test Case 2: Set D to 0
        d = 0; 
        #10;
        
        // Test Case 3: Change D just before the clock edge
        #2;
        d = 1;
        #8;
        
        // Test Case 4: Change D multiple times inside a cycle
        // Only the value at the active clock edge (posedge) will be latched
        d = 0; #3;
        d = 1; #3;
        d = 0; #4; 

        // Stop the simulation
        $finish;
    end

endmodule
