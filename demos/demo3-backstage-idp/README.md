# Demo 3 — Backstage IDP + Claude Agent (build LAST)

**Story:** Portal scaffolds service → PR with infra + CI → merge → ArgoCD deploys with observability pre-wired.

## Build checklist

- [ ] Backstage catalog + golden-path template
- [ ] Scaffolder action IDs in camelCase (no dashes)
- [ ] `publish:github` action for new repo
- [ ] Default bundle: ServiceMonitor, Grafana dashboard, alerts, secrets, policy
- [ ] Agent runbook action (scale/rotate) via PR
- [ ] Agent incident investigation via PR

## Done when

- [ ] New service live from one agent-initiated PR
- [ ] Every state change is a reviewable PR
- [ ] Runbook + investigation shown live
