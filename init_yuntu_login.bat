@echo off
setlocal
cd /d %~dp0
set "VENV_PYTHON=%~dp0.venv\Scripts\python.exe"
set "PLAYWRIGHT_HEADLESS=false"
echo Opening Yuntu login browser with profile:
echo %~dp0.playwright-yuntu-profile
if exist "%VENV_PYTHON%" (
  "%VENV_PYTHON%" scripts\init_yuntu_login.py
) else (
  python scripts\init_yuntu_login.py
)
