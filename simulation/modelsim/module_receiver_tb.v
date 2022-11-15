`timescale 1 ps/ 1 ps

module module_receiver_tb;

reg WriteEnable;
reg Clock;
reg Reset;
reg Req;
reg [15:00]  Entrada;
wire Ack;

module module_receiver_tb  (
	.Clock(Clock),
	.Reset(Reset),
	.Req(Reqt),
	.Entrada(Entrada),
	.q_ram_receiver(DataOut),
	.Ack(Ack)
);






always #1 Clock = ~Clock;


integer i = 0;

initial begin

  $monitor("time = %0t \t rst = %0h \t req = %0h \t in  = %0h \t out = %0h \t ack = %0h",
  $time, Reset, Req, Entrada, DataOut, Ack);
  
  Clock     = 0;
  Reset   = 0;
  Req = 0;
  Entrada    = 16'h00;
  
  #10
  for (i = 0; i < 17; i = i + 1) begin
    Entrada <= 16'h3000 + i;
    #2 Req <= 1;
    wait(Ack == 1);
    #2 Req <= 0;
  end
  
  
end

endmodule
