module counter_debouncer(
    input clk, rst_a_p,
    output reg [15:0] counter_out = 0, 
    output reg counter_match = 0       
);

always @(posedge clk or posedge rst_a_p) 
	begin
		 if (rst_a_p) 
			 begin
				  counter_out <= 0; 
				  counter_match <= 0;
			 end
		 else 
			 begin
				  if (counter_out >= 5000-1) 
					  begin
							counter_out <= 0;
							counter_match <= 1;
					  end 
				  else 
						begin
							counter_out <= counter_out + 1;
							counter_match <= 0;
					  end
			 end
	end
endmodule