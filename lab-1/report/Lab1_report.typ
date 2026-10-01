// CEG 3155 Lab 1 Report
// Folder layout expected:
//   report.typ
//   uottawa-logo.png
//   lab-1/            (unzipped lab-1.zip)
//   figures/          (your ASM charts, datapath, control logic, etc.)
// Compile: typst compile report.typ

#let hole(label) = box(fill: yellow.lighten(40%), inset: (x: 3pt), outset: (y: 2pt))[\[#label\]]

#set document(title: "Lab 1 - Introduction to VHDL and ASM Design")
#set text(font: ("Times New Roman", "Liberation Serif", "TeX Gyre Termes"), size: 11pt)
#set page(paper: "us-letter", margin: 1in)

// ================= TITLE PAGE =================
#page(numbering: none)[
  #set align(center)
  #v(0.2in)
  #image("figures/uottawa-logo.png", width: 2.3in)
  #v(0.5in)

  #text(size: 20pt, weight: "bold")[Lab 1 - Introduction to VHDL and ASM Design]
  #v(-2pt)
  #text(size: 14pt, weight: "bold", style: "italic")[#underline[CEG3155-Digital Systems II]] \
  #text(weight: "bold")[
    Fall 2026 \
    School of Electrical Engineering and Computer Science \
    University of Ottawa
  ]

  #v(0.15in)
  #text(size: 13pt)[Course Coordinator:] \
  Prof. Rami Abielmona

  #v(0.1in)
  #text(size: 13pt)[Teaching Assistants:] \
  #text(style: "italic")[
    Mathis Hurens Barrette
  ]

  #v(1fr)
  #text(weight: "bold")[Group: 11] \
  #text(weight: "bold")[Student Name and number:] Marcel Traore 300379484 \
  #text(weight: "bold")[Student Name and number:] Kai Rasco \#300304789 \
  #text(weight: "bold")[Experiment Date: September 23rd 2026] 
  #text(weight: "bold")[Submission Date:September 30th 2026]
  #v(0.3in)
]

// ================= BODY SETUP =================
#set page(numbering: "1")
#counter(page).update(1)
#set heading(numbering: "1.1")
#set par(justify: true)
#show raw.where(block: true): set text(size: 8pt)
#show raw.where(block: true): block.with(fill: luma(245), inset: 8pt, radius: 3pt, width: 100%)

#outline()
#pagebreak()

= Objective
The objective of this lab is to design a light display controller using the ASM method, implement it in structural VHDL and verify it by simulation.

= Problem Description
The goal is a controller for a row of eight LEDs driven by two switches. When only LEFT is on, a single light moves from right to left. When only RIGHT is on, a single light moves from left to right. When both are on, both lights move at the same time and cross each other. When both are off, the display is blank, but the position of each light is kept, so turning a switch back on resumes the motion from where it stopped. GReset brings the whole circuit back to its initial state. On a board, the lights would move one position per second so the motion is visible. As agreed with the TA, this lab is evaluated on the simulation of the top-level entity only, so the design is clocked directly by GClock (@sec-top).

#figure(
  table(
    columns: 3,
    align: (left, left, left),
    [*Port*], [*Name*], [*Description*],
    [Input], [GClock], [Global clock],
    [Input], [GReset], [Global reset],
    [Input], [Right], [Right switch: 0 = off, 1 = on],
    [Input], [Left], [Left switch: 0 = off, 1 = on],
    [Output], [DisplayOut[7..0]], [Eight display LEDs],
  ),
  caption: [Input/output specification],
)

= Design
== Pseudocode / Flowchart
The design starts from the pseudocode given in the lab manual:

#[
#set list(marker: ([•], [–]))
- _DISPLAY_ ← 00000000; _LMASK_ ← 00000001; _RMASK_ ← 10000000;
- if (LEFT and RIGHT)
  - _DISPLAY_ ← _LMASK_ ∨ _RMASK_;
  - _LMASK_ ← _LMASK_ \<\< 1;
  - _RMASK_ ← _RMASK_ >> 1;
- else if (LEFT)
  - _DISPLAY_ ← _LMASK_;
  - _LMASK_ ← _LMASK_ \<\< 1;
- else if (RIGHT)
  - _DISPLAY_ ← _RMASK_;
  - _RMASK_ ← _RMASK_ >> 1;
- else
  - _DISPLAY_ ← 00000000;
- Go back to first if statement;
]

The ASM chart in @fig-asm also serves as the flowchart of the solution.

