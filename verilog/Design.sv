module ring_counter(clk,clr,q);
  input clk ,clr;
  parameter N =4;
  output reg[N-1:0] q;
  
  always @(posedge clk)begin
    if(clr)begin 
      q <= 4'b0001;
    end
    
    else begin
      q <= {q[N-2:0],q[N-1]};
    end 
  end 
endmodule
