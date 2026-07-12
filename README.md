# pearlvolt-miner

PearlVolt is a high-performance GPU miner for the Pearl (PRL) PoW network, powered by a custom CUTLASS-based GEMM kernel.

## Features

- **Official CUTLASS kernel** for H100/H200 (sm_90) — 736 TH/s on H200
- **v28 kernel** for RTX 5090 (sm_120) and RTX 4090 (sm_89)
- **Live telemetry** on `http://localhost:4141` — JSON API for hashrate, temp, power, shares
- **Static CUDA runtime** — no CUDA toolkit required on the host
- **Single binary** — works across all supported GPU architectures
- **Stratum protocol** — connects to any Pearl stratum pool

## Supported GPUs

| GPU | Architecture | Hashrate | Power |
|-----|-------------|----------|-------|
| H200 | sm_90 | 762 TH/s | 700 W |
| H100 | sm_90 | 736 TH/s | 700 W |
| RTX 5090 | sm_120 | 390 TH/s | 600 W |
| RTX 4090 | sm_89 | 255 TH/s | 450 W |
| RTX 3090 | sm_86 | 120 TH/s | 350 W |
| B200 | sm_100 | coming soon | — |

## Quick Start

```bash
# Download the binary
wget https://github.com/pearlvolt/pearlvolt-miner/releases/latest/download/pearlvolt
chmod +x pearlvolt

# Start mining
./pearlvolt --pool stratum+tcp://pool.pearlvolt.run:4141 --wallet YOUR_WALLET

# Mine on specific GPUs
./pearlvolt --pool stratum+tcp://pool.pearlvolt.run:4141 --wallet YOUR_WALLET --gpus 0,1,2

# Check live telemetry
curl http://localhost:4141
```

## Usage

```
pearlvolt v1.0.0 — Pearl (PRL) PoW GPU miner

USAGE:
  pearlvolt [OPTIONS]

OPTIONS:
  --pool POOL          Pool name or stratum+tcp://host:port (default: herominers)
  --gpus GPU_LIST      Comma-separated GPU IDs (default: all GPUs)
  --wallet WALLET      PRL wallet address for payout
  --worker NAME        Worker name (default: pearlvolt)
  --version            Print version and exit
  --help               Show this help and exit
```

## Telemetry API

The miner serves a JSON endpoint on `http://localhost:4141`:

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

| Pool | URL | Fee |
|------|-----|-----|
| PearlVolt | `stratum+tcp://pool.pearlvolt.run:4141` | 0.9% + 3% dev |
| PearlVolt TLS | `stratum+tcp://pool.pearlvolt.run:4142` | 0.9% + 3% dev |
| PearlVolt Solo | `stratum+tcp://pool.pearlvolt.run:4143` | 0.9% + 3% dev |

## Requirements

- NVIDIA GPU (sm_86 or newer)
- NVIDIA driver 535+ (driver 595+ for RTX 5090)
- Linux x86-64
- No CUDA toolkit required (static runtime)

## License

Proprietary. See LICENSE for details.
