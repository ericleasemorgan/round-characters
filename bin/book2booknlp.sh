#!/usr/bin/env bash

# book2booknlp.sh - a front-end to book2booknlp.py

# Claudia Carroll <ccarrol3@nd.edu> and Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# January 20, 2022 - first cut


# configure
BOOK2BOOKNLP='./bin/book2booknlp.py'
JOBS='./tmp/jobs.tsv'

# sanity check
if [[ -z $1 || -z $2 ]]; then
	echo "Usage: $0 <input directory> <output directory>" >&2
	exit
fi

# get input
INPUT=$1
OUTPUT=$2

# get the number of files to process and the resulting .html files
FILES=($( find $INPUT -regex ".*_.*\.txt" ))
BOOKS=($( find $OUTPUT -name "*.html" ))

# if the lists are equal, then do... nothing
if [[ ${#FILES[@]} = ${#BOOKS[@]}  ]]; then exit
else

	# initialize
	rm -rf $JOBS

	for FILE in "${FILES[@]}"; do
   
	   # get the identifier
	   ID=$( basename $FILE '.txt' )

		# update the list of jobs
		printf "$ID\t$FILE\t$OUTPUT\n" >> $JOBS

	done

	# submit the work and done
	cat $JOBS | parallel --colsep '\t' $BOOK2BOOKNLP {1} {2} {3}

fi

# done
exit
