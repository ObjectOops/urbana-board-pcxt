module pcxt_top (
  input clk_100MHz,
  input reset_rtl_0,
  input uart_rtl_0_rxd,
  output uart_rtl_0_txd
);
    mb_block mb_block_i (
        .clk_100MHz(clk_100MHz),
        .reset_rtl_0(reset_rtl_0),
        .uart_rtl_0_rxd(uart_rtl_0_rxd),
        .uart_rtl_0_txd(uart_rtl_0_txd)
    );
endmodule
