# AI Broken API Report — better-chat
Generated: 2026-04-15

## RUNTIME-FAIL

- **`player.net.connection`** (line 228): `BasePlayer.net` removed. Use `player.Connection`.
- **`BasePlayer.FindByID()`** (line 227): Method removed. Use `BasePlayer.FindByIdOrderedByIndex()` or `RelationshipManager.FindByID()`.

## Severity: HIGH — runtime failures in player lookup paths
