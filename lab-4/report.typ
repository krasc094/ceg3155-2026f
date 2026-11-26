// CEG3155 Lab 4 report

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

#set document(title: "CEG3155 Lab 4 - Sequential Machine Design II: Keyboard Controller")
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
    #text(size: 20pt, weight: "bold")[Lab 4 - Sequential Machine Design II] \
    #v(0.2em)
    #text(size: 16pt, weight: "bold")[Keyboard Controller]
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
    *Experiment Date:* November 25th 2026 \
    *Submission Date:* November 25th, 2026
  ]
  #v(3em)
]

#set page(numbering: "-1-", number-align: center)
#counter(page).update(1)

#outline(title: [Table of content], depth: 2)

#pagebreak()

// ---------- report ----------

= Introduction

The objective of this lab is to learn how to:
- Design, implement and examine a finite-state-machine module;
- Design, implement and examine a keyboard-controller module.

To do so, the 8 steps of the FSM method are followed to implement a keyboard controller. This lab is important since PS/2 sends data one bit at a time with its own clock, which is the same idea behind UART, SPI and I2C. Receiving and decoding it is a skill used in almost every embedded or FPGA system.

= Problem Discussion

A protocol is presented which is used to scan each key on the keyboard uniquely. Each of them is represented as a column and a row in a matrix to know which key is being pressed. In this lab, the default scan codes are used.

A PS/2 keyboard sends each scan code as an 11-bit frame on `KbInfo`, one bit per falling edge of `KbClock`. The least significant data bit is sent first.

#figure(
  table(
    columns: (auto, auto, 1fr),
    inset: 5pt,
    [*Bit*], [*Value*], [*Meaning*],
    [0], [0], [Start bit],
    [1 to 8], [d0 to d7], [Scan code, LSB first],
    [9], [p], [Odd parity],
    [10], [1], [Stop bit],
  ),
  caption: [PS/2 frame],
)

#figure(
  table(
    columns: (auto, auto, 1fr, auto),
    inset: 5pt,
    [*Port*], [*Name*], [*Description*], [*On the board*],
    [Input], [`GClock`], [Global clock, 100 MHz], [`CLK100MHZ` (E3)],
    [Input], [`GReset`], [Global reset, asynchronous, active high (inverted inside)], [`BTNC`],
    [Input], [`KbClock`], [Keyboard clock], [`PS2_CLK`],
    [Input], [`KbInfo`], [Keyboard data], [`PS2_DATA`],
    [Output], [`BCD1[3..0]`], [Tens digit of the low 4 bits of the scan code], [`LED[15..12]`],
    [Output], [`BCD2[3..0]`], [Ones digit of the low 4 bits of the scan code], [`LED[7..4]`],
  ),
  caption: [Input/output specification],
)

= FSM Design

#fig("images/system_diagram.png", [System block diagram (from the lab manual)], width: 85%)

For this design, the following table was used ($K$ = `KbInfo`, $C$ = `countDone`):

#figure(
  table(
    columns: 6,
    align: center + horizon,
    inset: 5pt,
    [*Present*], [*KC = 00*], [*01*], [*11*], [*10*], [*Out*],
    [Waiting], [Reading], [X], [X], [Waiting], [0],
    [Reading], [Reading], [Waiting], [Waiting], [Reading], [1],
  ),
  caption: [Summary of the controller],
)

This way, only two states are needed, and the remaining steps of the method are based on them.

== Problem Specification

The goal of the FSM design is simple. As long as there is no start bit (1 $->$ 0 transition), the FSM stays in an idle state called Waiting. Otherwise, it goes into Reading. A counter is then used until the stop bit, after which the FSM switches back to the Waiting state.


== State Diagram

#fig("images/state_diagram.svg", [State diagram], width: 75%)

== State Table

#figure(
  table(
    columns: 6,
    align: center + horizon,
    inset: 5pt,
    table.header(
      table.cell(rowspan: 2)[*Present state*],
      table.cell(colspan: 4)[*Next state* ($K C$)],
      table.cell(rowspan: 2)[*Output*],
      [*00*], [*01*], [*11*], [*10*],
    ),
    [Waiting], [Reading], [X], [X], [Waiting], [0],
    [Reading], [Reading], [Waiting], [Waiting], [Reading], [1],
  ),
  caption: [State table. In Waiting the counter is held at 0, so $C = 1$ cannot happen (don't care)],
)

== State Minimization

With equivalence-class partitioning, $Pi_1$ groups the states that have the same output. Waiting and Reading have different outputs, so $Pi_1 = ("Waiting")("Reading")$ and the FSM is already minimal.

== State Assignment

With two states, one flip-flop $s$ is enough: Waiting is $s = 0$ and Reading is $s = 1$. The output of the FSM is the state bit itself.

== Transition Table

#figure(
  table(
    columns: 6,
    align: center + horizon,
    inset: 5pt,
    table.header(
      table.cell(rowspan: 2)[*Present state* $s$],
      table.cell(colspan: 4)[*Next state* $S$ ($K C$)],
      table.cell(rowspan: 2)[*Output*],
      [*00*], [*01*], [*11*], [*10*],
    ),
    [0], [1], [d], [d], [0], [0],
    [1], [1], [0], [0], [1], [1],
  ),
  caption: [Transition table],
)

