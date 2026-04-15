# AI Broken API Report — nteleportation
Generated: 2026-04-15

## COMPILE-FAIL

- **`BuildingPrivlidge`** (line 222): Type renamed to `BuildingPrivilege`. Compile error.

## RUNTIME-FAIL

- **`player.net.connection.authLevel`** (lines 8170, 8174): `BasePlayer.net` property removed. Use `player.Connection.authLevel`. Will throw `NullReferenceException` or `MissingMemberException` at runtime.

## Severity: CRITICAL — compile error + runtime failure
