`timescale 1ns/1ps

module tb_fifo;

  reg clk, rst, wr, rd;
  reg [7:0] din;
  wire [7:0] dout;
  wire empty, full;
  integer i;

  // Instantiate FIFO
  FIFO dut (
    .clk(clk),
    .rst(rst),
    .wr(wr),
    .rd(rd),
    .din(din),
    .dout(dout),
    .empty(empty),
    .full(full)
  );

  //  Assertation 
  
  bind FIFO fifo_assertion dut2(
    .clk   (clk),
    .rst   (rst),
    .wr    (wr),
    .rd    (rd),
    .count (count),   // internal count signal in FIFO
    .full  (full),
    .empty (empty)
);
  // Clock generation
  always #5 clk = ~clk;  // 100 MHz

  initial begin
    // Initialize
    clk = 0;
    rst = 1;
    wr  = 0;
    rd  = 0;
    din = 8'd0;

    // Apply reset
    #10
    rst = 0;

    for( i = 0; i < 16; i++)
      begin   
        
        din = $urandom();
        wr = 1'b1;
        rd = 1'b0;
        @(posedge clk);
      end
//   read 
  
    for( i = 0; i < 16; i++)
      begin   
        
        wr = 1'b0;
        rd = 1'b1;
        @(posedge clk);
      end
  end

  // Monitor activity
 initial begin
    $monitor("T=%0t | wr=%b rd=%b din=%h dout=%h full=%b empty=%b",
              $time, wr, rd, din, dout, full, empty);
 end
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    $assertvacuousoff(0);
    #500;
    $finish();
  end

endmodule
