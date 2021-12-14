// bd_divider = clock_frequency / baudrate

module capitalise_letters(input wire clk, rx,
								  output wire tx,
								  output wire [7:0] r_data);
	 

wire [7:0] t_data;
wire r_dv;

assign t_data = (r_data < 8'd123 && r_data > 8'd96 ) ? r_data - 8'd32 :	 r_data;
						 
uart_rx receiver (clk, rx, r_dv, r_data);
uart_tx transmitter (clk, t_data, r_dv, tx);

endmodule
