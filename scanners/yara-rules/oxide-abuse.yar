rule Oxide_Process_Start {
    meta:
        description = "Detects System.Diagnostics.Process.Start calls"
        severity = "critical"
        author = "penguin-rust-plugins"
    strings:
        $start1 = "System.Diagnostics.Process.Start"
        $start2 = "Process.Start("
    condition:
        any of them
}

rule Oxide_Assembly_Load {
    meta:
        description = "Detects Assembly.Load, Assembly.LoadFile, Assembly.LoadFrom"
        severity = "critical"
        author = "penguin-rust-plugins"
    strings:
        $load1 = "Assembly.Load"
        $load2 = "Assembly.LoadFile"
        $load3 = "Assembly.LoadFrom"
    condition:
        any of them
}

rule Oxide_Raw_Network {
    meta:
        description = "Detects raw network socket usage (WebClient, HttpClient, TcpClient, UdpClient, Socket)"
        severity = "medium"
        author = "penguin-rust-plugins"
    strings:
        $web1 = "new WebClient"
        $http1 = "new HttpClient"
        $http2 = "HttpWebRequest"
        $tcp1 = "new TcpClient"
        $udp1 = "new UdpClient"
        $sock1 = "new Socket("
    condition:
        any of them
}

rule Oxide_Registry_Access {
    meta:
        description = "Detects Windows Registry access (no legitimate reason for Rust plugin)"
        severity = "critical"
        author = "penguin-rust-plugins"
    strings:
        $reg1 = "Microsoft.Win32.Registry"
        $reg2 = "RegistryKey"
    condition:
        any of them
}

rule Oxide_File_Outside_Data {
    meta:
        description = "Detects File operations outside plugin data directory"
        severity = "medium"
        author = "penguin-rust-plugins"
    strings:
        $write1 = /File\.WriteAllText\("\/[^"]+"\)/
        $write2 = /File\.WriteAllText\("C:\\[^"]+"\)/
        $delete1 = /File\.Delete\(@"\/[^"]+"\)/
    condition:
        any of them
}
