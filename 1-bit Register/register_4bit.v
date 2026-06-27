module register_4bit(
    input [3:0] d,
    input clk,

    output [3:0] q
);

D_flipflop dff0(
    .d(d[0]),
    .clk(clk),
    .q(q[0])
);

D_flipflop dff1(
    .d(d[1]),
    .clk(clk),
    .q(q[1])
);

D_flipflop dff2(
    .d(d[2]),
    .clk(clk),
    .q(q[2])
);

D_flipflop dff3(
    .d(d[3]),
    .clk(clk),
    .q(q[3])
);

endmodule
