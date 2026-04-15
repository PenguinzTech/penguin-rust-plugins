# AI Conflict Report — anti-offline-raid
Generated: 2026-04-15

## Conflicts
- HIGH: `OnEntityTakeDamage` — returns non-null to block offline raid damage. Conflicts with ZoneManager and TruePVE which also return non-null. First-loaded plugin wins; others are silently skipped.

## Severity Summary
HIGH severity — damage blocking conflicts with multiple PVP control plugins; first-loaded winner is unpredictable.
