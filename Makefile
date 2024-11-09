dir := /home/vboxuser/data
backupdir := /home/vboxuser/backup
interval_secs := 10  
max_backups := 3

all: backup

backupdir:
	@mkdir -p $(backupdir)

backup: backupdir
	@bash backupd.sh $(dir) $(backupdir) $(interval_secs) $(max_backups)

restore:
	@bash restore.sh $(dir) $(backupdir)

