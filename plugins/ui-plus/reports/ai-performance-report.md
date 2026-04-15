# AI Performance Report — ui-plus
Generated: 2026-04-15

## Performance

- **`InvokeRepeating`** (~line 798): Uses MonoBehaviour's `InvokeRepeating()` instead of Oxide's `timer.Repeat()`. The Oxide timer system integrates with plugin lifecycle (auto-cancelled on plugin unload) and is preferred. `InvokeRepeating` may continue firing after the plugin is unloaded if not explicitly cancelled.

## Summary
No deprecated API usage. 1 performance/lifecycle issue.
