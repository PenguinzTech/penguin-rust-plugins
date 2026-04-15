# AI Broken API Report — vehicle-license
Generated: 2026-04-15

## RUNTIME-FAIL

- **`BasePlayer.FindByID()`** (line 5044): Method removed. Use `BasePlayer.FindByIdOrderedByIndex()` or `RelationshipManager.FindByID()`.

## Severity: MEDIUM — affects specific vehicle ownership lookup paths
