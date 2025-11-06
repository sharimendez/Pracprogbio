#!/bin/bash 

#Assign variable FILE to the file SLF_genomic.gff
FILE="SLF_genomic.gff"


TOTAL=$(grep -v "^#" "$FILE" | cut -f3 | wc -l) 
#Assign varaible TOTAL to count all words of unique features excluding field 3 and any #

GENE=$(grep -v "^#" "$FILE" | cut -f3 | grep -w "gene" | wc -l) 
#Assign varaible to grab all matching "gene" words within the file and exclude field 3 and any  #

MRNA=$(grep -v "^#" "$FILE" | cut -f3 | grep -w "mRNA | wc -l")
#Assign varaible to grab all matching "mRNA" words within the file and exclude field 3 and any  #

MRNA=$(grep -v "^#" "$FILE" | cut -f3 | grep -w "mRNA" | wc -l)

EXON=$(grep -v "^#" "$FILE" | cut -f3 | grep -w "exon" | wc -l)
#Assign varaible to grab all matching "exon" words within the file and exclude field 3 and any  #

echo "Total number of features: $TOTAL"
#echo the sentence Total number of features and the answer from the assigned variable of TOTAL

echo -e "gene:\t$GENE"
#echo gene words with the answer from the assigned variable of Gene
#the \t will create a tab space between gene and GENE while the -e will allow echo to interpret the function \t as tab

echo -e "mRNA:\t$MRNA"
#echo mRNA words with the answer from the assigned variable of MRNA
#the \t will create a tab space between mRNA and MRNA while the -e will allow echo to interpret the function \t as tab

echo -e "exon:\t$EXON"
#echo exon word with the answer from the assigned variable of EXON
#the \t will create a tab space between exon and EXON while the -e will allos echo to interpret the function -t as tab
