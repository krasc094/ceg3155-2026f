// CEG3155 Lab 3 report

// ---------- helpers ----------

#let todo(body) = box(fill: yellow.lighten(50%), inset: (x: 3pt, y: 1pt), outset: (y: 2pt))[*TODO:* #body]

#let fig(path, caption, width: 100%) = figure(image(path, width: width), caption: caption)

// one VHDL file in the appendix (two columns, small font like Lab 2)
#let code(path) = {
  let name = path.split("/").last()
  block(above: 1.2em, below: 0.6em, text(style: "italic", weight: "bold", size: 11pt, name))
  columns(2, gutter: 10pt, text(size: 8pt, raw(read(path), lang: "vhdl", block: true)))
}

// small K-map table: corner label, column labels, then one array per row
#let kmap(corner, cols, rows) = table(
  columns: cols.len() + 1,
  align: center,
  inset: 4pt,
  corner, ..cols.map(c => [*#c*]),
  ..rows.flatten(),
)

// ---------- document style ----------

#set document(title: "CEG3155 Lab 3 - Traffic Light Controller")
#set page(paper: "us-letter", margin: 1in)
#set text(font: ("Times New Roman", "TeX Gyre Termes", "Libertinus Serif"), size: 11pt)
#set par(justify: true)
#show raw: set text(font: ("DejaVu Sans Mono",))
#show raw.where(block: true): block.with(fill: luma(243), radius: 4pt, inset: 8pt, width: 100%)

#show heading.where(level: 1): it => block(above: 1.8em, below: 1.1em)[
  #text(size: 16pt, weight: "bold", it.body)
  #v(-0.5em)
  #line(length: 2.2em, stroke: 1.5pt)
]
#show heading.where(level: 2): set text(size: 12pt)
#show heading.where(level: 3): it => block(above: 1.2em, below: 0.8em,
  text(size: 11pt, weight: "bold", style: "italic", it.body))

// ---------- title page (no page number) ----------

#page(numbering: none)[
  #align(center)[
    #v(2em)
    #image("images/uottawa.png", width: 32%)
    #v(3em)
    #text(size: 20pt, weight: "bold")[Lab 3 - Traffic Light Controller]
    #v(0.8em)
    #text(size: 13pt, weight: "bold", style: "italic", underline[CEG3155-Digital Systems II]) \
    #text(weight: "bold")[Fall 2026] \
    #text(weight: "bold")[School of Electrical Engineering and Computer Science] \
    #text(weight: "bold")[University of Ottawa]
    #v(1.2em)
    #text(size: 13pt)[Course Coordinator:] \
    #text(size: 10pt)[Prof. Rami Abielmona]
    #v(0.8em)
    #text(size: 13pt)[Teaching Assistants:] \
    #text(size: 10pt, style: "italic")[Mathis Hurens Barrette]
  ]
  #v(1fr)
  #align(center)[
    *Group: 11* \
    *Student Name and number:* Marcel Traore 300379484 \
    *Student Name and number:* Kai Rasco \#300304789 \
    *Experiment Date:*  \
    *Submission Date:* 
  ]
  #v(3em)
]

#set page(numbering: "-1-", number-align: center)
#counter(page).update(1)

#outline(title: [Table of contents], depth: 2)

#pagebreak()

// ---------- report ----------

= Introduction



= Problem Discussion


#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    inset: 5pt,
    [*Port*], [*Name*], [*Description*], [*On the board*],
    [Input], [`GClock`], [Global clock], [1 Hz from `clk_div`],
    [Input], [`GReset`], [Global reset, asynchronous, active low], [`CPU_RESETN`],
    [Input], [`MSC[3..0]`], [Main street green time], [`SW[7..4]`],
    [Input], [`SSC[3..0]`], [Side street green time], [`SW[3..0]`],
    [Input], [`SSCS`], [Side street car sensor], [`BTNC` (debounced)],
    [Output], [`MSTL[2..0]`], [Main street light, one-hot (100 G, 010 Y, 001 R)], [`LED[5..3]`],
    [Output], [`SSTL[2..0]`], [Side street light, one-hot], [`LED[2..0]`],
    [Output], [`BCD1[3..0]`], [Tens digit of the current count (bonus)], [Left 7-segment digit],
    [Output], [`BCD2[3..0]`], [Ones digit of the current count (bonus)], [Right 7-segment digit],
  ),
  caption: [Input/output specification],
)

