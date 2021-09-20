#!/usr/bin/env bash

# character2sentence.sh - a front-end to character2sentence.py

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 20, 2021 - first cut; back from Lancaster


# configure
SENTENCES='./sentences'
CHARACTER2SENTENCE='./bin/character2sentence.py'
EXTENSION='.tsv'
JOBS='./tmp/jobs.tsv'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <tsv>" >&2
	exit
fi

# get input
TSV=$1

# initialize
rm -rf $JOBS

# create a list of jobs
cat $TSV | while read FILE IDENTIFIER; do

	# debug
	echo $FILE >&2
	echo $IDENTIFIER >&2
	echo

	# create output file name
	BASENAME=$(basename $FILE .tsv)
	OUTPUT="$SENTENCES/$BASENAME.txt"

	# update the list
	printf "$FILE$EXTENSION\t$IDENTIFIER\t$OUTPUT\n" >> $JOBS
	
done

# submit the work and done
cat $JOBS | parallel --colsep '\t' $CHARACTER2SENTENCE {1} {2} {3}
exit
