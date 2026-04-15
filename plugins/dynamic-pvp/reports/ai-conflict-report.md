# AI Conflict Report — dynamic-pvp
Generated: 2026-04-15

## Conflicts
- MEDIUM: Zone creation via ZoneManager API may race with ZoneManagerAutoZones zone lifecycle management. Zone state can become inconsistent on plugin reload.
- MEDIUM: TruePVE rule mappings may become stale if DynamicPVP creates/destroys zones faster than TruePVE syncs.

## Severity Summary
MEDIUM severity — zone lifecycle race conditions with ZoneManagerAutoZones and TruePVE synchronization drift.
