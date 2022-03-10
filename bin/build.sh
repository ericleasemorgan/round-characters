#!/usr/bin/env bash

# build.sh - one script to rule them all

# Claudia Carroll <ccarrol3@nd.edu> and Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 10, 2022 - first documentation


# configure
CORPUS='corpus'
BOOK2BOOKNLP='./bin/book2booknlp.sh'
FILE2ENT='./bin/file2ent.sh'
EXTRACTTOM='./bin/extract-tom.sh'
MEASURENECESSARY='./bin/measure-necessary.py'
TMP='./tmp'
JOBS='./tmp/jobs.tsv'

# make sane
rm -rf $TMP
mkdir $TMP

# create a list of all books to process
BOOKS=($( find $CORPUS/ -type d -not -name "." -not -name $CORPUS ))

# for each book, create a list of character extraction jobs to process
for BOOK in "${BOOKS[@]}"; do
	
	# denote character file
	FILE=$( basename $BOOK )
	FILE="$BOOK/$FILE.chr"
	
	# update the list of jobs, conditionally
	if [[ ! -f $FILE ]]; then echo $BOOK >> $JOBS; fi
	
done

# submit the work, conditionally
if [[ -f $JOBS ]]; then cat $JOBS | parallel $FILE2ENT; fi

# loop through the again doing the balance of the work
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
	$EXTRACTTOM $BOOK $CHARACTER $BOOK
	
	# measure necessary/unnecessary
	echo "  Measuring necessary/unnecessary" >&2
	FILE=$( basename $BOOK )
	FILE="$BOOK/$FILE.tsv"
	if [[ ! -f $FILE ]]; then $MEASURENECESSARY $BOOK > $FILE; fi
	
	# delimit
	echo
		
done
