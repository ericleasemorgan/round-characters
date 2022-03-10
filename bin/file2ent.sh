#!/usr/bin/env bash

# file2ent.sh - a front-ent to file2ent.py

# Claudia Carroll <ccarrol3@nd.edu> and Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 10, 2022 - first documentation


# configure
FILE2ENT='./bin/file2ent.py'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <directory>"
	exit
fi

# get input
BOOK=$1

# denote the file to process
FILE=$( basename $BOOK )
FILE="$BOOK/$FILE.txt"

# do the work
echo "Extracting main character from $FILE" >&2
CHARACTER=$( $FILE2ENT $FILE )
echo "The most frequently mentioned character in $FILE is $CHARACTER. Saving." >&2

# save for future reference
FILE=$( basename $BOOK )
FILE="$BOOK/$FILE.chr"
echo $CHARACTER > $FILE

# done
exit
