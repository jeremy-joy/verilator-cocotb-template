import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.clock import Clock

@cocotb.test()
async def smoke_test(dut):
    # If your DUT has a clock input, start it (rename clk_i if needed)
    if hasattr(dut, "clk_i"):
        cocotb.start_soon(Clock(dut.clk_i, 10, unit="ns").start())

    # If your DUT has reset, toggle it (rename reset_n_i if needed)
    if hasattr(dut, "reset_n_i"):
        dut.reset_n_i.value = 0
        await Timer(50, unit="ns")
        dut.reset_n_i.value = 1
        await Timer(20, unit="ns")

    # Drive inputs (rename data_i/data_o to match Buffer.v)
    dut.data_i.value = 0xA
    await RisingEdge(dut.clk_i) if hasattr(dut, "clk_i") else Timer(10, "ns")

    # Simple check (edit expectation to match your module)
    assert int(dut.data_o.value) == int(dut.data_i.value)
