FILE="Exam2_Levine_et_al_body_size.csv" #Assign the file csv to variable called FILE

OUT="sampling_summary.txt" #Assign the file txt to variable called OUT which will be the output file

>"$OUT" #Looked this up function is to create the output file if it doesn't already exist

#Count the number of unique site in field 2 and skip the header then assign this to the variable NUM_SITES
NUM_SITES=$(tail -n +2 "$FILE" | cut -d',' -f2 | sort | uniq | wc -l)

#echo/print the number of Number of sites from the variable value into the output file
#\t is used as a table space separation
echo -e "Number of sites:\t$NUM_SITES" >> "$OUT"

echo "" >> "$OUT" #Looked this up for better formatting this will add a blank line

#echo/print the columns called Site_code, N_samples, N_Females abd overwrite it into thw ouput file
#\t is used as tab space separation
echo -e "Site_Code\tN_Samples\tN_Males\t\tN_Females" >> "$OUT"

#Created a loop in order to loop through each unique site code within the FILE variable
for SITE in $(tail -n +2 "$FILE" | cut -d',' -f2 | sort| uniq)
do 
	TOTAL=$(grep "$SITE" "$FILE" | wc -l) #Count the total unique site code and assign it to the variable TOTAL

	MALE=$(grep "$SITE" "$FILE" | grep "M" | wc -l) #Count the male site by using M and assign it to the variable MALE

	FEMALE=$(grep "$SITE" "$FILE" | grep "F" | wc -l) #Count the female site by using F and assign it to the variable FEMALE

	#echo/print the sum of each variable used (SITE,TOTAL, MALE, and FEMALE) and overwrite it to the output file
	#used \t us ised as a table space separation ( used double for formatting)
	echo -e "$SITE\t\t$TOTAL\t\t$MALE\t\t$FEMALE" >> "$OUT"

done #Close loop 
