# From cocotb website
# Makefile

# defaults
SIM ?= verilator
TOPLEVEL_LANG ?= verilog
EXTRA_ARGS += --trace --trace-structs

VERILOG_SOURCES += $(PWD)/rtl/Buffer.sv
# use VHDL_SOURCES for VHDL files

# COCOTB_TOPLEVEL is the name of the toplevel module in your Verilog or VHDL file
COCOTB_TOPLEVEL = Buffer

# COCOTB_TEST_MODULES is the basename of the Python test file(s)
# tries to import a package with same name as test file.
COCOTB_TEST_MODULES = Buffer_tb

# path to the test files, relative to the Makefile
PYTHONPATH := $(PWD)/tb:$(PYTHONPATH)
export PYTHONPATH

SIM_BUILD = $(PWD)/sim

# include cocotb's make rules to take care of the simulator setup
include $(shell cocotb-config --makefiles)/Makefile.sim

.PHONY: run pre_clean wave

run: pre_clean sim

pre_clean:
	rm -f $(PWD)/dump.vcd
	rm -f $(PWD)/*.log
	rm -f $(PWD)/dump.fst
	rm -f $(PWD)/results.xml
	rm -rf $(PWD)/tb/__pycache__
	rm -rf $(PWD)/sim

wave:
# 	@mkdir -p $(PWD)/waves
# 	@if [ -f dump.vcd ]; then mv dump.vcd $(PWD)/waves/dump.vcd; fi
	gtkwave $(PWD)/dump.fst