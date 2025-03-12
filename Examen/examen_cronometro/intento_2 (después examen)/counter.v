module counter (
    input clk, rst, enable,
    output reg [9:0] mili_segundos,
	 output reg [9:0] segundos
);

always @(posedge clk or negedge rst) 
	begin
		 if (!rst)
			begin
				mili_segundos <= 0;
				segundos <= 0;
			end
		 else if (enable) 
			begin
				if(segundos>99)
					begin
						mili_segundos <= 0;
						segundos <= 0;
					end
				else if(mili_segundos>999)
					begin
						mili_segundos <= 0;
						segundos <= segundos + 1;
					end
				else
					mili_segundos <= mili_segundos + 1;
			end
	end
endmodule