#!/usr/bin/env python

# character2sentence.py - given a character ID and tsv vile, output a list of sentences

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 10, 2021 - first investigations
# September 20, 2021 - tweaked to add command-line input


# require
from os import remove, path
import pandas as pd
import re
import sys

# sanity check
if len( sys.argv ) != 4 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <file> <n> <output>" )

# get input
tsv        = sys.argv[ 1 ]
identifier = sys.argv[ 2 ]
output     = sys.argv[ 3 ]

# initialize
tokens      = pd.read_csv( tsv, sep='\t' )
identifiers = sorted( set( tokens.loc[ tokens[ 'characterId' ] == identifier ]['sentenceID'] ) )
if path.exists( output ) : remove( output )

# process each identifier
for identifier in identifiers :

	# parse
	items = tokens[ tokens[ 'sentenceID' ] == identifier ]['originalWord']
	
	# normalize
	sentence = ' '.join( items )
	sentence = re.sub( '\W+' , ' ', sentence )
	sentence = re.sub( '^\W+' , '', sentence )
	sentence = re.sub( '\W+$' , '', sentence )
	
	# output
	with open( output, 'a' ) as handle : handle.write( sentence + '\n' )

# done
exit()
