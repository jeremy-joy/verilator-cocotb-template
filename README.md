# Verilator Cocotb Template:
## Initial Setup after downloading template:
Run the following commands. Note that at the time, Python3.13 is the maximum version cocotb supports.

python3.13 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

## Run: Cleanup and run simulation
make run
## Open GTKWave
make wave 