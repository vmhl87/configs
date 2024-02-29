if [ $1 ]; then
	if [ -d $1 ]; then
		echo "Updating directory $1..."
		
		file_path=$(cat "$1/loc.txt")

		if [ -f "$file_path" ]; then
			cp $file_path $1/DATA
		else
			echo "Could not find file"
		fi
	else
		echo "Couldn't find directory"
	fi
else
	echo "Please provide a directory"
fi
