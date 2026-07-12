# Cloud Deploy

One-click deploy templates for PearlVolt miner on cloud GPU providers.

## Vast.ai

### Quick deploy

1. Go to [vast.ai](https://vast.ai) → Templates
2. Create new template using [`vast-template.json`](./vast-template.json)
3. Set your wallet in the environment variables:
   - `WALLET` = your PRL wallet address
   - `POOL` = `stratum+tcp://pool.pearlvolt.run:4141`
   - `GPUS` = `all` or specific GPU IDs
4. Launch on H100 or H200 instance

### Manual deploy

```bash
# On any Vast.ai H100/H200 instance:
bash <(curl -s https://raw.githubusercontent.com/pearlvolt/pearlvolt-miner/main/deploy/vast-ai.sh)
```

Or with custom wallet:
```bash
curl -s https://raw.githubusercontent.com/pearlvolt/pearlvolt-miner/main/deploy/vast-ai.sh | \
  WALLET=prl1YOURWALLET bash
```

## RunPod

### Quick deploy

1. Go to [runpod.io](https://runpod.io) → Templates
2. Create template using [`runpod-template.json`](./runpod-template.json)
3. Set environment variables:
   - `WALLET` = your PRL wallet address
   - `POOL` = `stratum+tcp://pool.pearlvolt.run:4141`
4. Deploy on H100 80GB pod

### Manual deploy

```bash
# On any RunPod H100/H200 pod:
bash <(curl -s https://raw.githubusercontent.com/pearlvolt/pearlvolt-miner/main/deploy/runpod.sh)
```

Or with custom wallet:
```bash
curl -s https://raw.githubusercontent.com/pearlvolt/pearlvolt-miner/main/deploy/runpod.sh | \
  WALLET=prl1YOURWALLET bash
```

## Recommended Instances

| Provider | GPU | Type | Cost/hr | Hashrate |
|----------|-----|------|---------|----------|
| Vast.ai | H100 | 80GB | ~$2-4 | 736 TH/s |
| Vast.ai | H200 | 141GB | ~$3-5 | 762 TH/s |
| RunPod | H100 | 80GB | ~$2-4 | 736 TH/s |

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `WALLET` | — | Your PRL wallet address |
| `POOL` | `stratum+tcp://pool.pearlvolt.run:4141` | Stratum pool URL |
| `GPUS` | `all` | Comma-separated GPU IDs |

## Requirements

- NVIDIA H100 or H200 (80GB+)
- CUDA 12.x compatible image
- No CUDA toolkit needed — static runtime built into binary

🌐 https://pearlvolt.run
