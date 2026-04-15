# AI Broken API Report — player-administration
Generated: 2026-04-15

## RUNTIME-FAIL

- **`BasePlayer.FindByID()`** (lines 699, 1496, 3044+, 10+ instances): Method removed. Use `BasePlayer.FindByIdOrderedByIndex()` or `RelationshipManager.FindByID()`. Most heavily affected plugin in this batch.

## Severity: HIGH — widespread runtime failures across core admin functions
