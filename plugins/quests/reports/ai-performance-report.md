# AI Performance Report — quests
Generated: 2026-04-15

## Deprecated API Usage

- **`OnPlayerChat(BasePlayer player, string message)`** (~line 475): Missing the `Chat.ChatChannel channel` parameter. This is an outdated hook signature — without it the hook fires on all channels (global, team, local, cards) indiscriminately. The correct modern signature is `OnPlayerChat(BasePlayer player, string message, Chat.ChatChannel channel)`. This is the highest-severity finding in this batch.

## Summary
1 deprecated hook signature — may cause unintended behaviour on team/local chat.
