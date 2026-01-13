// datapath code for vending machine

// top level module
module datapath(lt,gt,eq,ld_item,ld_price,ld_bal,ld_coin,coin_sel,bal_sel,item_sel,clk,reset);
parameter ITEM0_PRICE=8'd10,ITEM1_PRICE=8'd20,ITEM2_PRICE=8'd50,ITEM3_PRICE=8'd100;
parameter COIN0_PRICE=8'd0,COIN1_PRICE=8'd5,COIN2_PRICE=8'd10,COIN3_PRICE=8'd20;
output lt,gt,eq;
input [1:0] bal_sel,coin_sel,item_sel;
input ld_item,ld_price,ld_bal,ld_coin,clk,reset;
wire [7:0] item_out,price_out,bal_out,coin_mux_out,coin_out,sub_out,add_out,bal_mux_out;
wire [1:0] item_reg_out;
mux4to1 ITEM(.out(item_out),.in({ITEM3_PRICE, ITEM2_PRICE, ITEM1_PRICE, ITEM0_PRICE}),.sel(item_reg_out));
reg2 ITEM_REG(item_reg_out,item_sel,ld_item,clk,reset);
reg8 PRICE(price_out,item_out,ld_price,clk,reset);
comp COMP(lt,gt,eq,bal_out,price_out);
reg8 BAL_REG(bal_out,bal_mux_out,ld_bal,clk,reset);
adder ADDER(add_out,coin_out,bal_out);
sub SUB(sub_out,bal_out,price_out);
reg8 COIN_REG(coin_out,coin_mux_out,ld_coin,clk,reset);
mux4to1 COIN(.out(coin_mux_out),.in({COIN3_PRICE,COIN2_PRICE,COIN1_PRICE,COIN0_PRICE}),.sel(coin_sel));
mux4to1 MUX(.out(bal_mux_out),.in({bal_out,sub_out,add_out,8'd0}),.sel(bal_sel));
endmodule


// 4 to 1 mux
module mux4to1(out,in,sel);
input [31:0] in;
input [1:0] sel;
output [7:0] out;
assign out = in[sel*8 +: 8];
endmodule

// adder
module adder(sum,a,b);
input [7:0] a,b;
output [7:0] sum;
assign sum = a+b;
endmodule

// subtracter 
module sub(diff,x,y);
input [7:0] x,y;
output [7:0] diff;
assign diff = x-y;
endmodule

// comparator
module comp(lt,gt,eq,p,q);
input [7:0] p,q;
output lt,gt,eq;
assign lt = p<q;
assign gt = p>q;
assign eq = p==q;
endmodule

// 8 bit register
module reg8(out,in,ld,clk,reset);
input [7:0] in;
output reg [7:0] out;
input ld,clk,reset;
always @(posedge clk)
if(reset)
out<=8'd0;
else if(ld)
out<=in;
endmodule

// 2 bit register
module reg2(out,in,ld,clk,reset);
input [1:0] in;
output reg [1:0] out;
input ld,clk,reset;
always @(posedge clk)
if(reset)
out<=2'd0;
else if(ld)
out<=in;
endmodule