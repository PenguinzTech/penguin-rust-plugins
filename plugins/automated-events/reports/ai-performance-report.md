# AI Performance Report — automated-events
Generated: 2026-04-15

## Performance

- **Multiple `BasePlayer.activePlayerList` iterations** (~lines 782, 789, 800, 811): Event broadcast methods each iterate the full player list separately. Consolidating into a single loop per broadcast would reduce overhead on large servers.

## Summary
No deprecated API usage. 1 performance improvement opportunity.
