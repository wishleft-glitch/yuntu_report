# Yuntu Report

Custom email automation for OceanEngine Yuntu game APP bid ranking report.

## Included Files

- `scripts/yuntu_bid_report.py`: scraper, scheduler, mail sender
- `scripts/init_yuntu_login.py`: login-state initializer
- `.env.yuntu.example`: local config template
- `init_yuntu_login.bat`: open a visible browser and save login state
- `start_yuntu_report.bat`: interactive scheduler start
- `start_yuntu_report_autostart.bat`: no-prompt scheduler launcher
- `start_yuntu_report_task.ps1`: helper for Windows Task Scheduler

## New Device Setup

1. Install Python 3.10+.
2. Open a terminal in this repository.
3. Install dependencies:

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe -m playwright install chromium
```

4. Create local config:

```powershell
copy .env.yuntu.example .env.yuntu
```

5. Fill these values in `.env.yuntu`:

- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_SENDER`
- `SMTP_PASSWORD`
- `MAIL_TO`
- `PLAYWRIGHT_USER_DATA_DIR`

6. Initialize login state once:

```powershell
init_yuntu_login.bat
```

Log in to Yuntu in the opened browser window. Close the browser when login is complete, then stop the terminal window if needed. The login state stays on the local machine and is not stored in GitHub.

## Run Once

```powershell
.\.venv\Scripts\python.exe scripts\yuntu_bid_report.py --run-once
```

## Scheduled Run

```powershell
.\.venv\Scripts\python.exe scripts\yuntu_bid_report.py --schedule
```

Behavior:

- First check at `16:00`
- If yesterday's data is not ready, retry every hour
- Send mail once data is ready

## Windows Autostart

Recommended: create a Windows Task Scheduler job that runs on user logon and points to:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\start_yuntu_report_task.ps1
```

The helper script avoids duplicate scheduler processes and starts the report job in the background.

## Notes

- Do not commit `.env.yuntu`
- Do not commit `.playwright-yuntu-profile`
- Browser login state must be created again on each new device
- `init_yuntu_login.bat` forces visible mode for login
- `start_yuntu_report*.bat` force headless mode for scheduled runs
