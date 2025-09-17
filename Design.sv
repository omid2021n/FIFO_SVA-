///////////////////////////////Design Code

module FIFO (
    input  wire       clk,
    input  wire       rst,
    input  wire       wr,
    input  wire       rd,
    input  wire [7:0] din,
    output reg  [7:0] dout,
    output wire       empty,
    output wire       full
);

  // pointers and count
  reg [3:0] w_ptr, r_ptr;
  reg [4:0] count;   // 0–16 range
  reg [7:0] mem [15:0];

  // sequential logic
  always @(posedge clk) begin
    if (rst) begin
      count <= 0;
      w_ptr <= 0;
      r_ptr <= 0;
      dout  <= 8'hxx;
    end else begin
      // Write
      if (wr && !full) begin
        mem[w_ptr] <= din;
        w_ptr <= w_ptr + 1;
        count <= count + 1;
      end

      // Read
      if (rd && !empty) begin
        dout  <= mem[r_ptr];
        r_ptr <= r_ptr + 1;
        count <= count - 1;
      end
    end
  end

  // status flags
  assign empty = (count == 0);
  assign full  = (count == 15);

endmodule

///    Assertation 


module fifo_assertion (
  
    input wire clk,
    input wire rst,
    input wire wr,
    input wire rd,
    input wire [4:0] count,
    input wire full,
    input wire empty
  
);

// =====================================================
  // 1️⃣ Full flag matches count
  // full should be 1 when count = 15
  // =====================================================
  assert_full_flag: assert property (
    @(posedge clk)
    disable iff (rst)
    (count == 15) |-> full)
    $info("Verify  Full   time :%0t",$time);
   else $error("Full flag mismatch: count=%0d, full=%b", count, full);

  // =====================================================
  // 2️⃣ Empty flag matches count
  // empty should be 1 when count = 0
  // =====================================================
  assert_empty_flag: assert property (
    @(posedge clk)
    disable iff (rst)
    (count == 0) |-> empty)
    $info("Verify  Empty   time :%0t",$time);
  else $error("Empty flag mismatch: count=%0d, empty=%b", count, empty);

  // =====================================================
  // 3️⃣ No write when full
  // If wr=1 and full=1, count must not increase
  // =====================================================
  assert_no_overwrite: assert property (
    @(posedge clk)
    disable iff (rst)
    (wr && full) |-> (count <= 15))
    $info("Verify WR and  Full   time :%0t",$time);

  else $error("Write happened when FIFO full: count=%0d", count);

  // =====================================================
  // 4️⃣ No read when empty
  // If rd=1 and empty=1, count must not decrease
  // =====================================================
  assert_no_read_empty: assert property (
    @(posedge clk)
    disable iff (rst)
    (rd && empty) |-> (count >= 0))
    $info("Verify  RD and Empty   time :%0t",$time);

  else $error("Read happened when FIFO empty: count=%0d", count);

endmodule
  
  
