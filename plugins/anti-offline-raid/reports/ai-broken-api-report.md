# AI Broken API Report — anti-offline-raid
Generated: 2026-04-15

## RUNTIME-FAIL

- **`player.net.connection.authLevel`** (~line 360): `BasePlayer.net` removed. Use `player.Connection.authLevel`.
- **`BasePlayer.FindByID()`**: Method removed. Use `BasePlayer.FindByIdOrderedByIndex()` or `RelationshipManager.FindByID()`.

## Severity: HIGH — runtime failures on auth checks and player lookups
