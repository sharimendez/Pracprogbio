#! /bin/bash

#while reading variable LINE
while read LINE
do
	#echo value of variable line
	echo $LINE
	echo -e "\n\n"

#this is the name of the file we're looping for
done < mylist.txt
