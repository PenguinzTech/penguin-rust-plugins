# AI Conflict Report — better-chat
Generated: 2026-04-15

## Conflicts
- HIGH: Chain terminated by AdminDeepCover returning `true` from `OnBetterChat` before BetterChat processes downstream.

## Severity Summary
HIGH severity — upstream plugin can silently block all BetterChat processing.
