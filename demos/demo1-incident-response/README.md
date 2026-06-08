# Demo 1 — AI Incident Response

**Story:** Scripted failure → Robusta alerts → AI explains → SLO breach → ArgoCD rollback → postmortem draft.

## Build checklist

- [ ] `scripts/inject-failure.ps1` — bad image or OOM
- [ ] Robusta install on cluster
- [ ] HolmesGPT + k8sgpt MCP connected to Claude
- [ ] Prometheus SLO alert triggers rollback
- [ ] `scripts/run-demo.ps1` — full reproducible run
- [ ] Postmortem prompt template in `templates/postmortem.md`

## Done when

- [ ] RCA in Claude under 60 seconds
- [ ] Rollback completes live
- [ ] AI explanation and rollback are two separate visible steps
