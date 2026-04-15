# AI Conflict Report — better-chat-filter
Generated: 2026-04-15

## Conflicts
- HIGH: `OnBetterChat` — both BetterChatFilter and BetterChatMentions modify the `Message` field. Load order determines which transformation wins; the other is silently overridden.
- MEDIUM: `OnBetterChat` — BetterChatFlood returns `true` (block) before BetterChatFilter runs if load order puts Flood first; filter is skipped on flooded messages.
- LOW: Hidden dependency on BetterChatMute — calls `API_IsMuted()` without declaring it in plugin header. If BetterChatMute is unloaded, BetterChatFilter will throw a NullReferenceException.

## Severity Summary
HIGH severity — Message field corruption with BetterChatMentions; undeclared dependency on BetterChatMute.
