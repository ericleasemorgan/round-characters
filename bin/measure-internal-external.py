#!/usr/bin/env python

# measure-internal-external.py - given a text calculate the degree it is internal or external

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 23, 2021 - originally written months and months ago, but tweaked for slightly different input
# November  30, 2021 - now using pre-processed data


# configure
NECESSARY   = './etc/tom-necessary.txt'
UNNECESSARY = './etc/tom-unnecessary.txt'

# require
import sys
import os
import string

# sanity check and get input
if len( sys.argv ) != 2 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <file>" )
file = sys.argv[ 1 ]

# initialize
necessary   = 0
unnecessary = 0
key         = os.path.splitext( os.path.basename( file ) )[ 0 ]
with open( file ) as handle : sentences = handle.read().split( '\n' )
with open( NECESSARY ) as handle : tomNecessary = handle.read().split( '\n' )
with open( UNNECESSARY ) as handle : tomUnecessary = handle.read().split( '\n' )

# process each sentence
for sentence in sentences :

	# create a list of normalized tokens (words)
	sentence = sentence.translate( str.maketrans( '', '', string.punctuation ) )	
	tokens = [ token.lower() for token in sentence.split() ]

	# process each token
	for token in tokens :
	
		if token in tomNecessary   : necessary   += 1
		if token in tomUnecessary : unnecessary += 1
	
# done
print( '\t'.join( [ key, str( necessary ), str( unnecessary ) ] ) )
exit()
