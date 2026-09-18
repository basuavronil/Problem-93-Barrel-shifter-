module barrale_shifter(
  input clk, rst,
  input [3:0] d_in,
  input [1:0] mode,
  input [1:0] shift_amt,
  output [3:0] d_out
);
  reg [3:0] mem;
  always@(posedge clk or negedge rst)
    begin
      if (!rst)
        mem <= 4'd0;
      else begin
        case (mode)
          2'd00: mem = d_in << shift_amount;
          2'd01: mem = d_in >> shift_amount;
          2'b10; mem = $signed(d_in) >>> shift_amount; // retaining the signed bit
          2'b11: begin // rotate right
            case (shift_amount)
                2'b00: ;
                2'b01: mem = {mem[0], mem[3:1]}; 
                2'b10: mem = {mem[1:0], mem[3:2]};
                2'b11: mem = {mem[2:0], mem[3]};
                default: mem = mem;
            endcase
          end
          default: ;
        endcase
      end
      
    end
endmodule 
