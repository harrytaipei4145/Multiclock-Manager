
module mode1(a_in,b_in,out_2x);

input [2:0]a_in,b_in;


output [11:0]out_2x;
wire [8:0]a3,b3,sum1;
wire [9:0]sum1_co;
wire [10:0]sum1_co1,sum2;
wire [11:0]sum2_co,sum1_co2,sum_temp;
wire [12:0]sum_temp2;
wire [5:0]a2,b2;
wire [8:0]a2b,b2a;
wire [10:0]a2b_3,b2a_3;

wire co1,co2,co3;



DW_square#(3) square1(a_in,1'b0,a2);
DW_square#(3) square2(b_in,1'b0,b2);
DW02_mult#(3,6) mult1(a_in,a2,1'b0,a3);
DW02_mult#(3,6) mult2(b_in,b2,1'b0,b3);
DW02_mult#(3,6) mult3(a_in,b2,1'b0,b2a);
DW02_mult#(3,6) mult4(b_in,a2,1'b0,a2b);
assign a2b_3=3*a2b;
assign b2a_3=3*b2a;
DW01_add#(9) add1(a3,b3,1'b0,sum1,co1);
assign sum1_co={co1,sum1[8:0]};
assign sum1_co1={1'b0,sum1_co[9:0]};
assign sum1_co2={1'b0,sum1_co1[10:0]};
DW01_add#(11) add2(a2b_3,b2a_3,1'b0,sum2,co2);
assign sum2_co={co2,sum2[10:0]};
DW01_add#(12) add3(sum1_co2,sum2_co,1'b0,sum_temp,co3);
assign sum_temp2={co3,sum_temp[11:0]};
assign out_2x=sum_temp2[11:0];








endmodule