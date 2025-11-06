//-----------------------------------------------------------------------------
//
// Title       : PWM
// Design      : PWM_design
// Author      : Julio
// Company     : SiCI

module PWM_module (
  input  wire       clock,
  input  wire       enable,        
  input  wire [2:0] speed,
  output wire       PWM
);
  reg [4:0] counter;
  reg [4:0] width;
  reg       temp_PWM;

  // Enable activo en bajo
  always @(posedge clock or posedge enable) begin
    if (enable) begin
      counter  <= 5'd0;
      temp_PWM <= 1'b0;
    end 
	else begin
		counter  <= counter + 5'd1;   
		if (counter < width)
			temp_PWM <= 1'b1;       
		else
			temp_PWM <= 1'b0;
	end
  end

  always @(*) begin
    case (speed)
      3'd0: width = 5'd0;   // 0%
      3'd1: width = 5'd4;   // 12.5%
      3'd2: width = 5'd8;   // 25%
      3'd3: width = 5'd12;  // 37.5%
      3'd4: width = 5'd16;  // 50%
      3'd5: width = 5'd20;  // 62.5%
      3'd6: width = 5'd24;  // 75%
      3'd7: width = 5'd28;  // 87.5%
	  default : width = 5'd0;
    endcase
  end

  assign PWM = temp_PWM;
endmodule
