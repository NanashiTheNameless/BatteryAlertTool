# BatteryAlertTool

## Just a simple mac tool to nag you when your battery is low

This can be installed with

```sh
curl -H 'DNT: 1' -H 'Sec-GPC: 1' -H 'Cache-Control: no-cache, no-store' -H 'Pragma: no-cache' -s -L https://github.com/NanashiTheNameless/BatteryAlertTool/raw/refs/heads/main/setup.sh | bash
```

## Editing Parameters

### Mac

To change how often the script alerts you, at what percentage the script triggers, or the sound the script uses, you can edit the variables at <br>
`/Users/$USER/Library/Scripts/batt.sh` <br>
The important parameters are all at the top!

### Linux

To change how often the script alerts you, at what percentage the script triggers, or the sound the script uses, you can edit the variables at <br>
`/home/$USER/bin/batteryReminder` <br>
The important parameters are all at the top!
