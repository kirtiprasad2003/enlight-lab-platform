# ONE COMMAND before demo - get everything ready
#Requires -Version 5.1
$ErrorActionPreference = "Stop"
$Root = Split-Path -Parent $PSScriptRoot

Write-Host ""
Write-Host "========================================" -ForegroundColor Cyan
Write-Host "  ENLIGHT LAB - GO LIVE" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

. (Join-Path $PSScriptRoot "check-docker.ps1")
if (-not (Test-EnlightDocker)) { exit 1 }

$Ctx = "kind-enlight-lab"
$prev = $ErrorActionPreference
$ErrorActionPreference = "SilentlyContinue"
kubectl config use-context $Ctx 2>&1 | Out-Null
kubectl get nodes --request-timeout=15s 2>&1 | Out-Null
$clusterOk = ($LASTEXITCODE -eq 0)
$ErrorActionPreference = $prev

if (-not $clusterOk) {
    Write-Host "Cluster not healthy - running repair (10-15 min)..." -ForegroundColor Yellow
    & (Join-Path $PSScriptRoot "repair-cluster.ps1")
} else {
    Write-Host "Cluster OK - fast refresh (skips slow kind load if possible)..." -ForegroundColor Green
    & (Join-Path $Root "foundation\scripts\01-build-image.ps1") -Quick
    kubectl apply -k (Join-Path $Root "demos\demo2-chat-to-deploy\overlays\local") 2>&1 | Out-Null
    & (Join-Path $PSScriptRoot "stop-platform.ps1") 2>&1 | Out-Null
    & (Join-Path $PSScriptRoot "port-forward-all.ps1")
}

Start-Sleep -Seconds 3

Write-Host ""
Write-Host "Running quick validation..." -ForegroundColor Yellow
& (Join-Path $PSScriptRoot "test-all.ps1") -Quick

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "  GO LIVE COMPLETE" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "  App:    http://localhost:30800/health" -ForegroundColor Cyan
Write-Host "  ArgoCD: http://localhost:8080  (run port-forward-argocd.ps1 in 2nd window if needed)" -ForegroundColor Cyan
Write-Host ""
Write-Host "  Full demo:  .\scripts\run-12pm-demo.ps1" -ForegroundColor Yellow
Write-Host "  MCP guide:  docs\MCP-CONNECT-GUIDE.md" -ForegroundColor Yellow
Write-Host ""
