# AI Performance Report — info-panel
Generated: 2026-04-21

## Issues

### HIGH — Timers not destroyed in Unload (lines 1211, 1274, 1363, 1364, 1790, 1833, 1877, 1934)
Nine `Timer` fields (`TimeUpdater`, `MsgUpdater`, `HeliAttack`, `RadiationUpdater`, `BalanceUpdater`,
`PointsUpdater`, `CoordUpdater`, `CompassUpdater`, `TestTimer`) are started in `GUITimerInit` but
`Unload()` (line 1041) never calls `.Destroy()` on any of them. After a plugin reload the timers
continue firing against a partially-torn-down object graph, causing NullReferenceExceptions and
ghost UI refreshes until server restart.

### LOW — LINQ in panel layout calculations (lines 731, 757, 767, 771, 2493, 2552–2575, 2604, 2620, 2661, 2681)
`.Where()` / `.ToList()` / `.Select()` / `.OrderBy()` are used in panel ordering and child-panel
queries. These run on panel rebuild (connect/disconnect/event), not per-frame, so impact is
bounded but worth noting for large player counts.

### LOW — `FindObjectsOfType<>` on event triggers (lines 887, 898, 909, 920, 931)
Called once per event spawn to seed active-entity lists. Not per-frame, but `FindObjectsOfType`
is a full scene scan. No immediate action required; cache via `OnEntitySpawned` hook instead if
this causes hitches on busy servers.

## Summary
HIGH severity timer leak in `Unload` — should be patched before production use.
