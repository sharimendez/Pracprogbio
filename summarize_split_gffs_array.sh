#!/bin/bash 

#create an array of features containing gene, mRNA, and exon
features=("gene" "mRNA" "exon")

echo -e "Chromosome\tgene\tmRNA\texon" > chromosome_summary.txt
#echo the words Chromosome, gene, mRNA, and exon using \t as tab space to create columns

for FILE in *.gff #Use a for loop that will loop through all chromosome .gff files 
do
	if [[ "$FILE" == "SLF_genomic.gff" ]]; then 
	#created a if then loop to exclude the file SLF_genomic.gff in chromosome_summary.txt
		continue #skip this file and continue
	fi #close if then loop
	 
	CHR=$(echo "$FILE")
	#Assign variable CHR to FILE which is SLF_genomic.txt

	LINE="$CHR"
	#Assign Line variable to the ouput line of variable CHR

	for feature in "${features[@]}" #Use for loop through eah feature in the features array
	do 
		COUNT=$(grep -v "^#" "$FILE" |cut -f3 | grep -x "$feature" | wc -l)
		#Extract all matching feature name and count the number of matching line of each feature that appears in the file
		#Exclude field 3 and any lien that start with #
		#Assign it the variable count

		LINE="$LINE\t$COUNT"
		#Append the feature count to the current output line 
		#Use \t to create a tab space 

	done #close loop
	
	echo -e "$LINE" >> chromosome_summary.txt
	#Echo the complete line for this chromosome to chromosome_summary.txt

done #close loop
