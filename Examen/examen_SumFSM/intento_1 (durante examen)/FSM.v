module FSM(
    input clk, rst, //SW[4]
    input [3:0] switches, //SW[3:0]
    output reg [9:0] led_out,
	 output reg [6:0] FSM_out
);

// Definición de estados
parameter A = 0, // IDLE
          B = 1, // 
          C = 2, // 
			 D = 3;

reg [3:0] current_state;
reg [3:0] next_state;
//reg [3:0] contador_suma=0;
reg [6:0] contador_suma_interna=0;

integer i;


/*
for (i=0;i<switches;i=i+1)
	begin
		contador_suma_interna <= contador_suma_interna + i;
		next_state <= C;
	end
*/	
	
always @(posedge clk or posedge rst)
    begin
        if(rst)
            current_state<=A; //Estado deseado
        else
            current_state<=next_state;
    end
	 
//suma	 
always @(current_state or switches) 
    begin
        case (current_state)
            A: begin
					contador_suma_interna<=0;
					//contador_suma=0;
					FSM_out<=0;
                if (switches==0)
						begin
                    next_state <= A;
						  //contador_suma <= 0;
						end
                else
                    begin
                     if (switches)
                        begin
                         next_state <= B;
                        end
                     else
                         next_state <= A; //***
                    end
               end
            B: begin
						//contador_suma <= (switches * (switches + 1))/2;
						//contador_suma <= switches;
						if (!switches==0)
							 next_state <= C;
						else
							 next_state <= A; //***
					end
            C: begin
						for (i=0;i<switches;i=i+1)
							begin
								contador_suma_interna <= contador_suma_interna + i;
								next_state <= C;
							end
						next_state <= D; 
					end
            D: begin
						if(!rst)
							begin
								FSM_out <= contador_suma_interna;
								next_state <= D;
							end
						else
							next_state <= A;
               end
        endcase
    end

// Lógica de salida
always @(posedge clk) begin
    led_out = 10'b0000000000; 
    case (current_state)
        A: begin
            led_out = 10'b0000000000;
           end
        B: begin
            led_out = 10'b0000000001;
           end
        C: begin 
				led_out = 10'b0000000011;
           end
		  D: begin 
            led_out = 10'b0000000111;
           end
    endcase
end

endmodule