#!/bin/bash
#This script works as a shortcut to search in Firefox
flag=$1

if [ $flag == "-l" ]
then
	addr='https://'$2
	firefox $addr
 
elif [ $flag == "-y" ]
then
 	for data in ${@:2}
 	do
		addr=$addr$data+
	done
	firefox https://www.youtube.com/results?search_query=$addr

else
 	for data in $@
 	do
		addr=$addr$data+
	done
	firefox https://duckduckgo.com/?q=$addr&t=ffab&ia=web

fi



