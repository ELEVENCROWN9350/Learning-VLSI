module D_latch(
    input d,
    input en,
    output reg q
);

always @(d or en)
begin
    if(en)
        q = d;
end

endmodule
