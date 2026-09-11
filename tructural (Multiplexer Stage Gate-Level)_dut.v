module barrel_shifter_lsr_4bit (
    input  wire [3:0] in,
    input  wire [1:0] shift, // shift[1] = shift by 2, shift[0] = shift by 1
    output wire [3:0] out
);

    wire [3:0] stage1;

    // Stage 1: Shift by 1 bit if shift[0] == 1
    assign stage1[3] = shift[0] ? 1'b0  : in[3];
    assign stage1[2] = shift[0] ? in[3] : in[2];
    assign stage1[1] = shift[0] ? in[2] : in[1];
    assign stage1[0] = shift[0] ? in[1] : in[0];

    // Stage 2: Shift by 2 bits if shift[1] == 1
    assign out[3]    = shift[1] ? 1'b0      : stage1[3];
    assign out[2]    = shift[1] ? 1'b0      : stage1[2];
    assign out[1]    = shift[1] ? stage1[3] : stage1[1];
    assign out[0]    = shift[1] ? stage1[2] : stage1[0];

endmodule