== ASM Chart
#figure(image("figures/asm-chart.png", width: 85%), caption: [ASM chart]) <fig-asm>
The chart has five states. S0 is the initial state: DISPLAY is cleared, LMASK is set to 00000001 and RMASK to 10000000. From every state the chart returns to the same chain of decisions. If both switches are on (S1), DISPLAY takes LMASK OR RMASK and both masks shift. If only LEFT is on (S2), DISPLAY takes LMASK and LMASK shifts left. If only RIGHT is on (S3), DISPLAY takes RMASK and RMASK shifts right. If neither is on (S4), DISPLAY is cleared. The masks are not reset in S4, so the lights resume from where they stopped.

== Datapath
#figure(image("figures/datapath.png", width: 85%), caption: [Datapath]) <fig-dp>
Following the ASM rules, each unique name in the RTN statements gets its own register: LMASK, RMASK and DISPLAY. LMASK and RMASK are shift registers with a parallel load of their initial value (00000001 and 10000000) and control inputs Load_LMASK/shift_LMASK and Load_RMASK/shift_RMASK. An 8-bit OR gate forms LMASK OR RMASK. Since DISPLAY has four possible sources, a 4-to-1 mux selects its input, with LEFT and RIGHT used directly as the select lines: 11 selects LMASK OR RMASK, 10 selects LMASK, 01 selects RMASK and 00 selects 00000000. DISPLAY is loaded when Load_Display is high and drives DisplayOut[7..0].

Because the mux select comes directly from the switches, loading DISPLAY in S0 does not guarantee 00000000 unless both switches are off. In the top-level entity this is handled by the global reset: GReset clears DISPLAY, LMASK and RMASK through the asynchronous reset of their flip-flops (see @sec-top).

== Detailed ASM Chart
#figure(image("figures/detailed-asm.png", width: 85%), caption: [Detailed ASM chart]) <fig-dasm>
Each RTN statement of @fig-asm is replaced by the control signals that perform it on the datapath of @fig-dp, and each decision box tests the LEFT and RIGHT status signals. S0 asserts Load_Display, Load_LMASK and Load_RMASK. S1 asserts shift_LMASK, shift_RMASK and Load_Display. S2 asserts shift_LMASK and Load_Display, S3 asserts shift_RMASK and Load_Display, and S4 only asserts Load_Display (the mux already selects 00000000). Unlisted signals are 0.

== Control Logic (One-FF-Per-State)
#figure(image("figures/control-logic.png", width: 90%), caption: [Control logic (one-FF-per-state)]) <fig-ctrl>
One D flip-flop is used per state (S0 to S4), all clocked by CLK, so exactly one state is active at a time. Each control signal is the OR of the states that assert it in @fig-dasm:
- Load_Display = S0 + S1 + S2 + S3 + S4
- Load_LMASK = S0, #h(1em) shift_LMASK = S1 + S2
- Load_RMASK = S0, #h(1em) shift_RMASK = S1 + S3

Every state returns to the same decision boxes, and exactly one state is always active, so the next-state inputs only depend on the switches:
- S1_in = LEFT · RIGHT
- S2_in = LEFT · RIGHT'
- S3_in = LEFT' · RIGHT
- S4_in = LEFT' · RIGHT'

@fig-ctrl was drawn before the VHDL was written, and it differs from the equations above in two places: it ANDs S0_out into each next-state input, and it ORs S0, S1 and S2 into Load_LMASK (and S0, S1 and S3 into Load_RMASK). The equations above are the ones implemented in the VHDL.

In the VHDL (`lab1_control`), the state flip-flops are `dFF_2`, which has no reset input, so GReset is handled synchronously: S0_in = GReset, and each of S1_in to S4_in is also ANDed with GReset', so the controller is in S0 while GReset is high and leaves it on the first clock edge after GReset is released. The mask registers use the `shiftRegister` component, where load has priority over shift. The VHDL drives the load inputs with S0 only and the shift inputs with S1 + S2 and S1 + S3, exactly as in the equations above.

= Implementation
== Component Descriptions
The following components were written in VHDL:

