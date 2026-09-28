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
  #image("uottawa-logo.png", width: 2.3in)
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
    #hole("TA name") \
    #hole("TA name") \
    #hole("TA name")
  ]

  #v(1fr)
  #text(weight: "bold")[Group:]#hole("#") \
  #text(weight: "bold")[Student Name and number:] Marcel Traore \300379484 \
  #text(weight: "bold")[Student Name and number:] #hole("Name") \##hole("Student ID") \
  #text(weight: "bold")[Experiment Date:] #hole("Date") \
  #text(weight: "bold")[Submission Date:] #hole("Date")
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
The objective of this lab is to design a light display controller using the ASM method and implement it in structural VHDL on the Nexys A7-100T (Artix-7) board.

= Problem Description
The goal is a controller for a row of eight LEDs driven by two switches. When only LEFT is on, a single light moves from right to left. When only RIGHT is on, a single light moves from left to right. When both are on, both lights move at the same time and cross each other. When both are off, the display is blank, but the position of each light is kept, so turning a switch back on resumes the motion from where it stopped. GReset brings the whole circuit back to its initial state. The lights move one position per second so the motion is visible.

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

== Detailed ASM Chart
#figure(image("figures/detailed-asm.png", width: 85%), caption: [Detailed ASM chart]) <fig-dasm>
Each RTN statement of @fig-asm is replaced by the control signals that perform it on the datapath of @fig-dp, and each decision box tests the LEFT and RIGHT status signals. S0 asserts Load_Display, Load_LMASK and Load_RMASK. S1 asserts shift_LMASK, shift_RMASK and Load_Display. S2 asserts shift_LMASK and Load_Display, S3 asserts shift_RMASK and Load_Display, and S4 only asserts Load_Display (the mux already selects 00000000). Unlisted signals are 0.

== Control Logic (One-FF-Per-State)
#figure(image("figures/control-logic.png", width: 90%), caption: [Control logic (one-FF-per-state)]) <fig-ctrl>
One D flip-flop is used per state (S0 to S4), all clocked by CLK, so exactly one state is active at a time. Each control signal is the OR of the states that assert it in @fig-dasm:
- Load_Display = S0 AND S1 AND S2 AND S3 AND S4
- Load_LMASK = S0 AND S1 AND S2, #h(1em) shift_LMASK = S1 AND S2
- Load_RMASK = S0 AND S1 AND S3, #h(1em) shift_RMASK = S1 AND S3

Every state returns to the same decision boxes, so the next-state inputs only depend on the switches:
- S1_in = LEFT OR RIGHT
- S2_in = LEFT OR RIGHT'
- S3_in = LEFT' OR RIGHT
- S4_in = LEFT' OR RIGHT'

In the VHDL (`lab1_control`), the state flip-flops are dFF_2 and GReset is handled synchronously: S0_in = GReset, and each of S1_in to S4_in is also ANDed with GReset', so the controller is in S0 while GReset is high and leaves it on the first clock edge after GReset is released. The mask registers are implemented with the `shiftRegister` component, where load has priority over shift. For this reason the VHDL drives the load input with S0 only (LMASK ← 00000001, RMASK ← 10000000) and the shift inputs with S0 + S1 + S2 and S0 + S1 + S3; in S0 the load overrides the shift, which gives the same behaviour as the chart.

= Implementation
== Component Descriptions
To implement the pseudocode and upload it onto our board, we design the following components using VHDL.

- *dFF_2:* D flip-flop (course-provided) used as the one-hot state register in the control path. \
- *shiftRegister:* generic n-bit register built from 4-to-1 muxes and D flip-flops; supports hold, shift left, shift right and parallel load (load has priority). It is used for LMASK and RMASK. \
- *lab1_control:* one-hot controller with states S0 to S4 producing the load and shift control signals. \

The full code is in the Appendix.

== Pin Assignment
#figure(
  table(
    columns: 3,
    [*Logical port*], [*Board resource*], [*Pin*],
    [GClock], [CLK100MHZ], [E3],
    [Left], [SW1], [L16],
    [Right], [SW2], [M13],
    [GReset], [SW3], [R15],
    [DisplayOut[7..0]], [LED7..LED0], [U16, U17, V17, R18, N14, J13, K15, H17],
  ),
  caption: [Nexys A7-100T pin assignment],
)

= Simulation Results
== Shift Register
#figure(
  image("lab-1/waveforms/shiftRegister waveform.png", width: 100%),
  caption: [Shift register simulation (4 bits, clock period 20 ns)],
)
The testbench checks the three operations of the shift register. At 10 ns, d_tb is set to 0010 and load_tb goes high, so at the rising edge at 20 ns the register loads 0010. From 30 to 40 ns, shiftl_tb and shiftextension_tb are high, so at the 40 ns edge the register shifts left and the extension bit enters bit 0: 0010 becomes 0101. From 50 to 60 ns, shiftr_tb is high with the extension at 0, so at the 60 ns edge the register shifts right: 0101 becomes 0010. Between these operations no control signal is high, so the output holds its value. The results match the expected values, and the asserts in the testbench did not report any error.

== Control Logic
The control path was simulated by holding GReset high for one clock cycle and then applying LEFT and RIGHT, LEFT only, RIGHT only and neither, one cycle each. Since GReset is synchronous, S0 becomes active on the first rising edge with GReset high and asserts Load_LMASK, Load_RMASK and Load_Display (shift_LMASK and shift_RMASK are also high in S0, but load has priority in the shift register). After GReset is released, the controller moves to S1 (shift_LMASK, shift_RMASK, Load_Display), S2 (shift_LMASK, Load_Display), S3 (shift_RMASK, Load_Display) and S4 (Load_Display only) for each switch combination, with exactly one state flip-flop high at a time, which matches the detailed ASM chart.

== Full Display Controller
Traced from the ASM chart, the display shows 00000001, 00000010, 00000100 and so on with LEFT on, 10000000, 01000000 and so on with RIGHT on, and LMASK OR RMASK with both on, so the two lights move toward each other. With both switches off, the display is blank but LMASK and RMASK keep their values, so the motion resumes from where it stopped when a switch is turned back on.

= Hardware Test
Since we were not able to access the lab before the submission of the report, we didn't show the demonstration of our VHDL code.

= Conclusion
The light display controller was designed with the five steps of the ASM method: pseudocode, ASM chart, datapath, detailed ASM chart and one-FF-per-state control logic. The control path and the shift register were implemented in structural VHDL, and the shift register simulation matched the expected load, shift left and shift right results.

#pagebreak()
#set heading(numbering: "A.1")
#counter(heading).update(0)
= Appendix: VHDL Source Code
== dFF_2.vhd
#raw(read("lab-1/dFF_2.vhd"), lang: "vhdl", block: true)

== lab-1-control.vhdl
#raw(read("lab-1/lab-1-control.vhdl"), lang: "vhdl", block: true)

== shiftReg-nbit.vhdl
#raw(read("lab-1/shiftReg-nbit.vhdl"), lang: "vhdl", block: true)