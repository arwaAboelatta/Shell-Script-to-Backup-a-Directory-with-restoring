if [ $# -ne 2 ]
then
	echo "There must be 2 parameters"
	echo "eg: $0  dir  backupdir "
	exit 1
fi
dir=$1
backupdir=$2

if [ ! -d "$backupdir" ]
then 
	echo " Error: This backup directory does not exist"
	exit 1
fi

backups=($(ls -1t "$backupdir"))
my_timestamp_index=0


while true
do
echo "choose an option:"
echo "1.Restore to the previous version"
echo "2.Restore to the next version"
echo "3.Exit"
read -p "Enter your choice: " option

case $option in 
	1)
		if [ $my_timestamp_index -ge $((${#backups[@]}-1)) ]
		then
			echo " No older backup available to restore"
		else 
			my_timestamp_index=`expr $my_timestamp_index + 1`
			previous="${backups[$my_timestamp_index]}"
			rm -rf "$dir"/*
			cp -r "$backupdir/$previous"/* "$dir"
			echo "Restored to previous version: $previous"
		fi
		;;
		
	2)
		if [ $my_timestamp_index -le 0 ]
		then
			echo " No newer backup available to restore"
		else 
			my_timestamp_index=`expr $my_timestamp_index - 1`
			next="${backups[$my_timestamp_index]}"
			rm -rf "$dir"/*
			cp -r "$backupdir/$next"/* "$dir"
			echo "Restored to next version: $next"
		fi
		;;
		
	3)
		echo "Exit the restoring process"
		break
		;;
	*)
		echo "Invalid choice : please choose 1 OR 2 OR 3"
		;;
						
esac
done
