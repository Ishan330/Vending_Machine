// controller code
module controller(ld_item,ld_price,ld_bal,ld_coin,reset,bal_sel,done,clk,lt,gt,eq,start);
input lt,gt,eq,start,clk,reset;
output reg ld_item,ld_price,ld_bal,ld_coin,done;
output reg [1:0] bal_sel;
reg [2:0] state;
parameter IDLE=3'b000, ITEM_SELECT=3'b001, COIN_ACCEPT=3'b010, BAL_UPD=3'b011, DISPENSE=3'b100;

always @(posedge clk)
begin
if(reset)
state<=IDLE;
else 
begin
case(state)
IDLE: if(start)
state<=ITEM_SELECT;
ITEM_SELECT: state<=COIN_ACCEPT;
COIN_ACCEPT: state<=BAL_UPD;
BAL_UPD: if(lt)
state<=COIN_ACCEPT;
else
state<=DISPENSE;
DISPENSE: state<=IDLE;
default: state<=IDLE;
endcase
end
end

always @(*)
begin
ld_item=0;ld_price=0;ld_bal=0;ld_coin=0;done=0;bal_sel=0;
case(state)
IDLE:begin
ld_item=0;ld_price=0;ld_bal=1;ld_coin=0;done=0;bal_sel=0;
end
ITEM_SELECT:begin
ld_item=1;
end
COIN_ACCEPT:begin
ld_coin=1;ld_price=1;
end
BAL_UPD:begin
bal_sel=1;ld_bal=1;
end
DISPENSE:begin
bal_sel=2;ld_bal=1;done=1;
end
default: ;
endcase
end

endmodule