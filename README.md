# Backup and Restore Solution

This project provides a **backup and restore solution** to periodically back up a directory and restore specific backups. It includes a **Makefile**, a **backup script** (`backupd.sh`), and a **restore script** (`restore.sh`).


## Prerequisites

To use this project on Ubuntu, ensure you have:
1. **Bash**: Default shell on Ubuntu.
2. **Make**: Install with:
   ```bash
   sudo apt update
   sudo apt install make
   ```

Grant execute permissions to the scripts:
```bash
chmod +x backupd.sh restore.sh
```

## How to Run the Backup Solution

### 1. Setup

1. Clone or place the project scripts in a working directory.
2. Open a terminal and navigate to the project folder:
   ```bash
   cd /path/to/project-directory
   ```
3. Edit the **Makefile**:
   - Update `dir` with the source directory and `backupdir` with the backup directory:
     ```makefile
     dir := /path/to/source/dir      # Directory to back up
     backupdir := /path/to/backup/dir # Directory to store backups
     ```

### 2. Running the Backup

1. Start the backup process:
   ```bash
   make
   ```
   - This command creates a backup, monitors the specified directory for changes, and maintains the defined maximum number of backups by deleting the oldest backup when needed.

### 3. Restoring from Backups

To restore a previous backup:
   ```bash
   make restore
   ```
   The restore script will prompt you to choose which backup to restore.

### 4. Cleaning Up

To delete all backups in the `backupdir`, run:
   ```bash
   make clean
   ```

##  Cron-Based Backup Solution

This project also includes an optional **cron-based backup** script (`backup-cron.sh`) for scheduled backups at set intervals.

### Folder Structure
```
├── backup-cron.sh   # Bash script to perform periodic backups
```

### Setting Up Cron on Ubuntu
Install and enable cron:
```bash
sudo apt update
sudo apt install cron
sudo systemctl start cron
sudo systemctl enable cron
```

Grant execute permission to `backup-cron.sh`:
```bash
chmod +x backup-cron.sh
```
---
