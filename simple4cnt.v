module simple4cnt(
    input clk,
    input reset,
    input cntEn,
    output reg [3:0] count
    );
    
    always@(posedge clk)
    begin
        if(reset)
            count <= 0;
        else if(cntEn)
            count <= count + 1;
    end
endmodule
