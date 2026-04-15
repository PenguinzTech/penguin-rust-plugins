# AI Performance Report — better-chat
Generated: 2026-04-15

## Deprecated API Usage

- **`BasePlayer.FindByID(...).net.connection`** (~line 200): Uses the legacy `.net.connection` path. Modern API uses `.Connection`.

## Performance

- **Garbage creation acknowledged by author**: TODO comment at line ~19 explicitly notes "Reduce garbage creation" and "Improve string usage by using StringBuilders". String formatting in message processing creates allocations on every chat message.
- **Missing null check after `FindByID`**: `BasePlayer.FindByID()` can return null if the player disconnected between lookup and use.

## Summary
1 deprecated API usage, 2 performance notes (author-acknowledged).
