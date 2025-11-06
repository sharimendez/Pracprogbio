#!/bin/bash

FRUIT="fruit.txt"

echo $FRUIT

cut -f1 $FRUIT | tail -n +2 > fruit_1.txt

cat fruit_1.txt

COUNTER=0
echo "creating array"

while read LINE 
do 
	my_fruit[$COUNTER]=$LINE
	echo ${my_fruit [$COUNTER]}
	let COUNTER-COUNTER1	
done < fruit_1.txt 

cut -f2 $FRUIT | tail -n +2 > fruit_2.txt
 
COUNTER=0

#while reading the line in fruit_2.txt
while read LINE 
do 
	yum_scale[$COUNTER]=$LINE #declare array yum_scale to contain yum values from file

	echo ${yum_scale[$COUNTER]} #echo value of element in array to standard out 

	let COUNTER=COUNTER+1 #increment counter by 1

done < fruit_2.txt

COUNTER=0

#start a while loop to loop through the arrays 
while [ $COUNTER -lt ${#yum_scale[@]} ] # while the value of our counter is less than our array of sum_scale count all the elements
do 
	if [ ${yum_scale[$COUNTER]} = "yummy"]; then 
		echo ${my_fruit[$COUNTER]}
	else
		echo "This fruit is not yummy"
	fi 
	let COUNTER=COUNTER+1
done
