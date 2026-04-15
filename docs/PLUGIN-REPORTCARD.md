# Plugin Report Card

Generated: 2026-04-15

## Legend

| Symbol | Meaning |
|--------|---------|
| ✅ | Clean — no issues detected |
| ⚠️ | Warnings — minor or moderate issues requiring attention |
| ❌ | Broken — critical API failures, missing methods, or high-severity conflicts |
| N/A | Not analyzed — existing plugins predate this analysis session |

## Note on Columns

- **Broken API / Deprecated API / Performance**: analyzed for plugins added in the bulk-umod import; N/A for pre-existing plugins
- **Conflicts**: analyzed for all plugins
- **Overall**: worst of (Broken > Conflicts > Performance > Deprecated); N/A for pre-existing plugins
- Plugins with broken Oxide APIs have been removed and relocated to `penguin-rust-base` — see Relocated section below

---

## Plugin Report Card

| Plugin | Broken API | Deprecated API | Performance | Conflicts | Overall |
|--------|-----------|----------------|-------------|-----------|---------|
| admin-deep-cover | ✅ | ⚠️ | ⚠️ | ⚠️ | ⚠️ |
| automated-events | ✅ | ✅ | ⚠️ | ⚠️ | ⚠️ |
| better-chat-filter | ✅ | ✅ | ⚠️ | ❌ | ⚠️ |
| better-chat-flood | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| better-chat-global-mute | ✅ | ✅ | ✅ | ✅ | ✅ |
| better-chat-ignore | ✅ | ✅ | ✅ | ✅ | ✅ |
| better-chat-mentions | ✅ | ✅ | ✅ | ❌ | ⚠️ |
| better-chat-toggle | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| clan-tags | ✅ | ✅ | ✅ | ❌ | ❌ |
| clans | ✅ | ✅ | ✅ | ❌ | ⚠️ |
| economics | ✅ | ✅ | ✅ | ✅ | ✅ |
| emote | ✅ | ✅ | ✅ | ✅ | ✅ |
| friendly-fire | ✅ | ✅ | ✅ | ⚠️ | ✅ |
| gui-announcements | ✅ | ✅ | ⚠️ | ✅ | ⚠️ |
| landlord | ✅ | ✅ | ✅ | ✅ | ✅ |
| ui-plus | ✅ | ✅ | ⚠️ | ⚠️ | ⚠️ |
| vehicle-deployed-locks | ✅ | ✅ | ⚠️ | ✅ | ⚠️ |
| zone-domes | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| zone-manager-auto-zones | ✅ | ✅ | ⚠️ | ⚠️ | ⚠️ |
| admin-utilities (existing) | N/A | N/A | N/A | ✅ | N/A |
| bgrade (existing) | N/A | N/A | N/A | ⚠️ | N/A |
| copy-paste (existing) | N/A | N/A | N/A | ✅ | N/A |
| vanish (existing) | N/A | N/A | N/A | ✅ | N/A |
| remover-tool (existing) | N/A | N/A | N/A | ⚠️ | N/A |
| unburnable-meat (existing) | N/A | N/A | N/A | ⚠️ | N/A |
| vehicle-decay-protection (existing) | N/A | N/A | N/A | ⚠️ | N/A |
| night-lantern (existing) | N/A | N/A | N/A | ⚠️ | N/A |
| truepve (existing) | N/A | N/A | N/A | ❌ | N/A |
| stack-size-controller (existing) | N/A | N/A | N/A | ⚠️ | N/A |
| whitelist (existing) | N/A | N/A | N/A | ✅ | N/A |
| safespace (existing) | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |

---

## Relocated to penguin-rust-base (Patched)

The following plugins were removed from this scan pipeline due to broken Oxide APIs.
Patched versions (with `FindByID→FindAwakeOrSleeping`, `net.connection→Connection`,
`ConVar.Chat.ChatChannel→Chat.ChatChannel`, `BuildingPrivlidge→BuildingPrivilege`,
`CommunityEntity.ServerInstance→CuiHelper`) are baked into `penguin-rust-base` directly:

| Plugin | Reason |
|--------|--------|
| anti-offline-raid | FindByID, .net.connection removed |
| better-chat | FindByID, .net.connection removed |
| better-chat-mute | ConVar.Chat.ChatChannel removed |
| dynamic-pvp | FindByID removed |
| nteleportation | BuildingPrivlidge typo API + .net.connection removed |
| player-administration | FindByID removed (10+ instances) |
| quests | FindByID removed |
| tree-planter | CommunityEntity.ServerInstance removed |
| vehicle-license | FindByID removed |
| zone-manager | ConVar.Chat.ChatChannel + BuildingPrivlidge removed |

## Critical Issues

The following plugins in this repo have conflict warnings requiring attention:

- **clan-tags** — CRITICAL conflict — self-unloads when Clans is detected; mutually exclusive plugins
- **truepve** (existing) — HIGH conflict on OnEntityTakeDamage with ZoneManager/AntiOfflineRaid
