#!/usr/bin/env bash

# extract-words.sh - a front-end to extract-words.py

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# February 10, 2022 - first cut
# February 16, 2022 - adding output directory


# configure
EXTRACTWORDS='./bin/extract-words.py'
PATTERN='*.book'
JOBS='./tmp/jobs.tsv'

# sanity check
if [[ -z $1 || -z $2 || -z $3 ]]; then
	echo "Usage: $0 <input directory> <name> <output directory>" >&2
	exit
fi

# get input
INPUT=$1
NAME=$2
OUTPUT=$3

# initialize
rm -rf $JOBS

# create a list of jobs
find $INPUT -name "$PATTERN" | while read FILE; do

	# debug
	#echo $FILE >&2
	
	# update the list
	printf "$FILE\t$NAME\t$OUTPUT\n" >> $JOBS

done

# submit the work and done
cat $JOBS | parallel --colsep '\t' $EXTRACTWORDS {1} {2} {3}
exit
