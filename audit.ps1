<#
  fps-playbook audit: READ-ONLY snapshot of a Windows gaming PC.

  It changes nothing, needs no admin rights, and sends nothing anywhere.
  It only prints text. Read it before running it, and read the output before
  pasting it into an AI chat.

  Usage (from the folder holding this file):
    powershell -NoProfile -ExecutionPolicy Bypass -File .\audit.ps1
    powershell -NoProfile -ExecutionPolicy Bypass -File .\audit.ps1 -OutFile audit.txt
#>
param([string]$OutFile)

function Clean([string]$s) {
  # Keeps your account name and Steam ID out of anything you might paste or share.
  if (-not $s) { return $s }
  $s = $s -ireplace [regex]::Escape($env:USERNAME), '<user>'
  $s = $s -ireplace [regex]::Escape($env:COMPUTERNAME), '<pc>'
  return ($s -replace '(?i)(userdata[\\/])\d+', '$1<steamid>')
}

function Section([string]$title, [scriptblock]$body) {
  "`n=== $title ==="
  try { & $body | Out-String -Width 160 | ForEach-Object { Clean $_.TrimEnd() } }
  catch { "unavailable: $($_.Exception.Message)" }
}

function RegValue([string]$path, [string]$name) {
  try { "$name = " + (Get-ItemProperty -Path $path -Name $name -ErrorAction Stop).$name }
  catch { "$name = <unset>" }
}

function EventCount([hashtable]$filter) {
  try { @(Get-WinEvent -FilterHashtable $filter -ErrorAction Stop).Count } catch { 0 }
}

