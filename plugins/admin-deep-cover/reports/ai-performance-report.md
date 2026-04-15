# AI Performance Report — admin-deep-cover
Generated: 2026-04-15

## Deprecated API Usage

- **`player.Connection.authLevel` assignment** (lines ~405, ~463): Sets auth level directly on the connection object. Should use `ServerUsers.Set()` + `ServerUsers.Save()` and `player.SetPlayerFlag()` for consistency with modern Oxide. The plugin does this correctly elsewhere — these are inconsistent legacy paths left over from an older version.

## Performance

- **Repeated LINQ `.Where().ToList()`** in `GetAvailableIdentities()`: Called multiple times in loops without caching the result. Minor allocation pressure on each call site; cache the list or pass it as a parameter.

## Summary
2 deprecated API usages, 1 minor performance issue.