= FSM Design

== Problem Specification



== State Diagram

#fig("images/state_diagram.svg", [State diagram], width: 75%)


== State Table

#figure(
  table(
    columns: 8,
    align: center + horizon,
    inset: 5pt,
    table.header(
      table.cell(rowspan: 2)[*Present state*],
      table.cell(colspan: 4)[*Next state* ($g C$)],
      table.cell(colspan: 3)[*Output*],
      [*00*], [*01*], [*11*], [*10*], [*MSTL*], [*SSTL*], [*Timer running*],
    ),
    [S0], [S0], [S0], [S1], [S0], [100], [001], [MG],
    [S1], [S1], [S1], [S2], [S2], [010], [001], [MY],
    [S2], [S2], [S2], [S3], [S3], [001], [100], [SG],
    [S3], [S3], [S3], [S0], [S0], [001], [010], [SY],
  ),
  caption: [State table. Only the timer of the current state runs (its reset is the state bit AND `GReset`), the other three are held at 0],
)

== State Minimization

With equivalence-class partitioning, $Pi_1$ groups the states that have the same outputs (MSTL, SSTL). Every state has a different pair of lights, so $Pi_1 = (S_0)(S_1)(S_2)(S_3)$ and $Pi_2 = Pi_1$.

== State Assignment

#figure(
  table(
    columns: 4,
    align: center,
    inset: 5pt,
    [*State*], [*Sequential* ($y_1 y_0$)], [*Gray* ($y_1 y_0$)], [*One-hot* ($y_3 y_2 y_1 y_0$), chosen],
    [S0, Main Green], [00], [00], [0001],
    [S1, Main Yellow], [01], [01], [0010],
    [S2, Side Green], [10], [11], [0100],
    [S3, Side Yellow], [11], [10], [1000],
  ),
  caption: [State assignment],
)

We chose one hot encoding because each state has its own flip flop, so the lights come directly from the state bits without any decoding (for example $"MSTL"(2) = y_0$). The next state equations are also simpler, since each state only depends on the state before it, $g$ and $C$. The state bits are also used directly to reset the timers of each state. The downside is that it needs 4 flip flops instead of 2, but an FPGA has a lot of flip flops so this is not a problem.

== Transition Table

#figure(
  table(
    columns: 3,
    align: center + horizon,
    inset: 5pt,
    [*State*], [*Name*], [*$y_3 y_2 y_1 y_0$*],
    [S0], [Main Green], [0001],
    [S1], [Main Yellow], [0010],
    [S2], [Side Green], [0100],
    [S3], [Side Yellow], [1000],
  ),
  caption: [State codes (one-hot)],
)

