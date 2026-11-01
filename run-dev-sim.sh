#!/bin/bash
export PATH="$HOME/.local/share/fnm:$HOME/.bun/bin:$PATH"
eval "$(fnm env)"
cd ~/ios-dev-shell

while true; do
  echo "=== Starting Cloud iOS Dev Build Simulator at $(date) ===" | tee -a ~/sim.log
  npx native-sim up \
    --mode build \
    --dev \
    --framework expo \
    --minutes 350 \
    --no-open \
    --public 2>&1 | tee -a ~/sim.log
  echo "=== 6h session ended at $(date). Restarting in 10s... ===" | tee -a ~/sim.log
  sleep 10
done
