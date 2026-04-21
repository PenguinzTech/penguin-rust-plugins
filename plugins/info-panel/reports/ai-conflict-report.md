# AI Conflict Report — info-panel
Generated: 2026-04-21

## Conflicts
None detected.

## Integrations
- **Economics** — optional; displays player balance via `Economics.Call("Balance", steamId)` if configured
- **ServerRewards** — optional; displays RP points via `ServerRewards.Call("CheckPoints", userId)` if configured
- No `[PluginReference]` attributes used; all integrations are soft-called by panel type name

## Severity Summary
No conflicts. Economics and ServerRewards panel types are additive and only active when those plugins are loaded.
