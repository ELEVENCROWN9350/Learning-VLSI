module full_adder (
    input  wire a,
    input  wire b,
    input  wire cin,
    output wire sum,
    output wire cout
);

    // Logic equations for a Full Adder:
    // Sum  = A ⊕ B ⊕ Cin
    // Cout = (A · B) + (Cin · (A ⊕ B))
    
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (cin & (a ^ b));

endmodule
