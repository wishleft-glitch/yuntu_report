# Install In 5 Minutes

## 1. Install Python

Install Python 3.10 or newer.

## 2. Open This Folder

```powershell
cd yuntu_report
```

## 3. Install Dependencies

```powershell
python -m venv .venv
.\.venv\Scripts\python.exe -m pip install -r requirements.txt
.\.venv\Scripts\python.exe -m playwright install chromium
```

## 4. Create Local Config

```powershell
copy .env.yuntu.example .env.yuntu
```

Then fill:

- `SMTP_HOST`
- `SMTP_PORT`
- `SMTP_SENDER`
- `SMTP_PASSWORD`
- `MAIL_TO`
- `PLAYWRIGHT_USER_DATA_DIR`

## 5. Initialize Login State

```powershell
init_yuntu_login.bat
```

Log in to Yuntu in the opened browser. Close the browser after login is complete.

## 6. Test Once

```powershell
.\.venv\Scripts\python.exe scripts\yuntu_bid_report.py --run-once
```

## 7. Start Scheduled Mode

```powershell
.\.venv\Scripts\python.exe scripts\yuntu_bid_report.py --schedule
```

## 8. Optional Windows Autostart

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\start_yuntu_report_task.ps1
```

## Notes

- `.env.yuntu` is local only
- `.playwright-yuntu-profile` is local only
- Browser login state must be recreated on each new device
