# AI Conflict Report — clan-tags
Generated: 2026-04-15

## Conflicts
- CRITICAL: `OnPluginLoaded` — ClanTags explicitly detects Clans plugin and self-unloads. Both attempt to register clan tag formatters in BetterChat via `API_RegisterThirdPartyTitle`. Only one can be active at a time. ClanTags is the loser.

## Severity Summary
CRITICAL severity — ClanTags self-unloads when Clans is detected; mutually exclusive plugins.
