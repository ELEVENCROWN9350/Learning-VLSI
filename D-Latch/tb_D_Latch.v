`timescale 1ns / 1ps

module tb_D_latch;

    // Inputs (declared as reg)
    reg d;
    reg en;

    // Outputs (declared as wire)
    wire q;

    // Instantiate the Unit Under Test (UUT)
    D_latch uut (
        .d(d),
        .en(en),
        .q(q)
    );

    // Stimulus Process
    initial begin
        // Print header to the simulator console
        $display("Time\t en d | q");
        $display("-----------------");
        $monitor("%0dt\t  %b  %b | %b", $time, en, d, q);

        // Initialize inputs
        en = 0; d = 0; #10;
        
        // Test Case 1: Change D while Enable is LOW (q should remain uninitialized/stale)
        d = 1; #10;
        d = 0; #10;
        
        // Test Case 2: Turn Enable HIGH (Latch becomes transparent)
        en = 1; #10;  // q should immediately become 0 (matches d)
        
        // Test Case 3: Change D while Enable is HIGH (q should follow d immediately)
        d = 1; #10;  // q becomes 1
        d = 0; #10;  // q becomes 0
        d = 1; #10;  // q becomes 1
        
        // Test Case 4: Pull Enable LOW to lock/latch the value
        en = 0; #10;  // q should hold the value 1
        
        // Test Case 5: Change D while Enable is LOW (q must ignore changes and hold 1)
        d = 0; #10;
        d = 1; #10;
        d = 0; #10;

        // Stop the simulation
        $finish;
    end

endmodule
