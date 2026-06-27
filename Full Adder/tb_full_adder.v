`timescale 1ns / 1ps

module tb_full_adder;

    // Inputs to the design (declared as 'reg' in testbenches)
    reg a;
    reg b;
    reg cin;

    // Outputs from the design (declared as 'wire' in testbenches)
    wire sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a(a),
        .b(b),
        .cin(cin),
        .sum(sum),
        .cout(cout)
    );

    // Stimulus process
    initial begin
        // Print header to the simulator console
        $display("Time\t A B Cin | Sum Cout");
        $display("------------------------");
        
        // Use $monitor to automatically print values whenever they change
        $monitor("%0dt\t %b %b  %b  |  %b    %b", $time, a, b, cin, sum, cout);

        // Test all 8 possible binary combinations
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;
        
        // Stop the simulation
        $finish;
    end

endmodule
