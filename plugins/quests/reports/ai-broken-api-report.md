# AI Broken API Report — quests
Generated: 2026-04-15

## RUNTIME-FAIL

- **`BasePlayer.FindByID()`** (lines 347, 1125, 1307, 1316): Method removed. Use `BasePlayer.FindByIdOrderedByIndex()` or `RelationshipManager.FindByID()`.

## Severity: HIGH — quest assignment and player lookup will fail at runtime
