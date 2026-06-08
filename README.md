# Enlight Lab Platform

**Five DevOps demos. One foundation. $0 cloud cost for local demos.**

Unified platform connecting your earlier PoCs (`platform-poc` + `cloud-cost-k8s-poc`) into the Enlight Lab brief: GitOps, policy gates, observability, and AI-ready architecture.

---

## 100% local (no AWS)

Use **kind** instead of EKS, **Floci** instead of AWS APIs (Demo 4). Zero cloud cost.

See [docs/local-only-guide.md](docs/local-only-guide.md).

## Before 12PM demo

```powershell
cd D:\enlight-lab-platform
.\scripts\go-live.ps1          # get everything ready
.\scripts\test-all.ps1         # verify all PASS
.\scripts\run-12pm-demo.ps1    # rehearse demo
```

See **TONIGHT-CHECKLIST.md** and **docs\MCP-CONNECT-GUIDE.md** (you connect MCPs).

## Quick start (one command)

```powershell
cd D:\enlight-lab-platform
.\scripts\start-platform.ps1
```

Then run the manager demo:

```powershell
.\scripts\run-manager-demo.ps1
```

| URL | Purpose |
|-----|---------|
| http://localhost:30800/health | Live FastAPI app |
| http://localhost:3000 | Grafana (admin / enlight-admin) |
| http://localhost:8080 | ArgoCD GitOps UI |

Full guide: [docs/GETTING-STARTED.md](docs/GETTING-STARTED.md)

---

## What works today

| Feature | Status |
|---------|--------|
| Local Kubernetes (kind) | One-command start |
| FastAPI workload deployed | Live `/health` |
| OPA policy gate (CI layer) | Block + pass demo |
| Kyverno cluster policies | Live admission block |
| ArgoCD + self-heal | Installed |
| Prometheus + Grafana | Installed |
| EKS Terraform (production) | Ready to apply |
| GitHub Actions pipeline | Defined |
| Floci AWS emulator (Demo 4) | `floci/docker-compose.yml` |
| Demo 1, 3, 5 bodies | Roadmap only |

---

## Architecture

```text
Claude (future) --> GitHub Actions --> OPA policy gate
                           |                |
                           v           BLOCK / PASS
                      Docker build          |
                           v                v
                      kind / EKS  <--- ArgoCD GitOps
                           |
                    Kyverno admission
                           |
                    FastAPI + Grafana
```

**Golden rule:** AI explains. Git/ArgoCD fixes. Always two separate steps.

Simple explanation: [docs/00-layman-flow.md](docs/00-layman-flow.md)

---

## Project layout

```text
enlight-lab-platform/
├── scripts/
│   ├── start-platform.ps1       # ONE COMMAND START
│   ├── run-manager-demo.ps1     # Manager walkthrough
│   └── start-after-reboot.ps1
├── foundation/
│   ├── cluster/                 # kind config
│   ├── terraform/eks/           # Real EKS (demo day)
│   ├── policies/opa/            # CI policy
│   ├── policies/kyverno/        # Cluster policy
│   └── scripts/                 # Cluster lifecycle
├── workload/fastapi/            # Shared app
├── demos/demo2-chat-to-deploy/  # First demo (working)
├── gitops/argocd/
├── floci/                       # Demo 4 AWS emulator (NOT for K8s)
└── docs/
    ├── executive-summary.md     # For leadership
    └── manager-demo-script.md   # For your meeting
```

---

## Build order

1. **Foundation** — done (local)
2. **Demo 2** — Chat-to-Deploy (policy + deploy working)
3. **Demo 1** — AI incident + rollback
4. **Demo 4** — Drift + cost (Floci)
5. **Demo 5** — PR compliance bot
6. **Demo 3** — Backstage (last)

Roadmap: [docs/01-roadmap.md](docs/01-roadmap.md)

---

## For your manager

- Executive summary: [docs/executive-summary.md](docs/executive-summary.md)
- Demo script: [docs/manager-demo-script.md](docs/manager-demo-script.md)

**Pitch:** "Phase 1 PoCs proved pieces. Enlight Lab is Phase 2 — integrated, live, zero cloud cost today, EKS-ready tomorrow."

---

## Floci vs EKS vs kind

| Tool | Use for |
|------|---------|
| **kind** (this project) | Kubernetes — $0 local demos |
| **EKS Terraform** | Production demo day (pre-warm, destroy after) |
| **Floci** | AWS APIs (S3 drift) for Demo 4 — **not** Kubernetes |

---

## Teardown

```powershell
.\scripts\stop-platform.ps1
.\foundation\scripts\99-destroy.ps1
```
