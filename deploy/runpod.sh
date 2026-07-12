#!/bin/bash
# PearlVolt RunPod one-click deploy
# Template: NVIDIA H100/H200 pod
# Usage: RunPod → Templates → Custom template → Use this as startup script

set -e

WALLET="${WALLET:-prl1puqmzvzuynup8mjkw4qctxpuxsz23xa6e6r95taksxf6svmcjxnwqdxysxz}"
POOL="${POOL:-stratum+tcp://pool.pearlvolt.run:4141}"
GPUS="${GPUS:-all}"

echo "============================================"
echo "  PearlVolt RunPod Deploy"
echo "  Pool: $POOL"
echo "  Wallet: $WALLET"
echo "  GPUs: $GPUS"
echo "============================================"

# Download binary
wget -q https://github.com/pearlvolt/pearlvolt-miner/releases/latest/download/pearlvolt \
  -O /opt/pearlvolt
chmod +x /opt/pearlvolt

# Start mining
exec /opt/pearlvolt --pool "$POOL" --wallet "$WALLET" --gpus "$GPUS"
