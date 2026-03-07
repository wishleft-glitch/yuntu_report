# Install In 5 Minutes

## 1. Install Python

Install Python 3.10 or newer and make sure `python` or `py` works in terminal.

## 2. Open This Folder

```powershell
cd yuntu_report
```

## 3. Install Dependencies

```powershell
pip install -r requirements.txt
playwright install chromium
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

## 5. Initialize Login State

```powershell
init_yuntu_login.bat
```

Log in to Yuntu in the opened browser.

## 6. Test Once

```powershell
python scripts\yuntu_bid_report.py --run-once
```

## 7. Start Scheduled Mode

```powershell
python scripts\yuntu_bid_report.py --schedule
```

## 8. Optional Windows Autostart

```powershell
start_yuntu_report_autostart.bat
```

## Notes

- `.env.yuntu` is local only
- Browser login state must be recreated on each new device