#figure(
  table(
    columns: 7,
    align: center + horizon,
    inset: 5pt,
    table.header(
      table.cell(rowspan: 2)[*Present state* \ $y_3 y_2 y_1 y_0$],
      table.cell(colspan: 4)[*Next state* $Y_3 Y_2 Y_1 Y_0$ ($g C$)],
      table.cell(colspan: 2)[*Output*],
      [*00*], [*01*], [*11*], [*10*], [*MSTL*], [*SSTL*],
    ),
    [0001], [0001], [0001], [0010], [0001], [100], [001],
    [0010], [0010], [0010], [0100], [0100], [010], [001],
    [0100], [0100], [0100], [1000], [1000], [001], [100],
    [1000], [1000], [1000], [0001], [0001], [001], [010],
  ),
  caption: [Transition table. The other 12 codes are unreachable (don't cares)],
)

== Design Equations



#grid(
  columns: 2,
  gutter: 16pt,
  figure(
    kmap([$g C$ / $y_3 y_0$], ("00", "01", "11", "10"), (
      ([*00*], [0], [1], [d], [0]),
      ([*01*], [0], [1], [d], [0]),
      ([*11*], [0], [0], [d], [1]),
      ([*10*], [0], [1], [d], [1]),
    )),
    caption: [$Y_0$: groups $y_0 overline(g)$, $y_0 overline(C)$ and $y_3 g$],
  ),
  figure(
    kmap([$g C$ / $y_0 y_1$], ("00", "01", "11", "10"), (
      ([*00*], [0], [1], [d], [0]),
      ([*01*], [0], [1], [d], [0]),
      ([*11*], [0], [0], [d], [1]),
      ([*10*], [0], [0], [d], [0]),
    )),
    caption: [$Y_1$: groups $y_1 overline(g)$ and $y_0 g C$],
  ),
  figure(
    kmap([$g$ / $y_1 y_2$], ("00", "01", "11", "10"), (
      ([*0*], [0], [1], [d], [0]),
      ([*1*], [0], [0], [d], [1]),
    )),
    caption: [$Y_2$ ($C$ does not matter)],
  ),
  figure(
    kmap([$g$ / $y_2 y_3$], ("00", "01", "11", "10"), (
      ([*0*], [0], [1], [d], [0]),
      ([*1*], [0], [0], [d], [1]),
    )),
    caption: [$Y_3$ ($C$ does not matter)],
  ),
)

*Next state:*
$ Y_0 = y_3 g + y_0 (overline(g) + overline(C)) quad quad Y_1 = y_0 g C + y_1 overline(g) $
$ Y_2 = y_1 g + y_2 overline(g) quad quad Y_3 = y_2 g + y_3 overline(g) $
Flip-flop 0 stores the inverse: $D_0 = overline(Y_0)$ and $y_0 = overline(q_0)$.

*Lights:*
$ "MSTL"(2) = y_0, quad "MSTL"(1) = y_1, quad "MSTL"(0) = y_2 + y_3 $
$ "SSTL"(2) = y_2, quad "SSTL"(1) = y_3, quad "SSTL"(0) = y_0 + y_1 $

*Counter resets (active low), enable and timer flag:*
$ "ResetMG" = y_0 dot "GReset", quad "ResetMY" = y_1 dot "GReset", quad "ResetSG" = y_2 dot "GReset", quad "ResetSY" = y_3 dot "GReset" $
$ "EnableMG" = overline("gteq_MG"), quad g = "gteq_MG" + "gteq_MY" + "gteq_SG" + "gteq_SY" $

*BCD decoder (bonus):* $s_3 s_2 s_1 s_0$ is the 4-bit count, BCD1 is the tens digit and BCD2 is the ones digit.

#figure(
  table(
    columns: 4,
    align: center,
    inset: 4pt,
    table.header([*Count*], [*$s_3 s_2 s_1 s_0$*], [*BCD1*], [*BCD2*]),
    [0],  [0000], [0000], [0000],
    [1],  [0001], [0000], [0001],
    [2],  [0010], [0000], [0010],
    [3],  [0011], [0000], [0011],
    [4],  [0100], [0000], [0100],
    [5],  [0101], [0000], [0101],
    [6],  [0110], [0000], [0110],
    [7],  [0111], [0000], [0111],
    [8],  [1000], [0000], [1000],
    [9],  [1001], [0000], [1001],
    [10], [1010], [0001], [0000],
    [11], [1011], [0001], [0001],
    [12], [1100], [0001], [0010],
    [13], [1101], [0001], [0011],
    [14], [1110], [0001], [0100],
    [15], [1111], [0001], [0101],
  ),
  caption: [Hex to BCD truth table],
)

The counter needs 4 bits to represent all 16 possible numbers (0 to 15), so there are no don't cares. $"BCD1"(3..1)$ is always 000, so only $"BCD1"(0)$ needs a K-map. $"BCD2"(0) = s_0$ because taking away 10 does not change if the number is odd or even, so it does not need one either.

