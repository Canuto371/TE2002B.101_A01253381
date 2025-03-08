module decoder_7_seg(
    input [3:0] decoder_in, 
    output reg [6:0] decoder_out
);
    always @(*)
    begin
        case(decoder_in)
            4'd0: decoder_out = 7'b0000001; 
            4'd1: decoder_out = 7'b1001111; 
            4'd2: decoder_out = 7'b0010010; 
            4'd3: decoder_out = 7'b0000110; 
            4'd4: decoder_out = 7'b1001100; 
            4'd5: decoder_out = 7'b0100100; 
            4'd6: decoder_out = 7'b0100000; 
            4'd7: decoder_out = 7'b0001111; 
            4'd8: decoder_out = 7'b0000000; 
            4'd9: decoder_out = 7'b0000100; 
            default: decoder_out = 7'b1111111;
        endcase
    end
endmodule