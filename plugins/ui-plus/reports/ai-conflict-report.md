# AI Conflict Report — ui-plus
Generated: 2026-04-15

## Conflicts
- MEDIUM: `OnUserConnected` — shares with Clans. Sequential execution, no return conflict, but initialization order of UI vs clan data may affect display on first connect.

## Severity Summary
MEDIUM severity — initialization order dependency with Clans on player connect.
