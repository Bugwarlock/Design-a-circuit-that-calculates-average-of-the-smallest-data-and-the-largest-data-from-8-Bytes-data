module my_main (clock,reset,data,start,W,done);
  input clock,reset,start;
  input [7:0] data;
  output reg [7:0] W;
  output reg done;
  reg [7:0] smallest,largest;
  reg [8:0] summ;
  wire check1,check2;
  reg counter;
  mycomparator CMP1 (.a (data) , .b (smallest) ,.c (check1));
  mycomparator CMP2 (.a (data) , .b (largest) ,.c (check2));
  always @(posedge reset) begin
    smallest = 0;
    largest = 0;
  end
  always @(posedge clock) begin
      if (start == 1) begin
        smallest = data;
        largest = data;
        counter = 0;
    end
  end
  always @(posedge clock) begin
      counter <= counter + 1;
      if (counter == 9) begin
        done <= 1;
        $stop;
      end
      if (check1 == 1) begin
        smallest = data;
        summ = smallest + largest;
        W = summ / 2;
        $display("our average is :%d\n",W);
      end
      if (check2 == 0) begin
        largest = data;
        summ = smallest + largest;
        W = summ / 2;
        $display("our average is :%d\n",W);
      end
    end
endmodule

