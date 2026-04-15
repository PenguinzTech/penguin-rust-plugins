# AI Conflict Report — better-chat-mute
Generated: 2026-04-15

## Conflicts
- HIGH: Bypassed by AdminDeepCover. Deep-covered admins can chat during global mute enforcement.
- ❌ BROKEN: Uses `ConVar.Chat.ChatChannel` (removed) — plugin will not compile.

## Severity Summary
CRITICAL severity — plugin broken (compilation failure); also bypassed by AdminDeepCover.
