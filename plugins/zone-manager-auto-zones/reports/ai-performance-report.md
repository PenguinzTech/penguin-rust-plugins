# AI Performance Report — zone-manager-auto-zones
Generated: 2026-04-15

## Performance

- **`UnityEngine.Object.FindObjectsOfType<MonumentInfo>()`** (~line 32): Slow Unity API that scans all objects in the scene. Called only at server initialisation, which is acceptable — not a runtime concern.

## Summary
No deprecated API usage. 1 performance note (init-time only, acceptable).