#grid(
  columns: 2,
  gutter: 16pt,
  figure(
    kmap([$s_3 s_2$ / $s_1 s_0$], ("00", "01", "11", "10"), (
      ([*00*], [0], [0], [0], [0]),
      ([*01*], [0], [0], [0], [0]),
      ([*11*], [1], [1], [1], [1]),
      ([*10*], [0], [0], [1], [1]),
    )),
    caption: [$"BCD1"(0)$: groups $s_3 s_2$ and $s_3 s_1$],
  ),
  figure(
    kmap([$s_3 s_2$ / $s_1 s_0$], ("00", "01", "11", "10"), (
      ([*00*], [0], [0], [0], [0]),
      ([*01*], [0], [0], [0], [0]),
      ([*11*], [0], [0], [0], [0]),
      ([*10*], [1], [1], [0], [0]),
    )),
    caption: [$"BCD2"(3)$: group $s_3 overline(s_2) overline(s_1)$],
  ),
  figure(
    kmap([$s_3 s_2$ / $s_1 s_0$], ("00", "01", "11", "10"), (
      ([*00*], [0], [0], [0], [0]),
      ([*01*], [1], [1], [1], [1]),
      ([*11*], [0], [0], [1], [1]),
      ([*10*], [0], [0], [0], [0]),
    )),
    caption: [$"BCD2"(2)$: groups $overline(s_3) s_2$ and $s_2 s_1$],
  ),
  figure(
    kmap([$s_3 s_2$ / $s_1 s_0$], ("00", "01", "11", "10"), (
      ([*00*], [0], [0], [1], [1]),
      ([*01*], [0], [0], [1], [1]),
      ([*11*], [1], [1], [0], [0]),
      ([*10*], [0], [0], [0], [0]),
    )),
    caption: [$"BCD2"(1)$: groups $overline(s_3) s_1$ and $s_3 s_2 overline(s_1)$],
  ),
)

From the K-maps, we get
$ "BCD1"(0) = s_3 s_2 + s_3 s_1 $
$ "BCD2"(3) = s_3 overline(s_2) overline(s_1), quad "BCD2"(2) = overline(s_3) s_2 + s_2 s_1, quad "BCD2"(1) = overline(s_3) s_1 + s_3 s_2 overline(s_1), quad "BCD2"(0) = s_0 $

== Circuit Implementation

#fig("images/board_diagram.svg", [Top level on the Nexys A7])

The circuit is done in structural VHDL, using the components given by the course and our own components. The state register is 4 `enARdFF_2` flip flops, one for each state, clocked by `GClock` and reset by `GReset`. The next state equations $Y_0$ to $Y_3$ and the light outputs are done with AND, OR and NOT gates, directly from the design equations. Flip flop 0 gets $overline(Y_0)$ and its output is inverted again to give $y_0$, so the reset puts the FSM in S0.

The four timers are built the same way. Each `counter4` is 4 `enARdFF_2` flip flops and an `adder4` that adds 1 to the count at every clock. The `adder4` is a chain of 4 `oneBitAdder`. Each `comparator4` is a chain of 4 `oneBitComparator` starting from the most significant bit, and gteq is the inverse of lt. The hex to BCD decoder is made of gates from the BCD equations above.

The top level connects the controller to the board. The 100 MHz clock goes into `clk_div`, which gives 1 Hz for the controller and the debouncer, and 1 kHz for the display. The car button `BTNC` goes through the debouncer before going to `SSCS`. `CPU_RESETN` is the global reset (active low) and goes to the controller and the display. The switches `SW[7..4]` and `SW[3..0]` give `MSC` and `SSC`, and the lights go to `LED[5..3]` for the main street and `LED[2..0]` for the side street. The display driver `sevenSeg` switches between the two digits at 1 kHz to show `BCD1` and `BCD2`. The pins are set in the constraints file `lab3_fsm.xdc`.

= Discussion of Used Components

Everything is structural RTL VHDL; only the course flip-flop and clock divider are behavioral. The main code is in the Appendix.

