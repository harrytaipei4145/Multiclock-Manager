//synopsys translate_off
`include "DW02_mult.v"
`include "DW01_add.v"
`include "DW_square.v"
`include "DW_sqrt.v"
`include "DW01_sub.v"
`include "DW01_absval.v"
//synopsys translate_on

`include "mode1.v"
`include "mode2.v"
`include "mode3.v"



module MCD(a_in,b_in,in_valid,mode,clk,clk_2x,clk_4x,clk_8x,rst_n,out_2x,out_valid_2x,out_4x,out_valid_4x,out_8x,out_valid_8x);

input [2:0]a_in,b_in;
input [1:0]mode;
input clk,clk_2x,clk_4x,clk_8x,rst_n,in_valid;
output reg out_valid_2x,out_valid_4x,out_valid_8x;
output reg [11:0]out_2x,out_4x,out_8x;
wire [11:0]ans_2x,ans_4x,ans_8x;

reg [11:0]a1,a2,a3;

reg [1:0]check1;
reg [2:0]check2;
reg [3:0]check3;
reg i;
wire temp_2x,temp_4x,temp_8x;



mode1 mode1(a_in,b_in,ans_2x);
mode2 mode2(a_in,b_in,ans_4x);
mode3 mode3(a_in,b_in,ans_8x);



always @(posedge clk)begin
i<=0;
end

always @(posedge clk_2x or negedge rst_n)begin
if(rst_n==0)
check1<=0;
else if(rst_n==1)
begin
case(check1)
0:begin
if(in_valid==1 && mode==1)
check1<=1;
else 
check1<=0;
end
1:
check1<=2;
2:
check1<=0;
default:
check1<=0;
endcase
end
else check1<=0;
end



always @(posedge clk_2x or negedge rst_n)begin

if(rst_n==0)begin
out_valid_2x<=0;
out_2x<=0;
end

else if(a1>=0  && check1==2)begin
out_valid_2x<=1;
out_2x<=a1;


end
else if(check1==0)begin
out_valid_2x<=0;
out_2x<=0;
end

end

always @(posedge clk_2x)begin

if(mode==1)
begin
a1<=ans_2x;
end

end


always @(posedge clk_4x or negedge rst_n)begin
if(rst_n==0)
check2<=0;
else if(rst_n==1)
begin
case(check2)
0:begin

if(in_valid==1 && mode==2)
check2<=1;
else 
check2<=0;
end
1:
check2<=2;
2:
check2<=3;
3:
check2<=4;
4:
check2<=0;

default:
check2<=0;
endcase
end
else check2<=0;
end


always @(posedge clk_4x or negedge rst_n)begin

if(rst_n==0)begin
out_valid_4x<=0;
out_4x<=0;
end
else if(a2>=0  && check2==4)begin
out_valid_4x<=1;
out_4x<=a2;
end
else if(check2==0)begin
out_valid_4x<=0;
out_4x<=0;
end
end

always @(posedge clk_4x)begin

if(mode==2)
begin
a2<=ans_4x;
end
end



always @(posedge clk_8x or negedge rst_n)begin
if(rst_n==0)
check3<=0;
else if(rst_n==1)
begin
case(check3)
0:begin

if(in_valid==1 && mode==3)
check3<=1;
else 
check3<=0;
end
1:
check3<=2;
2:
check3<=3;
3:
check3<=4;
4:
check3<=5;
5:
check3<=6;
6:
check3<=7;
7:
check3<=8;
8:
check3<=0;

default:
check3<=0;
endcase
end
else check3<=0;
end


always @(posedge clk_8x or negedge rst_n)begin

if(rst_n==0)begin
out_valid_8x<=0;
out_8x<=0;
end
else if(check3==8)begin
out_valid_8x<=1;
out_8x<=a3;
end
else if(check3==0)begin
out_valid_8x<=0;
out_8x<=0;
a3<=0;
end
else if(check3>=1 && check3<=3)
a3<=a3;
else 
a3<=ans_8x;

end




endmodule