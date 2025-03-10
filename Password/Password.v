module Password(
    input clk, rst,
    input [9:0] switches,
    output reg [9:0] led_out,
    output reg [6:0] HEX0,
    output reg [6:0] HEX1,
    output reg [6:0] HEX2,
    output reg [6:0] HEX3,
    output reg [6:0] HEX4
);

// Definición de estados
parameter A = 0, // IDLE
          B = 1, // PRIMER DIGITO
          C = 2, // SEGUNDO DIGITO
			 D = 3, // TERCER DIGITO
          E = 4, // DONE
          F = 5; // ERROR

reg [3:0] current_state;
reg [3:0] next_state=A;

always @(posedge clk or negedge rst)
    begin
        if(!rst)
            current_state<=A; //Estado deseado
        else
            current_state<=next_state;
    end


always @(current_state,switches) 
    begin
        case (current_state)
            A: begin
                if (switches==0)
                    next_state <= A;
                else
                    begin
                     if (switches[3])
                        begin
                         next_state <= B;
                        end
                     else
                         next_state <= F;
                    end
            end
            B: begin
                if (switches==0)
                    next_state <= B;
                else
                    begin
                     if (switches[7])
                        begin
                         next_state <= C;
                        end
                     else
                         next_state <= F;
                    end
            end
            C: begin
						 if (switches == 0)
							  next_state <= C;
						 else begin
							  if (switches[1])
									next_state <= D;
							  else
									next_state <= F;
						 end
					end
				D: begin
						 if (switches == 0)
							  next_state <= D;
						 else begin
							  if (switches[5])
									next_state <= E;
							  else
									next_state <= F;
						 end
					end
            E: begin
						if(switches == 0)
							next_state <= E;
						else
							next_state <= A;
               end
            F: begin
						if(switches == 0)
							next_state <= F;
						else
							next_state <= A;
               end
        endcase
    end


// Lógica de salida
always @(current_state) begin
    led_out = 10'b0000000000; // Apagar todos los LEDs por defecto
    case (current_state)
        A: begin
            HEX4 = 7'b1111111; // Apagar todos los displays
            HEX3 = 7'b1111111;
            HEX2 = 7'b1111111;
            HEX1 = 7'b1111111;
            HEX0 = 7'b1111111;
           end
        B: begin
            led_out = 10'b000000001;
           end
        C: begin
            led_out = 10'b0000000011;
           end
		  D: begin
            led_out = 10'b0000000111;
           end
        E: begin
				led_out = 10'b0000000111;
            HEX4 = 7'b1111111; // Mostrar "DONE"
            HEX3 = 7'b0100001; // D
            HEX2 = 7'b1000000; // O
            HEX1 = 7'b1001000; // N
            HEX0 = 7'b0000110; // E
           end
        F: begin
            HEX4 = 7'b0000110; // Mostrar "ERROR"
            HEX3 = 7'b0101111; // R
            HEX2 = 7'b0101111; // R
            HEX1 = 7'b0100011; // O
            HEX0 = 7'b0101111; // R
			  end
    endcase
end

endmodule