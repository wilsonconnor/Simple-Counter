module cntrTop(
    input reset,
    input sw,
    output [3:0] an,
    output [7:0] seg,
    input clk
    );
    
    wire synchWire, dbWire, cntEn;
    wire [3:0] count;
    assign an = 4'b1110;
    
    Synchronizer #(.NUMBITS(1)) synch1 (.clk(clk), .in(sw), .out(synchWire));
    deBounce #(.CLKSPDMHZ(100),.DELAYMS(5)) db1(.clk(clk), .reset(reset), .in(synchWire), .out(dbWire));
    oneShot uut(.clk(clk), .in(dbWire), .out(cntEn), .reset(reset));
    simple4cnt cnt(.clk(clk), .reset(reset), .cntEn(cntEn), .count(count));
    sdDisplay dis(.indata(count), .clk(clk), .sseg(seg), .reset(reset));
       
endmodule
