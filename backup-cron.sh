dir="/home/vboxuser/data"
backupdir="/home/vboxuser/backup"
max_backups=3
current_date=$(date +"%y-%m-%d-%H-%M-%S")

cp -r "$dir" "$backupdir/$current_date"

count_backups=$( ls -1 "$backupdir" | wc -l )
while [ $count_backups -gt "$max_backups" ]
do
	earliest_backup=$(ls -1t "$backupdir" | tail -n 1)
	rm -r "$backupdir/$earliest_backup"
	count_backups=$(ls -1 "$backupdir" | wc -l)
done

 
