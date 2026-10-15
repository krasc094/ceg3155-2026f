module tff
  (input  i_t,
   input  i_clock,
   output o_q,
   output o_qbar);
  reg int_q;
  wire n832_o;
  wire n836_o;
  wire n837_o;
  reg n838_q;
  assign o_q = int_q; //(module output)
  assign o_qbar = n836_o; //(module output)
  /* ./tFF.vhdl:39:16  */
  always @*
    int_q = n838_q; // (isignal)
  initial
    int_q = 1'b0;
  /* ./tFF.vhdl:48:34  */
  assign n832_o = ~int_q;
  /* ./tFF.vhdl:58:33  */
  assign n836_o = ~int_q;
  /* ./tFF.vhdl:46:9  */
  assign n837_o = i_t ? n832_o : int_q;
  /* ./tFF.vhdl:46:9  */
  always @(posedge i_clock)
    n838_q <= n837_o;
  initial
    n838_q = 1'b0;
endmodule

module dflipflop
  (input  i_d,
   input  i_clk,
   input  i_reset_bar,
   output o_q,
   output o_qbar);
  wire int_q;
  wire n820_o;
  wire n822_o;
  wire n825_o;
  reg n826_q;
  assign o_q = int_q; //(module output)
  assign o_qbar = n825_o; //(module output)
  /* ./dFlipFlop.vhdl:13:8  */
  assign int_q = n826_q; // (signal)
  /* ./dFlipFlop.vhdl:18:20  */
  assign n820_o = ~i_reset_bar;
  /* ./dFlipFlop.vhdl:18:5  */
  assign n822_o = n820_o ? 1'b0 : i_d;
  /* ./dFlipFlop.vhdl:26:11  */
  assign n825_o = ~int_q;
  /* ./dFlipFlop.vhdl:17:3  */
  always @(posedge i_clk)
    n826_q <= n822_o;
endmodule

module mux4_1bit
  (input  a,
   input  b,
   input  c,
   input  d,
   input  [1:0] sel,
   output o);
  wire n792_o;
  wire n793_o;
  wire n794_o;
  wire n795_o;
  wire n796_o;
  wire n797_o;
  wire n798_o;
  wire n799_o;
  wire n800_o;
  wire n801_o;
  wire n802_o;
  wire n803_o;
  wire n804_o;
  wire n805_o;
  wire n806_o;
  wire n807_o;
  wire n808_o;
  wire n809_o;
  wire n810_o;
  wire n811_o;
  wire n812_o;
  wire n813_o;
  wire n814_o;
  assign o = n814_o; //(module output)
  /* ./mux4_1bit.vhdl:19:23  */
  assign n792_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:19:16  */
  assign n793_o = ~n792_o;
  /* ./mux4_1bit.vhdl:19:11  */
  assign n794_o = a & n793_o;
  /* ./mux4_1bit.vhdl:19:40  */
  assign n795_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:19:33  */
  assign n796_o = ~n795_o;
  /* ./mux4_1bit.vhdl:19:28  */
  assign n797_o = n794_o & n796_o;
  /* ./mux4_1bit.vhdl:20:23  */
  assign n798_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:20:16  */
  assign n799_o = ~n798_o;
  /* ./mux4_1bit.vhdl:20:34  */
  assign n800_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:20:27  */
  assign n801_o = n799_o & n800_o;
  /* ./mux4_1bit.vhdl:20:11  */
  assign n802_o = b & n801_o;
  /* ./mux4_1bit.vhdl:19:47  */
  assign n803_o = n797_o | n802_o;
  /* ./mux4_1bit.vhdl:21:18  */
  assign n804_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:21:11  */
  assign n805_o = c & n804_o;
  /* ./mux4_1bit.vhdl:21:34  */
  assign n806_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:21:27  */
  assign n807_o = ~n806_o;
  /* ./mux4_1bit.vhdl:21:22  */
  assign n808_o = n805_o & n807_o;
  /* ./mux4_1bit.vhdl:20:40  */
  assign n809_o = n803_o | n808_o;
  /* ./mux4_1bit.vhdl:22:18  */
  assign n810_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:22:11  */
  assign n811_o = d & n810_o;
  /* ./mux4_1bit.vhdl:22:29  */
  assign n812_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:22:22  */
  assign n813_o = n811_o & n812_o;
  /* ./mux4_1bit.vhdl:21:40  */
  assign n814_o = n809_o | n813_o;
endmodule

module dff_2
  (input  i_d,
   input  i_clock,
   output o_q,
   output o_qbar);
  wire int_q;
  wire n789_o;
  reg n790_q;
  assign o_q = int_q; //(module output)
  assign o_qbar = n789_o; //(module output)
  /* ./dFF_2.vhdl:39:16  */
  assign int_q = n790_q; // (signal)
  /* ./dFF_2.vhdl:54:33  */
  assign n789_o = ~int_q;
  /* ./dFF_2.vhdl:46:9  */
  always @(posedge i_clock)
    n790_q <= i_d;
endmodule

