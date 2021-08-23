#!/usr/bin/env bash

# txt2json.sh - given the full path to a plain text file, model it and output the result of the BookNLP pipeline

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# August 23, 2021 - first cut; while in Lancaster


# configure
BOOKNLP='/afs/crc.nd.edu/user/e/emorgan/projects/round-characters/lib'
TOKENS='/afs/crc.nd.edu/user/e/emorgan/projects/round-characters/tokens'
JSON='/afs/crc.nd.edu/user/e/emorgan/projects/round-characters/json'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <file>" >&2
	exit
fi

# get input
FILE=$1

# initialize
BASENAME=$( basename $FILE .txt )

# make sane
cd $BOOKNLP

# do the work and done
./runjava novels/BookNLP -doc $FILE -printHTML -p $JSON -tok "$TOKENS/$BASENAME.tsv" -f -id $BASENAME
exit