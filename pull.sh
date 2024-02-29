if [ $1 ]; then
	if [ -d $1 ]; then
		echo "Pulling entry $1..."
		
		file_path=$(cat "$1/loc.txt")

		read -p "Write to $file_path? (y/n): " confirm

		if [ "$confirm" = "y" ]; then
			cp $1/DATA $file_path
		else
			echo "Aborted"
		fi
	else
		echo "Couldn't find entry"
	fi
else
	echo "Please provide an entry"
fi
