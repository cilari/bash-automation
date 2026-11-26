# Bash Automation

Three Bash scripts for automating common Linux sysadmin tasks. Each uses `set -euo pipefail` for safe error handling and targets both macOS and Linux.

---

## Scripts

### `backup.sh` — Timestamped directory backup

Compresses a directory into a `.tar.gz` archive and saves it in a `backups/` folder next to the source.

```bash
./backup.sh <source-directory>
```

```bash
./backup.sh ~/projects/my-app
```

Example output:
```
→ Backup saved: ~/projects/backups/backup_2026-11-26-10-30-00.tar.gz
```

---

### `health_check.sh` — System health report

Prints disk usage, memory, top 5 processes by CPU, and uptime. Detects macOS vs Linux and uses the appropriate commands.

```bash
./health_check.sh
```

Example output:
```
===== System Health Report: Wed Nov 26 10:30:00 2026 =====

-- Disk Usage --
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1        50G   18G   30G  38% /

-- Memory Usage --
...

-- Top 5 Processes by CPU --
...

-- Uptime --
10:30:00 up 3 days, 4:12, 2 users, load average: 0.42, 0.38, 0.35
```

---

### `log_cleaner.sh` — Interactive log file cleanup

Finds `.log` files older than N days and prompts you to choose which ones to delete.

```bash
./log_cleaner.sh <log-directory> <days>
```

```bash
./log_cleaner.sh ~/logs 30
```

Example output:
```
Files to delete:
  [0] ~/logs/app.log
  [1] ~/logs/error.log
  [2] ~/logs/access.log

Enter numbers to DELETE (space-separated), 'a' for all, 'q' to quit:
```

Defaults to `/var/log` and 30 days if no arguments are passed.

---

## Requirements

- Bash 4+ — macOS ships with 3.2, install a newer version via Homebrew:

```bash
brew install bash
```

Scripts use `#!/usr/bin/env bash` to pick up the correct version automatically.
