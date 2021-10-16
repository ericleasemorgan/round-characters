#!/usr/bin/env bash

# character2sentence.sh - a front-end to character2sentence.py
# usage: find etc -name 'characters*.tsv' -exec ./bin/character2sentence.sh {} \;

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 20, 2021 - first cut; back from Lancaster
# October   16, 2021 - modified for new version of character2sentence.py; Alexandra's birthday


# configure
CHARACTER2SENTENCE='./bin/character2sentence.py'
EXTENSION='tsv'
ROOT='./tokens'
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
	echo $FILE       >&2
	echo $IDENTIFIER >&2
	echo

	# get the base name (key)
	BASENAME=$(basename $FILE .tsv)

	# update the list
	printf "$BASENAME\t$IDENTIFIER\n" >> $JOBS
	
done

# submit the work and done
cat $JOBS | parallel --colsep '\t' $CHARACTER2SENTENCE {1} {2}
exit
