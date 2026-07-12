# PearlVolt Miner

🌐 https://pearlvolt.run
💬 Discord: https://discord.gg/ZRSBaSMtg

High-performance GPU miner for the Pearl (PRL) PoW network.

## Features

- CUTLASS-accelerated GEMM kernel for datacenter GPUs (H100/H200)
- Optimized kernel for consumer GPUs (RTX 5090, 4090, 3090)
- Live telemetry API on `http://localhost:4141`
- Single binary — all supported GPUs, no compilation needed
- Static CUDA runtime — no CUDA toolkit required on host

## Supported GPUs

| GPU | Hashrate | Power |
|-----|----------|-------|
| H200 | 762 TH/s | 700 W |
| H100 | 736 TH/s | 700 W |
| RTX 5090 | 390 TH/s | 600 W |
| RTX 4090 | 255 TH/s | 450 W |
| RTX 3090 | 120 TH/s | 350 W |
| B200 | Coming soon | — |

## Quick Start

```bash
# Download
wget https://github.com/pearlvolt/pearlvolt-miner/releases/latest/download/pearlvolt
chmod +x pearlvolt

# Mine
./pearlvolt --pool stratum+tcp://pool.pearlvolt.run:4141 --wallet YOUR_WALLET

# Specific GPUs
./pearlvolt --pool stratum+tcp://pool.pearlvolt.run:4141 --wallet YOUR_WALLET --gpus 0,1,2

# Live telemetry
curl http://localhost:4141
```

## Usage

```
pearlvolt v1.0.0 — Pearl (PRL) PoW GPU miner

USAGE:
  pearlvolt [OPTIONS]

OPTIONS:
  --pool POOL          Pool URL or name (default: herominers)
  --gpus GPU_LIST      Comma-separated GPU IDs (default: all)
  --wallet WALLET      PRL wallet address for payout
  --worker NAME        Worker name (default: pearlvolt)
  --version            Print version
  --help               Show help
```

## Telemetry

JSON endpoint at `http://localhost:4141`:

```json
{
  "version": "1.0.0",
  "total_hashrate": 762,
  "total_shares_accepted": 159,
  "total_shares_submitted": 159,
  "gpus": [
    {
      "id": 0,
      "name": "NVIDIA H200",
      "hashrate_ths": 762,
      "temp_c": 47,
      "power_w": 692,
      "fan_pct": 0,
      "shares_accepted": 159,
      "shares_submitted": 159,
      "attempts": 295054
    }
  ]
}
```

## Pools

| Pool | URL |
|------|-----|
| PearlVolt | `stratum+tcp://pool.pearlvolt.run:4141` |
| PearlVolt TLS | `stratum+tcp://pool.pearlvolt.run:4142` |
| PearlVolt Solo | `stratum+tcp://pool.pearlvolt.run:4143` |

## Requirements

- NVIDIA GPU (compute capability 8.0+)
- NVIDIA driver 535+ (driver 595+ for RTX 5090)
- Linux x86-64
- No CUDA toolkit needed — static runtime built in

## License

Proprietary. See LICENSE for details.
