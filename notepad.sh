# !/bin/bash

# this script create a file .txt that storage what user needs 

line=""
name="$1.txt"

if [[ $name == "" ]]; then
    name=$(date).txt
fi

printf "Write your notes, when you finish write 'end'\n"

while [[ $line != "end" ]]; do
    read -p "" line
    text="$text$line\n"
    printf "$text" > notepad.txt
done 

head -n -1 notepad.txt > $name 
rm notepad.txt

read -p "Where do you want to save your notes? " path
if [[ ${path} != "" ]]; then
    mv $name $path
fi



