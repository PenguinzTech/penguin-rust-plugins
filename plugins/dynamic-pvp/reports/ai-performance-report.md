# AI Performance Report — dynamic-pvp
Generated: 2026-04-15

## Performance

- **Debug string interpolation in coroutines** (~line 74-77): String concatenation using `$"...{player.displayName}..."` inside coroutines allocates on every frame when debug logging is enabled. Use conditional logging or `string.Format` only when the log level is active.

## Summary
No deprecated API usage. 1 minor performance note (debug path only).
