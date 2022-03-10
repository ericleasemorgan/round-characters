#!/usr/bin/env bash

# clean.sh - remove all the computed files from a directory (book)

# sanity check
if [[ -z $1 ]]; then
	echo "Usage: $0 <directory>" >&2
	exit
fi

# get input
DIRECTORY=$1

# do the work and done; a bit tricky
find $DIRECTORY -type f -not -name "*.txt" | parallel rm
exit