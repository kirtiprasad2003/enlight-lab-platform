# Demo 4 — Drift & Cost Sentinel

**Story:** Terraform matches AWS → manual console change → drift detected → cost delta → reconciliation PR.

## Build checklist

- [ ] driftctl or terraform plan-diff job
- [ ] Infracost cost estimate on drifted resource
- [ ] Claude explains change + cost in plain English
- [ ] Auto-open reconciliation PR
- [ ] `scripts/run-demo.ps1`

## Reuse from cloud-cost-k8s-poc

- OpenCost / Grafana dashboards
- Cost label policies
