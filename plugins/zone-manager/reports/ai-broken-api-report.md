# AI Broken API Report — zone-manager
Generated: 2026-04-15

## COMPILE-FAIL

- **`ConVar.Chat.ChatChannel`** (lines 376, 391): Namespace removed. Use `Chat.ChatChannel`.
- **`BuildingPrivlidge`** (line 275): Type was renamed to `BuildingPrivilege` (typo fix in Rust). Plugin will fail to compile.

## Severity: CRITICAL — will not load
