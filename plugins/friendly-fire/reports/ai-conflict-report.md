# AI Conflict Report — friendly-fire
Generated: 2026-04-15

## Conflicts
- LOW: `OnPlayerAttack` fires before `OnEntityTakeDamage`. FriendlyFire can pre-block damage but if it returns null, OnEntityTakeDamage blockers (TruePVE, ZoneManager, AntiOfflineRaid) still fire. Cumulative logic is predictable but may confuse server operators.

## Severity Summary
LOW severity — hook ordering interaction with damage blockers is predictable but may be confusing.
