module sender (output reg Ready,
input Transmit,
input Reset,
input Clock,
output reg [15:0] DataIn,
output reg [3:0] Address,
output reg ReadEnable,
output reg [15:0] saida,
input Ack,
output reg Req);

//output reg ReadEnable, Ready, Req;
//
//input Transmit, Reset, Clock, Ack;
//

//
////Endereços de memoria com profundidade de 16 endereços, para endereçar 16 posições precisamos de 4 bits
//output reg [3:0] Address;
//
//
////Saida do Sender
//output reg [15:0] saida;
//
////Data in da Memoria para o sender
//output reg [15:0] DataIn;


////Variaveis auxiliares do contador

reg [3:0] CountAddress;
reg		 CountFlag;



// Estados
parameter	StateReset 			= 0,
				Sender_Memory 		= 1,
				Sender_Control 	= 2,
				StateReady			= 3,
				StateReadyCount	= 4;
				
// Registrador de estados
reg [2:0] Estado;
				
// Estado inicial
initial begin

	Estado <= StateReset; 
	
end


// Decodificador de proximo estado

always @(posedge Clock, posedge Reset)

	begin
		if(Reset == 1)
		
			Estado <= StateReset;
			
		else begin
			case(Estado)
			
				StateReset: 
					begin
					
						//colocar as variaveis auxiliares como 0
					
						if(Transmit == 1 && Reset == 0) 
							Estado <= Sender_Memory;
						else
							Estado <= StateReset;
						
					end
					
				Sender_Memory: 
					begin
					
						//ativa readEnable
						//atribui Contator para address
						//passa o estado (porque só no proximo pulso
						//a saida vai ter o valor do dado em DataIn)
						
						if(Reset == 1)
							Estado <= StateReset;
						else if(CountAddress == 0 && CountFlag == 1'b1)
							Estado <= StateReady;
						else if(Ack == 0)
							Estado <= Sender_Control;
						else Estado <= Sender_Memory;
						
					end
					
				Sender_Control: 
					begin
					
						//Atribui DataIn para a saida
						//soma um em CountAdrees
						//se CountAddress == 15 atribui 1 para CountFlag
					
						if(Reset == 1)
							Estado <= StateReset;
						
						else if(Ack == 1)
							Estado <= Sender_Memory;
					
						else Estado <= Sender_Control;
						
					end
					
				StateReady: 
					begin
					
						//Sinal de ready será 1
						
						if(Reset == 1)
							Estado <= StateReset;
						
						else 
							Estado <= StateReadyCount;
						
					end
					
				StateReadyCount: 
					begin
					
						Estado <= StateReset;
						
					end
					
			endcase
		end

	end



	
	
// Decodificador de Saida 

always @(Estado)
	begin
						//atribuições default
						ReadEnable 		= 0;
						Ready 			= 0;
						CountFlag 		= 0;
						CountAddress 	= 0; 
			
			case(Estado)
			
				StateReset: 
					begin
					
						//colocar as variaveis auxiliares como 0, atribuições default
						//e as saidas também como 0
					
						ReadEnable 		= 0;
						Ready 			= 0;
						CountFlag 		= 0;
						CountAddress 	= 0; 
						
					end
					
				Sender_Memory: 
					begin
					
						//ativa readEnable
						//atribui Contator para address
						//passa o estado (porque só no proximo pulso
						//a saida vai ter o valor do dado em DataIn)
						
						Req = 0;
						ReadEnable 	= 1;
						Address = CountAddress;
						
					end
					
				Sender_Control: 
					begin
					
						//Atribui DataIn para a saida
						//soma um em CountAdrees
						//se CountAddress == 15 atribui 1 para CountFlag
						Req = 1; 
						ReadEnable 	= 0;
						saida = DataIn;
						CountAddress = CountAddress + 1'b1;
						
						if(CountAddress == 15) 
							CountFlag = 1;
					
					end
					
				StateReady: 
					begin
					
						//Sinal de ready será 1
						
						Ready = 1;
						
					end
					
				StateReadyCount: 
					begin
					
						Ready = 1;
						
					end
					
			endcase
	end
		
endmodule
