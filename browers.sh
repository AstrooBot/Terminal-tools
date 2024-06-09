#!/bin/bash
flag=$1

if [ $flag == "-l" ]
then
	addr='https://'$2
	firefox $addr

else
 	for data in $@
 	do
		addr=$addr$data+
	done
	firefox https://duckduckgo.com/?q=$addr&t=ffab&ia=web

fi



