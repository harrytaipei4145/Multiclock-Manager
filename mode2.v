module mode2(a_in,b_in,out_4x);

input [2:0]a_in,b_in;


output [11:0]out_4x;
wire [5:0]a2,b2,sub;
wire [6:0]sub_co,absval;
wire [13:0]ans;
wire co;


DW_square#(3) square1(a_in,1'b0,a2);
DW_square#(3) square2(b_in,1'b0,b2);
DW01_sub#(6) add1(a2,b2,1'b0,sub,co);
assign sub_co={co,sub[5:0]};
DW01_absval#(7) absval1(sub_co,absval);
DW_square#(7) square3(absval,1'b0,ans);
assign out_4x=ans[11:0];







endmodule