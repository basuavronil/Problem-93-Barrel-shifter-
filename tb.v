`timescale 1ns / 1ps

module barrel_shifter_tb;

    // Testbench Signals
    reg  [3:0] data_in;
    reg  [1:0] shift_amt;
    reg  [1:0] mode;
    wire [3:0] data_out;

    // Instantiate the Unit Under Test (UUT)
    barrel_shifter uut (
        .data_in(data_in),
        .shift_amt(shift_amt),
        .mode(mode),
        .data_out(data_out)
    );

    // Test Stimulus
    initial begin
        // Setup Waveform Dumping for GTKWave
        $dumpfile("dump.vcd");
        $dumpvars(0, barrel_shifter_tb);

        // Display Header in Console
        $display("--------------------------------------------------");
        $display(" TIME | MODE | DATA_IN | SHIFT | DATA_OUT | OPERATION");
        $display("--------------------------------------------------");

        // --------------------------------------------------------------------
        // Test 1: Logical Shift Left (mode = 00)
        // --------------------------------------------------------------------
        mode = 2'b00; data_in = 4'b0011; shift_amt = 2'd0; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | LSL 0", $time, mode, data_in, shift_amt, data_out);
        
        shift_amt = 2'd1; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | LSL 1", $time, mode, data_in, shift_amt, data_out);
        
        shift_amt = 2'd2; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | LSL 2", $time, mode, data_in, shift_amt, data_out);

        // --------------------------------------------------------------------
        // Test 2: Logical Shift Right (mode = 01)
        // --------------------------------------------------------------------
        mode = 2'b01; data_in = 4'b1100; shift_amt = 2'd1; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | LSR 1", $time, mode, data_in, shift_amt, data_out);

        shift_amt = 2'd2; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | LSR 2", $time, mode, data_in, shift_amt, data_out);

        // --------------------------------------------------------------------
        // Test 3: Arithmetic Shift Right (mode = 10) - Preserves Sign Bit
        // --------------------------------------------------------------------
        mode = 2'b10; data_in = 4'b1000; shift_amt = 2'd1; #10; // Negative number
        $display("%40t |  %b  |   %b  |   %d   |   %b   | ASR 1 (Signed)", $time, mode, data_in, shift_amt, data_out);

        shift_amt = 2'd2; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | ASR 2 (Signed)", $time, mode, data_in, shift_amt, data_out);

        // --------------------------------------------------------------------
        // Test 4: Rotate Right (mode = 11)
        // --------------------------------------------------------------------
        mode = 2'b11; data_in = 4'b1001; shift_amt = 2'd1; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | ROR 1", $time, mode, data_in, shift_amt, data_out);

        shift_amt = 2'd2; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | ROR 2", $time, mode, data_in, shift_amt, data_out);

        shift_amt = 2'd3; #10;
        $display("%40t |  %b  |   %b  |   %d   |   %b   | ROR 3", $time, mode, data_in, shift_amt, data_out);

        $display("--------------------------------------------------");
        $finish;
    end

endmodule
