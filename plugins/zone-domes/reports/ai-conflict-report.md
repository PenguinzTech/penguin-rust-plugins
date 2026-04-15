# AI Conflict Report — zone-domes
Generated: 2026-04-15

## Conflicts
- MEDIUM: Zone lifecycle shared with ZoneManagerAutoZones. Hook ordering on zone create/destroy events may cause ZoneDomes to miss auto-created zones or vice versa.

## Severity Summary
MEDIUM severity — zone lifecycle hook ordering dependency with ZoneManagerAutoZones.
