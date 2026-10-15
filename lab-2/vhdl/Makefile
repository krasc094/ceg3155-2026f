# === VHDL
GHDL = ghdl
R_FLAGS = --vcd=$(WAVE_F).vcd --wave=$(WAVE_F).ghw --stop-time=1us

# === vhdl components
DEPS = ./*.vhdl
TOP_LEVEL = lab2_topLevel

WAVE_F = wave

# === WAVEFORM
GTKWAVE = gtkwave
GTKWAVE_FLAGS = --nomenus

default: simulate	
	$(GHDL) -e --ieee=synopsys -fexplicit $(TOP_LEVEL) # elaborate
	$(GHDL) -r --ieee=synopsys -fexplicit $(TOP_LEVEL) $(R_FLAGS) # run

simulate:
	$(GHDL) -a -fsynopsys $(DEPS)

waveform: default
	@$(GTKWAVE) $(GTKWAVE_FLAGS) -f $(WAVE_F).vcd

clean:
	-rm -f $(WAVE_F).ghw $(WAVE_F).vcd
	-rm -f work-obj93.cf
	-rm -f design.json
	-rm -f design.frames
	-rm -f design.fasm
	-rm -f design_routed.fasm

bitstream: simulate
	ghdl -a -fsynopsys --std=08 ./*.vhdl
	ghdl --synth --std=08 --out=verilog $(TOP_LEVEL) > top_synth.v
	yosys -p "read_verilog top_synth.v; synth_xilinx -flatten -arch xc7 -top $(TOP_LEVEL); write_json design.json"
	nextpnr-xilinx \
		--json design.json \
		--xdc lab2.xdc \
		--chipdb "$$CHIPDB/xc7a100tcsg324.bin" \
		--fasm design.fasm
	fasm2frames --part xc7a100tcsg324-1 \
		--db-root "$$PRJXRAY_DB_DIR/artix7" \
		design.fasm > design.frames
	xc7frames2bit --part-file "$$PRJXRAY_DB_DIR/artix7/xc7a100tcsg324-1/part.yaml" \
		--part-name xc7a100tcsg324-1 \
		-frm-file design.frames \
		--output-file design.bit
