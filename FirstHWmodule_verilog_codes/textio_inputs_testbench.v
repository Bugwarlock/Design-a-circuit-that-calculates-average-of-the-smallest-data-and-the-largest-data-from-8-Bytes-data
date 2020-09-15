module testio_input();
  reg rst,str,clk =0;
  reg [7:0] inpdata;
  wire d;
  wire [7:0] w;
  integer inputs,outputs;
  my_main MUT (.clock (clk),.reset (rst),.start (str),.data (inpdata),.W (w),.done(d));
  initial begin
    assign rst = 1;
    #20;
    assign rst = 0;
    assign str = 1;
    #55;
    assign str = 0;
  end
  initial repeat (20) #50 clk = ~clk; 
  initial begin 
    inputs = $fopen("inputs.txt","r");
    outputs = $fopen("outputs.txt","w");
    while (!$feof(inputs)) begin
      inpdata = $fscan(inputs,"%b\n");
      #100;
      $printf(outputs,"%b\n",w);
    end
  end
endmodule