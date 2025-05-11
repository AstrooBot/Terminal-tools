if [[ ! -f "$HOME/Workplace/Terminal-tools/info" ]]; then

	echo "lol" > info
        echo "file does not exist"	
else 
	var=$(cat info)
	if [[ "$var" != "$PWD" ]]; then
		echo "error"
	else 
		echo "every ok"
	fi

fi
