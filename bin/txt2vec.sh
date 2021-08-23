#!/usr/bin/env bash

# txt2vec.sh - given a study carrel, create a set of vectors for MALLET	

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# August 4, 2020 - first cut for the Reader Toolbox


# configure
MALLETHOME='./mallet'
MODELDIR='tmp'
VECTORS='model.vec'
CORPUS='sentences'
STOPWORDS='etc/en.txt'

# initialize
PWD=`pwd`
CORPUS="$PWD/$CORPUS"
VECTORS="$PWD/$MODELDIR/$VECTORS"
STOPWORDS="$PWD/$STOPWORDS"

# make sane
mkdir -p $MODELDIR

# do the work
$MALLETHOME/bin/mallet import-dir \
	--input $CORPUS \
	--output $VECTORS \
	--keep-sequence TRUE \
    --stoplist-file	$STOPWORDS
    
# done
exit