module binarycounter_nbit_29
  (input  i_clk,
   input  i_enable,
   input  i_reset,
   output [28:0] o_count);
  wire [28:0] int_count;
  wire [28:0] int_t;
  wire n439_o;
  wire n440_o;
  wire n441_o;
  wire n442_o;
  wire n443_o;
  wire n444_o;
  wire n445_o;
  wire n446_o;
  wire n447_o;
  wire n448_o;
  wire n449_o;
  wire n450_o;
  wire n451_o;
  wire n452_o;
  wire n453_o;
  wire n454_o;
  wire n455_o;
  wire n456_o;
  wire n457_o;
  wire n458_o;
  wire n459_o;
  wire n460_o;
  wire n461_o;
  wire n462_o;
  wire n463_o;
  wire n464_o;
  wire n465_o;
  wire n466_o;
  wire n467_o;
  wire n468_o;
  wire n469_o;
  wire n470_o;
  wire n471_o;
  wire n472_o;
  wire n473_o;
  wire n474_o;
  wire n475_o;
  wire n476_o;
  wire n477_o;
  wire n478_o;
  wire n479_o;
  wire n480_o;
  wire n481_o;
  wire n482_o;
  wire n483_o;
  wire n484_o;
  wire n485_o;
  wire n486_o;
  wire n487_o;
  wire n488_o;
  wire n489_o;
  wire n490_o;
  wire n491_o;
  wire n492_o;
  wire n493_o;
  wire n494_o;
  wire n495_o;
  wire n496_o;
  wire n497_o;
  wire n498_o;
  wire n499_o;
  wire n500_o;
  wire n501_o;
  wire n502_o;
  wire n503_o;
  wire n504_o;
  wire n505_o;
  wire n506_o;
  wire n507_o;
  wire n508_o;
  wire n509_o;
  wire n510_o;
  wire n511_o;
  wire n512_o;
  wire n513_o;
  wire n514_o;
  wire n515_o;
  wire n516_o;
  wire n517_o;
  wire n518_o;
  wire n519_o;
  wire n520_o;
  wire n521_o;
  wire n522_o;
  wire n523_o;
  wire n524_o;
  wire n525_o;
  wire n526_o;
  wire n527_o;
  wire n528_o;
  wire n529_o;
  wire n530_o;
  wire n531_o;
  wire n532_o;
  wire n533_o;
  wire n534_o;
  wire n535_o;
  wire n536_o;
  wire n537_o;
  wire n538_o;
  wire n539_o;
  wire n540_o;
  wire n541_o;
  wire n542_o;
  wire n543_o;
  wire n544_o;
  wire n545_o;
  wire n546_o;
  wire n547_o;
  wire n548_o;
  wire n549_o;
  wire n550_o;
  wire n551_o;
  wire n552_o;
  wire n553_o;
  wire n554_o;
  wire n555_o;
  wire n556_o;
  wire n557_o;
  wire n558_o;
  wire n559_o;
  wire n560_o;
  wire n561_o;
  wire n562_o;
  wire n563_o;
  wire n564_o;
  wire n565_o;
  wire n566_o;
  wire n567_o;
  wire n568_o;
  wire n569_o;
  wire n570_o;
  wire n571_o;
  wire n572_o;
  wire n573_o;
  wire n574_o;
  wire n575_o;
  wire n576_o;
  wire n577_o;
  wire n578_o;
  wire n579_o;
  wire n580_o;
  wire n581_o;
  wire n582_o;
  wire n583_o;
  wire n584_o;
  wire n585_o;
  wire n586_o;
  wire n587_o;
  wire n588_o;
  wire n589_o;
  wire n590_o;
  wire n591_o;
  wire n592_o;
  wire n593_o;
  wire n594_o;
  wire n595_o;
  wire n596_o;
  wire n597_o;
  wire n598_o;
  wire n599_o;
  wire n600_o;
  wire n601_o;
  wire n602_o;
  wire n603_o;
  wire n604_o;
  wire n605_o;
  wire n606_o;
  wire n607_o;
  wire bits_n1_bit_n608;
  wire bits_n1_bit_o_q;
  wire bits_n1_bit_o_qbar;
  wire n613_o;
  wire bits_n2_bit_n614;
  wire bits_n2_bit_o_q;
  wire bits_n2_bit_o_qbar;
  wire n619_o;
  wire bits_n3_bit_n620;
  wire bits_n3_bit_o_q;
  wire bits_n3_bit_o_qbar;
  wire n625_o;
  wire bits_n4_bit_n626;
  wire bits_n4_bit_o_q;
  wire bits_n4_bit_o_qbar;
  wire n631_o;
  wire bits_n5_bit_n632;
  wire bits_n5_bit_o_q;
  wire bits_n5_bit_o_qbar;
  wire n637_o;
  wire bits_n6_bit_n638;
  wire bits_n6_bit_o_q;
  wire bits_n6_bit_o_qbar;
  wire n643_o;
  wire bits_n7_bit_n644;
  wire bits_n7_bit_o_q;
  wire bits_n7_bit_o_qbar;
  wire n649_o;
  wire bits_n8_bit_n650;
  wire bits_n8_bit_o_q;
  wire bits_n8_bit_o_qbar;
  wire n655_o;
  wire bits_n9_bit_n656;
  wire bits_n9_bit_o_q;
  wire bits_n9_bit_o_qbar;
  wire n661_o;
  wire bits_n10_bit_n662;
  wire bits_n10_bit_o_q;
  wire bits_n10_bit_o_qbar;
  wire n667_o;
  wire bits_n11_bit_n668;
  wire bits_n11_bit_o_q;
  wire bits_n11_bit_o_qbar;
  wire n673_o;
  wire bits_n12_bit_n674;
  wire bits_n12_bit_o_q;
  wire bits_n12_bit_o_qbar;
  wire n679_o;
  wire bits_n13_bit_n680;
  wire bits_n13_bit_o_q;
  wire bits_n13_bit_o_qbar;
  wire n685_o;
  wire bits_n14_bit_n686;
  wire bits_n14_bit_o_q;
  wire bits_n14_bit_o_qbar;
  wire n691_o;
  wire bits_n15_bit_n692;
  wire bits_n15_bit_o_q;
  wire bits_n15_bit_o_qbar;
  wire n697_o;
  wire bits_n16_bit_n698;
  wire bits_n16_bit_o_q;
  wire bits_n16_bit_o_qbar;
  wire n703_o;
  wire bits_n17_bit_n704;
  wire bits_n17_bit_o_q;
  wire bits_n17_bit_o_qbar;
  wire n709_o;
  wire bits_n18_bit_n710;
  wire bits_n18_bit_o_q;
  wire bits_n18_bit_o_qbar;
  wire n715_o;
  wire bits_n19_bit_n716;
  wire bits_n19_bit_o_q;
  wire bits_n19_bit_o_qbar;
  wire n721_o;
  wire bits_n20_bit_n722;
  wire bits_n20_bit_o_q;
  wire bits_n20_bit_o_qbar;
  wire n727_o;
  wire bits_n21_bit_n728;
  wire bits_n21_bit_o_q;
  wire bits_n21_bit_o_qbar;
  wire n733_o;
  wire bits_n22_bit_n734;
  wire bits_n22_bit_o_q;
  wire bits_n22_bit_o_qbar;
  wire n739_o;
  wire bits_n23_bit_n740;
  wire bits_n23_bit_o_q;
  wire bits_n23_bit_o_qbar;
  wire n745_o;
  wire bits_n24_bit_n746;
  wire bits_n24_bit_o_q;
  wire bits_n24_bit_o_qbar;
  wire n751_o;
  wire bits_n25_bit_n752;
  wire bits_n25_bit_o_q;
  wire bits_n25_bit_o_qbar;
  wire n757_o;
  wire bits_n26_bit_n758;
  wire bits_n26_bit_o_q;
  wire bits_n26_bit_o_qbar;
  wire n763_o;
  wire bits_n27_bit_n764;
  wire bits_n27_bit_o_q;
  wire bits_n27_bit_o_qbar;
  wire n769_o;
  wire bits_n28_bit_n770;
  wire bits_n28_bit_o_q;
  wire bits_n28_bit_o_qbar;
  wire n775_o;
  wire bits_n29_bit_n776;
  wire bits_n29_bit_o_q;
  wire bits_n29_bit_o_qbar;
  wire [28:0] n781_o;
  wire [28:0] n782_o;
  assign o_count = int_count; //(module output)
  /* ./binaryCounter_nbit.vhdl:24:10  */
  assign int_count = n781_o; // (signal)
  /* ./binaryCounter_nbit.vhdl:25:10  */
  assign int_t = n782_o; // (signal)
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n439_o = int_count[27]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n440_o = int_t[27]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n441_o = n439_o & n440_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n442_o = int_count[28]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n443_o = n442_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n444_o = n441_o | n443_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n445_o = int_count[26]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n446_o = int_t[26]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n447_o = n445_o & n446_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n448_o = int_count[27]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n449_o = n448_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n450_o = n447_o | n449_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n451_o = int_count[25]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n452_o = int_t[25]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n453_o = n451_o & n452_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n454_o = int_count[26]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n455_o = n454_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n456_o = n453_o | n455_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n457_o = int_count[24]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n458_o = int_t[24]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n459_o = n457_o & n458_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n460_o = int_count[25]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n461_o = n460_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n462_o = n459_o | n461_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n463_o = int_count[23]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n464_o = int_t[23]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n465_o = n463_o & n464_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n466_o = int_count[24]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n467_o = n466_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n468_o = n465_o | n467_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n469_o = int_count[22]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n470_o = int_t[22]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n471_o = n469_o & n470_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n472_o = int_count[23]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n473_o = n472_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n474_o = n471_o | n473_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n475_o = int_count[21]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n476_o = int_t[21]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n477_o = n475_o & n476_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n478_o = int_count[22]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n479_o = n478_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n480_o = n477_o | n479_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n481_o = int_count[20]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n482_o = int_t[20]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n483_o = n481_o & n482_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n484_o = int_count[21]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n485_o = n484_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n486_o = n483_o | n485_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n487_o = int_count[19]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n488_o = int_t[19]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n489_o = n487_o & n488_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n490_o = int_count[20]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n491_o = n490_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n492_o = n489_o | n491_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n493_o = int_count[18]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n494_o = int_t[18]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n495_o = n493_o & n494_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n496_o = int_count[19]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n497_o = n496_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n498_o = n495_o | n497_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n499_o = int_count[17]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n500_o = int_t[17]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n501_o = n499_o & n500_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n502_o = int_count[18]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n503_o = n502_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n504_o = n501_o | n503_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n505_o = int_count[16]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n506_o = int_t[16]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n507_o = n505_o & n506_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n508_o = int_count[17]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n509_o = n508_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n510_o = n507_o | n509_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n511_o = int_count[15]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n512_o = int_t[15]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n513_o = n511_o & n512_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n514_o = int_count[16]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n515_o = n514_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n516_o = n513_o | n515_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n517_o = int_count[14]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n518_o = int_t[14]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n519_o = n517_o & n518_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n520_o = int_count[15]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n521_o = n520_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n522_o = n519_o | n521_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n523_o = int_count[13]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n524_o = int_t[13]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n525_o = n523_o & n524_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n526_o = int_count[14]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n527_o = n526_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n528_o = n525_o | n527_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n529_o = int_count[12]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n530_o = int_t[12]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n531_o = n529_o & n530_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n532_o = int_count[13]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n533_o = n532_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n534_o = n531_o | n533_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n535_o = int_count[11]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n536_o = int_t[11]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n537_o = n535_o & n536_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n538_o = int_count[12]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n539_o = n538_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n540_o = n537_o | n539_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n541_o = int_count[10]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n542_o = int_t[10]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n543_o = n541_o & n542_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n544_o = int_count[11]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n545_o = n544_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n546_o = n543_o | n545_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n547_o = int_count[9]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n548_o = int_t[9]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n549_o = n547_o & n548_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n550_o = int_count[10]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n551_o = n550_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n552_o = n549_o | n551_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n553_o = int_count[8]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n554_o = int_t[8]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n555_o = n553_o & n554_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n556_o = int_count[9]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n557_o = n556_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n558_o = n555_o | n557_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n559_o = int_count[7]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n560_o = int_t[7]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n561_o = n559_o & n560_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n562_o = int_count[8]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n563_o = n562_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n564_o = n561_o | n563_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n565_o = int_count[6]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n566_o = int_t[6]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n567_o = n565_o & n566_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n568_o = int_count[7]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n569_o = n568_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n570_o = n567_o | n569_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n571_o = int_count[5]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n572_o = int_t[5]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n573_o = n571_o & n572_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n574_o = int_count[6]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n575_o = n574_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n576_o = n573_o | n575_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n577_o = int_count[4]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n578_o = int_t[4]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n579_o = n577_o & n578_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n580_o = int_count[5]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n581_o = n580_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n582_o = n579_o | n581_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n583_o = int_count[3]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n584_o = int_t[3]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n585_o = n583_o & n584_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n586_o = int_count[4]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n587_o = n586_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n588_o = n585_o | n587_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n589_o = int_count[2]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n590_o = int_t[2]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n591_o = n589_o & n590_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n592_o = int_count[3]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n593_o = n592_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n594_o = n591_o | n593_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n595_o = int_count[1]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n596_o = int_t[1]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n597_o = n595_o & n596_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n598_o = int_count[2]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n599_o = n598_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n600_o = n597_o | n599_o;
  /* ./binaryCounter_nbit.vhdl:35:27  */
  assign n601_o = int_count[0]; // extract
  /* ./binaryCounter_nbit.vhdl:35:42  */
  assign n602_o = int_t[0]; // extract
  /* ./binaryCounter_nbit.vhdl:35:33  */
  assign n603_o = n601_o & n602_o;
  /* ./binaryCounter_nbit.vhdl:35:62  */
  assign n604_o = int_count[1]; // extract
  /* ./binaryCounter_nbit.vhdl:35:66  */
  assign n605_o = n604_o & i_reset;
  /* ./binaryCounter_nbit.vhdl:35:49  */
  assign n606_o = n603_o | n605_o;
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n607_o = int_t[28]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n1_bit_n608 = bits_n1_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n1_bit (
    .i_t(n607_o),
    .i_clock(i_clk),
    .o_q(bits_n1_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n613_o = int_t[27]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n2_bit_n614 = bits_n2_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n2_bit (
    .i_t(n613_o),
    .i_clock(i_clk),
    .o_q(bits_n2_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n619_o = int_t[26]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n3_bit_n620 = bits_n3_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n3_bit (
    .i_t(n619_o),
    .i_clock(i_clk),
    .o_q(bits_n3_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n625_o = int_t[25]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n4_bit_n626 = bits_n4_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n4_bit (
    .i_t(n625_o),
    .i_clock(i_clk),
    .o_q(bits_n4_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n631_o = int_t[24]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n5_bit_n632 = bits_n5_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n5_bit (
    .i_t(n631_o),
    .i_clock(i_clk),
    .o_q(bits_n5_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n637_o = int_t[23]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n6_bit_n638 = bits_n6_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n6_bit (
    .i_t(n637_o),
    .i_clock(i_clk),
    .o_q(bits_n6_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n643_o = int_t[22]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n7_bit_n644 = bits_n7_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n7_bit (
    .i_t(n643_o),
    .i_clock(i_clk),
    .o_q(bits_n7_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n649_o = int_t[21]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n8_bit_n650 = bits_n8_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n8_bit (
    .i_t(n649_o),
    .i_clock(i_clk),
    .o_q(bits_n8_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n655_o = int_t[20]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n9_bit_n656 = bits_n9_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n9_bit (
    .i_t(n655_o),
    .i_clock(i_clk),
    .o_q(bits_n9_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n661_o = int_t[19]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n10_bit_n662 = bits_n10_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n10_bit (
    .i_t(n661_o),
    .i_clock(i_clk),
    .o_q(bits_n10_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n667_o = int_t[18]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n11_bit_n668 = bits_n11_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n11_bit (
    .i_t(n667_o),
    .i_clock(i_clk),
    .o_q(bits_n11_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n673_o = int_t[17]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n12_bit_n674 = bits_n12_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n12_bit (
    .i_t(n673_o),
    .i_clock(i_clk),
    .o_q(bits_n12_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n679_o = int_t[16]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n13_bit_n680 = bits_n13_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n13_bit (
    .i_t(n679_o),
    .i_clock(i_clk),
    .o_q(bits_n13_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n685_o = int_t[15]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n14_bit_n686 = bits_n14_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n14_bit (
    .i_t(n685_o),
    .i_clock(i_clk),
    .o_q(bits_n14_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n691_o = int_t[14]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n15_bit_n692 = bits_n15_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n15_bit (
    .i_t(n691_o),
    .i_clock(i_clk),
    .o_q(bits_n15_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n697_o = int_t[13]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n16_bit_n698 = bits_n16_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n16_bit (
    .i_t(n697_o),
    .i_clock(i_clk),
    .o_q(bits_n16_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n703_o = int_t[12]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n17_bit_n704 = bits_n17_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n17_bit (
    .i_t(n703_o),
    .i_clock(i_clk),
    .o_q(bits_n17_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n709_o = int_t[11]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n18_bit_n710 = bits_n18_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n18_bit (
    .i_t(n709_o),
    .i_clock(i_clk),
    .o_q(bits_n18_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n715_o = int_t[10]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n19_bit_n716 = bits_n19_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n19_bit (
    .i_t(n715_o),
    .i_clock(i_clk),
    .o_q(bits_n19_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n721_o = int_t[9]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n20_bit_n722 = bits_n20_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n20_bit (
    .i_t(n721_o),
    .i_clock(i_clk),
    .o_q(bits_n20_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n727_o = int_t[8]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n21_bit_n728 = bits_n21_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n21_bit (
    .i_t(n727_o),
    .i_clock(i_clk),
    .o_q(bits_n21_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n733_o = int_t[7]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n22_bit_n734 = bits_n22_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n22_bit (
    .i_t(n733_o),
    .i_clock(i_clk),
    .o_q(bits_n22_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n739_o = int_t[6]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n23_bit_n740 = bits_n23_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n23_bit (
    .i_t(n739_o),
    .i_clock(i_clk),
    .o_q(bits_n23_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n745_o = int_t[5]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n24_bit_n746 = bits_n24_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n24_bit (
    .i_t(n745_o),
    .i_clock(i_clk),
    .o_q(bits_n24_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n751_o = int_t[4]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n25_bit_n752 = bits_n25_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n25_bit (
    .i_t(n751_o),
    .i_clock(i_clk),
    .o_q(bits_n25_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n757_o = int_t[3]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n26_bit_n758 = bits_n26_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n26_bit (
    .i_t(n757_o),
    .i_clock(i_clk),
    .o_q(bits_n26_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n763_o = int_t[2]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n27_bit_n764 = bits_n27_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n27_bit (
    .i_t(n763_o),
    .i_clock(i_clk),
    .o_q(bits_n27_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n769_o = int_t[1]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n28_bit_n770 = bits_n28_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n28_bit (
    .i_t(n769_o),
    .i_clock(i_clk),
    .o_q(bits_n28_bit_o_q),
    .o_qbar());
  /* ./binaryCounter_nbit.vhdl:43:21  */
  assign n775_o = int_t[0]; // extract
  /* ./binaryCounter_nbit.vhdl:44:16  */
  assign bits_n29_bit_n776 = bits_n29_bit_o_q; // (signal)
  /* ./binaryCounter_nbit.vhdl:40:7  */
  tff bits_n29_bit (
    .i_t(n775_o),
    .i_clock(i_clk),
    .o_q(bits_n29_bit_o_q),
    .o_qbar());
  assign n781_o = {bits_n1_bit_n608, bits_n2_bit_n614, bits_n3_bit_n620, bits_n4_bit_n626, bits_n5_bit_n632, bits_n6_bit_n638, bits_n7_bit_n644, bits_n8_bit_n650, bits_n9_bit_n656, bits_n10_bit_n662, bits_n11_bit_n668, bits_n12_bit_n674, bits_n13_bit_n680, bits_n14_bit_n686, bits_n15_bit_n692, bits_n16_bit_n698, bits_n17_bit_n704, bits_n18_bit_n710, bits_n19_bit_n716, bits_n20_bit_n722, bits_n21_bit_n728, bits_n22_bit_n734, bits_n23_bit_n740, bits_n24_bit_n746, bits_n25_bit_n752, bits_n26_bit_n758, bits_n27_bit_n764, bits_n28_bit_n770, bits_n29_bit_n776};
  assign n782_o = {n444_o, n450_o, n456_o, n462_o, n468_o, n474_o, n480_o, n486_o, n492_o, n498_o, n504_o, n510_o, n516_o, n522_o, n528_o, n534_o, n540_o, n546_o, n552_o, n558_o, n564_o, n570_o, n576_o, n582_o, n588_o, n594_o, n600_o, n606_o, i_enable};
endmodule

module shiftregister_8
  (input  clock,
   input  reset,
   input  load,
   input  shiftl,
   input  shiftr,
   input  shiftextension,
   input  [7:0] d,
   output [7:0] o);
  wire [7:0] int_d;
  wire [7:0] int_q;
  wire [1:0] int_sel;
  wire n331_o;
  wire n332_o;
  wire n333_o;
  wire n334_o;
  wire n335_o;
  wire n336_o;
  wire muxes_n1_mux_i_n337;
  wire muxes_n1_mux_i_o;
  wire n340_o;
  wire n341_o;
  wire n342_o;
  wire n343_o;
  wire muxes_n2_mux_i_n344;
  wire muxes_n2_mux_i_o;
  wire n347_o;
  wire n348_o;
  wire n349_o;
  wire n350_o;
  wire muxes_n3_mux_i_n351;
  wire muxes_n3_mux_i_o;
  wire n354_o;
  wire n355_o;
  wire n356_o;
  wire n357_o;
  wire muxes_n4_mux_i_n358;
  wire muxes_n4_mux_i_o;
  wire n361_o;
  wire n362_o;
  wire n363_o;
  wire n364_o;
  wire muxes_n5_mux_i_n365;
  wire muxes_n5_mux_i_o;
  wire n368_o;
  wire n369_o;
  wire n370_o;
  wire n371_o;
  wire muxes_n6_mux_i_n372;
  wire muxes_n6_mux_i_o;
  wire n375_o;
  wire n376_o;
  wire n377_o;
  wire mux_lsb_n378;
  wire mux_lsb_o;
  wire n381_o;
  wire n382_o;
  wire n383_o;
  wire mux_msb_n384;
  wire mux_msb_o;
  wire n387_o;
  wire bits_n1_b_i_n388;
  wire bits_n1_b_i_o_q;
  wire bits_n1_b_i_o_qbar;
  wire n393_o;
  wire bits_n2_b_i_n394;
  wire bits_n2_b_i_o_q;
  wire bits_n2_b_i_o_qbar;
  wire n399_o;
  wire bits_n3_b_i_n400;
  wire bits_n3_b_i_o_q;
  wire bits_n3_b_i_o_qbar;
  wire n405_o;
  wire bits_n4_b_i_n406;
  wire bits_n4_b_i_o_q;
  wire bits_n4_b_i_o_qbar;
  wire n411_o;
  wire bits_n5_b_i_n412;
  wire bits_n5_b_i_o_q;
  wire bits_n5_b_i_o_qbar;
  wire n417_o;
  wire bits_n6_b_i_n418;
  wire bits_n6_b_i_o_q;
  wire bits_n6_b_i_o_qbar;
  wire n423_o;
  wire bits_n7_b_i_n424;
  wire bits_n7_b_i_o_q;
  wire bits_n7_b_i_o_qbar;
  wire n429_o;
  wire bits_n8_b_i_n430;
  wire bits_n8_b_i_o_q;
  wire bits_n8_b_i_o_qbar;
  wire [7:0] n435_o;
  wire [7:0] n436_o;
  wire [1:0] n437_o;
  assign o = int_q; //(module output)
  /* ./shiftReg-nbit.vhdl:19:10  */
  assign int_d = n435_o; // (signal)
  /* ./shiftReg-nbit.vhdl:20:10  */
  assign int_q = n436_o; // (signal)
  /* ./shiftReg-nbit.vhdl:21:10  */
  assign int_sel = n437_o; // (signal)
  /* ./shiftReg-nbit.vhdl:45:24  */
  assign n331_o = shiftl | load;
  /* ./shiftReg-nbit.vhdl:46:24  */
  assign n332_o = shiftr | load;
  /* ./shiftReg-nbit.vhdl:52:17  */
  assign n333_o = int_q[6]; // extract
  /* ./shiftReg-nbit.vhdl:53:17  */
  assign n334_o = int_q[7]; // extract
  /* ./shiftReg-nbit.vhdl:54:17  */
  assign n335_o = int_q[5]; // extract
  /* ./shiftReg-nbit.vhdl:55:13  */
  assign n336_o = d[6]; // extract
  /* ./shiftReg-nbit.vhdl:57:12  */
  assign muxes_n1_mux_i_n337 = muxes_n1_mux_i_o; // (signal)
  /* ./shiftReg-nbit.vhdl:50:5  */
  mux4_1bit muxes_n1_mux_i (
    .a(n333_o),
    .b(n334_o),
    .c(n335_o),
    .d(n336_o),
    .sel(int_sel),
    .o(muxes_n1_mux_i_o));
  /* ./shiftReg-nbit.vhdl:52:17  */
  assign n340_o = int_q[5]; // extract
  /* ./shiftReg-nbit.vhdl:53:17  */
  assign n341_o = int_q[6]; // extract
  /* ./shiftReg-nbit.vhdl:54:17  */
  assign n342_o = int_q[4]; // extract
  /* ./shiftReg-nbit.vhdl:55:13  */
  assign n343_o = d[5]; // extract
  /* ./shiftReg-nbit.vhdl:57:12  */
  assign muxes_n2_mux_i_n344 = muxes_n2_mux_i_o; // (signal)
  /* ./shiftReg-nbit.vhdl:50:5  */
  mux4_1bit muxes_n2_mux_i (
    .a(n340_o),
    .b(n341_o),
    .c(n342_o),
    .d(n343_o),
    .sel(int_sel),
    .o(muxes_n2_mux_i_o));
  /* ./shiftReg-nbit.vhdl:52:17  */
  assign n347_o = int_q[4]; // extract
  /* ./shiftReg-nbit.vhdl:53:17  */
  assign n348_o = int_q[5]; // extract
  /* ./shiftReg-nbit.vhdl:54:17  */
  assign n349_o = int_q[3]; // extract
  /* ./shiftReg-nbit.vhdl:55:13  */
  assign n350_o = d[4]; // extract
  /* ./shiftReg-nbit.vhdl:57:12  */
  assign muxes_n3_mux_i_n351 = muxes_n3_mux_i_o; // (signal)
  /* ./shiftReg-nbit.vhdl:50:5  */
  mux4_1bit muxes_n3_mux_i (
    .a(n347_o),
    .b(n348_o),
    .c(n349_o),
    .d(n350_o),
    .sel(int_sel),
    .o(muxes_n3_mux_i_o));
  /* ./shiftReg-nbit.vhdl:52:17  */
  assign n354_o = int_q[3]; // extract
  /* ./shiftReg-nbit.vhdl:53:17  */
  assign n355_o = int_q[4]; // extract
  /* ./shiftReg-nbit.vhdl:54:17  */
  assign n356_o = int_q[2]; // extract
  /* ./shiftReg-nbit.vhdl:55:13  */
  assign n357_o = d[3]; // extract
  /* ./shiftReg-nbit.vhdl:57:12  */
  assign muxes_n4_mux_i_n358 = muxes_n4_mux_i_o; // (signal)
  /* ./shiftReg-nbit.vhdl:50:5  */
  mux4_1bit muxes_n4_mux_i (
    .a(n354_o),
    .b(n355_o),
    .c(n356_o),
    .d(n357_o),
    .sel(int_sel),
    .o(muxes_n4_mux_i_o));
  /* ./shiftReg-nbit.vhdl:52:17  */
  assign n361_o = int_q[2]; // extract
  /* ./shiftReg-nbit.vhdl:53:17  */
  assign n362_o = int_q[3]; // extract
  /* ./shiftReg-nbit.vhdl:54:17  */
  assign n363_o = int_q[1]; // extract
  /* ./shiftReg-nbit.vhdl:55:13  */
  assign n364_o = d[2]; // extract
  /* ./shiftReg-nbit.vhdl:57:12  */
  assign muxes_n5_mux_i_n365 = muxes_n5_mux_i_o; // (signal)
  /* ./shiftReg-nbit.vhdl:50:5  */
  mux4_1bit muxes_n5_mux_i (
    .a(n361_o),
    .b(n362_o),
    .c(n363_o),
    .d(n364_o),
    .sel(int_sel),
    .o(muxes_n5_mux_i_o));
  /* ./shiftReg-nbit.vhdl:52:17  */
  assign n368_o = int_q[1]; // extract
  /* ./shiftReg-nbit.vhdl:53:17  */
  assign n369_o = int_q[2]; // extract
  /* ./shiftReg-nbit.vhdl:54:17  */
  assign n370_o = int_q[0]; // extract
  /* ./shiftReg-nbit.vhdl:55:13  */
  assign n371_o = d[1]; // extract
  /* ./shiftReg-nbit.vhdl:57:12  */
  assign muxes_n6_mux_i_n372 = muxes_n6_mux_i_o; // (signal)
  /* ./shiftReg-nbit.vhdl:50:5  */
  mux4_1bit muxes_n6_mux_i (
    .a(n368_o),
    .b(n369_o),
    .c(n370_o),
    .d(n371_o),
    .sel(int_sel),
    .o(muxes_n6_mux_i_o));
  /* ./shiftReg-nbit.vhdl:65:15  */
  assign n375_o = int_q[0]; // extract
  /* ./shiftReg-nbit.vhdl:66:15  */
  assign n376_o = int_q[1]; // extract
  /* ./shiftReg-nbit.vhdl:68:11  */
  assign n377_o = d[0]; // extract
  /* ./shiftReg-nbit.vhdl:70:10  */
  assign mux_lsb_n378 = mux_lsb_o; // (signal)
  /* ./shiftReg-nbit.vhdl:63:3  */
  mux4_1bit mux_lsb (
    .a(n375_o),
    .b(n376_o),
    .c(shiftextension),
    .d(n377_o),
    .sel(int_sel),
    .o(mux_lsb_o));
  /* ./shiftReg-nbit.vhdl:76:15  */
  assign n381_o = int_q[7]; // extract
  /* ./shiftReg-nbit.vhdl:78:15  */
  assign n382_o = int_q[6]; // extract
  /* ./shiftReg-nbit.vhdl:79:11  */
  assign n383_o = d[7]; // extract
  /* ./shiftReg-nbit.vhdl:81:10  */
  assign mux_msb_n384 = mux_msb_o; // (signal)
  /* ./shiftReg-nbit.vhdl:74:3  */
  mux4_1bit mux_msb (
    .a(n381_o),
    .b(shiftextension),
    .c(n382_o),
    .d(n383_o),
    .sel(int_sel),
    .o(mux_msb_o));
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n387_o = int_d[7]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n1_b_i_n388 = bits_n1_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n1_b_i (
    .i_d(n387_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n1_b_i_o_q),
    .o_qbar());
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n393_o = int_d[6]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n2_b_i_n394 = bits_n2_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n2_b_i (
    .i_d(n393_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n2_b_i_o_q),
    .o_qbar());
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n399_o = int_d[5]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n3_b_i_n400 = bits_n3_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n3_b_i (
    .i_d(n399_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n3_b_i_o_q),
    .o_qbar());
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n405_o = int_d[4]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n4_b_i_n406 = bits_n4_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n4_b_i (
    .i_d(n405_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n4_b_i_o_q),
    .o_qbar());
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n411_o = int_d[3]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n5_b_i_n412 = bits_n5_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n5_b_i (
    .i_d(n411_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n5_b_i_o_q),
    .o_qbar());
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n417_o = int_d[2]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n6_b_i_n418 = bits_n6_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n6_b_i (
    .i_d(n417_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n6_b_i_o_q),
    .o_qbar());
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n423_o = int_d[1]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n7_b_i_n424 = bits_n7_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n7_b_i (
    .i_d(n423_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n7_b_i_o_q),
    .o_qbar());
  /* ./shiftReg-nbit.vhdl:90:19  */
  assign n429_o = int_d[0]; // extract
  /* ./shiftReg-nbit.vhdl:91:14  */
  assign bits_n8_b_i_n430 = bits_n8_b_i_o_q; // (signal)
  /* ./shiftReg-nbit.vhdl:86:5  */
  dflipflop bits_n8_b_i (
    .i_d(n429_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n8_b_i_o_q),
    .o_qbar());
  assign n435_o = {mux_msb_n384, muxes_n1_mux_i_n337, muxes_n2_mux_i_n344, muxes_n3_mux_i_n351, muxes_n4_mux_i_n358, muxes_n5_mux_i_n365, muxes_n6_mux_i_n372, mux_lsb_n378};
  assign n436_o = {bits_n1_b_i_n388, bits_n2_b_i_n394, bits_n3_b_i_n400, bits_n4_b_i_n406, bits_n5_b_i_n412, bits_n6_b_i_n418, bits_n7_b_i_n424, bits_n8_b_i_n430};
  assign n437_o = {n331_o, n332_o};
endmodule

module mux4_nbit_8
  (input  [7:0] i_1,
   input  [7:0] i_2,
   input  [7:0] i_3,
   input  [7:0] i_4,
   input  [1:0] sel,
   output [7:0] o);
  wire n113_o;
  wire n114_o;
  wire n115_o;
  wire n116_o;
  wire n117_o;
  wire n118_o;
  wire n119_o;
  wire n120_o;
  wire n121_o;
  wire n122_o;
  wire n123_o;
  wire n124_o;
  wire n125_o;
  wire n126_o;
  wire n127_o;
  wire n128_o;
  wire n129_o;
  wire n130_o;
  wire n131_o;
  wire n132_o;
  wire n133_o;
  wire n134_o;
  wire n135_o;
  wire n136_o;
  wire n137_o;
  wire n138_o;
  wire n139_o;
  wire n140_o;
  wire n141_o;
  wire n142_o;
  wire n143_o;
  wire n144_o;
  wire n145_o;
  wire n146_o;
  wire n147_o;
  wire n148_o;
  wire n149_o;
  wire n150_o;
  wire n151_o;
  wire n152_o;
  wire n153_o;
  wire n154_o;
  wire n155_o;
  wire n156_o;
  wire n157_o;
  wire n158_o;
  wire n159_o;
  wire n160_o;
  wire n161_o;
  wire n162_o;
  wire n163_o;
  wire n164_o;
  wire n165_o;
  wire n166_o;
  wire n167_o;
  wire n168_o;
  wire n169_o;
  wire n170_o;
  wire n171_o;
  wire n172_o;
  wire n173_o;
  wire n174_o;
  wire n175_o;
  wire n176_o;
  wire n177_o;
  wire n178_o;
  wire n179_o;
  wire n180_o;
  wire n181_o;
  wire n182_o;
  wire n183_o;
  wire n184_o;
  wire n185_o;
  wire n186_o;
  wire n187_o;
  wire n188_o;
  wire n189_o;
  wire n190_o;
  wire n191_o;
  wire n192_o;
  wire n193_o;
  wire n194_o;
  wire n195_o;
  wire n196_o;
  wire n197_o;
  wire n198_o;
  wire n199_o;
  wire n200_o;
  wire n201_o;
  wire n202_o;
  wire n203_o;
  wire n204_o;
  wire n205_o;
  wire n206_o;
  wire n207_o;
  wire n208_o;
  wire n209_o;
  wire n210_o;
  wire n211_o;
  wire n212_o;
  wire n213_o;
  wire n214_o;
  wire n215_o;
  wire n216_o;
  wire n217_o;
  wire n218_o;
  wire n219_o;
  wire n220_o;
  wire n221_o;
  wire n222_o;
  wire n223_o;
  wire n224_o;
  wire n225_o;
  wire n226_o;
  wire n227_o;
  wire n228_o;
  wire n229_o;
  wire n230_o;
  wire n231_o;
  wire n232_o;
  wire n233_o;
  wire n234_o;
  wire n235_o;
  wire n236_o;
  wire n237_o;
  wire n238_o;
  wire n239_o;
  wire n240_o;
  wire n241_o;
  wire n242_o;
  wire n243_o;
  wire n244_o;
  wire n245_o;
  wire n246_o;
  wire n247_o;
  wire n248_o;
  wire n249_o;
  wire n250_o;
  wire n251_o;
  wire n252_o;
  wire n253_o;
  wire n254_o;
  wire n255_o;
  wire n256_o;
  wire n257_o;
  wire n258_o;
  wire n259_o;
  wire n260_o;
  wire n261_o;
  wire n262_o;
  wire n263_o;
  wire n264_o;
  wire n265_o;
  wire n266_o;
  wire n267_o;
  wire n268_o;
  wire n269_o;
  wire n270_o;
  wire n271_o;
  wire n272_o;
  wire n273_o;
  wire n274_o;
  wire n275_o;
  wire n276_o;
  wire n277_o;
  wire n278_o;
  wire n279_o;
  wire n280_o;
  wire n281_o;
  wire n282_o;
  wire n283_o;
  wire n284_o;
  wire n285_o;
  wire n286_o;
  wire n287_o;
  wire n288_o;
  wire n289_o;
  wire n290_o;
  wire n291_o;
  wire n292_o;
  wire n293_o;
  wire n294_o;
  wire n295_o;
  wire n296_o;
  wire n297_o;
  wire n298_o;
  wire n299_o;
  wire n300_o;
  wire n301_o;
  wire n302_o;
  wire n303_o;
  wire n304_o;
  wire n305_o;
  wire n306_o;
  wire n307_o;
  wire n308_o;
  wire n309_o;
  wire n310_o;
  wire n311_o;
  wire n312_o;
  wire n313_o;
  wire n314_o;
  wire n315_o;
  wire n316_o;
  wire n317_o;
  wire n318_o;
  wire n319_o;
  wire n320_o;
  wire n321_o;
  wire n322_o;
  wire n323_o;
  wire n324_o;
  wire n325_o;
  wire n326_o;
  wire n327_o;
  wire n328_o;
  wire [7:0] n329_o;
  assign o = n329_o; //(module output)
  /* ./mux4_nBit.vhdl:19:11  */
  assign n113_o = i_1[7]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n114_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n115_o = ~n114_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n116_o = n113_o & n115_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n117_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n118_o = ~n117_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n119_o = n116_o & n118_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n120_o = i_2[7]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n121_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n122_o = ~n121_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n123_o = n120_o & n122_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n124_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n125_o = n123_o & n124_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n126_o = n119_o | n125_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n127_o = i_3[7]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n128_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n129_o = n127_o & n128_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n130_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n131_o = ~n130_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n132_o = n129_o & n131_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n133_o = n126_o | n132_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n134_o = i_4[7]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n135_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n136_o = n134_o & n135_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n137_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n138_o = n136_o & n137_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n139_o = n133_o | n138_o;
  /* ./mux4_nBit.vhdl:19:11  */
  assign n140_o = i_1[6]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n141_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n142_o = ~n141_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n143_o = n140_o & n142_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n144_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n145_o = ~n144_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n146_o = n143_o & n145_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n147_o = i_2[6]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n148_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n149_o = ~n148_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n150_o = n147_o & n149_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n151_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n152_o = n150_o & n151_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n153_o = n146_o | n152_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n154_o = i_3[6]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n155_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n156_o = n154_o & n155_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n157_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n158_o = ~n157_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n159_o = n156_o & n158_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n160_o = n153_o | n159_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n161_o = i_4[6]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n162_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n163_o = n161_o & n162_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n164_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n165_o = n163_o & n164_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n166_o = n160_o | n165_o;
  /* ./mux4_nBit.vhdl:19:11  */
  assign n167_o = i_1[5]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n168_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n169_o = ~n168_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n170_o = n167_o & n169_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n171_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n172_o = ~n171_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n173_o = n170_o & n172_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n174_o = i_2[5]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n175_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n176_o = ~n175_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n177_o = n174_o & n176_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n178_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n179_o = n177_o & n178_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n180_o = n173_o | n179_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n181_o = i_3[5]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n182_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n183_o = n181_o & n182_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n184_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n185_o = ~n184_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n186_o = n183_o & n185_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n187_o = n180_o | n186_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n188_o = i_4[5]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n189_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n190_o = n188_o & n189_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n191_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n192_o = n190_o & n191_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n193_o = n187_o | n192_o;
  /* ./mux4_nBit.vhdl:19:11  */
  assign n194_o = i_1[4]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n195_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n196_o = ~n195_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n197_o = n194_o & n196_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n198_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n199_o = ~n198_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n200_o = n197_o & n199_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n201_o = i_2[4]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n202_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n203_o = ~n202_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n204_o = n201_o & n203_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n205_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n206_o = n204_o & n205_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n207_o = n200_o | n206_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n208_o = i_3[4]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n209_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n210_o = n208_o & n209_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n211_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n212_o = ~n211_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n213_o = n210_o & n212_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n214_o = n207_o | n213_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n215_o = i_4[4]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n216_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n217_o = n215_o & n216_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n218_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n219_o = n217_o & n218_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n220_o = n214_o | n219_o;
  /* ./mux4_nBit.vhdl:19:11  */
  assign n221_o = i_1[3]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n222_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n223_o = ~n222_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n224_o = n221_o & n223_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n225_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n226_o = ~n225_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n227_o = n224_o & n226_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n228_o = i_2[3]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n229_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n230_o = ~n229_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n231_o = n228_o & n230_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n232_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n233_o = n231_o & n232_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n234_o = n227_o | n233_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n235_o = i_3[3]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n236_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n237_o = n235_o & n236_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n238_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n239_o = ~n238_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n240_o = n237_o & n239_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n241_o = n234_o | n240_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n242_o = i_4[3]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n243_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n244_o = n242_o & n243_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n245_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n246_o = n244_o & n245_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n247_o = n241_o | n246_o;
  /* ./mux4_nBit.vhdl:19:11  */
  assign n248_o = i_1[2]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n249_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n250_o = ~n249_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n251_o = n248_o & n250_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n252_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n253_o = ~n252_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n254_o = n251_o & n253_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n255_o = i_2[2]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n256_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n257_o = ~n256_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n258_o = n255_o & n257_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n259_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n260_o = n258_o & n259_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n261_o = n254_o | n260_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n262_o = i_3[2]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n263_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n264_o = n262_o & n263_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n265_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n266_o = ~n265_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n267_o = n264_o & n266_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n268_o = n261_o | n267_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n269_o = i_4[2]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n270_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n271_o = n269_o & n270_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n272_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n273_o = n271_o & n272_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n274_o = n268_o | n273_o;
  /* ./mux4_nBit.vhdl:19:11  */
  assign n275_o = i_1[1]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n276_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n277_o = ~n276_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n278_o = n275_o & n277_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n279_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n280_o = ~n279_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n281_o = n278_o & n280_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n282_o = i_2[1]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n283_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n284_o = ~n283_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n285_o = n282_o & n284_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n286_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n287_o = n285_o & n286_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n288_o = n281_o | n287_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n289_o = i_3[1]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n290_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n291_o = n289_o & n290_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n292_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n293_o = ~n292_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n294_o = n291_o & n293_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n295_o = n288_o | n294_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n296_o = i_4[1]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n297_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n298_o = n296_o & n297_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n299_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n300_o = n298_o & n299_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n301_o = n295_o | n300_o;
  /* ./mux4_nBit.vhdl:19:11  */
  assign n302_o = i_1[0]; // extract
  /* ./mux4_nBit.vhdl:19:26  */
  assign n303_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:19:19  */
  assign n304_o = ~n303_o;
  /* ./mux4_nBit.vhdl:19:15  */
  assign n305_o = n302_o & n304_o;
  /* ./mux4_nBit.vhdl:19:41  */
  assign n306_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:19:34  */
  assign n307_o = ~n306_o;
  /* ./mux4_nBit.vhdl:19:30  */
  assign n308_o = n305_o & n307_o;
  /* ./mux4_nBit.vhdl:20:11  */
  assign n309_o = i_2[0]; // extract
  /* ./mux4_nBit.vhdl:20:26  */
  assign n310_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:20:19  */
  assign n311_o = ~n310_o;
  /* ./mux4_nBit.vhdl:20:15  */
  assign n312_o = n309_o & n311_o;
  /* ./mux4_nBit.vhdl:20:37  */
  assign n313_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:20:30  */
  assign n314_o = n312_o & n313_o;
  /* ./mux4_nBit.vhdl:19:46  */
  assign n315_o = n308_o | n314_o;
  /* ./mux4_nBit.vhdl:21:11  */
  assign n316_o = i_3[0]; // extract
  /* ./mux4_nBit.vhdl:21:22  */
  assign n317_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:21:15  */
  assign n318_o = n316_o & n317_o;
  /* ./mux4_nBit.vhdl:21:37  */
  assign n319_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:21:30  */
  assign n320_o = ~n319_o;
  /* ./mux4_nBit.vhdl:21:26  */
  assign n321_o = n318_o & n320_o;
  /* ./mux4_nBit.vhdl:20:42  */
  assign n322_o = n315_o | n321_o;
  /* ./mux4_nBit.vhdl:22:11  */
  assign n323_o = i_4[0]; // extract
  /* ./mux4_nBit.vhdl:22:22  */
  assign n324_o = sel[1]; // extract
  /* ./mux4_nBit.vhdl:22:15  */
  assign n325_o = n323_o & n324_o;
  /* ./mux4_nBit.vhdl:22:33  */
  assign n326_o = sel[0]; // extract
  /* ./mux4_nBit.vhdl:22:26  */
  assign n327_o = n325_o & n326_o;
  /* ./mux4_nBit.vhdl:21:42  */
  assign n328_o = n322_o | n327_o;
  assign n329_o = {n139_o, n166_o, n193_o, n220_o, n247_o, n274_o, n301_o, n328_o};
endmodule

module lab1_control
  (input  i_clock,
   input  i_reset,
   input  i_left,
   input  i_right,
   output o_loaddisplay,
   output o_loadlmask,
   output o_loadrmask,
   output o_shiftlmask,
   output o_shiftrmask);
  wire s0in;
  wire s1in;
  wire s2in;
  wire s3in;
  wire s4in;
  wire s0out;
  wire s1out;
  wire s2out;
  wire s3out;
  wire s4out;
  wire int_reset;
  wire n64_o;
  wire n65_o;
  wire n66_o;
  wire n67_o;
  wire n68_o;
  wire n69_o;
  wire n70_o;
  wire n71_o;
  wire n72_o;
  wire n73_o;
  wire n74_o;
  wire n75_o;
  wire n76_o;
  wire n77_o;
  wire n78_o;
  wire n79_o;
  wire n80_o;
  wire n81_o;
  wire n82_o;
  wire n83_o;
  wire n84_o;
  wire n85_o;
  wire n86_o;
  wire s0_n87;
  wire s0_o_q;
  wire s0_o_qbar;
  wire s1_n92;
  wire s1_o_q;
  wire s1_o_qbar;
  wire s2_n97;
  wire s2_o_q;
  wire s2_o_qbar;
  wire s3_n102;
  wire s3_o_q;
  wire s3_o_qbar;
  wire s4_n107;
  wire s4_o_q;
  wire s4_o_qbar;
  assign o_loaddisplay = n84_o; //(module output)
  assign o_loadlmask = s0out; //(module output)
  assign o_loadrmask = s0out; //(module output)
  assign o_shiftlmask = n85_o; //(module output)
  assign o_shiftrmask = n86_o; //(module output)
  /* ./lab1_control.vhdl:21:10  */
  assign s0in = int_reset; // (signal)
  /* ./lab1_control.vhdl:21:16  */
  assign s1in = n67_o; // (signal)
  /* ./lab1_control.vhdl:21:22  */
  assign s2in = n71_o; // (signal)
  /* ./lab1_control.vhdl:21:28  */
  assign s3in = n75_o; // (signal)
  /* ./lab1_control.vhdl:21:34  */
  assign s4in = n80_o; // (signal)
  /* ./lab1_control.vhdl:22:10  */
  assign s0out = s0_n87; // (signal)
  /* ./lab1_control.vhdl:22:17  */
  assign s1out = s1_n92; // (signal)
  /* ./lab1_control.vhdl:22:24  */
  assign s2out = s2_n97; // (signal)
  /* ./lab1_control.vhdl:22:31  */
  assign s3out = s3_n102; // (signal)
  /* ./lab1_control.vhdl:22:38  */
  assign s4out = s4_n107; // (signal)
  /* ./lab1_control.vhdl:31:10  */
  assign int_reset = n64_o; // (signal)
  /* ./lab1_control.vhdl:34:16  */
  assign n64_o = ~i_reset;
  /* ./lab1_control.vhdl:37:18  */
  assign n65_o = i_left & i_right;
  /* ./lab1_control.vhdl:37:34  */
  assign n66_o = ~int_reset;
  /* ./lab1_control.vhdl:37:30  */
  assign n67_o = n65_o & n66_o;
  /* ./lab1_control.vhdl:38:22  */
  assign n68_o = ~i_right;
  /* ./lab1_control.vhdl:38:18  */
  assign n69_o = i_left & n68_o;
  /* ./lab1_control.vhdl:38:38  */
  assign n70_o = ~int_reset;
  /* ./lab1_control.vhdl:38:34  */
  assign n71_o = n69_o & n70_o;
  /* ./lab1_control.vhdl:39:11  */
  assign n72_o = ~i_left;
  /* ./lab1_control.vhdl:39:22  */
  assign n73_o = n72_o & i_right;
  /* ./lab1_control.vhdl:39:38  */
  assign n74_o = ~int_reset;
  /* ./lab1_control.vhdl:39:34  */
  assign n75_o = n73_o & n74_o;
  /* ./lab1_control.vhdl:40:11  */
  assign n76_o = ~i_left;
  /* ./lab1_control.vhdl:40:26  */
  assign n77_o = ~i_right;
  /* ./lab1_control.vhdl:40:22  */
  assign n78_o = n76_o & n77_o;
  /* ./lab1_control.vhdl:40:42  */
  assign n79_o = ~int_reset;
  /* ./lab1_control.vhdl:40:38  */
  assign n80_o = n78_o & n79_o;
  /* ./lab1_control.vhdl:45:26  */
  assign n81_o = s0out | s1out;
  /* ./lab1_control.vhdl:45:35  */
  assign n82_o = n81_o | s2out;
  /* ./lab1_control.vhdl:45:44  */
  assign n83_o = n82_o | s3out;
  /* ./lab1_control.vhdl:45:53  */
  assign n84_o = n83_o | s4out;
  /* ./lab1_control.vhdl:46:25  */
  assign n85_o = s1out | s2out;
  /* ./lab1_control.vhdl:47:25  */
  assign n86_o = s1out | s3out;
  /* ./lab1_control.vhdl:53:14  */
  assign s0_n87 = s0_o_q; // (signal)
  /* ./lab1_control.vhdl:49:1  */
  dff_2 s0 (
    .i_d(s0in),
    .i_clock(i_clock),
    .o_q(s0_o_q),
    .o_qbar());
  /* ./lab1_control.vhdl:60:14  */
  assign s1_n92 = s1_o_q; // (signal)
  /* ./lab1_control.vhdl:56:1  */
  dff_2 s1 (
    .i_d(s1in),
    .i_clock(i_clock),
    .o_q(s1_o_q),
    .o_qbar());
  /* ./lab1_control.vhdl:67:14  */
  assign s2_n97 = s2_o_q; // (signal)
  /* ./lab1_control.vhdl:63:1  */
  dff_2 s2 (
    .i_d(s2in),
    .i_clock(i_clock),
    .o_q(s2_o_q),
    .o_qbar());
  /* ./lab1_control.vhdl:74:14  */
  assign s3_n102 = s3_o_q; // (signal)
  /* ./lab1_control.vhdl:70:1  */
  dff_2 s3 (
    .i_d(s3in),
    .i_clock(i_clock),
    .o_q(s3_o_q),
    .o_qbar());
  /* ./lab1_control.vhdl:81:14  */
  assign s4_n107 = s4_o_q; // (signal)
  /* ./lab1_control.vhdl:77:1  */
  dff_2 s4 (
    .i_d(s4in),
    .i_clock(i_clock),
    .o_q(s4_o_q),
    .o_qbar());
endmodule

module clockdiv_100mhz
  (input  i_clk_100mhz,
   output o_clk_25mhz,
   output o_clk_20hz,
   output o_clk_10hz,
   output o_clk_5hz);
  wire [28:0] int_count;
  localparam n50_o = 1'b1;
  localparam n51_o = 1'b0;
  wire [28:0] counter_n52;
  wire [28:0] counter_o_count;
  wire n55_o;
  wire n56_o;
  wire n57_o;
  wire n58_o;
  assign o_clk_25mhz = n55_o; //(module output)
  assign o_clk_20hz = n56_o; //(module output)
  assign o_clk_10hz = n57_o; //(module output)
  assign o_clk_5hz = n58_o; //(module output)
  /* ./clockDiv_100Mhz.vhdl:28:10  */
  assign int_count = counter_n52; // (signal)
  /* ./clockDiv_100Mhz.vhdl:36:18  */
  assign counter_n52 = counter_o_count; // (signal)
  /* ./clockDiv_100Mhz.vhdl:30:3  */
  binarycounter_nbit_29 counter (
    .i_clk(i_clk_100mhz),
    .i_enable(n50_o),
    .i_reset(n51_o),
    .o_count(counter_o_count));
  /* ./clockDiv_100Mhz.vhdl:39:27  */
  assign n55_o = int_count[2]; // extract
  /* ./clockDiv_100Mhz.vhdl:41:26  */
  assign n56_o = int_count[26]; // extract
  /* ./clockDiv_100Mhz.vhdl:42:26  */
  assign n57_o = int_count[27]; // extract
  /* ./clockDiv_100Mhz.vhdl:43:25  */
  assign n58_o = int_count[28]; // extract
endmodule

module lab1_topLevel
  (input  GClock,
   input  GReset,
   input  Left,
   input  Right,
   output [7:0] DisplayOut);
  wire zero;
  wire [7:0] zero_8bit;
  wire int_loaddisplay;
  wire int_loadlmask;
  wire int_loadrmask;
  wire int_shiftrmask;
  wire int_shiftlmask;
  wire [7:0] int_displayin;
  wire [7:0] int_rmaskin;
  wire [7:0] int_lmaskin;
  wire [7:0] int_rmaskout;
  wire [7:0] int_lmaskout;
  wire [7:0] int_bothout;
  wire [1:0] int_muxsel;
  wire int_clock;
  wire int_reset;
  wire [7:0] n3_o;
  wire clock_div_n7;
  wire clock_div_o_clk_25mhz;
  wire clock_div_o_clk_20hz;
  wire clock_div_o_clk_10hz;
  wire clock_div_o_clk_5hz;
  wire control_n15;
  wire control_n16;
  wire control_n17;
  wire control_n18;
  wire control_n19;
  wire control_o_loaddisplay;
  wire control_o_loadlmask;
  wire control_o_loadrmask;
  wire control_o_shiftlmask;
  wire control_o_shiftrmask;
  wire [7:0] mux_n30;
  wire [7:0] mux_o;
  wire [7:0] displayreg_n33;
  wire [7:0] displayreg_o;
  wire n36_o;
  wire [7:0] lmaskreg_n37;
  wire [7:0] lmaskreg_o;
  wire n40_o;
  wire [7:0] rmaskreg_n41;
  wire [7:0] rmaskreg_o;
  wire [1:0] n45_o;
  assign DisplayOut = displayreg_n33; //(module output)
  /* ./lab1_topLevel.vhdl:64:8  */
  assign zero = 1'b0; // (signal)
  /* ./lab1_topLevel.vhdl:65:8  */
  assign zero_8bit = 8'b00000000; // (signal)
  /* ./lab1_topLevel.vhdl:67:8  */
  assign int_loaddisplay = control_n15; // (signal)
  /* ./lab1_topLevel.vhdl:67:25  */
  assign int_loadlmask = control_n16; // (signal)
  /* ./lab1_topLevel.vhdl:67:40  */
  assign int_loadrmask = control_n17; // (signal)
  /* ./lab1_topLevel.vhdl:68:8  */
  assign int_shiftrmask = control_n19; // (signal)
  /* ./lab1_topLevel.vhdl:68:24  */
  assign int_shiftlmask = control_n18; // (signal)
  /* ./lab1_topLevel.vhdl:70:8  */
  assign int_displayin = mux_n30; // (signal)
  /* ./lab1_topLevel.vhdl:70:23  */
  assign int_rmaskin = 8'b10000000; // (signal)
  /* ./lab1_topLevel.vhdl:70:36  */
  assign int_lmaskin = 8'b00000001; // (signal)
  /* ./lab1_topLevel.vhdl:71:24  */
  assign int_rmaskout = rmaskreg_n41; // (signal)
  /* ./lab1_topLevel.vhdl:71:38  */
  assign int_lmaskout = lmaskreg_n37; // (signal)
  /* ./lab1_topLevel.vhdl:71:52  */
  assign int_bothout = n3_o; // (signal)
  /* ./lab1_topLevel.vhdl:73:8  */
  assign int_muxsel = n45_o; // (signal)
  /* ./lab1_topLevel.vhdl:74:8  */
  assign int_clock = clock_div_n7; // (signal)
  /* ./lab1_topLevel.vhdl:74:19  */
  assign int_reset = GReset; // (signal)
  /* ./lab1_topLevel.vhdl:81:29  */
  assign n3_o = int_lmaskout | int_rmaskout;
  /* ./lab1_topLevel.vhdl:97:19  */
  assign clock_div_n7 = clock_div_o_clk_20hz; // (signal)
  /* ./lab1_topLevel.vhdl:94:1  */
  clockdiv_100mhz clock_div (
    .i_clk_100mhz(GClock),
    .o_clk_25mhz(),
    .o_clk_20hz(clock_div_o_clk_20hz),
    .o_clk_10hz(),
    .o_clk_5hz());
  /* ./lab1_topLevel.vhdl:108:22  */
  assign control_n15 = control_o_loaddisplay; // (signal)
  /* ./lab1_topLevel.vhdl:109:20  */
  assign control_n16 = control_o_loadlmask; // (signal)
  /* ./lab1_topLevel.vhdl:110:20  */
  assign control_n17 = control_o_loadrmask; // (signal)
  /* ./lab1_topLevel.vhdl:111:21  */
  assign control_n18 = control_o_shiftlmask; // (signal)
  /* ./lab1_topLevel.vhdl:112:21  */
  assign control_n19 = control_o_shiftrmask; // (signal)
  /* ./lab1_topLevel.vhdl:102:1  */
  lab1_control control (
    .i_clock(int_clock),
    .i_reset(int_reset),
    .i_left(Left),
    .i_right(Right),
    .o_loaddisplay(control_o_loaddisplay),
    .o_loadlmask(control_o_loadlmask),
    .o_loadrmask(control_o_loadrmask),
    .o_shiftlmask(control_o_shiftlmask),
    .o_shiftrmask(control_o_shiftrmask));
  /* ./lab1_topLevel.vhdl:123:10  */
  assign mux_n30 = mux_o; // (signal)
  /* ./lab1_topLevel.vhdl:115:1  */
  mux4_nbit_8 mux (
    .i_1(zero_8bit),
    .i_2(int_rmaskout),
    .i_3(int_lmaskout),
    .i_4(int_bothout),
    .sel(int_muxsel),
    .o(mux_o));
  /* ./lab1_topLevel.vhdl:136:10  */
  assign displayreg_n33 = displayreg_o; // (signal)
  /* ./lab1_topLevel.vhdl:126:1  */
  shiftregister_8 displayreg (
    .clock(int_clock),
    .reset(int_reset),
    .load(int_loaddisplay),
    .shiftl(zero),
    .shiftr(zero),
    .shiftextension(zero),
    .d(int_displayin),
    .o(displayreg_o));
  /* ./lab1_topLevel.vhdl:147:35  */
  assign n36_o = int_lmaskout[7]; // extract
  /* ./lab1_topLevel.vhdl:149:10  */
  assign lmaskreg_n37 = lmaskreg_o; // (signal)
  /* ./lab1_topLevel.vhdl:139:1  */
  shiftregister_8 lmaskreg (
    .clock(int_clock),
    .reset(int_reset),
    .load(int_loadlmask),
    .shiftl(int_shiftlmask),
    .shiftr(zero),
    .shiftextension(n36_o),
    .d(int_lmaskin),
    .o(lmaskreg_o));
  /* ./lab1_topLevel.vhdl:160:35  */
  assign n40_o = int_rmaskout[0]; // extract
  /* ./lab1_topLevel.vhdl:162:10  */
  assign rmaskreg_n41 = rmaskreg_o; // (signal)
  /* ./lab1_topLevel.vhdl:152:1  */
  shiftregister_8 rmaskreg (
    .clock(int_clock),
    .reset(int_reset),
    .load(int_loadrmask),
    .shiftl(zero),
    .shiftr(int_shiftrmask),
    .shiftextension(n40_o),
    .d(int_rmaskin),
    .o(rmaskreg_o));
  assign n45_o = {Left, Right};
endmodule

