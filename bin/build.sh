#!/usr/bin/env bash

# build.sh - one script to rule them all

# configure
CORPUS='corpus'
BOOK2BOOKNLP='./bin/book2booknlp.sh'
FILE2ENT='./bin/file2ent.py'
EXTRACTWORDS='./bin/extract-words.sh'
MEASURENECESSARY='./bin/measure-necessary.py'

# process each book in the corpus
BOOKS=($( find $CORPUS/ -type d -not -name "." -not -name $CORPUS ))
for BOOK in "${BOOKS[@]}"; do

	# debug
	echo "Processing $BOOK" >&2
	
	# get the main character
	FILE=$( basename $BOOK )
	FILE="$BOOK/$FILE.txt"
	echo "  Exracting the main character from $FILE." >&2

	# check for main character file
	FILE=$( basename $BOOK )
	FILE="$BOOK/$FILE.chr"
	if [[ -f $FILE ]]; then
		CHARACTER=$( cat $FILE )
		echo "  The most frequently mentioned character is $CHARACTER." >&2

	else
	
		FILE=$( basename $BOOK )
		FILE="$BOOK/$FILE.txt"
		CHARACTER=$( $FILE2ENT $FILE 2>/dev/null | head -n 1 | cut -f1 )
		echo "  The most frequently mentioned character is $CHARACTER." >&2
		echo "  Saving it for future reference" >&2
		FILE=$( basename $BOOK )
		FILE="$BOOK/$FILE.chr"
		echo $CHARACTER > $FILE
	
	fi
	
	# process the book with Python BookNLP
	echo "  Processing $BOOK with Python BookNLP" >&2
	$BOOK2BOOKNLP $BOOK $BOOK 2>/dev/null 1>/dev/null 
	
	# extract agent, pos, and mods words
	echo "  Extracting agent, pos, and mods words associated with $CHARACTER." >&2
	$EXTRACTWORDS $BOOK $CHARACTER $BOOK
	
	# measure necessary/unnecessary
	echo "  Measuring necessary/unnecessary" >&2
	FILE=$( basename $BOOK )
	FILE="$BOOK/$FILE.tsv"
	$MEASURENECESSARY $BOOK > $FILE
	
	# delimit
	echo
		
done
