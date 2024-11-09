This project provides a "backup and restore solution" to periodically back up a directory and restore specific backups. The solution consists of a "Makefile", a "backup script (`backupd.sh`)", and a "restore script (`restore.sh`)". The backup system ensures a certain number of backups are maintained and the oldest backups are removed when the max backups are reached.

  Files Overview:

- backupd.sh: Handles automatic backups of a directory at specified intervals and keeps a fixed number of backups by deleting older ones.
- restore.sh: Allows the user to restore previous or later backups from a directory.
- Makefile: Simplifies running the backup and restore scripts and ensures the correct directories exist.

 2. Prerequisites

To use this project on Ubuntu, you will need:

1. Bash: Ensure you have bash installed (which is default on Ubuntu).
2. Make: The `make` utility to run the provided Makefile.

  Installation:

Install `make` using the following bash commands:

sudo apt update
sudo apt install make


Ensure that your project contains the necessary permissions for executing bash scripts:

chmod +x backupd.sh
chmod +x restore.sh

---

3. How to Run the Backup Solution

3.1. Setup

1. Clone the project or place the scripts in a working directory.
2. Navigate to the folder where the scripts and Makefile are located:
   ```bash
   cd /path/to/project-directory
   ```
3. Edit the Makefile :
   - Open the Makefile using a text editor:
     ```bash
     nano Makefile
     ```
   - Update the paths for your source directory (`dir`) and backup directory (`backupdir`) within the Makefile:
     ```makefile
     dir := /path/to/source/dir    # Directory to back up
     backupdir := /path/to/backup/dir  # Directory to store backups
.............................................................     
 3.2. Running the Backup

1. Run the backup process:
   ```bash
   make
   ```

This will:
- Create a backup of the directory specified in `dir` and store it in `backupdir`.
- Automatically check the directory for changes every specified interval (`interval_secs`) and back up any changes.
- Limit the number of backups to the value of `max_backups` (set in the Makefile) by deleting the oldest backup when the limit is reached.
...................................
3.3. Restoring from Backups

To restore a previous backup:
1. Run the restore script via the Makefile:
   ```bash
   make restore
   ```

The restore script will prompt you to choose the version to restore.

3.4. Cleaning Up

To delete all backups in the `backupdir`, run the clean target:
```bash
make clean
```

---
 BONUS part:
This project provides a backup solution using a bash script (backup-cron.sh) to automatically back up a directory to another location at a specified interval. Additionally, it provides detailed instructions for setting up the solution as a cron job.

Folder Structure
├── backup-cron.sh   # Bash script to perform periodic backups

Installing Cron on Ubuntu:
sudo apt update
sudo apt install cron
sudo systemctl start cron
sudo systemctl enable cron

chmod +x backup-cron.sh

How to Set Up a Cron Job for the Backup Script
1.Create the backup-cron.sh file:
2.Open a terminal and create the script
3.Make sure the script is executable
chmod +x backup-cron.sh

4.Add the following line to run the backup-cron.sh every minute at second 23:
* * * * * (sleep 23; /path/to/backup-cron.sh)
Save and exit the cron file. This will run the script every minute at second 23.

5.Running the Backup Every 3rd Friday of the Month at 12:31 AM
31 0 15-21 * 5 [ "$(date +\%u)" -eq 5 ] && /path/to/backup-cron.sh

