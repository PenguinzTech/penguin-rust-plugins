# AI Broken API Report — tree-planter
Generated: 2026-04-15

## RUNTIME-FAIL

- **`CommunityEntity.ServerInstance`** (lines 662-663): Property removed from `CommunityEntity`. Will throw `MissingMemberException` at runtime when planting trees.

## Severity: HIGH — core functionality will fail at runtime
