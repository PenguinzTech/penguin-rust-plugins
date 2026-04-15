# AI Performance Report — anti-offline-raid
Generated: 2026-04-15

## Deprecated API Usage

- **`player.net.connection.authLevel`** (~line 360): Legacy connection path. Use `player.Connection.authLevel` instead. Inconsistent with line ~348 which already uses the modern path.

## Performance

- **`foreach (var player in BasePlayer.activePlayerList)`** (~line 360, 882): Iterates the full active player list every 5 minutes via `timer.Repeat()`. Acceptable at a 5-minute interval but worth noting for high-population servers.

## Summary
1 deprecated API usage, 1 minor performance note (acceptable interval).
