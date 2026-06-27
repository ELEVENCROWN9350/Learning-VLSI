`timescale 1ns / 1ps

module tb_shift_register_4bit;

    // Inputs (declared as reg)
    reg clk;
    reg serial_in;

    // Outputs (declared as wire)
    wire [3:0] q;

    // Instantiate the Unit Under Test (UUT)
    shift_register_4bit uut (
        .clk(clk),
        .serial_in(serial_in),
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
        $display("Time\t clk serial_in | q[3] q[2] q[1] q[0]");
        $display("-------------------------------------------");
        $monitor("%0dt\t  %b       %b     |  %b    %b    %b    %b", $time, clk, serial_in, q[3], q[2], q[1], q[0]);

        // Initialize input data (Register defaults to 4'b0000 via your initial block)
        serial_in = 0;
        #12; // Move past the first clock edge to synchronize inputs

        // Test Case 1: Shift in a '1'
        serial_in = 1; #10; // On edge: q becomes 4'b1000
        
        // Test Case 2: Shift in another '1'
        serial_in = 1; #10; // On edge: q becomes 4'b1100
        
        // Test Case 3: Shift in a '0'
        serial_in = 0; #10; // On edge: q becomes 4'b0110
        
        // Test Case 4: Shift in a '1'
        serial_in = 1; #10; // On edge: q becomes 4'b1011
        
        // Test Case 5: Clear out the register by feeding '0's
        serial_in = 0; #10; // q becomes 4'b0101
        serial_in = 0; #10; // q becomes 4'b0010
        serial_in = 0; #10; // q becomes 4'b0001
        serial_in = 0; #10; // q becomes 4'b0000

        // Stop the simulation
        $finish;
    end

endmodule
