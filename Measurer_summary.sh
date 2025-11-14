#!/bin/bash
FILE="Exam2_Levine_et_al_body_size.csv" #Assign the file csv to variable FILE

OUT="measurer_summary.txt" #Aissgn the file txt to the variable OUT which will be the ouput file

> "$OUT" #Looked this up function is to create the output file if it doesn't already exist

#Echo/print the following 5 columns and overwrite it to the output file
#\t is used as a table space separation
echo -e "Measurer\t#Samples\t#Rural\t\t#Suburban\t#Urban" >> "$OUT"

#Looked this up mapfile read the line in the FILE and stores them into an array called MEASURERS here
#This command  array remove the header, cut and extracts field 1, sort and uniq removes duplicates 
mapfile -t MEASURERS < <(tail -n +2 "$FILE" | cut -d',' -f1 | sort| uniq)

#Create a for loop that goes through from the array 
for M in "${MEASURERS[@]}"
do
	#Assign the total number of rows from measurer to the variable TOTAL
	TOTAL=$(grep "$M" "$FILE" | wc -l)
	
	#Set a counter for the following variable categories
	RURAL=0
	SUBURBAN=0
	URBAN=0	
	
	#Store the row from measurer into a new array called LINES 
	mapfile -t LINES < <(grep "$M" "$FILE")
	
	#Create a for loop to loop through each line from the array 
	for LINE in "${LINES[@]}"
	do
		#Assign the extraction of the site code from field 2 to the variable SITES
		SITES=$(echo "$LINE" | cut -d',' -f2)

		#Assign the extraction of the VALUE from field 5
		#Looked up the tr removes whitespace
		VALUE=$(echo $LINE | cut -d',' -f5 | tr -d '[:space:]')
		
		#Create if statement in order to classify the VAlUE to its appropriate counter
		#If the VALUE is less than 15 then do the following
		if [ "$VALUE" -lt 15 ]; then
                	((RURAL++)) #Add to the counter of rural in order to obtain the total value 

		#Elif the VALUE is between 15 and 49 then do the following
        	elif [ "$VALUE" -ge 15 ] && [ "$VALUE" -lt 49 ]; then
                	((SUBURBAN++)) #Add to the counter of suburban in order to obtain the total value        	

		else #Else the VALUE is greater than 50 then do the following 
                	((URBAN++)) #Add to the counter of urban in order to obtain the total value 

        	fi #Close the if statement 

	done #Close the for loop

#Echo/print the values of each variable for its following column and overwrite it into the output file
echo -e "$M\t\t$TOTAL\t\t$RURAL\t\t$SUBURBAN\t\t$URBAN" >> "$OUT"

done #Close the for loop 
