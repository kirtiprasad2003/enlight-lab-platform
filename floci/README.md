# Floci — Local AWS Emulator (Demo 4)

Use for **Demo 4: Drift & Cost Sentinel** — S3/Lambda/SQS drift demos.

**Do NOT use for EKS.** Kubernetes runs on `kind` (free) or real EKS.

## Start

```powershell
cd D:\enlight-lab-platform\floci
docker compose up -d
```

## Configure AWS CLI (PowerShell)

```powershell
$env:AWS_ENDPOINT_URL="http://localhost:4566"
$env:AWS_DEFAULT_REGION="us-east-1"
$env:AWS_ACCESS_KEY_ID="test"
$env:AWS_SECRET_ACCESS_KEY="test"

aws s3 mb s3://enlight-demo --endpoint-url http://localhost:4566
aws s3 ls --endpoint-url http://localhost:4566
```
