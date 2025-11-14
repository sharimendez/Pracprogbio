#!/bin/bash

FILE="Exam2_Levine_et_al_body_size.csv" #Assign the file csv to variable FILE

OUT="largest_individual.txt" #Aissgn the file txt to the variable OUT which will be the ouput file

> "$OUT" #Looked this up function is to create the output file if it doesn't already exist

#Looked this up mapfile read the line from the FILE stores it into an array called DATA
mapfile -t DATA < <(tail -n +2 "$FILE")

#Set variables to track the longest lenght and site location of male and females
MAX_M_LEN=0
MAX_M_SITE=""
MAX_F_LEN=0
MAX_F_SITE=""

#Create a loop to loop through each line in the DATA array
for LINE in "${DATA[@]}"
do
	#Extract the SITE from field 2
	SITE=$(echo "$LINE" | cut -d',' -f2)
	
	#Exctract the SEX from field 3
	SEX=$(echo "$LINE" | cut -d',' -f3)

	#Extract the LENGHT from field 4
	LENGHT=$(echo "$LINE" | cut -d',' -f4)
	
	#Create a if elif then loop to check if the samples are male
	#If SEX equal male then excute the following steps
	if [[ "$SEX" == "M" ]]; then
			
		#If they are male then if the lenght is greater than the maximum length then do the following
		if [ $LENGHT -gt  $MAX_M_LEN ]; then
			MAX_M_LEN=$LENGHT #Assign the value of the lenght to LENGHT which is re-assign maximum male lenght
			MAX_M_SITE=$SITE #Assign the value of the sites to SITE which is re-assign to maximum male site
		fi #Close the if statement 

	#Elif if the samples is female then do the following
	elif [[ "$SEX" == "F" ]]; then

		#If they are female then if the lenght is greater than the maximum lenght of the female then do the following
		if [ $LENGHT -gt  $MAX_F_LEN ]; then
                        MAX_F_LEN=$LENGHT #Assign the value of the lenght to LENGHT which is re-assign to maximum female lenght 
                        MAX_F_SITE=$SITE #Assign the value of the sites to SITE which is re-assign to maximum female site
		fi #Close the if statement 
	fi #Close the if elif then loop
done #Close the for loop

#Echo/print the longest male result and the male site location of this length to the output file with the following statement
echo "Length of the longest Male: ${MAX_M_LEN} and site code location was at: ${MAX_M_SITE}" >> "$OUT"

#Echo/print the longest female result and the female site location of the length to the output file with the following statement
echo "Length of the longest Female: ${MAX_F_LEN} and site code location was at: ${MAX_F_SITE}" >> "$OUT"

#Create if statement in order to check if the maximum male and female site are located at the same site or at different site then overwrite it into the output file
if [[ "$MAX_M_SITE" == "$MAX_F_SITE" ]]; then
	echo "Both were collated from the same site." >> "$OUT" 
else
	echo "Both were collated from different sites." >> "$OUT"
fi #Close the if else statement

