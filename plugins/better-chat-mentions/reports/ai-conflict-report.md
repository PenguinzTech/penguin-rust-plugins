# AI Conflict Report — better-chat-mentions
Generated: 2026-04-15

## Conflicts
- HIGH: `OnBetterChat` — both BetterChatMentions and BetterChatFilter modify the `Message` field. Load order dependent.
- MEDIUM: `OnBetterChat` — BetterChatToggle removes titles before/after BetterChatMentions formats mentions, causing visual inconsistency.

## Severity Summary
HIGH severity — Message field corruption with BetterChatFilter; visual inconsistency with BetterChatToggle.
