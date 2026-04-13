rule Obfuscated_Base64_Blob {
    meta:
        description = "Detects large Base64 literals (30+ consecutive Base64 chars)"
        severity = "medium"
        author = "penguin-rust-plugins"
    strings:
        $b64 = /[A-Za-z0-9+\/]{30,}={0,2}/
    condition:
        $b64
}

rule Obfuscated_Hex_String {
    meta:
        description = "Detects long hex string literals (40+ hex chars)"
        severity = "medium"
        author = "penguin-rust-plugins"
    strings:
        $hex = /[0-9A-Fa-f]{40,}/
    condition:
        $hex
}

rule Obfuscated_Char_Code_Array {
    meta:
        description = "Detects suspicious char code arrays (10+ (char)0x... elements)"
        severity = "medium"
        author = "penguin-rust-plugins"
    strings:
        $charcode = /\(char\)0x[0-9A-Fa-f]{2}/
    condition:
        #charcode >= 10
}

rule Obfuscated_String_Reverse {
    meta:
        description = "Detects .Reverse() chained with new string( on small literals"
        severity = "low"
        author = "penguin-rust-plugins"
    strings:
        $reverse = /.Reverse\(\).*new string\(/
    condition:
        $reverse
}
