# AI Performance Report — better-chat-filter
Generated: 2026-04-15

## Performance

- **`String.Split(' ')` + multiple regex replacements on every chat message** (~lines 470, 479, 489, 592): `FilterText()` is in the hot path (called on every message) and allocates a new array on each invocation. Consider caching compiled `Regex` instances as static fields and reusing split buffers.

## Summary
No deprecated API usage. 1 performance issue in hot path.