- *dFF_2:* D flip-flop (course-provided, no reset) used as the one-hot state register in the control path. \
- *dFlipFlop:* positive-edge-triggered D flip-flop built from six NAND-type gates, with an asynchronous active-low reset (i_reset_bar = 0 forces Q to 0). It is the storage element of the shift register. \
- *mux4_1bit:* 1-bit 4-to-1 multiplexer written as a sum of products; select 00 picks a, 01 picks b, 10 picks c and 11 picks d. \
- *shiftRegister:* generic n-bit register with one `mux4_1bit` and one `dFlipFlop` per bit. The select lines are sel(1) = shiftL + load and sel(0) = shiftR + load, so 00 holds, 01 shifts right (bit i takes bit i+1), 10 shifts left (bit i takes bit i-1) and 11 loads d. Because load drives both select lines, it has priority over either shift. The end bits take shiftExtension as the incoming bit. It is intended for LMASK and RMASK. \
- *lab1_control:* one-hot controller with states S0 to S4 producing the load and shift control signals. \
- *mux4_nBit:* generic n-bit 4-to-1 multiplexer (one sum-of-products expression per bit), used as the 8-bit DISPLAY input mux. \
- *lab1_topLevel:* top-level entity connecting the controller to the datapath (@sec-top). \

The full code is in the Appendix.

== Top-Level Entity <sec-top>
`lab1_topLevel` has the ports of the I/O specification (GClock, GReset, Left, Right, DisplayOut[7..0]) and is built structurally from the components above:

- *control (`lab1_control`):* receives Left, Right and the clock, and drives Load_Display, Load_LMASK, Load_RMASK, shift_LMASK and shift_RMASK.
- *lMaskReg and rMaskReg (`shiftRegister`, n = 8):* LMASK and RMASK, with parallel inputs fixed at 00000001 and 10000000. LMASK only uses shiftL and RMASK only uses shiftR. Each register's shiftExtension is tied to its own opposite end bit (LMASK(7) for LMASK, RMASK(0) for RMASK), so the masks rotate instead of shifting out: after reaching the last LED the light wraps back to the first one and keeps moving.
- *OR gate:* the 8-bit expression LMASK or RMASK forms the "both" input of the mux.
- *mux (`mux4_nBit`):* sel(1) = Left and sel(0) = Right, with inputs 00000000, RMASK, LMASK and LMASK OR RMASK, as in @fig-dp.
- *displayReg (`shiftRegister`, n = 8):* the DISPLAY register. Its shift inputs are tied to 0, so it only loads (when Load_Display is high) or holds, and its output drives DisplayOut.

GReset is active high. It is inverted once and sent to the controller (which inverts it again, so S0_in = GReset) and to the active-low reset of all three registers. While GReset is high, DISPLAY, LMASK and RMASK are held at 00000000 and the controller is in S0. On the first clock edge after GReset is released, S0 is still active, so the masks load 00000001 and 10000000 and the controller moves to S1 to S4 according to the switches.

Since the design is only verified in simulation, no clock divider is used: GClock drives the controller and the registers directly, so the lights move one position per clock cycle. The course clock divider (`clk_div`) is declared in the top-level but its instance is commented out; it would only be needed to slow the lights down to about 1 Hz on a board.

= Simulation Results
== Shift Register
#figure(
  image("../waveforms/shiftRegister waveform.png", width: 100%),
  caption: [Shift register simulation (4 bits, clock period 20 ns)],
)
The testbench checks the load and shift left operations of the shift register. At 10 ns, d_tb is set to 0010 and load_tb goes high, so at the rising edge at 20 ns the register loads 0010. From 30 to 40 ns, shiftl_tb and shiftextension_tb are high, so at the 40 ns edge the register shifts left and the extension bit enters bit 0: 0010 becomes 0101. Between these operations no control signal is high, so the output holds its value. The results match the expected values.

== Control Logic
The controller is not simulated on its own; it is verified through the top-level simulation in @fig-top-sim. Tracing the VHDL equations: while GReset is high, only S0 is set on the next clock edge, which asserts Load_LMASK, Load_RMASK and Load_Display. After GReset is released, each switch combination sets exactly one of S1 (LEFT and RIGHT), S2 (LEFT only), S3 (RIGHT only) or S4 (neither) on the next edge, which matches the detailed ASM chart.

== Full Display Controller
#figure(
  image("../waveforms/topLevel waveform.png", width: 100%),
  caption: [Top-level simulation]
  ,
) <fig-top-sim>
The testbench `lab1_topLevel_TB` drives GClock directly (no clock divider) with a 20 ns period, so the rising edges are at multiples of 20 ns. GReset is high from 10 to 50 ns. LEFT alone is then on from 70 to 170 ns, RIGHT alone from 190 to 290 ns, and both from 310 to 410 ns, with both switches off in between. @tab-top-sim lists DisplayOut (in hex) at each rising edge.

