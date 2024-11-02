module tb();
  reg clk ,clr;
  wire[3:0] q;
  
  ring_counter r(.clk(clk),.clr(clr),.q(q));
  
  initial begin
    
    clk = 0;
    clr = 1;
    #5 clr = 0;
    $monitor("output = %d",q);
    #100 $finish();
  end 
  
  always #4 clk = ~clk;
  
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(1);
  end
  
endmodule
