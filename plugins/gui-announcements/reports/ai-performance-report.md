# AI Performance Report — gui-announcements
Generated: 2026-04-15

## Performance

- **Repeated `permission.GetUserGroups(player.UserIDString)`** (~lines 1183-1184, 1211-1212, 1947-1948): Called 3+ times per join/leave event, each call doing a lookup. Cache the result in a local variable for the duration of the handler.

## Summary
No deprecated API usage. 1 performance improvement opportunity.
