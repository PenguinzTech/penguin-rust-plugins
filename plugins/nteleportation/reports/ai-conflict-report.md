# AI Conflict Report — nteleportation
Generated: 2026-04-15

## Conflicts
- MEDIUM: `OnPlayerConnected` — shares event with UiPlus and Clans. Each performs player initialization (teleport data, UI setup, clan lookup). Initialization order dependency; no return value conflict.
- ❌ BROKEN: BuildingPrivlidge typo + .net.connection removed — will not compile/run.

## Severity Summary
CRITICAL severity — plugin broken (compilation failure); also has initialization order dependencies.
