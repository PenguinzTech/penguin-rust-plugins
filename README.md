# penguin-rust-plugins

[![CodeQL](https://github.com/PenguinzTech/penguin-rust-plugins/actions/workflows/codeql.yml/badge.svg)](https://github.com/PenguinzTech/penguin-rust-plugins/actions/workflows/codeql.yml)
[![Scan PR](https://github.com/PenguinzTech/penguin-rust-plugins/actions/workflows/scan-pr.yml/badge.svg)](https://github.com/PenguinzTech/penguin-rust-plugins/actions/workflows/scan-pr.yml)

A third-party security scanning and redistribution layer for Oxide framework plugins hosted on umod.org. We are not the upstream authors of any plugin—we are a scanning service similar to Bitnami or Chainguard, which harden upstream software and make the security artifacts publicly auditable.

## Purpose & Scope

This repository:
- Fetches Rust plugins from umod.org automatically
- Runs each plugin through security scanners: ClamAV, YARA, Semgrep, gitleaks, trivy
- Publishes scan reports alongside the source code in git for permanent audit trail
- Publishes clean plugins as versioned releases and OCI artifacts only when scans pass
- Provides SHA256 hash files and SBOMs so downstream consumers can verify integrity

We do **not**:
- Modify plugin source code
- Guarantee plugin functionality or compatibility
- Endorse plugins—we only report what scanners find
- Hold any copyright or licensing authority over plugins

## Trust Model

**What we do:** Run deterministic, open-source scanners on unmodified upstream source. Commit scan reports to git (immutable audit log). Publish only when scanners are clean.

**What you verify:** Scan reports are in this repo, Git history is tamper-proof (GitHub signed commits), hash chain is independently verifiable. You trust the scanners (ClamAV, YARA, etc.), not us.

**Attack surface:** If the repo is compromised, scan reports could be falsified. Use GitHub's security features (required PR reviews, branch protection, signed commits) to mitigate.

## What a Plugin Directory Contains

Each `plugins/{slug}/` contains:
- `{FileName}.cs` — unmodified plugin source from umod.org
- `{slug}.hash` — SHA256 of the plugin file
- `reports/` — full scan output (ClamAV, YARA, Semgrep, gitleaks, trivy)
- `sbom.cdx.json` — CycloneDX SBOM
- `provenance.json` — fetch metadata (author, upstream version, URL, fetch timestamp)
- `ATTRIBUTION.md` — upstream author credit and licensing notice

All artifacts are committed to git for public inspection.

## Scope

This repository covers only the **most commonly used** Rust/Oxide plugins. Each plugin gets a dedicated GitHub Actions workflow that runs the full scan suite on a daily schedule — CI credits are finite, so we deliberately keep the plugin set small and high-value rather than attempting full coverage of umod.org.

If a plugin is niche or has a small install base, it is unlikely to be accepted. Priority is given to plugins with broad server adoption.

## Adding a New Plugin

1. Open a GitHub issue with template `type:feature` + `component:infra`
2. Include plugin slug (as it appears in umod.org URL) and evidence of broad adoption (download count, community usage)
3. Maintainers evaluate CI budget impact before accepting
4. If accepted, maintainers run `./scripts/add-plugin.sh <slug> <FileName.cs>` to scaffold
5. File PR with new entry in `registry.txt` and workflow file generated
6. Scanners run; if clean, automated commit + release published
7. If quarantined, issue opened; see reports for details

## Reporting an Issue

- **Tampered plugin detected?** GitHub issue, label `plugin-tampered`
- **Bad scan (false positive)?** GitHub issue, label `plugin-scan-issue`, include evidence
- **Licensing question?** See `ATTRIBUTION.md` in plugin directory; contact upstream author via umod.org

## Attribution

Every plugin retains the license and copyright of its upstream author. See `plugins/{slug}/ATTRIBUTION.md` for upstream author credit and source URL. This repository adds only scanning, audit logs, and packaging metadata.

---

**Upstream source:** https://umod.org  
**Maintained by:** PenguinzTech
