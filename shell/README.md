# Basic usage

```./log-archive.sh /path/to/backup```


# Steps to make backup process run automatically

## 1. Installing cron implemenatations(cronie) on Arch
```sudo pacman -S cronie```

## 2. Make the script executable:
```chmod +x ./log-archive.sh```

## 3. Edit crontab using `crontab -e` and add following lines.

```0 0 * * * ~/path/to/script/log-archive.sh /path/of/folder/to/backup >> ~/path/to/store/log/log_name.log 2>&1```


