$projectRoot = $PSScriptRoot
$pythonPath = Join-Path $projectRoot '.venv\Scripts\python.exe'
$scriptPath = Join-Path $projectRoot 'scripts\yuntu_bid_report.py'
$logPath = Join-Path $projectRoot 'yuntu_bid_report_autostart.log'
$batchPath = Join-Path $projectRoot 'start_yuntu_report_autostart.bat'

$existing = Get-CimInstance Win32_Process |
    Where-Object {
        $_.ExecutablePath -eq $pythonPath -and
        $_.CommandLine -like "*scripts\\yuntu_bid_report.py*" -and
        $_.CommandLine -like "*--schedule*"
    } |
    Select-Object -First 1

if ($existing) {
    Add-Content -Path $logPath -Value "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss,fff') [INFO] Scheduler already running. Skip duplicate start."
    exit 0
}

Start-Process -FilePath 'cmd.exe' `
    -ArgumentList "/c `"$batchPath`"" `
    -WorkingDirectory $projectRoot `
    -WindowStyle Hidden
