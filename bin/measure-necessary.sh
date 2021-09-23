#!/usr/bin/env bash

# measure-necessary.sh - a front-end to measure-necessary.py

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 23, 2021 - first cut


# configure
SCORES='./scores'
MEASURENECESSARY='./bin/measure-necessary.py'
JOBS='./tmp/jobs.tsv'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <directory>" >&2
	exit
fi

# get input
DIRECTORY=$1

# initialize
rm -rf $JOBS

# create a list of jobs
find $DIRECTORY -name "*.txt" | while read FILE; do

	# debug
	echo $FILE >&2

	# create output file name
	BASENAME=$(basename $FILE .txt)
	OUTPUT="$SCORES/$BASENAME.tsv"

	# update the list
	printf "$FILE\t$OUTPUT\n" >> $JOBS
	
done

# submit the work and done
cat $JOBS | parallel --colsep '\t' $MEASURENECESSARY {1} {2}
exit
