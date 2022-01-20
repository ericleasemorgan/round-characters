#!/usr/bin/env python

# sentences2files.py - given a file of sentences and a directory, create bunches o' files

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# January 6, 2022 - first cut


# configure
PADDING = 3

# require
import sys

# sanity check; get input
if len( sys.argv ) != 3 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <file> <directory>" )
file      = sys.argv[ 1 ]
directory = sys.argv[ 2 ]

# slurp up all the sentences and process each one
with open( file ) as handle : sentences = handle.read().split( '\n' )
for index, sentence in enumerate( sentences ) : 

	# increment
	index = str(index + 1 ).zfill( PADDING )
	
	# configure output, and... output
	output = directory + '/sentence-' + index + '.txt'
	with open( output, 'w' ) as handle : handle.write( sentence )
