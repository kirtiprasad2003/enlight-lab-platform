# Demo 5 — PR-Gated Compliance Bot

**Story:** PR violates control → bot comments + blocks merge → fix → re-check passes → evidence artifact.

## Build checklist

- [ ] OPA/Conftest in PR checks (GitHub Actions)
- [ ] Secrets scanner (block hardcoded secrets)
- [ ] Claude PR comment with control ID + remediation
- [ ] Evidence artifact JSON mapping checks to controls
- [ ] `scripts/run-demo.ps1`

## Example violations to script

- Public S3 bucket in Terraform
- Missing encryption
- Hardcoded API key in code
