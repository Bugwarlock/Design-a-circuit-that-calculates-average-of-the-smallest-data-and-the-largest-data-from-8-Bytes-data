//this testbench include Huffman Method
module dterministicinputstestbench();
  reg rst,str,clk =0;
  reg [7:0] n_state,p_state;
  wire d;
  wire [7:0] w;
  parameter Onefive = 15 , Sevensix = 76 , Twooneeight = 218 , Threeeight = 38 , Fourone = 41 , Twofourone = 241 , Oneonetwo = 112 , Seventwo =72;
  my_main MUT (.clock (clk),.reset (rst),.start (str),.data (n_state),.W (w),.done(d));
     always@(p_state) begin
      case(p_state)
        Onefive: n_state = Sevensix; 
        Sevensix: n_state = Twooneeight; 
        Twooneeight: n_state = Threeeight;
        Threeeight: n_state = Fourone;
        Fourone: n_state = Twofourone;
        Twofourone: n_state = Oneonetwo;
        Oneonetwo: n_state = Seventwo;
        Seventwo: n_state = Onefive;
        default : n_state = Onefive;
      endcase    
     end
    initial repeat (20) #50 clk = ~clk;
    always @(posedge rst) if(rst == 1) p_state <= Seventwo;
      initial repeat (8) begin
          #100;
          p_state <= n_state;
        end 
  initial begin
    assign rst = 1;
    #20;
    assign rst = 0;
    assign str = 1;
    #55;
    assign str = 0;
  end
endmodule