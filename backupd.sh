if [ $# -ne 4 ]
then
	echo "There must be 4 parameters"
	echo "eg: $0  dir  backupdir  interval-sec  max-backups"
	exit 1
fi

dir=$1
backupdir=$2
interval_secs=$3
max_backups=$4


if ! expr "$max_backups" + 0 >/dev/null 2>&1
then
	echo "warning: max_backups is not a number"
	exit 1
elif [ "$max_backups" -le 0 ]; then
	echo echo "warning: max_backups must be a positive number"
	exit 1
fi

echo "Backup directory is ready: $backupdir "
current_date=$(date +"%y-%m-%d-%H-%M-%S")
ls -lR $dir > directory-info.last
cp -r "$dir" "$backupdir/$current_date"
echo " Backup Created at $backupdir/$current_date"

#count_backups=$( ls -1 "$backupdir" | wc -l )
#while [ $count_backups -gt "$max_backups" ]
#do
#	earliest_backup=$(ls -1t "$backupdir" | tail -n 1)
#	rm -r "$backupdir/$earliest_backup"
#	count_backups=$(ls -1 "$backupdir" | wc -l)
#done



while true;
do 
	sleep "$interval_secs"
	ls -lR $dir > directory-info.new
	if ! diff -s directory-info.last  directory-info.new > /dev/null
	then 
	  current_date=$(date +"%y-%m-%d-%H-%M-%S")
	  cp -r "$dir" "$backupdir/$current_date"
	  mv  directory-info.new  directory-info.last 
	  echo " Backup Created at $backupdir/$current_date"
	  
	  count_backups=$( ls -1 "$backupdir" | wc -l )
	  if [ "$count_backups" -gt "$max_backups" ]
	  then
	  	earliest_backup=$(ls -1t "$backupdir" | tail -n 1)
	  	rm -r "$backupdir/$earliest_backup"
	  fi  
	fi
done




 
