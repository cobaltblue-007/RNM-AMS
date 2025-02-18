`timescale 1ns/1ps

module filter(input real inp, output real outp);

real R = 10.0e3;
real C = 1.592e-6;


real Ts = 1.0e-12;

import "DPI-C" pure function real exp (input real x);
real a = exp(-Ts/(R*C));

real z_int = 0.0;

always @(inp) begin 
       z_int = a*z_int + (1.0-a)*inp;
end
assign outp = z_int;
endmodule       