== Design Equations

#figure(
  kmap([$s$ / $K C$], ("00", "01", "11", "10"), (
    ([*0*], [1], [d], [d], [0]),
    ([*1*], [1], [0], [0], [1]),
  )),
  caption: [$S$: groups $overline(s) overline(K)$ and $s overline(C)$],
)

*Next state:*
$ S = overline(s) overline(K) + s overline(C) $

*Counter and comparators* ($n$ is the 4-bit count of filtered clock edges in Reading):
$ "countDone" = (n >= 9), quad "isData" = (n < 8) $
$ "EnableCounter" = s, quad "ResetCounter" = s quad "(active low, so the counter is cleared in Waiting)" $

*Registers:*
$ "Shift" = s dot "isData", quad "LoadDisplay" = "countDone" $

*Clock filter* ($q_7 ... q_0$ are the last 8 samples of `KbClock` at 100 MHz):
$ "Set" = q_7 q_6 ... q_0, quad "Reset" = overline(q_7) overline(q_6) ... overline(q_0) $

*BCD decoder,* with $h_3 h_2 h_1 h_0$ the low 4 bits of the scan code and $"BCD1"(3..1) = 000$:
$ "BCD1"(0) = h_3 h_2 + h_3 h_1 $
$ "BCD2"(3) = h_3 overline(h_2) overline(h_1), quad "BCD2"(2) = overline(h_3) h_2 + h_2 h_1, quad "BCD2"(1) = overline(h_3) h_1 + h_3 h_2 overline(h_1), quad "BCD2"(0) = h_0 $

== Circuit Implementation

#fig("images/circuit_toplevel.svg", [Top-level circuit (`lab4_topLevel`). To keep it readable, the clock and reset wires are not drawn: every register (FSM, counter and both shift registers) is clocked by `clk_f` and reset by `resetBar`.], width: 65%)

#fig("images/circuit_fsm.svg", [FSM next-state logic (`lab4_fsm`), $S = overline(s) overline(K) + s overline(C)$], width: 80%)

= Discussion of Used Components

Everything is structural RTL VHDL; only the course flip-flop is behavioral. The main code is in the Appendix.

#table(
  columns: (auto, 1fr),
  inset: 6pt,
  [*lab4_topLevel*], [Top level: clock filter, FSM, counter, two comparators, serial shift register, display register and BCD decoder, mapped to the Nexys A7 pins.],
  [*lab4_fsm*], [2-state FSM (Waiting, Reading) with one `enARdFF_2`.],
  [*clockFilter_100Mhz*], [Samples `KbClock` at 100 MHz into an 8-bit serial shift register. When the 8 samples are all 1 the SR latch is set, when they are all 0 it is reset. Its output is the filtered clock.],
  [*shiftRegisterSerial*], [n-bit serial-in parallel-out shift register. New bits enter at the MSB and shift right, so after 8 shifts d0 is in bit 0. Used with n = 8 for the scan code and for the clock filter.],
  [*shiftRegister*], [n-bit register with load, shift left and shift right (`mux4_1bit` per bit). Only load is used here, to hold the scan code for the display.],
  [*counter4*], [4-bit up counter with enable and asynchronous clear: 4 `enARdFF_2` and `adder4` adding 1.],
  [*comparator4*], [4-bit unsigned comparator: a chain of 4 `oneBitComparator` starting from the most significant bit. Gives gt, lt and gteq = not lt.],
)

= Discussion of Actual Solution

The keyboard clock (`KbClock`) is routed through the digital filter, while the data line (`KbInfo`) is sent directly to the FSM and the serial shift register. The filtered clock is then used to synchronize all registers in the system. The scan code is built in the serial shift register and subsequently copied to a display register, which feeds the BCD decoder. The FSM does not output the scan code; instead, it solely controls the shifting and counting operations.

The table below shows one frame, one filtered clock edge at a time.