#table(
  columns: (auto, 1fr),
  inset: 6pt,
  [*TopLevel_trafficLightBoard*], [Board top level: clock divider, debouncer, controller and display driver, mapped to the Nexys A7 pins.],
  [*trafficLightController*], [Top-level entity of the lab: 4-state one-hot FSM, four timers, OR gates and BCD decoder.],
  [*counter4*], [4-bit up counter with enable and asynchronous clear: 4 `enARdFF_2` and `adder4` adding 1.],
  [*comparator4*], [4-bit unsigned comparator: a chain of 4 `oneBitComparator` starting from the most significant bit. Gives gt, lt and gteq = not lt.],
  [*adder4*], [4-bit ripple carry adder from 4 `oneBitAdder`.],
  [*hex_bcd_decoder*], [Turns the 4-bit count into tens and ones BCD digits (bonus), from K-map equations.],
  [*sevenSeg*], [Shows the two digits on the Nexys display: one flip-flop switches between the digits at 1 kHz, a multiplexer picks the digit and `dec_7seg` drives the segments.],
  [*enARdFF_2, oneBitAdder, oneBitComparator*], [Provided by the course: D flip-flop with enable and asynchronous reset, 1-bit full adder, 1-bit comparator.],
  [*clk_div, debouncer, dec_7seg*], [Provided by the course: clock divider (changed for the 100 MHz clock), push-button debouncer, 7-segment decoder.],
)

= Discussion of Actual Solution

#fig("images/controller_diagram.svg", [Traffic light controller block diagram])

#fig("images/flowchart.svg", [Flowchart of the solution], width: 35%)

Our solution is a Moore FSM with 4 states, main green (S0), main yellow (S1), side green (S2) and side yellow (S3). We used one hot encoding, so each state has its own flip flop ($y_0$ to $y_3$) and the lights come directly from the state bits. $y_0$ is stored inverted, so when `GReset` is pressed all the flip flops go to 0 and the FSM starts in S0 with the main street green and the side street red.

Each state has its own timer made of a `counter4` and a `comparator4`. A timer only counts when its state is active, because its reset is the state bit AND `GReset`. The other three timers stay at 0. The comparator checks if the count reached the limit. `MSC` and `SSC` come from the switches and the yellow times are fixed in the code (`MT` = 5 and `SST` = 3). The comparator outputs are combined into $g$, which tells the FSM that the time of the current state is over.

When $g$ is 1, the FSM goes to the next state. The only exception is the main green, which only goes to yellow if $g$ is 1 and there is a car ($C$). If there is no car, the main green counter stops at `MSC` because its enable is $overline("gteq_MG")$, and the light stays green until a car arrives.

For the bonus, the four counts are OR'ed together into `activeCount`. Since only one counter runs at a time, this is basically the count of the current state. The hex to BCD decoder splits it into the tens (`BCD1`) and the ones (`BCD2`), which are shown on the display.

On the board, the top level adds the clock divider (1 Hz for the controller and 1 kHz for the display), the debouncer for the car button and the `sevenSeg`.

= Discussion of Tool

We simulated everything with GHDL and looked at the waveforms (`.ghw`) in GTKWave. A PowerShell script (`run_tests.ps1`) compiles the design and runs all the testbenches. This script was created using AI to make it faster, but could also be done without this script.

= Discussion of Challenging Problems

We had two main problems. First, the synthesis in Vivado failed with a system resources error. It was not from our code but from Vivado and Windows, and it worked after restarting the computer and running it again. Second, the anodes of the 7-segment display were confusing to use as a selector for the digit number. All 8 digits share the same segment pins, so the anodes are basically used to choose which digit is on. A flip-flop switches between the two digits at 1 kHz, which is fast enough that both look on at the same time.


= Simulation Results

The clock period in the simulations is 10 ns, so 100 ns is 10 cycles. Each phase lasts its limit + 1 cycle.

== Traffic Light Controller Simulation

#fig("images/sim_controller_1.png", [0 to 740 ns. During reset the lights are already MS green and SS red (S0). With no car, the count goes from 1 to 6 and stays at 6 ($g = 1$). A car at 220 ns gives yellow on the next clock, then MS yellow lasts 6 cycles, SS green 3 (`SSC` = 2) and SS yellow 4 (`SST` = 3).])

