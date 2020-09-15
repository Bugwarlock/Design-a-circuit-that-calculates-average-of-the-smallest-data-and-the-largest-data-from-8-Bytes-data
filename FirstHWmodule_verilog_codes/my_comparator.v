module mycomparator (input [7:0] a,b,output reg c);
  always @(a,b) begin
    if (a <= b) 
      c = 1;
    else
      c = 0;
    end
  endmodule

