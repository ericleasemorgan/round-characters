#!/usr/bin/env python

# character2sentence.py - given a character ID and json file, output a list of spoken sentences

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# October 12, 2021 - first investigations


# require
from os import remove, path
import         json
import         sys

# sanity check
if len( sys.argv ) != 4 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <file> <n> <output>" )

# get input
file       = sys.argv[ 1 ]
identifier = sys.argv[ 2 ]
output     = sys.argv[ 3 ]

# sanitize
if path.exists( output ) : remove( output )

# initialize; read the json file
with open( file, 'r' ) as handle : data = json.load( handle )

# get and process each character
characters = data[ 'characters' ]
for character in characters :
	
	# re-initialize
	found = False
	
	# check for desired character
	if str( character[ 'id' ] ) == identifier :
	
		# success; flag and done
		found = True
		break

# conditionally continue
if found :

	# get and process each sentence
	sentences = character[ 'speaking' ]
	for sentence in sentences :
	
		# parse and output
		words = sentence[ 'w' ]
		with open( output, 'a' ) as handle : handle.write( words + '\n' )


	