#figure(
  table(
    columns: 3,
    align: (left, left, left),
    [*Phase*], [*Edges (ns)*], [*DisplayOut*],
    [Reset], [20 to 60], [00, 00, 00],
    [LEFT only], [80 to 160], [01, 01, 02, 04, 08],
    [Both off], [180], [00],
    [RIGHT only], [200 to 280], [80, 80, 40, 20, 10],
    [Both off], [300], [00],
    [Both on], [320 to 400], [24, 24, 42, 81, 81],
  ),
  caption: [DisplayOut in the top-level simulation],
) <tab-top-sim>

DisplayOut stays at 00 during reset, and LMASK and RMASK load their initial values on the 60 ns edge. With LEFT on, the light moves from right to left (01, 02, 04, 08). With RIGHT on, it moves from left to right (80, 40, 20, 10). With both switches off, the display is blank. With both on, DisplayOut is LMASK OR RMASK and both lights move at the same time. At 410 ns, sim_end stops the clock, which ends the test. After that, the stimulus process starts over because it does not end with a `wait;` statement, so GReset is raised again and clears the display.

The waveform also shows the effect of a one-clock delay. The mux select comes directly from the switches, but the shift signals come from the state register, which only follows the switches one edge later:
- *Start of a phase:* on the first edge after a switch turns on, the state is still S4, so DISPLAY loads the mask without shifting it. The first value of each phase (01, 80, 24) is therefore shown for two cycles.
- *End of a phase:* on the first edge after a switch turns off, the state is still S2 or S3, so the mask shifts once more while DISPLAY loads 00. LMASK ends at 00100000 instead of 00010000, and RMASK at 00000100 instead of 00001000. When both switches turn on, each light therefore resumes one position past where it was last shown: 24 = 00100000 OR 00000100.

Because the lights had already passed each other by then, they move apart in the last phase (24, 42, 81) instead of toward each other. At 81 the lights are at the two ends. On the next shift, the masks rotate (LMASK 10000000 becomes 00000001 and RMASK 00000001 becomes 10000000), so 81 is shown again. Apart from these one-clock effects, which would not be noticeable at 1 Hz, the simulation matches the expected behaviour.

= Hardware Test
As agreed with the TA, the design is evaluated on the top-level simulation (@fig-top-sim) only, so it was not synthesized or demonstrated on the board.

= Design Obstacles
- *No reset on the state flip-flops:* the course-provided `dFF_2` has no reset input, so GReset was made synchronous by feeding it into S0_in and blocking S1_in to S4_in while it is high.
- *Load and shift in the same state:* the chart loads the masks in S0 while S1 to S3 shift them. Giving load priority over shift in `shiftRegister` let the shift signals stay simple without conflicting with the load in S0.
- *Reset of the datapath:* loading DISPLAY in S0 does not clear it unless both switches are off, since the mux select comes from the switches. This was solved by connecting GReset to the asynchronous reset of all three registers.

= Conclusion
The light display controller was designed with the five steps of the ASM method: pseudocode, ASM chart, datapath, detailed ASM chart and one-FF-per-state control logic. The control path, the shift register, the datapath and the top-level entity were implemented in structural VHDL. The shift register simulation matched the expected load and shift left results, and the top-level simulation shows the lights moving left, right, and both at once according to the switches, with the masks kept while both switches are off. The only difference from the ideal behaviour is a one-clock delay between the switches and the state register, which makes the first value of each phase last two cycles and makes the lights resume one position later.

#pagebreak()
#set heading(numbering: "A.1")
#counter(heading).update(0)
= Appendix: VHDL Source Code
== lab1_topLevel.vhdl
#raw(read("../vhdl/lab1_topLevel.vhdl"), lang: "vhdl", block: true)

== lab1_control.vhdl
#raw(read("../vhdl/lab1_control.vhdl"), lang: "vhdl", block: true)

== dFF_2.vhdl
#raw(read("../vhdl/dFF_2.vhdl"), lang: "vhdl", block: true)

== dFlipFlop.vhdl
#raw(read("../vhdl/dFlipFlop.vhdl"), lang: "vhdl", block: true)

== mux4_1bit.vhdl
#raw(read("../vhdl/mux4_1bit.vhdl"), lang: "vhdl", block: true)

== mux4_nBit.vhdl
#raw(read("../vhdl/mux4_nBit.vhdl"), lang: "vhdl", block: true)

== shiftReg-nbit.vhdl
#raw(read("../vhdl/shiftReg-nbit.vhdl"), lang: "vhdl", block: true)
