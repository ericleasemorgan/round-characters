#!/usr/bin/env python

# extract-words.py - given a JSON file and a proper name, output agent, poss, and mod words

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# February 10, 2022 - first cut; based on Claudia Carrol's jq recipe


# configure
EXTENSION = '.tom'

# require
import json
import sys
import os

# sanity check
if len( sys.argv ) != 4 : sys.exit( 'Usage: ' + sys.argv[ 0 ] + " <file> <name> <directory>" )

# get input
file      = sys.argv[ 1 ]
name      = sys.argv[ 2 ]
directory = sys.argv[ 3 ]

# read the given file
with open( file ) as handle : records = json.load( handle )
 
# process each character
characters = records[ 'characters' ]
for character in characters :

	# process each proper name
	propers = character[ 'mentions' ][ 'proper' ]
	for proper in propers :
		
		# filter by the given name
		if proper[ 'n' ] == name :
		
			# initialize
			words = []
			
			# get agent, poss, and mod words; could be more elegant
			for item in character[ 'agent' ] : words.append( item[ 'w' ] )
			for item in character[ 'poss' ]  : words.append( item[ 'w' ] )
			for item in character[ 'mod' ]   : words.append( item[ 'w' ] )
						
			# sort (just for fun) and create a string of words
			words = ' '.join( sorted( words ) )
						
			# denote a chapter name, output, and done
			basename = os.path.basename( os.path.splitext( file )[ 0 ] )
			file     = directory + '/' + basename + EXTENSION
			with open( file, 'w' ) as handle : handle.write( words )
			break

# The hero said, "Tonto, our work here is done."
exit()

			
			