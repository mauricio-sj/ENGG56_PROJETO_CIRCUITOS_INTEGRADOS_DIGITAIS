`timescale 1 ps/ 1 ps

module module_sender_tb;

reg 	Transmit;
reg 	Reset;
reg 	Clock;
reg 	[15:0] DataIn;
reg 	ReadEnable;
reg 	[15:0] saida;
reg 	Ack;
reg 	Req;

module_sender_tb (
	Ready,
	Transmit,
	Reset,
	Clock,
	DataIn,
	Address,
	ReadEnable,
	saida,
	Ack,
	Req);

always #1 Clock = ~Clock;

integer i = 0;

initial begin

  $monitor("time = %0t \t Clock = %0h \t rst = %0h \t wrt = %0h \t str = %0h \t in  = %0h \t ack = %0h \t req = %0h \t out = %0h",
  $time, Clock, Reset, ReadEnable, Transmit, DataIn, Ack, Req, saida);
  
  Clock   = 0;
  Reset = 0;
  ReadEnable = 0;
  Transmit = 0;
  DataIn  = 16'h00;
  Ack   = 0;
  Req =0;
  saida  = 16'h00;


  
  repeat (16) begin

	Transmit <= 1;
	
	#10
   	Req <= 0;
    	ReadEnable 	<= 1;

    	#10
	Transmit <= 0;
	Req <= 1; 
	ReadEnable 	<= 0;
	DataIn = DataIn + 1'b1;
	saida = DataIn;
						
	 
  end
end
  
   
endmodule
