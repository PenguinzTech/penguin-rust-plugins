# AI Conflict Report — zone-manager
Generated: 2026-04-15

## Conflicts
- HIGH: `OnEntityTakeDamage` — returns non-null (block damage) based on zone flags. Conflicts with TruePVE and AntiOfflineRaid which also return non-null. First-loaded wins.
- ❌ BROKEN: ConVar.Chat.ChatChannel + BuildingPrivlidge — will not compile.

## Severity Summary
CRITICAL severity — plugin broken (compilation failure); also has HIGH severity damage blocking conflicts.
