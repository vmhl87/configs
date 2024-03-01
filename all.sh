if [ $1 ]; then
	if [ "$1" = "pull" ]; then
		echo "Pulling all"

		read -p "Do you want to push all? (y/n): " pall

		for subdir in */; do
			if [ "$pall" = "y" ]; then
				cp $subdir/DATA $(cat "$subdir/loc.txt")
			else
				bash pull.sh $subdir
			fi
		done
	else
		read -p "Do you want to push all? (y/n): " pall

		for subdir in */; do
			if [ "$pall" = "y" ]; then
				bash push.sh $subdir
			else
				read -p "Push directory $subdir? (y/n): " confirm

				if [ "$confirm" = "y" ]; then
					bash push.sh $subdir
				fi
			fi
		done
	fi
else
	echo "Specify an option (push/pull)"
fi
