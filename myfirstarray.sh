#! /bin/bash

#Set variable named counter to 0
COUNTER1=0
COUNTER2=10

#while my counter is less than 150 then, 
while [ $COUNTER1 -lt 150 ]  
do 
	#populate the element with the value of the index of the counter it equal to the value of the counter 
	my_array[$COUNTER1]=$COUNTER2 
	
	echo ${my_array[$COUNTER1]} >> my_array_list2.txt
	 #echo the value of the array to field my_array_list.txt
	

	#increase the counter by 1 
	let COUNTER1=COUNTER1+1

#close while loop
done
