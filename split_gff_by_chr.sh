#!/bin/bash

#Assign variable FILE to the file name SLF_genomic.gff
FILE="SLF_genomic.gff"

grep -v "^#" "$FILE" | cut -f1 | sort | uniq > chrIDS_list.txt
#Extract, sort, unique features from the file name SLF_genomic.gff excluding field 1 and any #
#Write the results in chrIDS_list.txt

while read CHR #Use while loop to read each chromosome ID from the file 
do 
	grep -w "^$CHR" "$FILE" > ${CHR}.gff 
	#For each chromosome extract all its line and save it to a new file ending with .gff

	echo "Wrote ${CHR}.gff"
	#Echo the word Wrote before the new file 

done < chrIDS_list.txt #Close loop but read each chromosome ID from the txt file until the file ends
