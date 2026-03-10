@echo off
setlocal
cd /d %~dp0
set "VENV_PYTHON=%~dp0.venv\Scripts\python.exe"
set "PLAYWRIGHT_HEADLESS=true"

if not exist .env.yuntu (
  echo Missing .env.yuntu
  echo Copy .env.yuntu.example to .env.yuntu and fill SMTP settings first.
  pause
  exit /b 1
)

if exist "%VENV_PYTHON%" (
  "%VENV_PYTHON%" scripts\yuntu_bid_report.py --schedule
) else (
  python scripts\yuntu_bid_report.py --schedule
)
pause
