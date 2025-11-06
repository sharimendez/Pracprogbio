#!/bin/bash

#Assign the variable FILE to the file name to SLF_genomic.gff
FILE="SLF_genomic.gff"

echo -e "Chromsome\tGenecount"
#echo the words Chromosome and Gene cout
#use \t to create a tab space for columns and -e is used to echo can interpret \t as tab space

grep -v "^#" "$FILE" | cut -f1,3 | grep -w "gene" | cut -f1 | sort | uniq -c |
#Extract, sort and show unique feature byt counting from SLF_genomic.gff excluded field 1 and 3 and any #

while read COUNT CHR #Use while loop will read two variables (chromsome and gene count) from each line of uniq -c output 
do 
	echo -e "${CHR}\t${COUNT}" #Echo the two variables using a tab space
done #close loop


