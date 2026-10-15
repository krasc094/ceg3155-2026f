module fulladder_1bit
  (input  a,
   input  b,
   input  ci,
   output s,
   output co);
  wire n585_o;
  wire n586_o;
  wire n587_o;
  wire n588_o;
  wire n589_o;
  wire n590_o;
  wire n591_o;
  assign s = n586_o; //(module output)
  assign co = n591_o; //(module output)
  /* ./fullAdder_1bit.vhdl:15:10  */
  assign n585_o = a ^ b;
  /* ./fullAdder_1bit.vhdl:15:16  */
  assign n586_o = n585_o ^ ci;
  /* ./fullAdder_1bit.vhdl:16:12  */
  assign n587_o = a & b;
  /* ./fullAdder_1bit.vhdl:16:25  */
  assign n588_o = b & ci;
  /* ./fullAdder_1bit.vhdl:16:19  */
  assign n589_o = n587_o | n588_o;
  /* ./fullAdder_1bit.vhdl:16:39  */
  assign n590_o = a & ci;
  /* ./fullAdder_1bit.vhdl:16:33  */
  assign n591_o = n589_o | n590_o;
endmodule

module carrylookaheadunit_4bit
  (input  [3:0] i_a,
   input  [3:0] i_b,
   input  i_carry,
   output [3:0] o_carry,
   output o_superpropagate,
   output o_supergenerate);
  wire [3:0] int_p;
  wire [3:0] int_g;
  wire [4:0] int_carry;
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
  wire [3:0] n579_o;
  wire [3:0] n580_o;
  wire [3:0] n581_o;
  wire [4:0] n582_o;
  assign o_carry = n579_o; //(module output)
  assign o_superpropagate = n515_o; //(module output)
  assign o_supergenerate = n534_o; //(module output)
  /* ./carryLookaheadUnit_4bit.vhdl:17:8  */
  assign int_p = n580_o; // (signal)
  /* ./carryLookaheadUnit_4bit.vhdl:18:8  */
  assign int_g = n581_o; // (signal)
  /* ./carryLookaheadUnit_4bit.vhdl:19:8  */
  assign int_carry = n582_o; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  assign n509_o = int_p[2]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:53:22  */
  assign n510_o = int_p[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:30:26  */
  assign n511_o = n510_o & n509_o;
  /* ./carryLookaheadAdder_4bit.vhdl:51:14  */
  assign n512_o = int_p[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:30:33  */
  assign n513_o = n511_o & n512_o;
  /* ./carryLookaheadAdder_4bit.vhdl:46:1  */
  assign n514_o = int_p[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:30:40  */
  assign n515_o = n513_o & n514_o;
  /* ./carryLookaheadAdder_4bit.vhdl:16:3  */
  assign n516_o = int_g[2]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:15:3  */
  assign n517_o = int_p[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:32:12  */
  assign n518_o = n517_o & n516_o;
  /* ./carryLookaheadAdder_4bit.vhdl:13:3  */
  assign n519_o = int_g[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:32:5  */
  assign n520_o = n519_o | n518_o;
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  assign n521_o = int_p[2]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  assign n522_o = int_p[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:33:12  */
  assign n523_o = n522_o & n521_o;
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  assign n524_o = int_g[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:33:19  */
  assign n525_o = n523_o & n524_o;
  /* ./carryLookaheadUnit_4bit.vhdl:33:5  */
  assign n526_o = n520_o | n525_o;
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  assign n527_o = int_p[2]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  assign n528_o = int_p[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:34:12  */
  assign n529_o = n528_o & n527_o;
  assign n530_o = int_p[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:34:19  */
  assign n531_o = n529_o & n530_o;
  assign n532_o = int_g[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:34:26  */
  assign n533_o = n531_o & n532_o;
  /* ./carryLookaheadUnit_4bit.vhdl:34:5  */
  assign n534_o = n526_o | n533_o;
  /* ./carryLookaheadUnit_4bit.vhdl:38:20  */
  assign n535_o = i_a[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:31  */
  assign n536_o = i_b[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:24  */
  assign n537_o = n535_o & n536_o;
  /* ./carryLookaheadUnit_4bit.vhdl:39:20  */
  assign n538_o = i_a[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:30  */
  assign n539_o = i_b[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:24  */
  assign n540_o = n538_o | n539_o;
  /* ./carryLookaheadUnit_4bit.vhdl:38:20  */
  assign n541_o = i_a[2]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:31  */
  assign n542_o = i_b[2]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:24  */
  assign n543_o = n541_o & n542_o;
  /* ./carryLookaheadUnit_4bit.vhdl:39:20  */
  assign n544_o = i_a[2]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:30  */
  assign n545_o = i_b[2]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:24  */
  assign n546_o = n544_o | n545_o;
  /* ./carryLookaheadUnit_4bit.vhdl:38:20  */
  assign n547_o = i_a[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:31  */
  assign n548_o = i_b[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:24  */
  assign n549_o = n547_o & n548_o;
  /* ./carryLookaheadUnit_4bit.vhdl:39:20  */
  assign n550_o = i_a[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:30  */
  assign n551_o = i_b[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:24  */
  assign n552_o = n550_o | n551_o;
  /* ./carryLookaheadUnit_4bit.vhdl:38:20  */
  assign n553_o = i_a[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:31  */
  assign n554_o = i_b[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:38:24  */
  assign n555_o = n553_o & n554_o;
  /* ./carryLookaheadUnit_4bit.vhdl:39:20  */
  assign n556_o = i_a[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:30  */
  assign n557_o = i_b[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:39:24  */
  assign n558_o = n556_o | n557_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:26  */
  assign n559_o = int_g[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:41  */
  assign n560_o = int_p[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:60  */
  assign n561_o = int_carry[3]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:47  */
  assign n562_o = n560_o & n561_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:32  */
  assign n563_o = n559_o | n562_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:26  */
  assign n564_o = int_g[2]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:41  */
  assign n565_o = int_p[2]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:60  */
  assign n566_o = int_carry[2]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:47  */
  assign n567_o = n565_o & n566_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:32  */
  assign n568_o = n564_o | n567_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:26  */
  assign n569_o = int_g[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:41  */
  assign n570_o = int_p[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:60  */
  assign n571_o = int_carry[1]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:47  */
  assign n572_o = n570_o & n571_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:32  */
  assign n573_o = n569_o | n572_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:26  */
  assign n574_o = int_g[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:41  */
  assign n575_o = int_p[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:60  */
  assign n576_o = int_carry[0]; // extract
  /* ./carryLookaheadUnit_4bit.vhdl:45:47  */
  assign n577_o = n575_o & n576_o;
  /* ./carryLookaheadUnit_4bit.vhdl:45:32  */
  assign n578_o = n574_o | n577_o;
  /* ./carryLookaheadUnit_4bit.vhdl:48:23  */
  assign n579_o = int_carry[4:1]; // extract
  assign n580_o = {n540_o, n546_o, n552_o, n558_o};
  assign n581_o = {n537_o, n543_o, n549_o, n555_o};
  assign n582_o = {n563_o, n568_o, n573_o, n578_o, i_carry};
endmodule

module carrylookaheadadder_4bit
  (input  [3:0] i_a,
   input  [3:0] i_b,
   input  i_carryin,
   output o_carry,
   output o_overflow,
   output [3:0] o_result,
   output o_superpropagate,
   output o_supergenerate);
  reg [4:0] int_carry;
  reg [3:0] int_result;
  wire n459_o;
  wire n460_o;
  wire n461_o;
  wire n462_o;
  wire [3:0] cla_n463;
  wire cla_n464;
  wire cla_n465;
  wire [3:0] cla_o_carry;
  wire cla_o_superpropagate;
  wire cla_o_supergenerate;
  wire n472_o;
  wire n473_o;
  wire n474_o;
  wire adders_n1_fa_i_n475;
  wire adders_n1_fa_i_s;
  wire adders_n1_fa_i_co;
  wire n480_o;
  wire n481_o;
  wire n482_o;
  wire adders_n2_fa_i_n483;
  wire adders_n2_fa_i_s;
  wire adders_n2_fa_i_co;
  wire n488_o;
  wire n489_o;
  wire n490_o;
  wire adders_n3_fa_i_n491;
  wire adders_n3_fa_i_s;
  wire adders_n3_fa_i_co;
  wire n496_o;
  wire n497_o;
  wire n498_o;
  wire adders_n4_fa_i_n499;
  wire adders_n4_fa_i_s;
  wire adders_n4_fa_i_co;
  wire [4:0] n504_o;
  wire [3:0] n505_o;
  assign o_carry = n459_o; //(module output)
  assign o_overflow = n462_o; //(module output)
  assign o_result = int_result; //(module output)
  assign o_superpropagate = cla_n464; //(module output)
  assign o_supergenerate = cla_n465; //(module output)
  /* ./carryLookaheadAdder_4bit.vhdl:37:8  */
  always @*
    int_carry = n504_o; // (isignal)
  initial
    int_carry = 5'b00000;
  /* ./carryLookaheadAdder_4bit.vhdl:38:8  */
  always @*
    int_result = n505_o; // (isignal)
  initial
    int_result = 4'b0000;
  /* ./carryLookaheadAdder_4bit.vhdl:41:21  */
  assign n459_o = int_carry[4]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:44:24  */
  assign n460_o = int_carry[4]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:44:41  */
  assign n461_o = int_carry[3]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:44:28  */
  assign n462_o = n460_o ^ n461_o;
  /* ./carryLookaheadAdder_4bit.vhdl:51:14  */
  assign cla_n463 = cla_o_carry; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:52:23  */
  assign cla_n464 = cla_o_superpropagate; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:53:22  */
  assign cla_n465 = cla_o_supergenerate; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:46:1  */
  carrylookaheadunit_4bit cla (
    .i_a(i_a),
    .i_b(i_b),
    .i_carry(i_carryin),
    .o_carry(cla_o_carry),
    .o_superpropagate(cla_o_superpropagate),
    .o_supergenerate(cla_o_supergenerate));
  /* ./carryLookaheadAdder_4bit.vhdl:60:13  */
  assign n472_o = i_a[3]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:61:13  */
  assign n473_o = i_b[3]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:62:20  */
  assign n474_o = int_carry[3]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:63:10  */
  assign adders_n1_fa_i_n475 = adders_n1_fa_i_s; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  fulladder_1bit adders_n1_fa_i (
    .a(n472_o),
    .b(n473_o),
    .ci(n474_o),
    .s(adders_n1_fa_i_s),
    .co());
  /* ./carryLookaheadAdder_4bit.vhdl:60:13  */
  assign n480_o = i_a[2]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:61:13  */
  assign n481_o = i_b[2]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:62:20  */
  assign n482_o = int_carry[2]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:63:10  */
  assign adders_n2_fa_i_n483 = adders_n2_fa_i_s; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  fulladder_1bit adders_n2_fa_i (
    .a(n480_o),
    .b(n481_o),
    .ci(n482_o),
    .s(adders_n2_fa_i_s),
    .co());
  /* ./carryLookaheadAdder_4bit.vhdl:60:13  */
  assign n488_o = i_a[1]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:61:13  */
  assign n489_o = i_b[1]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:62:20  */
  assign n490_o = int_carry[1]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:63:10  */
  assign adders_n3_fa_i_n491 = adders_n3_fa_i_s; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  fulladder_1bit adders_n3_fa_i (
    .a(n488_o),
    .b(n489_o),
    .ci(n490_o),
    .s(adders_n3_fa_i_s),
    .co());
  /* ./carryLookaheadAdder_4bit.vhdl:60:13  */
  assign n496_o = i_a[0]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:61:13  */
  assign n497_o = i_b[0]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:62:20  */
  assign n498_o = int_carry[0]; // extract
  /* ./carryLookaheadAdder_4bit.vhdl:63:10  */
  assign adders_n4_fa_i_n499 = adders_n4_fa_i_s; // (signal)
  /* ./carryLookaheadAdder_4bit.vhdl:58:3  */
  fulladder_1bit adders_n4_fa_i (
    .a(n496_o),
    .b(n497_o),
    .ci(n498_o),
    .s(adders_n4_fa_i_s),
    .co());
  assign n504_o = {cla_n463, i_carryin};
  assign n505_o = {adders_n1_fa_i_n475, adders_n2_fa_i_n483, adders_n3_fa_i_n491, adders_n4_fa_i_n499};
endmodule

module carrylookaheadunit_16bit
  (input  [3:0] i_g,
   input  [3:0] i_p,
   input  i_c0,
   output [3:0] o_carry);
  wire [4:0] int_carry;
  wire n412_o;
  wire n413_o;
  wire n414_o;
  wire n415_o;
  wire n416_o;
  wire n417_o;
  wire n418_o;
  wire n419_o;
  wire n420_o;
  wire n421_o;
  wire n422_o;
  wire n423_o;
  wire n424_o;
  wire n425_o;
  wire n426_o;
  wire n427_o;
  wire n428_o;
  wire n429_o;
  wire n430_o;
  wire n431_o;
  wire n432_o;
  wire n433_o;
  wire n434_o;
  wire n435_o;
  wire n436_o;
  wire n437_o;
  wire n438_o;
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
  wire [3:0] n450_o;
  wire [4:0] n451_o;
  assign o_carry = n450_o; //(module output)
  /* ./carryLookaheadUnit_16bit.vhdl:15:8  */
  assign int_carry = n451_o; // (signal)
  /* ./dFlipFlop.vhdl:16:3  */
  assign n412_o = i_p[0]; // extract
  /* ./dFlipFlop.vhdl:17:3  */
  assign n413_o = i_p[1]; // extract
  assign n414_o = i_p[2]; // extract
  assign n415_o = i_p[3]; // extract
  assign n416_o = i_g[0]; // extract
  assign n417_o = i_g[1]; // extract
  assign n418_o = i_g[2]; // extract
  assign n419_o = i_g[3]; // extract
  /* ./carryLookaheadUnit_16bit.vhdl:27:24  */
  assign n420_o = n412_o & i_c0;
  /* ./carryLookaheadUnit_16bit.vhdl:27:17  */
  assign n421_o = n416_o | n420_o;
  /* ./carryLookaheadUnit_16bit.vhdl:29:24  */
  assign n422_o = n413_o & n416_o;
  /* ./carryLookaheadUnit_16bit.vhdl:29:17  */
  assign n423_o = n417_o | n422_o;
  /* ./carryLookaheadUnit_16bit.vhdl:30:24  */
  assign n424_o = n413_o & n412_o;
  /* ./carryLookaheadUnit_16bit.vhdl:30:31  */
  assign n425_o = n424_o & i_c0;
  /* ./carryLookaheadUnit_16bit.vhdl:30:17  */
  assign n426_o = n423_o | n425_o;
  /* ./carryLookaheadUnit_16bit.vhdl:32:24  */
  assign n427_o = n414_o & n417_o;
  /* ./carryLookaheadUnit_16bit.vhdl:32:17  */
  assign n428_o = n418_o | n427_o;
  /* ./carryLookaheadUnit_16bit.vhdl:33:24  */
  assign n429_o = n414_o & n413_o;
  /* ./carryLookaheadUnit_16bit.vhdl:33:31  */
  assign n430_o = n429_o & n416_o;
  /* ./carryLookaheadUnit_16bit.vhdl:33:17  */
  assign n431_o = n428_o | n430_o;
  /* ./carryLookaheadUnit_16bit.vhdl:34:24  */
  assign n432_o = n414_o & n413_o;
  /* ./carryLookaheadUnit_16bit.vhdl:34:31  */
  assign n433_o = n432_o & n412_o;
  /* ./carryLookaheadUnit_16bit.vhdl:34:38  */
  assign n434_o = n433_o & i_c0;
  /* ./carryLookaheadUnit_16bit.vhdl:34:17  */
  assign n435_o = n431_o | n434_o;
  /* ./carryLookaheadUnit_16bit.vhdl:36:24  */
  assign n436_o = n415_o & n418_o;
  /* ./carryLookaheadUnit_16bit.vhdl:36:17  */
  assign n437_o = n419_o | n436_o;
  /* ./carryLookaheadUnit_16bit.vhdl:37:24  */
  assign n438_o = n415_o & n414_o;
  /* ./carryLookaheadUnit_16bit.vhdl:37:31  */
  assign n439_o = n438_o & n417_o;
  /* ./carryLookaheadUnit_16bit.vhdl:37:17  */
  assign n440_o = n437_o | n439_o;
  /* ./carryLookaheadUnit_16bit.vhdl:38:24  */
  assign n441_o = n415_o & n414_o;
  /* ./carryLookaheadUnit_16bit.vhdl:38:31  */
  assign n442_o = n441_o & n413_o;
  /* ./carryLookaheadUnit_16bit.vhdl:38:38  */
  assign n443_o = n442_o & n416_o;
  /* ./carryLookaheadUnit_16bit.vhdl:38:17  */
  assign n444_o = n440_o | n443_o;
  /* ./carryLookaheadUnit_16bit.vhdl:39:24  */
  assign n445_o = n415_o & n414_o;
  /* ./carryLookaheadUnit_16bit.vhdl:39:31  */
  assign n446_o = n445_o & n413_o;
  /* ./carryLookaheadUnit_16bit.vhdl:39:38  */
  assign n447_o = n446_o & n412_o;
  /* ./carryLookaheadUnit_16bit.vhdl:39:45  */
  assign n448_o = n447_o & i_c0;
  /* ./carryLookaheadUnit_16bit.vhdl:39:17  */
  assign n449_o = n444_o | n448_o;
  /* ./carryLookaheadUnit_16bit.vhdl:41:21  */
  assign n450_o = int_carry[4:1]; // extract
  assign n451_o = {n449_o, n435_o, n426_o, n421_o, i_c0};
endmodule

module dflipflop
  (input  i_d,
   input  i_clk,
   input  i_reset_bar,
   output o_q,
   output o_qbar);
  wire int_q;
  wire n404_o;
  wire n406_o;
  wire n409_o;
  reg n410_q;
  assign o_q = int_q; //(module output)
  assign o_qbar = n409_o; //(module output)
  /* ./dFlipFlop.vhdl:13:8  */
  assign int_q = n410_q; // (signal)
  /* ./dFlipFlop.vhdl:18:20  */
  assign n404_o = ~i_reset_bar;
  /* ./dFlipFlop.vhdl:18:5  */
  assign n406_o = n404_o ? 1'b0 : i_d;
  /* ./dFlipFlop.vhdl:26:11  */
  assign n409_o = ~int_q;
  /* ./dFlipFlop.vhdl:17:3  */
  always @(posedge i_clk)
    n410_q <= n406_o;
endmodule

module mux4_1bit
  (input  a,
   input  b,
   input  c,
   input  d,
   input  [1:0] sel,
   output o);
  wire n376_o;
  wire n377_o;
  wire n378_o;
  wire n379_o;
  wire n380_o;
  wire n381_o;
  wire n382_o;
  wire n383_o;
  wire n384_o;
  wire n385_o;
  wire n386_o;
  wire n387_o;
  wire n388_o;
  wire n389_o;
  wire n390_o;
  wire n391_o;
  wire n392_o;
  wire n393_o;
  wire n394_o;
  wire n395_o;
  wire n396_o;
  wire n397_o;
  wire n398_o;
  assign o = n398_o; //(module output)
  /* ./mux4_1bit.vhdl:19:23  */
  assign n376_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:19:16  */
  assign n377_o = ~n376_o;
  /* ./mux4_1bit.vhdl:19:11  */
  assign n378_o = a & n377_o;
  /* ./mux4_1bit.vhdl:19:40  */
  assign n379_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:19:33  */
  assign n380_o = ~n379_o;
  /* ./mux4_1bit.vhdl:19:28  */
  assign n381_o = n378_o & n380_o;
  /* ./mux4_1bit.vhdl:20:23  */
  assign n382_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:20:16  */
  assign n383_o = ~n382_o;
  /* ./mux4_1bit.vhdl:20:34  */
  assign n384_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:20:27  */
  assign n385_o = n383_o & n384_o;
  /* ./mux4_1bit.vhdl:20:11  */
  assign n386_o = b & n385_o;
  /* ./mux4_1bit.vhdl:19:47  */
  assign n387_o = n381_o | n386_o;
  /* ./mux4_1bit.vhdl:21:18  */
  assign n388_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:21:11  */
  assign n389_o = c & n388_o;
  /* ./mux4_1bit.vhdl:21:34  */
  assign n390_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:21:27  */
  assign n391_o = ~n390_o;
  /* ./mux4_1bit.vhdl:21:22  */
  assign n392_o = n389_o & n391_o;
  /* ./mux4_1bit.vhdl:20:40  */
  assign n393_o = n387_o | n392_o;
  /* ./mux4_1bit.vhdl:22:18  */
  assign n394_o = sel[1]; // extract
  /* ./mux4_1bit.vhdl:22:11  */
  assign n395_o = d & n394_o;
  /* ./mux4_1bit.vhdl:22:29  */
  assign n396_o = sel[0]; // extract
  /* ./mux4_1bit.vhdl:22:22  */
  assign n397_o = n395_o & n396_o;
  /* ./mux4_1bit.vhdl:21:40  */
  assign n398_o = n393_o | n397_o;
endmodule

module dff_2
  (input  i_d,
   input  i_clock,
   output o_q,
   output o_qbar);
  wire int_q;
  wire n373_o;
  reg n374_q;
  assign o_q = int_q; //(module output)
  assign o_qbar = n373_o; //(module output)
  /* ./dFF_2.vhdl:39:16  */
  assign int_q = n374_q; // (signal)
  /* ./dFF_2.vhdl:54:33  */
  assign n373_o = ~int_q;
  /* ./dFF_2.vhdl:46:9  */
  always @(posedge i_clock)
    n374_q <= i_d;
endmodule

module iszero_4bit
  (input  [3:0] i_in,
   output o_iszero);
  wire n360_o;
  wire n361_o;
  wire n362_o;
  wire n363_o;
  wire n364_o;
  wire n365_o;
  wire n366_o;
  assign o_iszero = n366_o; //(module output)
  /* ./carryLookaheadAdder_8bit.vhdl:78:17  */
  assign n360_o = i_in[0]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:77:19  */
  assign n361_o = i_in[1]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:70:1  */
  assign n362_o = i_in[2]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:70:1  */
  assign n363_o = i_in[3]; // extract
  /* ./isZero_4bit.vhdl:16:18  */
  assign n364_o = n363_o | n362_o;
  /* ./isZero_4bit.vhdl:16:24  */
  assign n365_o = n364_o | n361_o;
  /* ./isZero_4bit.vhdl:16:30  */
  assign n366_o = n365_o | n360_o;
endmodule

module carrylookaheadadder_8bit
  (input  [7:0] i_a,
   input  [7:0] i_b,
   input  i_carryin,
   output o_carry,
   output o_overflow,
   output [7:0] o_result);
  localparam [4:0] n312_o = 5'b00000;
  reg [4:0] int_carry;
  reg [7:0] int_result;
  localparam [3:0] n314_o = 4'b0000;
  reg [3:0] int_g;
  localparam [3:0] n315_o = 4'b0000;
  reg [3:0] int_p;
  wire [3:0] cla_n316;
  wire [3:0] cla_o_carry;
  wire [3:0] n319_o;
  wire [3:0] n320_o;
  wire n321_o;
  wire [3:0] lower_n324;
  wire lower_n325;
  wire lower_n326;
  wire lower_o_carry;
  wire lower_o_overflow;
  wire [3:0] lower_o_result;
  wire lower_o_superpropagate;
  wire lower_o_supergenerate;
  wire [3:0] n335_o;
  wire [3:0] n336_o;
  wire higher_n338;
  wire [3:0] higher_n339;
  wire higher_n340;
  wire higher_n341;
  wire higher_o_carry;
  wire higher_o_overflow;
  wire [3:0] higher_o_result;
  wire higher_o_superpropagate;
  wire higher_o_supergenerate;
  wire n351_o;
  wire n352_o;
  wire [4:0] n353_o;
  wire [7:0] n354_o;
  wire [1:0] n355_o;
  wire [3:0] n356_o;
  wire [1:0] n357_o;
  wire [3:0] n358_o;
  assign o_carry = n351_o; //(module output)
  assign o_overflow = higher_n338; //(module output)
  assign o_result = int_result; //(module output)
  /* ./carryLookaheadAdder_8bit.vhdl:43:8  */
  always @*
    int_carry = n353_o; // (isignal)
  initial
    int_carry = 5'b00000;
  /* ./carryLookaheadAdder_8bit.vhdl:44:8  */
  always @*
    int_result = n354_o; // (isignal)
  initial
    int_result = 8'b00000000;
  /* ./carryLookaheadAdder_8bit.vhdl:46:8  */
  always @*
    int_g = n356_o; // (isignal)
  initial
    int_g = 4'b0000;
  /* ./carryLookaheadAdder_8bit.vhdl:47:8  */
  always @*
    int_p = n358_o; // (isignal)
  initial
    int_p = 4'b0000;
  /* ./carryLookaheadAdder_8bit.vhdl:57:16  */
  assign cla_n316 = cla_o_carry; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:52:1  */
  carrylookaheadunit_16bit cla (
    .i_g(int_g),
    .i_p(int_p),
    .i_c0(i_carryin),
    .o_carry(cla_o_carry));
  /* ./carryLookaheadAdder_8bit.vhdl:62:15  */
  assign n319_o = i_a[3:0]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:63:15  */
  assign n320_o = i_b[3:0]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:64:27  */
  assign n321_o = int_carry[0]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:67:17  */
  assign lower_n324 = lower_o_result; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:65:25  */
  assign lower_n325 = lower_o_superpropagate; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:66:24  */
  assign lower_n326 = lower_o_supergenerate; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:60:1  */
  carrylookaheadadder_4bit lower (
    .i_a(n319_o),
    .i_b(n320_o),
    .i_carryin(n321_o),
    .o_carry(),
    .o_overflow(),
    .o_result(lower_o_result),
    .o_superpropagate(lower_o_superpropagate),
    .o_supergenerate(lower_o_supergenerate));
  /* ./carryLookaheadAdder_8bit.vhdl:72:15  */
  assign n335_o = i_a[7:4]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:73:15  */
  assign n336_o = i_b[7:4]; // extract
  /* ./carryLookaheadAdder_8bit.vhdl:77:19  */
  assign higher_n338 = higher_o_overflow; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:78:17  */
  assign higher_n339 = higher_o_result; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:75:25  */
  assign higher_n340 = higher_o_superpropagate; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:76:24  */
  assign higher_n341 = higher_o_supergenerate; // (signal)
  /* ./carryLookaheadAdder_8bit.vhdl:70:1  */
  carrylookaheadadder_4bit higher (
    .i_a(n335_o),
    .i_b(n336_o),
    .i_carryin(i_carryin),
    .o_carry(),
    .o_overflow(higher_o_overflow),
    .o_result(higher_o_result),
    .o_superpropagate(higher_o_superpropagate),
    .o_supergenerate(higher_o_supergenerate));
  /* ./carryLookaheadAdder_8bit.vhdl:82:21  */
  assign n351_o = int_carry[1]; // extract
  assign n352_o = n312_o[0]; // extract
  assign n353_o = {cla_n316, n352_o};
  assign n354_o = {higher_n339, lower_n324};
  assign n355_o = n314_o[3:2]; // extract
  assign n356_o = {n355_o, higher_n340, lower_n325};
  assign n357_o = n315_o[3:2]; // extract
  assign n358_o = {n357_o, higher_n341, lower_n326};
endmodule

module shiftregister_4
  (input  clock,
   input  reset,
   input  load,
   input  shiftl,
   input  shiftr,
   input  shiftextension,
   input  [3:0] d,
   output [3:0] o);
  wire [3:0] int_d;
  wire [3:0] int_q;
  wire [1:0] int_sel;
  wire n254_o;
  wire n255_o;
  wire n256_o;
  wire n257_o;
  wire n258_o;
  wire n259_o;
  wire muxes_n1_mux_i_n260;
  wire muxes_n1_mux_i_o;
  wire n263_o;
  wire n264_o;
  wire n265_o;
  wire n266_o;
  wire muxes_n2_mux_i_n267;
  wire muxes_n2_mux_i_o;
  wire n270_o;
  wire n271_o;
  wire n272_o;
  wire mux_lsb_n273;
  wire mux_lsb_o;
  wire n276_o;
  wire n277_o;
  wire n278_o;
  wire mux_msb_n279;
  wire mux_msb_o;
  wire n282_o;
  wire bits_n1_b_i_n283;
  wire bits_n1_b_i_o_q;
  wire bits_n1_b_i_o_qbar;
  wire n288_o;
  wire bits_n2_b_i_n289;
  wire bits_n2_b_i_o_q;
  wire bits_n2_b_i_o_qbar;
  wire n294_o;
  wire bits_n3_b_i_n295;
  wire bits_n3_b_i_o_q;
  wire bits_n3_b_i_o_qbar;
  wire n300_o;
  wire bits_n4_b_i_n301;
  wire bits_n4_b_i_o_q;
  wire bits_n4_b_i_o_qbar;
  wire [3:0] n306_o;
  wire [3:0] n307_o;
  wire [1:0] n308_o;
  assign o = int_q; //(module output)
  /* ./shiftRegister_nBit.vhdl:20:10  */
  assign int_d = n306_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:21:10  */
  assign int_q = n307_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:22:10  */
  assign int_sel = n308_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:46:24  */
  assign n254_o = shiftl | load;
  /* ./shiftRegister_nBit.vhdl:47:24  */
  assign n255_o = shiftr | load;
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n256_o = int_q[2]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n257_o = int_q[3]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n258_o = int_q[1]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n259_o = d[2]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n1_mux_i_n260 = muxes_n1_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n1_mux_i (
    .a(n256_o),
    .b(n257_o),
    .c(n258_o),
    .d(n259_o),
    .sel(int_sel),
    .o(muxes_n1_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n263_o = int_q[1]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n264_o = int_q[2]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n265_o = int_q[0]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n266_o = d[1]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n2_mux_i_n267 = muxes_n2_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n2_mux_i (
    .a(n263_o),
    .b(n264_o),
    .c(n265_o),
    .d(n266_o),
    .sel(int_sel),
    .o(muxes_n2_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:67:15  */
  assign n270_o = int_q[0]; // extract
  /* ./shiftRegister_nBit.vhdl:68:15  */
  assign n271_o = int_q[1]; // extract
  /* ./shiftRegister_nBit.vhdl:70:11  */
  assign n272_o = d[0]; // extract
  /* ./shiftRegister_nBit.vhdl:72:10  */
  assign mux_lsb_n273 = mux_lsb_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:65:3  */
  mux4_1bit mux_lsb (
    .a(n270_o),
    .b(n271_o),
    .c(shiftextension),
    .d(n272_o),
    .sel(int_sel),
    .o(mux_lsb_o));
  /* ./shiftRegister_nBit.vhdl:78:15  */
  assign n276_o = int_q[3]; // extract
  /* ./shiftRegister_nBit.vhdl:80:15  */
  assign n277_o = int_q[2]; // extract
  /* ./shiftRegister_nBit.vhdl:81:11  */
  assign n278_o = d[3]; // extract
  /* ./shiftRegister_nBit.vhdl:83:10  */
  assign mux_msb_n279 = mux_msb_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:76:3  */
  mux4_1bit mux_msb (
    .a(n276_o),
    .b(shiftextension),
    .c(n277_o),
    .d(n278_o),
    .sel(int_sel),
    .o(mux_msb_o));
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n282_o = int_d[3]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n1_b_i_n283 = bits_n1_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n1_b_i (
    .i_d(n282_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n1_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n288_o = int_d[2]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n2_b_i_n289 = bits_n2_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n2_b_i (
    .i_d(n288_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n2_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n294_o = int_d[1]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n3_b_i_n295 = bits_n3_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n3_b_i (
    .i_d(n294_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n3_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n300_o = int_d[0]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n4_b_i_n301 = bits_n4_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n4_b_i (
    .i_d(n300_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n4_b_i_o_q),
    .o_qbar());
  assign n306_o = {mux_msb_n279, muxes_n1_mux_i_n260, muxes_n2_mux_i_n267, mux_lsb_n273};
  assign n307_o = {bits_n1_b_i_n283, bits_n2_b_i_n289, bits_n3_b_i_n295, bits_n4_b_i_n301};
  assign n308_o = {n254_o, n255_o};
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
  wire n146_o;
  wire n147_o;
  wire n148_o;
  wire n149_o;
  wire n150_o;
  wire n151_o;
  wire muxes_n1_mux_i_n152;
  wire muxes_n1_mux_i_o;
  wire n155_o;
  wire n156_o;
  wire n157_o;
  wire n158_o;
  wire muxes_n2_mux_i_n159;
  wire muxes_n2_mux_i_o;
  wire n162_o;
  wire n163_o;
  wire n164_o;
  wire n165_o;
  wire muxes_n3_mux_i_n166;
  wire muxes_n3_mux_i_o;
  wire n169_o;
  wire n170_o;
  wire n171_o;
  wire n172_o;
  wire muxes_n4_mux_i_n173;
  wire muxes_n4_mux_i_o;
  wire n176_o;
  wire n177_o;
  wire n178_o;
  wire n179_o;
  wire muxes_n5_mux_i_n180;
  wire muxes_n5_mux_i_o;
  wire n183_o;
  wire n184_o;
  wire n185_o;
  wire n186_o;
  wire muxes_n6_mux_i_n187;
  wire muxes_n6_mux_i_o;
  wire n190_o;
  wire n191_o;
  wire n192_o;
  wire mux_lsb_n193;
  wire mux_lsb_o;
  wire n196_o;
  wire n197_o;
  wire n198_o;
  wire mux_msb_n199;
  wire mux_msb_o;
  wire n202_o;
  wire bits_n1_b_i_n203;
  wire bits_n1_b_i_o_q;
  wire bits_n1_b_i_o_qbar;
  wire n208_o;
  wire bits_n2_b_i_n209;
  wire bits_n2_b_i_o_q;
  wire bits_n2_b_i_o_qbar;
  wire n214_o;
  wire bits_n3_b_i_n215;
  wire bits_n3_b_i_o_q;
  wire bits_n3_b_i_o_qbar;
  wire n220_o;
  wire bits_n4_b_i_n221;
  wire bits_n4_b_i_o_q;
  wire bits_n4_b_i_o_qbar;
  wire n226_o;
  wire bits_n5_b_i_n227;
  wire bits_n5_b_i_o_q;
  wire bits_n5_b_i_o_qbar;
  wire n232_o;
  wire bits_n6_b_i_n233;
  wire bits_n6_b_i_o_q;
  wire bits_n6_b_i_o_qbar;
  wire n238_o;
  wire bits_n7_b_i_n239;
  wire bits_n7_b_i_o_q;
  wire bits_n7_b_i_o_qbar;
  wire n244_o;
  wire bits_n8_b_i_n245;
  wire bits_n8_b_i_o_q;
  wire bits_n8_b_i_o_qbar;
  wire [7:0] n250_o;
  wire [7:0] n251_o;
  wire [1:0] n252_o;
  assign o = int_q; //(module output)
  /* ./shiftRegister_nBit.vhdl:20:10  */
  assign int_d = n250_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:21:10  */
  assign int_q = n251_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:22:10  */
  assign int_sel = n252_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:46:24  */
  assign n146_o = shiftl | load;
  /* ./shiftRegister_nBit.vhdl:47:24  */
  assign n147_o = shiftr | load;
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n148_o = int_q[6]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n149_o = int_q[7]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n150_o = int_q[5]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n151_o = d[6]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n1_mux_i_n152 = muxes_n1_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n1_mux_i (
    .a(n148_o),
    .b(n149_o),
    .c(n150_o),
    .d(n151_o),
    .sel(int_sel),
    .o(muxes_n1_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n155_o = int_q[5]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n156_o = int_q[6]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n157_o = int_q[4]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n158_o = d[5]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n2_mux_i_n159 = muxes_n2_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n2_mux_i (
    .a(n155_o),
    .b(n156_o),
    .c(n157_o),
    .d(n158_o),
    .sel(int_sel),
    .o(muxes_n2_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n162_o = int_q[4]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n163_o = int_q[5]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n164_o = int_q[3]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n165_o = d[4]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n3_mux_i_n166 = muxes_n3_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n3_mux_i (
    .a(n162_o),
    .b(n163_o),
    .c(n164_o),
    .d(n165_o),
    .sel(int_sel),
    .o(muxes_n3_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n169_o = int_q[3]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n170_o = int_q[4]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n171_o = int_q[2]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n172_o = d[3]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n4_mux_i_n173 = muxes_n4_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n4_mux_i (
    .a(n169_o),
    .b(n170_o),
    .c(n171_o),
    .d(n172_o),
    .sel(int_sel),
    .o(muxes_n4_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n176_o = int_q[2]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n177_o = int_q[3]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n178_o = int_q[1]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n179_o = d[2]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n5_mux_i_n180 = muxes_n5_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n5_mux_i (
    .a(n176_o),
    .b(n177_o),
    .c(n178_o),
    .d(n179_o),
    .sel(int_sel),
    .o(muxes_n5_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:53:17  */
  assign n183_o = int_q[1]; // extract
  /* ./shiftRegister_nBit.vhdl:54:17  */
  assign n184_o = int_q[2]; // extract
  /* ./shiftRegister_nBit.vhdl:55:17  */
  assign n185_o = int_q[0]; // extract
  /* ./shiftRegister_nBit.vhdl:56:13  */
  assign n186_o = d[1]; // extract
  /* ./shiftRegister_nBit.vhdl:58:12  */
  assign muxes_n6_mux_i_n187 = muxes_n6_mux_i_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:51:5  */
  mux4_1bit muxes_n6_mux_i (
    .a(n183_o),
    .b(n184_o),
    .c(n185_o),
    .d(n186_o),
    .sel(int_sel),
    .o(muxes_n6_mux_i_o));
  /* ./shiftRegister_nBit.vhdl:67:15  */
  assign n190_o = int_q[0]; // extract
  /* ./shiftRegister_nBit.vhdl:68:15  */
  assign n191_o = int_q[1]; // extract
  /* ./shiftRegister_nBit.vhdl:70:11  */
  assign n192_o = d[0]; // extract
  /* ./shiftRegister_nBit.vhdl:72:10  */
  assign mux_lsb_n193 = mux_lsb_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:65:3  */
  mux4_1bit mux_lsb (
    .a(n190_o),
    .b(n191_o),
    .c(shiftextension),
    .d(n192_o),
    .sel(int_sel),
    .o(mux_lsb_o));
  /* ./shiftRegister_nBit.vhdl:78:15  */
  assign n196_o = int_q[7]; // extract
  /* ./shiftRegister_nBit.vhdl:80:15  */
  assign n197_o = int_q[6]; // extract
  /* ./shiftRegister_nBit.vhdl:81:11  */
  assign n198_o = d[7]; // extract
  /* ./shiftRegister_nBit.vhdl:83:10  */
  assign mux_msb_n199 = mux_msb_o; // (signal)
  /* ./shiftRegister_nBit.vhdl:76:3  */
  mux4_1bit mux_msb (
    .a(n196_o),
    .b(shiftextension),
    .c(n197_o),
    .d(n198_o),
    .sel(int_sel),
    .o(mux_msb_o));
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n202_o = int_d[7]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n1_b_i_n203 = bits_n1_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n1_b_i (
    .i_d(n202_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n1_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n208_o = int_d[6]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n2_b_i_n209 = bits_n2_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n2_b_i (
    .i_d(n208_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n2_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n214_o = int_d[5]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n3_b_i_n215 = bits_n3_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n3_b_i (
    .i_d(n214_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n3_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n220_o = int_d[4]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n4_b_i_n221 = bits_n4_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n4_b_i (
    .i_d(n220_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n4_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n226_o = int_d[3]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n5_b_i_n227 = bits_n5_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n5_b_i (
    .i_d(n226_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n5_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n232_o = int_d[2]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n6_b_i_n233 = bits_n6_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n6_b_i (
    .i_d(n232_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n6_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n238_o = int_d[1]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n7_b_i_n239 = bits_n7_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n7_b_i (
    .i_d(n238_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n7_b_i_o_q),
    .o_qbar());
  /* ./shiftRegister_nBit.vhdl:92:19  */
  assign n244_o = int_d[0]; // extract
  /* ./shiftRegister_nBit.vhdl:93:14  */
  assign bits_n8_b_i_n245 = bits_n8_b_i_o_q; // (signal)
  /* ./shiftRegister_nBit.vhdl:88:5  */
  dflipflop bits_n8_b_i (
    .i_d(n244_o),
    .i_clk(clock),
    .i_reset_bar(reset),
    .o_q(bits_n8_b_i_o_q),
    .o_qbar());
  assign n250_o = {mux_msb_n199, muxes_n1_mux_i_n152, muxes_n2_mux_i_n159, muxes_n3_mux_i_n166, muxes_n4_mux_i_n173, muxes_n5_mux_i_n180, muxes_n6_mux_i_n187, mux_lsb_n193};
  assign n251_o = {bits_n1_b_i_n203, bits_n2_b_i_n209, bits_n3_b_i_n215, bits_n4_b_i_n221, bits_n5_b_i_n227, bits_n6_b_i_n233, bits_n7_b_i_n239, bits_n8_b_i_n245};
  assign n252_o = {n146_o, n147_o};
endmodule

module mulcontrol
  (input  [7:0] i_multiplicand,
   input  [3:0] i_multiplier,
   input  i_clock,
   input  i_reset,
   output o_loadmultiplicand,
   output o_shlmultiplicand,
   output o_loadmultiplier,
   output o_shrmultiplier,
   output o_loadproduct,
   output o_productselect,
   output o_done);
  wire s0in;
  wire s1in;
  wire s2in;
  wire s3in;
  wire s0out;
  wire s1out;
  wire s2out;
  wire s3out;
  wire int_multiplierlsbiszero;
  wire int_z1;
  wire int_z2;
  wire int_bothzero;
  wire n87_o;
  wire z1_n88;
  wire z1_o_iszero;
  wire z2_n91;
  wire z2_o_iszero;
  wire n94_o;
  wire n95_o;
  wire n96_o;
  wire n97_o;
  wire n98_o;
  wire n99_o;
  wire n100_o;
  wire n101_o;
  wire n102_o;
  wire n103_o;
  wire n104_o;
  wire n105_o;
  wire n106_o;
  wire n107_o;
  wire n108_o;
  wire n109_o;
  wire n110_o;
  wire n111_o;
  wire n112_o;
  wire n113_o;
  wire n114_o;
  wire n115_o;
  wire n116_o;
  wire s0_n117;
  wire s0_o_q;
  wire s0_o_qbar;
  wire s1_n122;
  wire s1_o_q;
  wire s1_o_qbar;
  wire s2_n127;
  wire s2_o_q;
  wire s2_o_qbar;
  wire s3_n132;
  wire s3_o_q;
  wire s3_o_qbar;
  wire n137_o;
  wire n138_o;
  wire n139_o;
  wire n140_o;
  assign o_loadmultiplicand = s0out; //(module output)
  assign o_shlmultiplicand = s2out; //(module output)
  assign o_loadmultiplier = s0out; //(module output)
  assign o_shrmultiplier = s2out; //(module output)
  assign o_loadproduct = n140_o; //(module output)
  assign o_productselect = s1out; //(module output)
  assign o_done = s3out; //(module output)
  /* ./mulControl.vhdl:40:10  */
  assign s0in = i_reset; // (signal)
  /* ./mulControl.vhdl:40:16  */
  assign s1in = n104_o; // (signal)
  /* ./mulControl.vhdl:40:22  */
  assign s2in = n111_o; // (signal)
  /* ./mulControl.vhdl:40:28  */
  assign s3in = n116_o; // (signal)
  /* ./mulControl.vhdl:41:10  */
  assign s0out = s0_n117; // (signal)
  /* ./mulControl.vhdl:41:17  */
  assign s1out = s1_n122; // (signal)
  /* ./mulControl.vhdl:41:24  */
  assign s2out = s2_n127; // (signal)
  /* ./mulControl.vhdl:41:31  */
  assign s3out = s3_n132; // (signal)
  /* ./mulControl.vhdl:43:10  */
  assign int_multiplierlsbiszero = n95_o; // (signal)
  /* ./mulControl.vhdl:44:10  */
  assign int_z1 = z1_n88; // (signal)
  /* ./mulControl.vhdl:44:18  */
  assign int_z2 = z2_n91; // (signal)
  /* ./mulControl.vhdl:44:26  */
  assign int_bothzero = n94_o; // (signal)
  /* ./lab2_multiplier.vhdl:10:5  */
  assign n87_o = i_multiplier[0]; // extract
  /* ./mulControl.vhdl:52:17  */
  assign z1_n88 = z1_o_iszero; // (signal)
  /* ./mulControl.vhdl:49:1  */
  iszero_8bit z1 (
    .i_in(i_multiplicand),
    .o_iszero(z1_o_iszero));
  /* ./mulControl.vhdl:58:17  */
  assign z2_n91 = z2_o_iszero; // (signal)
  /* ./mulControl.vhdl:55:1  */
  iszero_4bit z2 (
    .i_in(i_multiplier),
    .o_iszero(z2_o_iszero));
  /* ./mulControl.vhdl:61:24  */
  assign n94_o = int_z1 & int_z2;
  /* ./mulControl.vhdl:62:28  */
  assign n95_o = ~n87_o;
  /* ./mulControl.vhdl:66:11  */
  assign n96_o = ~i_reset;
  /* ./mulControl.vhdl:67:18  */
  assign n97_o = s0out & int_multiplierlsbiszero;
  /* ./mulControl.vhdl:67:50  */
  assign n98_o = ~int_bothzero;
  /* ./mulControl.vhdl:67:46  */
  assign n99_o = n97_o & n98_o;
  /* ./mulControl.vhdl:68:21  */
  assign n100_o = s2out & int_multiplierlsbiszero;
  /* ./mulControl.vhdl:68:53  */
  assign n101_o = ~int_bothzero;
  /* ./mulControl.vhdl:68:49  */
  assign n102_o = n100_o & n101_o;
  /* ./mulControl.vhdl:68:11  */
  assign n103_o = n99_o | n102_o;
  /* ./mulControl.vhdl:66:23  */
  assign n104_o = n96_o & n103_o;
  /* ./mulControl.vhdl:69:11  */
  assign n105_o = ~i_reset;
  /* ./mulControl.vhdl:71:22  */
  assign n106_o = s0out | s2out;
  /* ./mulControl.vhdl:71:65  */
  assign n107_o = ~int_bothzero;
  /* ./mulControl.vhdl:71:61  */
  assign n108_o = int_multiplierlsbiszero & n107_o;
  /* ./mulControl.vhdl:71:32  */
  assign n109_o = n106_o & n108_o;
  /* ./mulControl.vhdl:71:11  */
  assign n110_o = s1out | n109_o;
  /* ./mulControl.vhdl:69:23  */
  assign n111_o = n105_o & n110_o;
  /* ./mulControl.vhdl:72:11  */
  assign n112_o = ~i_reset;
  /* ./mulControl.vhdl:73:18  */
  assign n113_o = s2out | s0out;
  /* ./mulControl.vhdl:73:57  */
  assign n114_o = int_multiplierlsbiszero & int_bothzero;
  /* ./mulControl.vhdl:73:28  */
  assign n115_o = n113_o & n114_o;
  /* ./mulControl.vhdl:72:23  */
  assign n116_o = n112_o & n115_o;
  /* ./mulControl.vhdl:80:16  */
  assign s0_n117 = s0_o_q; // (signal)
  /* ./mulControl.vhdl:76:3  */
  dff_2 s0 (
    .i_d(s0in),
    .i_clock(i_clock),
    .o_q(s0_o_q),
    .o_qbar());
  /* ./mulControl.vhdl:86:16  */
  assign s1_n122 = s1_o_q; // (signal)
  /* ./mulControl.vhdl:82:3  */
  dff_2 s1 (
    .i_d(s1in),
    .i_clock(i_clock),
    .o_q(s1_o_q),
    .o_qbar());
  /* ./mulControl.vhdl:92:16  */
  assign s2_n127 = s2_o_q; // (signal)
  /* ./mulControl.vhdl:88:3  */
  dff_2 s2 (
    .i_d(s2in),
    .i_clock(i_clock),
    .o_q(s2_o_q),
    .o_qbar());
  /* ./mulControl.vhdl:98:16  */
  assign s3_n132 = s3_o_q; // (signal)
  /* ./mulControl.vhdl:94:3  */
  dff_2 s3 (
    .i_d(s3in),
    .i_clock(i_clock),
    .o_q(s3_o_q),
    .o_qbar());
  /* ./mulControl.vhdl:106:20  */
  assign n137_o = ~s3out;
  /* ./mulControl.vhdl:106:51  */
  assign n138_o = s1out & int_multiplierlsbiszero;
  /* ./mulControl.vhdl:106:41  */
  assign n139_o = s0out | n138_o;
  /* ./mulControl.vhdl:106:30  */
  assign n140_o = n137_o & n139_o;
endmodule

module lab2_multiplier
  (input  [3:0] i_operanda,
   input  [3:0] i_operandb,
   input  i_reset,
   input  i_clock,
   output [7:0] o_product,
   output o_overflow,
   output o_done);
  wire [7:0] int_multiplicandout;
  wire [3:0] int_multiplierout;
  wire int_loadmultiplicand;
  wire int_shlmultiplicand;
  wire int_shrmultiplier;
  wire int_loadmultiplier;
  wire int_loadproduct;
  localparam [7:0] n37_o = 8'b00000000;
  reg [7:0] int_multiplicandin;
  reg [7:0] int_adderout;
  reg [7:0] int_productout;
  wire zero;
  wire control_n41;
  wire control_n42;
  wire control_n43;
  wire control_n44;
  wire control_n45;
  wire control_n47;
  wire control_o_loadmultiplicand;
  wire control_o_shlmultiplicand;
  wire control_o_loadmultiplier;
  wire control_o_shrmultiplier;
  wire control_o_loadproduct;
  wire control_o_productselect;
  wire control_o_done;
  wire [7:0] multiplicand_n61;
  wire [7:0] multiplicand_o;
  wire [3:0] multiplier_n64;
  wire [3:0] multiplier_o;
  wire [7:0] product_n67;
  wire [7:0] product_o;
  wire adder_n71;
  wire [7:0] adder_n72;
  wire adder_o_carry;
  wire adder_o_overflow;
  wire [7:0] adder_o_result;
  wire [3:0] n78_o;
  wire [7:0] n79_o;
  assign o_product = int_adderout; //(module output)
  assign o_overflow = adder_n71; //(module output)
  assign o_done = control_n47; //(module output)
  /* ./lab2_multiplier.vhdl:55:10  */
  assign int_multiplicandout = multiplicand_n61; // (signal)
  /* ./lab2_multiplier.vhdl:56:10  */
  assign int_multiplierout = multiplier_n64; // (signal)
  /* ./lab2_multiplier.vhdl:58:10  */
  assign int_loadmultiplicand = control_n41; // (signal)
  /* ./lab2_multiplier.vhdl:59:10  */
  assign int_shlmultiplicand = control_n42; // (signal)
  /* ./lab2_multiplier.vhdl:60:10  */
  assign int_shrmultiplier = control_n44; // (signal)
  /* ./lab2_multiplier.vhdl:61:10  */
  assign int_loadmultiplier = control_n43; // (signal)
  /* ./lab2_multiplier.vhdl:63:10  */
  assign int_loadproduct = control_n45; // (signal)
  /* ./lab2_multiplier.vhdl:65:10  */
  always @*
    int_multiplicandin = n79_o; // (isignal)
  initial
    int_multiplicandin = 8'b00000000;
  /* ./lab2_multiplier.vhdl:66:10  */
  always @*
    int_adderout = adder_n72; // (isignal)
  initial
    int_adderout = 8'b00000000;
  /* ./lab2_multiplier.vhdl:67:10  */
  always @*
    int_productout = product_n67; // (isignal)
  initial
    int_productout = 8'b00000000;
  /* ./lab2_multiplier.vhdl:69:10  */
  assign zero = 1'b0; // (signal)
  /* ./lab2_multiplier.vhdl:83:27  */
  assign control_n41 = control_o_loadmultiplicand; // (signal)
  /* ./lab2_multiplier.vhdl:84:26  */
  assign control_n42 = control_o_shlmultiplicand; // (signal)
  /* ./lab2_multiplier.vhdl:85:25  */
  assign control_n43 = control_o_loadmultiplier; // (signal)
  /* ./lab2_multiplier.vhdl:86:24  */
  assign control_n44 = control_o_shrmultiplier; // (signal)
  /* ./lab2_multiplier.vhdl:82:22  */
  assign control_n45 = control_o_loadproduct; // (signal)
  /* ./lab2_multiplier.vhdl:87:15  */
  assign control_n47 = control_o_done; // (signal)
  /* ./lab2_multiplier.vhdl:76:1  */
  mulcontrol control (
    .i_multiplicand(int_multiplicandout),
    .i_multiplier(int_multiplierout),
    .i_clock(i_clock),
    .i_reset(i_reset),
    .o_loadmultiplicand(control_o_loadmultiplicand),
    .o_shlmultiplicand(control_o_shlmultiplicand),
    .o_loadmultiplier(control_o_loadmultiplier),
    .o_shrmultiplier(control_o_shrmultiplier),
    .o_loadproduct(control_o_loadproduct),
    .o_productselect(),
    .o_done(control_o_done));
  /* ./lab2_multiplier.vhdl:100:8  */
  assign multiplicand_n61 = multiplicand_o; // (signal)
  /* ./lab2_multiplier.vhdl:90:1  */
  shiftregister_8 multiplicand (
    .clock(i_clock),
    .reset(i_reset),
    .load(int_loadmultiplicand),
    .shiftl(int_shlmultiplicand),
    .shiftr(zero),
    .shiftextension(zero),
    .d(int_multiplicandin),
    .o(multiplicand_o));
  /* ./lab2_multiplier.vhdl:113:8  */
  assign multiplier_n64 = multiplier_o; // (signal)
  /* ./lab2_multiplier.vhdl:103:1  */
  shiftregister_4 multiplier (
    .clock(i_clock),
    .reset(i_reset),
    .load(int_loadmultiplier),
    .shiftl(zero),
    .shiftr(int_shrmultiplier),
    .shiftextension(zero),
    .d(i_operandb),
    .o(multiplier_o));
  /* ./lab2_multiplier.vhdl:126:8  */
  assign product_n67 = product_o; // (signal)
  /* ./lab2_multiplier.vhdl:116:1  */
  shiftregister_8 product (
    .clock(i_clock),
    .reset(i_reset),
    .load(int_loadproduct),
    .shiftl(zero),
    .shiftr(zero),
    .shiftextension(zero),
    .d(int_adderout),
    .o(product_o));
  /* ./lab2_multiplier.vhdl:134:19  */
  assign adder_n71 = adder_o_overflow; // (signal)
  /* ./lab2_multiplier.vhdl:135:17  */
  assign adder_n72 = adder_o_result; // (signal)
  /* ./lab2_multiplier.vhdl:129:1  */
  carrylookaheadadder_8bit adder (
    .i_a(int_multiplicandout),
    .i_b(int_productout),
    .i_carryin(zero),
    .o_carry(),
    .o_overflow(adder_o_overflow),
    .o_result(adder_o_result));
  assign n78_o = n37_o[7:4]; // extract
  assign n79_o = {n78_o, i_operanda};
endmodule

module iszero_8bit
  (input  [7:0] i_in,
   output o_iszero);
  wire n19_o;
  wire n20_o;
  wire n21_o;
  wire n22_o;
  wire n23_o;
  wire n24_o;
  wire n25_o;
  wire n26_o;
  wire n27_o;
  wire n28_o;
  wire n29_o;
  wire n30_o;
  wire n31_o;
  wire n32_o;
  wire n33_o;
  assign o_iszero = n33_o; //(module output)
  /* ./lab2_topLevel.vhdl:49:1  */
  assign n19_o = i_in[0]; // extract
  /* ./lab2_topLevel.vhdl:49:1  */
  assign n20_o = i_in[1]; // extract
  /* ./lab2_topLevel.vhdl:46:17  */
  assign n21_o = i_in[2]; // extract
  /* ./lab2_topLevel.vhdl:43:1  */
  assign n22_o = i_in[3]; // extract
  /* ./lab2_topLevel.vhdl:11:5  */
  assign n23_o = i_in[4]; // extract
  /* ./lab2_topLevel.vhdl:10:27  */
  assign n24_o = i_in[5]; // extract
  /* ./lab2_topLevel.vhdl:10:14  */
  assign n25_o = i_in[6]; // extract
  /* ./lab2_topLevel.vhdl:10:5  */
  assign n26_o = i_in[7]; // extract
  /* ./isZero_8bit.vhdl:22:18  */
  assign n27_o = n26_o | n25_o;
  /* ./isZero_8bit.vhdl:22:24  */
  assign n28_o = n27_o | n24_o;
  /* ./isZero_8bit.vhdl:22:30  */
  assign n29_o = n28_o | n23_o;
  /* ./isZero_8bit.vhdl:22:36  */
  assign n30_o = n29_o | n22_o;
  /* ./isZero_8bit.vhdl:22:42  */
  assign n31_o = n30_o | n21_o;
  /* ./isZero_8bit.vhdl:22:48  */
  assign n32_o = n31_o | n20_o;
  /* ./isZero_8bit.vhdl:22:54  */
  assign n33_o = n32_o | n19_o;
endmodule

module lab2_topLevel
  (input  [3:0] OperandA,
   input  [3:0] OperandB,
   input  GReset,
   input  GClock,
   output ZeroOut,
   output OverflowOut,
   output CarryOut,
   output [7:0] MuxOut);
  wire [7:0] int_result;
  wire int_clock;
  wire int_reset;
  wire n4_o;
  wire zero_n5;
  wire zero_o_iszero;
  wire [7:0] mult_n8;
  wire mult_n9;
  wire [7:0] mult_o_product;
  wire mult_o_overflow;
  wire mult_o_done;
  localparam n17_o = 1'bZ;
  assign ZeroOut = zero_n5; //(module output)
  assign OverflowOut = mult_n9; //(module output)
  assign CarryOut = n17_o; //(module output)
  assign MuxOut = mult_n8; //(module output)
  /* ./lab2_topLevel.vhdl:36:8  */
  assign int_result = 8'bX; // (signal)
  /* ./lab2_topLevel.vhdl:37:8  */
  assign int_clock = GClock; // (signal)
  /* ./lab2_topLevel.vhdl:37:19  */
  assign int_reset = n4_o; // (signal)
  /* ./lab2_topLevel.vhdl:40:14  */
  assign n4_o = ~GReset;
  /* ./lab2_topLevel.vhdl:46:17  */
  assign zero_n5 = zero_o_iszero; // (signal)
  /* ./lab2_topLevel.vhdl:43:1  */
  iszero_8bit zero (
    .i_in(int_result),
    .o_iszero(zero_o_iszero));
  /* ./lab2_topLevel.vhdl:55:18  */
  assign mult_n8 = mult_o_product; // (signal)
  /* ./lab2_topLevel.vhdl:56:19  */
  assign mult_n9 = mult_o_overflow; // (signal)
  /* ./lab2_topLevel.vhdl:49:1  */
  lab2_multiplier mult (
    .i_operanda(OperandA),
    .i_operandb(OperandB),
    .i_reset(int_reset),
    .i_clock(int_clock),
    .o_product(mult_o_product),
    .o_overflow(mult_o_overflow),
    .o_done());
endmodule