#figure(
  table(
    columns: (auto, auto, auto, 1fr),
    align: center + horizon,
    inset: 5pt,
    [*Edge*], [*State before*], [*Count before*], [*Action*],
    [Start bit], [Waiting], [0 (cleared)], [$K = 0$, FSM goes to Reading],
    [d0 to d7], [Reading], [0 to 7], [Shift the data bit in, count + 1],
    [Parity], [Reading], [8], [No shift, count + 1],
    [Stop bit], [Reading], [9 (`countDone`)], [Display register loads the scan code, FSM goes back to Waiting],
  ),
  caption: [Frame timing],
)

Staying in Reading for the parity and stop bits is needed: if the FSM went back to Waiting after d7, a parity bit of 0 would look like a new start bit.

= Discussion of Tool

Everything was simulated with GHDL and the waveforms (`.ghw`) were viewed in GTKWave. A Makefile compiles the design and runs the simulation. The design was then synthesized and implemented in Vivado 2022.1 for the Nexys A7-100T.

= Discussion of Challenging Problems

The clock filter was implemented using a gate-based SR latch. This "gated" design, where the output is controlled by logic gates rather than a dedicated clock edge, introduced timing issues during FPGA synthesis, even though the circuit performed correctly in simulation.

= Simulation Results

The `GClock` period in the simulations is 10 ns and the testbench `KbClock` has a 4 µs period (2 µs low, 2 µs high). Each byte is sent as a full 11-bit frame with odd parity.

== Keyboard Controller Simulation

#fig("images/sim_toplevel.png", [`tb_lab4_topLevel`, three frames (`16`, `1C`, `45`). In each frame `int_displayin` fills one bit per edge while `int_count` goes 0 to 9, `int_tobcd` loads the scan code when `int_countdone` is 1, and `bcd1`/`bcd2` show 0 6, 1 2 and 0 5.])

Testbench output:

```
code 00010110 -> BCD1=0000 BCD2=0110
code 00011100 -> BCD1=0001 BCD2=0010
code 01000101 -> BCD1=0000 BCD2=0101
```

== Shift Register Simulation

#fig("images/sim_shiftReg.png", [`tb_shiftRegister`: `2` (0010) is loaded at 20 ns, then a shift left with extension 1 gives `5` (0101) at 40 ns. The output is U before the load because this testbench does not reset the register.])

== Serial Shift Register Simulation

#fig("images/sim_shiftRegSerial.png", [`tb_shiftRegisterSerial`: a 1 is shifted in at 20 ns (`80`), then a 0 at 40 ns (`40`). New bits enter at the MSB and move right.])

= Verification

The testbenches below were used for verification. The waveforms were compared with the expected values from the tables and equations.

#figure(
  table(
    columns: (auto, 1fr, auto),
    inset: 5pt,
    [*Testbench*], [*Cases*], [*Result*],
    [tb_lab4_topLevel], [Three full PS/2 frames (`16`, `1C`, `45`), checked with assertions], [Pass],
    [tb_shiftRegister], [Load `0010`, then shift left with extension 1 (expect `0101`)], [Pass],
    [tb_shiftRegisterSerial], [Shift in 1 then 0 (expect `80` then `40`)], [Pass],
  ),
  caption: [Verification summary],
)

#figure(
  table(
    columns: 4,
    align: center,
    inset: 5pt,
    [*Scan code*], [*Low 4 bits*], [*Expected BCD1 BCD2*], [*Simulation*],
    [`16`], [6], [0000 0110], [0000 0110],
    [`1C`], [12], [0001 0010], [0001 0010],
    [`45`], [5], [0000 0101], [0000 0101],
  ),
  caption: [Expected and simulated outputs],
)

The lab demo was compeleted during the lab session and it produced the right outputs.

= Discussion


= Appendix: VHDL Code

The main components are listed below. The testbenches and the course-provided files are in the submitted source files.

#for f in (
  "vhdl/lab4_topLevel.vhdl",
  "vhdl/lab4_fsm.vhdl",
  "vhdl/components/clockFilter_100Mhz.vhdl",
  "vhdl/components/shiftRegSerial_nbit.vhdl",
  "vhdl/components/shiftReg_nbit.vhdl",
  "vhdl/components/counter_4bit.vhdl",
  "vhdl/components/comparator_4bit.vhdl",
  "vhdl/components/adder_4bit.vhdl",
  "vhdl/components/hexBcdDecoder.vhdl",
  "vhdl/components/allOnes_8bit.vhdl",
  "vhdl/components/allZeroes_8bit.vhdl",
  "vhdl/components/mux4_1bit.vhdl",
) {
  code(f)
}
