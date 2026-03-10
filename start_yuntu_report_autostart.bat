@echo off
setlocal
cd /d %~dp0
set "VENV_PYTHON=%~dp0.venv\Scripts\python.exe"
set "PLAYWRIGHT_HEADLESS=true"

if not exist .env.yuntu exit /b 1

if exist "%VENV_PYTHON%" (
  "%VENV_PYTHON%" scripts\yuntu_bid_report.py --schedule >> yuntu_bid_report_autostart.log 2>&1
) else (
  python scripts\yuntu_bid_report.py --schedule >> yuntu_bid_report_autostart.log 2>&1
)
