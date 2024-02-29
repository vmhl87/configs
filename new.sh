if [ $1 ]; then
	if [ -d $1 ]; then
		echo "entry already exists"
	else
		if [ $2 ]; then
			if [ -f $2 ]; then
				read -p "Create entry $1 at path $2? (y/n): " confirm

				if [ "$confirm" = "y" ]; then
					mkdir $1
					echo "$2" > $1/loc.txt
					bash push.sh $1
				else
					echo "Aborted"
				fi
			else
				echo "Couldn't find source file"
			fi
		else
			echo "Provide a source"
		fi
	fi
else
	echo "Provide a name"
fi
