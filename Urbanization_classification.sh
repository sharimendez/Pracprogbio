#!/bin/bash

FILE="Exam2_Levine_et_al_body_size.csv" #Assign the file csv to variable FILE

OUT="Urbanization_classification.txt" #Aissgn the file txt to the variable OUT which will be the ouput file

>"$OUT" #Looked this up function is to create the output file if it doesn't already exist

#echo/print two columns called Sites_Code and Class and overwrite it into output file
#\t is used as a table space separation
echo -e "Sites_Code\tClass" >> "$OUT"

#Looked this up mafile read the line in the FILE and stores them into an array called SITES here
#The array will store the unique sites, remove the header, cut and extracts field 2, sort and give uniq values 
mapfile -t SITES < <(tail -n +2 "$FILE" | cut -d',' -f2 | sort | uniq)

#Created a loop tp loop through the each site code from the array
for SITE in "${SITES[@]}"
do 	
	#Extract the values from field 5 from the first row containing this value
	#Looked this up the tr removes any whitedspace from the value
	VALUE=$(grep "$SITE" "$FILE" | head -n 1 | cut -d',' -f5 | tr -d '[:space:]')
	
	#Create a if - else the statment for each condition
	#If the value is less than 15 then
	if [ "$VALUE" -lt 15 ]; then
		CLASS="Rural" #Assign the value to CLASS which is assign to rural

	#If-else the value is greater than 5 but less than 49 then
	elif [ "$VALUE" -ge 15 ] && [ "$VALUE" -lt 49 ]; then 
		CLASS="Suburban" #Assign the value to CLASS which is assign to suburban
	
	else #Else all other value greater than or equal to  50 
		CLASS="Urban"#Assign the value to CLASS which is assign to urban

	fi #Close if elif then loop
	
	#Echo/print the the values of variable SITE and CLASS to the respected fields and overwrite it into output file
	#\t is used as a table space separation
	echo -e "${SITE}\t\t${CLASS}" >> "$OUT"

done #Close loop

