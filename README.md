# Verilator Cocotb Template:
## Initial Setup after downloading template:
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

## Run: Cleanup and run simulation
make run
## Open GTKWave
make wave 