module receiver (output reg [15:0] DataIn,
output reg [3:0] Address,
output reg WriteEnable,
input Clock,
input Reset,
output reg Ready,
input Req,
output reg Ack,
input [15:0] Entrada);

//output reg WriteEnable, Ready, Ack;
////Endereços de memoria
//output reg [3:0] Address;
////Saida para a memoria
//output reg [15:0] DataIn;
//



//input [15:0] Entrada;
//input Clock, Reset, Req;

reg		 CountFlag;
reg [3:0] CountAddress;
reg [3:0] Estado;


parameter 	StateReset 			= 0,
				RecebeDados 		= 1,
				GravaDado			= 2,
				StateReady			= 3,
				StateReadyCount	= 4;

// Estado inicial
initial begin
	Estado <= StateReset; 
end


// Decodificador de proximo estado
always @(posedge Clock, posedge Reset)
	begin
	if(Reset == 1)
			Estado <= StateReset;
	else
		begin
		case(Estado)
		
			StateReset: 
				begin
				
					//
				
					if(Req == 1 && Reset == 0) 
						Estado <= RecebeDados;
					else 
						Estado <= StateReset;
					
				end
			RecebeDados: 
				begin
				
					//
					if(Reset == 1)
						Estado <= StateReset;
						
					else if(CountAddress == 0 && CountFlag == 1'b1)
						Estado <= StateReady;
						
					else if(Req == 1)
						Estado <= GravaDado;
					
					else Estado <= RecebeDados;
					
				end
			GravaDado:
				begin
					//
					
					if(Reset == 1)
						Estado <= StateReset;
					
					else if(Req == 0)
						Estado <= RecebeDados;
						
					else Estado <= GravaDado;
				
				end
			StateReady:
				begin
				
					if(Reset == 1)
						Estado <= StateReset;
							
					else Estado <= StateReadyCount;
					
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
				
		// atribuições default		
				CountAddress = 0;
				Ack = 0;
				Ready = 0;
				CountFlag = 0;
				
				
	case(Estado)
		
		StateReset: 
			begin
			
				//
				CountAddress = 0;
				Ack = 0;
				Ready = 0;
				CountFlag = 0;
				
			end
		RecebeDados: 
			begin
			
				//
				Address = CountAddress;
				Ack = 0;
				WriteEnable = 0;
				
			end
		GravaDado:
			begin
				//
				
				WriteEnable = 1;
				DataIn = Entrada;
				
				Ack = 1;
				CountAddress = CountAddress + 1'b1;
				
				if(CountAddress == 15) 
					CountFlag = 1;
			
			end
		StateReady:
			begin
				Ready = 1;
			end
			
		StateReadyCount:
			begin
				Ready = 1;
			end
		
		endcase
	
	end

endmodule
