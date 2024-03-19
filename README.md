# 目的
sqlite3のファイルをバップアップする。

# 参照
[Cron-based backup - Litestream](https://litestream.io/alternatives/cron/)

# 手順
sqlite3コマンドを実行できること。
```
# Ubuntu
sudo apt-get install -y sqlite3
```

必要に応じて SRC_FILE と DST_DIR を変更する。

単体で動作確認する。
```
bash sqlite3_backup_script.sh
```

毎日0時に実行する。
```
# Edit your cron jobs
crontab -e

# Add this to the end of the crontab
0 0 * * * /path/to/sqlite3_backup_script.sh
```
