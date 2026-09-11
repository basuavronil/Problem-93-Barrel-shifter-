module barrel_shifter (
    input  wire [3:0] data_in,   // Data input
    input  wire [1:0] shift_amt, // Shift amount (0-3 bits)
    input  wire [1:0] mode,      // 00: LSL, 01: LSR, 10: ASR, 11: ROR
    output reg  [3:0] data_out   // Data output
);

    always @(*) begin
        case (mode)
            2'b00: data_out = data_in << shift_amt;                  // Logical Left Shift
            2'b01: data_out = data_in >> shift_amt;                  // Logical Right Shift
            2'b10: data_out = $signed(data_in) >>> shift_amt;        // Arithmetic Right Shift
            2'b11: begin                                             // Rotate Right
                case (shift_amt)
                    2'b00: data_out =  data_in;
                    2'b01: data_out = {data_in[0],   data_in[3:1]};
                    2'b10: data_out = {data_in[1:0], data_in[3:2]};
                    2'b11: data_out = {data_in[2:0], data_in[3]};
                endcase
            end
            default: data_out = data_in;
        endcase
    end

endmodule