#fig("images/sim_controller_2.png", [714 to 1460 ns. The car waits for two full cycles, and MS green lasts 7 cycles (`MSC` + 1) each time. When the car leaves at 1140 ns, MS stays green and the count stays at 6.])

#fig("images/sim_controller_3.png", [1410 to 2130 ns. With `MSC` = 3 and `SSC` = 9, SS green lasts 10 cycles and MS green stops counting at 3. The reset at 2010 ns goes back to S0 right away, even in the middle of SS green.])

== Counter Simulation

#fig("images/sim_counter.png", [`counter4`: after the reset is released, it counts from 0 to F and wraps back to 0.])

== Comparator Simulation

#fig("images/sim_comparator.png", [`comparator4` with A = 5: gt while B < 5, both gt and lt are 0 at B = 5, lt from B = 6, and gteq = not lt.])

== Adder Simulation

#fig("images/sim_adder.png", [`adder4` from 1200 to 1360 ns: with A = F the sum wraps and cout = 1. From 1280 ns, A = 0 and cin = 1, so the sum is B + 1.])

== Hex to BCD Decoder Simulation

#fig("images/sim_hex_bcd.png", [`hex_bcd_decoder` with inputs 0 to F. From A (10), bcd1 (tens) is 1 and bcd2 (ones) starts again at 0.])

== Seven-Segment Display Simulation

#fig("images/sim_sevenseg.png", [`sevenSeg`: `an` switches between FE (right digit) and FD (left digit) on every clock. The segments show 7 and 4 (47), then 5 and 1 (15). They are active low: 78 is 7, 19 is 4, 12 is 5 and 79 is 1.])

= Verification

Every component has a testbench that applies the cases below. We compared the waveforms with the expected values from our tables and equations, and all of them matched.

#figure(
  table(
    columns: (auto, 1fr, auto),
    inset: 5pt,
    [*Testbench*], [*Cases*], [*Result*],
    [tb_adder4], [All 512 combinations of A, B and cin], [Pass],
    [tb_comparator4], [All 256 pairs of A and B], [Pass],
    [tb_counter4], [Reset, counting with wrap-around, hold with enable = 0, reset], [Pass],
    [tb_hex_bcd_decoder], [All 16 inputs], [Pass],
    [tb_sevenSeg], [Two numbers, digit switching and segments], [Pass],
    [tb_trafficLightController], [Reset, no car, late car, car waiting, car leaving early, new switch values, reset during SS green], [Pass],
  ),
  caption: [Verification summary],
)

#figure(
  table(
    columns: 3,
    align: center,
    inset: 5pt,
    [*Phase*], [*Expected (cycles)*], [*Simulation*],
    [MS green, car waiting, `MSC` = 6], [7], [7],
    [MS green, car arrives after `MSC`], [1 more], [1],
    [MS yellow, `MT` = 5], [6], [6],
    [SS green, `SSC` = 2], [3], [3],
    [SS green, `SSC` = 9], [10], [10],
    [SS yellow, `SST` = 3], [4], [4],
    [Reset during SS green], [S0 right away], [S0 right away],
  ),
  caption: [Expected and simulated phase lengths],
)

We were able to present the demonstration by uploading the code via Vivado. We were able to confirm the waveform that we got during the simulations.

= Discussion

The design worked in simulation and on the FPGA board in the lab. The limitations are that `MSC` and `SSC` cannot be 0, that each phase lasts one cycle longer than its limit, and that the car has to be present (button held) when the main green time is over.

A possible improvement would be to lower the debounce time, so we do not have to press the button so long.

= Appendix: VHDL Code

The main components are listed below. The testbenches and the course-provided files are in the submitted source files.

#for f in (
  "vhdl/mine/TopLevel_trafficLightBoard.vhdl",
  "vhdl/mine/trafficLightController.vhdl",
  "vhdl/mine/counter4.vhdl",
  "vhdl/mine/comparator4.vhdl",
  "vhdl/mine/adder4.vhdl",
  "vhdl/mine/hexBcdDecoder.vhdl",
  "vhdl/mine/sevenSeg.vhdl",
) {
  code(f)
}
