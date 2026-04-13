rule Hardcoded_Discord_Webhook {
    meta:
        description = "Detects hardcoded Discord webhooks"
        severity = "critical"
        author = "penguin-rust-plugins"
    strings:
        $discord1 = "https://discord.com/api/webhooks/"
        $discord2 = "https://discordapp.com/api/webhooks/"
    condition:
        any of them
}

rule Hardcoded_Slack_Webhook {
    meta:
        description = "Detects hardcoded Slack webhooks"
        severity = "critical"
        author = "penguin-rust-plugins"
    strings:
        $slack = "https://hooks.slack.com/services/"
    condition:
        $slack
}

rule Hardcoded_Bearer_Token {
    meta:
        description = "Detects hardcoded Bearer tokens (20+ alphanumeric chars)"
        severity = "critical"
        author = "penguin-rust-plugins"
    strings:
        $bearer = /Authorization:\s*Bearer\s+[A-Za-z0-9._\-]{20,}/
    condition:
        $bearer
}

rule Hardcoded_AWS_Access_Key {
    meta:
        description = "Detects AWS access key pattern (AKIA + 16 alphanumeric)"
        severity = "critical"
        author = "penguin-rust-plugins"
    strings:
        $aws = /AKIA[0-9A-Z]{16}/
    condition:
        $aws
}

rule Hardcoded_Steam_API_Key {
    meta:
        description = "Detects hardcoded Steam API keys (32-char hex)"
        severity = "high"
        author = "penguin-rust-plugins"
    strings:
        $steam = /steampowered\.com\/.*key=[0-9A-Fa-f]{32}/
    condition:
        $steam
}
