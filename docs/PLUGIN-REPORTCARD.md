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

- **Broken API**: N/A for existing plugins (analyzed separately)
- **Deprecated API**: N/A for existing plugins
- **Performance**: N/A for existing plugins
- **Conflicts**: Analyzed for all plugins (new and existing)
- **Overall**: N/A for existing plugins; status determined by worst issue (Broken > Conflicts > Performance > Deprecated) for new plugins

---

## Plugin Report Card

| Plugin | Broken API | Deprecated API | Performance | Conflicts | Overall |
|--------|-----------|----------------|-------------|-----------|---------|
| admin-deep-cover | ✅ | ⚠️ | ⚠️ | ⚠️ | ⚠️ |
| anti-offline-raid | ❌ | ⚠️ | ⚠️ | ❌ | ❌ |
| automated-events | ✅ | ✅ | ⚠️ | ⚠️ | ⚠️ |
| better-chat | ❌ | ⚠️ | ⚠️ | ⚠️ | ❌ |
| better-chat-filter | ✅ | ✅ | ⚠️ | ❌ | ⚠️ |
| better-chat-flood | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| better-chat-global-mute | ✅ | ✅ | ✅ | ✅ | ✅ |
| better-chat-ignore | ✅ | ✅ | ✅ | ✅ | ✅ |
| better-chat-mentions | ✅ | ✅ | ✅ | ❌ | ⚠️ |
| better-chat-mute | ❌ | ✅ | ✅ | ❌ | ❌ |
| better-chat-toggle | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| clan-tags | ✅ | ✅ | ✅ | ❌ | ❌ |
| clans | ✅ | ✅ | ✅ | ❌ | ⚠️ |
| dynamic-pvp | ❌ | ✅ | ⚠️ | ⚠️ | ❌ |
| economics | ✅ | ✅ | ✅ | ✅ | ✅ |
| emote | ✅ | ✅ | ✅ | ✅ | ✅ |
| friendly-fire | ✅ | ✅ | ✅ | ⚠️ | ✅ |
| gui-announcements | ✅ | ✅ | ⚠️ | ✅ | ⚠️ |
| landlord | ✅ | ✅ | ✅ | ✅ | ✅ |
| nteleportation | ❌ | ⚠️ | ✅ | ⚠️ | ❌ |
| player-administration | ❌ | ✅ | ✅ | ✅ | ❌ |
| quests | ❌ | ⚠️ | ✅ | ✅ | ❌ |
| tree-planter | ❌ | ✅ | ⚠️ | ✅ | ❌ |
| ui-plus | ✅ | ✅ | ⚠️ | ⚠️ | ⚠️ |
| vehicle-deployed-locks | ✅ | ✅ | ⚠️ | ✅ | ⚠️ |
| vehicle-license | ❌ | ✅ | ⚠️ | ✅ | ❌ |
| zone-domes | ✅ | ✅ | ✅ | ⚠️ | ⚠️ |
| zone-manager | ❌ | ✅ | ✅ | ❌ | ❌ |
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

## Critical Issues

The following plugins have ❌ Overall status and require immediate attention:

- **anti-offline-raid** — Broken API (FindByID, .net.connection); HIGH conflict with ZoneManager/TruePVE on damage blocking
- **better-chat** — Broken API (FindByID, .net.connection); bypassed by AdminDeepCover
- **better-chat-mute** — Broken API (ConVar.Chat.ChatChannel removed); bypassed by AdminDeepCover
- **clan-tags** — CRITICAL conflict — self-unloads when Clans is detected; mutually exclusive plugins
- **dynamic-pvp** — Broken API (FindByID); MEDIUM zone lifecycle race with ZoneManagerAutoZones/TruePVE
- **nteleportation** — Broken API (BuildingPrivlidge typo, .net.connection); MEDIUM init order dependency
- **player-administration** — Broken API (FindByID, 10+ instances)
- **quests** — Broken API (FindByID); deprecated OnPlayerChat usage
- **tree-planter** — Broken API (CommunityEntity.ServerInstance); risky while(true) coroutine
- **vehicle-license** — Broken API (FindByID); no interval bounds checking
- **zone-manager** — Broken API (ConVar.Chat.ChatChannel, BuildingPrivlidge); HIGH conflict with TruePVE/AntiOfflineRaid

Additionally, **truepve** (existing) has HIGH conflict on OnEntityTakeDamage with ZoneManager/AntiOfflineRaid.
