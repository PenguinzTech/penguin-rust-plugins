# AI Conflict Report — admin-deep-cover
Generated: 2026-04-15

## Conflicts
- HIGH: Returns `true` from `OnBetterChat`, terminating the hook chain. All BetterChat extension plugins (filter, mute, flood, ignore, mentions, toggle) are silently bypassed when AdminDeepCover is active.
- HIGH: Admins using AdminDeepCover can chat during global mute (BetterChatMute never fires).

## Severity Summary
HIGH severity — BetterChat hook chain termination impacts all downstream chat extensions.