$report = & {
  "fps-playbook audit, read-only. Taken $(Get-Date -Format 'yyyy-MM-dd HH:mm')"

  Section 'Windows' {
    $os = Get-CimInstance Win32_OperatingSystem
    "$($os.Caption) build $($os.BuildNumber)"
    "Last boot: $($os.LastBootUpTime)"
  }
  Section 'CPU' {
    Get-CimInstance Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors, MaxClockSpeed, VirtualizationFirmwareEnabled | Format-List
  }
  Section 'Motherboard and BIOS' {
    Get-CimInstance Win32_BaseBoard | Select-Object Manufacturer, Product | Format-List
    Get-CimInstance Win32_BIOS | Select-Object SMBIOSBIOSVersion, ReleaseDate | Format-List
  }
  Section 'Memory (compare ConfiguredClockSpeed with the speed on the kit)' {
    Get-CimInstance Win32_PhysicalMemory | Select-Object DeviceLocator, Manufacturer, PartNumber, @{n='GB';e={[math]::Round($_.Capacity/1GB)}}, Speed, ConfiguredClockSpeed | Format-Table -AutoSize
    "Slots on board: " + (Get-CimInstance Win32_PhysicalMemoryArray).MemoryDevices
  }
  Section 'Storage' {
    Get-PhysicalDisk | Select-Object FriendlyName, MediaType, BusType, HealthStatus | Format-Table -AutoSize
  }
  Section 'GPU and display' {
    Get-CimInstance Win32_VideoController | Select-Object Name, DriverVersion, DriverDate, CurrentHorizontalResolution, CurrentVerticalResolution, CurrentRefreshRate | Format-List
  }
  Section 'NVIDIA live state, if present (take this at idle, then again in game)' {
    $smi = Get-Command nvidia-smi -ErrorAction SilentlyContinue
    if ($smi) {
      & $smi.Source --query-gpu=name,driver_version,pstate,clocks.gr,clocks.mem,power.draw,power.limit,temperature.gpu,fan.speed,utilization.gpu,pcie.link.gen.current,pcie.link.gen.max,pcie.link.width.current --format=csv
      & $smi.Source -q -d MEMORY | Select-String 'BAR1' -Context 0,1 | ForEach-Object { "BAR1 " + $_.Context.PostContext }
    } else { 'nvidia-smi not found' }
  }
  Section 'Power plan' { powercfg /getactivescheme }
  Section 'Virtualization and VBS (anti-cheat may REQUIRE these, see PLAYBOOK.md)' {
    "Hypervisor present: " + (Get-CimInstance Win32_ComputerSystem).HypervisorPresent
    Get-CimInstance -Namespace root\Microsoft\Windows\DeviceGuard -ClassName Win32_DeviceGuard -ErrorAction Stop | Select-Object VirtualizationBasedSecurityStatus, SecurityServicesRunning | Format-List
    RegValue 'HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot\State' 'UEFISecureBootEnabled'
  }
  Section 'Windows gaming settings (unset usually means the Windows default)' {
    RegValue 'HKLM:\SYSTEM\CurrentControlSet\Control\GraphicsDrivers' 'HwSchMode'
    RegValue 'HKCU:\Software\Microsoft\GameBar' 'AutoGameModeEnabled'
    RegValue 'HKCU:\System\GameConfigStore' 'GameDVR_Enabled'
    RegValue 'HKCU:\Software\Microsoft\Windows\CurrentVersion\GameDVR' 'AppCaptureEnabled'
  }
  Section 'Startup entries (names only)' {
    Get-CimInstance Win32_StartupCommand | Select-Object -ExpandProperty Name | Sort-Object -Unique
  }
  Section 'Top processes by memory' {
    Get-Process | Group-Object Name | ForEach-Object { [pscustomobject]@{ Name = $_.Name; Count = $_.Count; MB = [math]::Round(($_.Group | Measure-Object WS -Sum).Sum / 1MB) } } | Sort-Object MB -Descending | Select-Object -First 20 | Format-Table -AutoSize
  }
  Section 'Top processes by CPU time since boot' {
    Get-Process | Sort-Object CPU -Descending | Select-Object -First 15 Name, @{n='CPUsec';e={[math]::Round($_.CPU)}} | Format-Table -AutoSize
  }
  Section 'Third-party automatic services that are running' {
    Get-CimInstance Win32_Service -Filter "StartMode='Auto' AND State='Running'" | Where-Object { $_.PathName -notmatch '(?i)\\Windows\\' } | Select-Object -ExpandProperty Name | Sort-Object
  }
  Section 'Network' {
    Get-NetAdapter | Where-Object Status -eq 'Up' | Select-Object InterfaceDescription, LinkSpeed | Format-Table -AutoSize
  }
  Section 'Stability, last 30 days (fix these before overclocking)' {
    $since = (Get-Date).AddDays(-30)
    "WHEA hardware errors: " + (EventCount @{ LogName = 'System'; ProviderName = 'Microsoft-Windows-WHEA-Logger'; StartTime = $since })
    "Unexpected shutdowns (Kernel-Power 41): " + (EventCount @{ LogName = 'System'; ProviderName = 'Microsoft-Windows-Kernel-Power'; Id = 41; StartTime = $since })
    "GPU driver events (nvlddmkm): " + (EventCount @{ LogName = 'System'; ProviderName = 'nvlddmkm'; StartTime = $since })
  }
  Section 'Counter-Strike 2 settings, if installed' {
    $steam = (Get-ItemProperty 'HKCU:\Software\Valve\Steam' -ErrorAction Stop).SteamPath
    Get-ChildItem (Join-Path $steam 'userdata') -Directory -ErrorAction Stop | ForEach-Object {
      $cfg = Join-Path $_.FullName '730\local\cfg'
      $video = Join-Path $cfg 'cs2_video.txt'
      if (Test-Path $video) {
        "Found: $video"
        Get-Content $video | Where-Object { $_ -match 'setting\.' } | ForEach-Object { $_.Trim() }
        $convars = Join-Path $cfg 'cs2_machine_convars.vcfg'
        if (Test-Path $convars) { Select-String -Path $convars -Pattern '"fps_max"|r_player_visibility_mode' | ForEach-Object { $_.Line.Trim() } }
      }
    }
  }
}

$report
if ($OutFile) { $report | Out-File -FilePath $OutFile -Encoding utf8; "`nSaved to $OutFile. Read it before sharing it." }
