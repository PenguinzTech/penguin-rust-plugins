# AI Performance Report — tree-planter
Generated: 2026-04-15

## Performance

- **`while (true)` coroutine with manual frame budget** (~line 434): `CycleEntities()` uses an infinite loop with yield and manual `framebudgetms` checks. This is a common Oxide pattern and is correctly implemented here — noted for awareness rather than as a defect.

## Summary
No deprecated API usage. 1 minor performance note (acceptable pattern).
