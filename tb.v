// testbench code
module vending_test;
reg reset,start,clk;
reg [1:0] item_sel,coin_sel;
wire done;
wire lt, gt, eq;
wire ld_item, ld_price, ld_bal, ld_coin;
wire [1:0] bal_sel;
datapath d(lt,gt,eq,ld_item,ld_price,ld_bal,ld_coin,coin_sel,bal_sel,item_sel,clk,reset);
controller c(ld_item,ld_price,ld_bal,ld_coin,reset,bal_sel,done,clk,lt,gt,eq,start);

initial
begin
clk=1'b0;
reset=1'b1;
coin_sel=2'b00;
item_sel=2'b00;
#1000 $finish;
end

always 
#5 clk=~clk;

initial
begin
#10 reset=1'b0;
#10 item_sel=2'b11;
#10 start=1'b1;
#10 start=1'b0;
#20 coin_sel=2'b01;
#20 coin_sel=2'b01;
#20 coin_sel=2'b10;
#20 coin_sel=2'b10;
#20 coin_sel=2'b10;
#20 coin_sel=2'b11;
#20 coin_sel=2'b11;
#20 coin_sel=2'b10;
#20 coin_sel=2'b11;
end
initial
begin
$dumpfile("vending.vcd");
$dumpvars(0,vending_test);
$monitor("TIME:%d,PRICE:%d,COIN:%d,BALANCE:%d,DONE:%d",$time,d.price_out,d.coin_out,d.bal_out,done);
end

endmodule