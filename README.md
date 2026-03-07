# Yuntu Report

Custom email automation for OceanEngine Yuntu game APP bid ranking Top 9.

## Included Files

- `scripts/yuntu_bid_report.py`: scraper, scheduler, mail sender
- `scripts/init_yuntu_login.py`: login-state initializer
- `.env.yuntu.example`: local config template
- `init_yuntu_login.bat`: open browser and save login state
- `start_yuntu_report.bat`: interactive scheduler start
- `start_yuntu_report_autostart.bat`: no-prompt launcher for Windows autostart

## New Device Setup

1. Install Python 3.10+.
2. Open a terminal in this repository.
3. Install dependencies:

```powershell
pip install -r requirements.txt
playwright install chromium
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

6. Initialize login state once:

```powershell
init_yuntu_login.bat
```

Log in to Yuntu in the opened browser window. That login state stays on the local machine and is not stored in GitHub.

## Run Once

```powershell
python scripts\yuntu_bid_report.py --run-once
```

## Scheduled Run

```powershell
python scripts\yuntu_bid_report.py --schedule
```

Behavior:

- First check at `16:00`
- If yesterday's data is not ready, retry every hour
- Send mail once data is ready

## Windows Autostart

Use `start_yuntu_report_autostart.bat` after local config and login state are ready.

## Notes

- Do not commit `.env.yuntu`
- Browser login state must be created again on each new device
