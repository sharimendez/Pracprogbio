#!/bin/bash

FILE="SLF_genomic.gff" #Assign the variable FILE to file name to SLF_genomic.gff

echo -e "Chromsome\tGeneCount\tClass" > density_report.txt
#echo the words Chromosome GeneCoutn and Class
#Use \t to create a tab space for columns and -e is used to echo can interpret \t as tab space
#Overwrite this to density_report.txt file

grep -v "^#" "$FILE" | cut -f1,3 | grep -w "gene" | cut -f1 | sort | uniq -c |
#Extract, sort, and show unique feature by counting from SLF_genomic.gff exlude field 1 and 3 and any lines that start with #

while read COUNT CHR #Use while loop to read two variables (chromosome and gene count) from each line of uniq -c output
do
	if [ $COUNT -gt 2000 ] #If the gene count is greater than 2000 then
	then
		echo -e "${CHR}\t${COUNT}\tHigh-Density" >> density_report.txt
		#Label the chromsome as High density 
		#Echo the values of chromsome and gene count and append it to density_report.txt
		#Use \t to create tab spaces for columns
	else
		echo -e "${CHR}\t${COUNT}\tLow-Density" >> density_report.txt
		#Label the chrosmome as Low density
		#Echo the vavlue of chromosome and gene count and apped it to density_report.txt
		#Use \t to create tab space for columns
        
	fi #close if then else loop
done #Close while loop
