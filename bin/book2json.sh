#!/usr/bin/env bash

# book2json.sh - given than name of a book, output BookNLP results for each found txt file

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# August 23, 2021 - first cut; while in Lancaster


# configure
BOOKS='/afs/crc.nd.edu/user/e/emorgan/projects/round-characters/books'
TXT2JSON='./bin/txt2json.sh'
JSON='/afs/crc.nd.edu/user/e/emorgan/projects/round-characters/json'
HTML='/afs/crc.nd.edu/user/e/emorgan/projects/round-characters/html'

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <book>" >&2
	exit
fi

# get input and submit the work; could use error checking
BOOK=$1
find "$BOOKS/$BOOK" -name *.txt | parallel $TXT2JSON

# clean up
find $JSON -name *.html | parallel mv {} $HTML
find $JSON -name *.book | parallel rename .book .json {}

# done
exit
