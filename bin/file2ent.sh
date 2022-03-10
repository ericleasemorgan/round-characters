#!/usr/bin/env bash

# file2ent.sh - a front-ent to file2ent.py

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
CHARACTER=$( $FILE2ENT $FILE 2>/dev/null )
echo "The most frequently mentioned character in $FILE is $CHARACTER. Saving." >&2

# save for future reference
FILE=$( basename $BOOK )
FILE="$BOOK/$FILE.chr"
echo $CHARACTER > $FILE

# done
exit
