

module mode3(a_in,b_in,out_8x);

input [2:0]a_in,b_in;


output [11:0]out_8x;
wire [5:0]a2,b2,sum;
wire [7:0]ans2;
wire[6:0]sum_co;
wire [11:0]ans3;
wire co;
wire [3:0]sqrt;


DW_square#(3) square1(a_in,1'b0,a2);
DW_square#(3) square2(b_in,1'b0,b2);
DW01_add#(6) add1(a2,b2,1'b0,sum,co);
assign sum_co={co,sum[5:0]};
DW_sqrt#(7) sqrt1(sum_co,sqrt);
DW_square#(4) square3(sqrt,1'b0,ans2);
DW02_mult#(8,4) mult1(ans2,sqrt,1'b0,ans3);
assign out_8x={2'b00,ans3[9:0]};





endmodule