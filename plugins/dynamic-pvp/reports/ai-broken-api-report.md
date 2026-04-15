# AI Broken API Report — dynamic-pvp
Generated: 2026-04-15

## RUNTIME-FAIL

- **`BasePlayer.FindByID()`** (line 3458): Method removed. Use `BasePlayer.FindByIdOrderedByIndex()` or `RelationshipManager.FindByID()`.

## Severity: HIGH — player lookup failures at runtime
