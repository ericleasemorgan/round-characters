#!/usr/bin/env bash

# extract-words.sh - a front-end to extract-words.py

# Claudia Carroll <ccarrol3@nd.edu> and Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# February 10, 2022 - first cut
# February 16, 2022 - adding output directory
# March    10, 2022 - making a bit faster by looking for equal number of files


# configure
EXTRACTTOM='./bin/extract-tom.py'
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

# get the number of files to process and the resulting .tom files
FILES=($( find $INPUT -name "$PATTERN" ) )
TOM=($( find $INPUT -name "*.tom" ) )

# if the lists are equal, then do... nothing; not a perfect check
if [[ ${#FILES[@]} = ${#TOM[@]}  ]]; then exit
else

	# initialize
	rm -rf $JOBS

	# process each file
	for FILE in "${FILES[@]}"; do

		# update the list
		printf "$FILE\t$NAME\t$OUTPUT\n" >> $JOBS

	done

	# submit the work and done
	cat $JOBS | parallel --colsep '\t' $EXTRACTTOM {1} {2} {3}

fi

# done
exit
