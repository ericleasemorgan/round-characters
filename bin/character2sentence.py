#!/usr/bin/env python

# character2sentence.py - given a file's basename, an ID, and a speaker, output a list of sentences

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 10, 2021 - first investigations
# September 20, 2021 - tweaked to add command-line input
# October   15, 2021 - hacking to accomodate speakers
# January   25, 2022 - revising to work with Python BookNLP


# configure
ROOT = './tmp'

# require
from os import remove, path
import json
import pandas as pd
import re
import sys

# sanity check; get input
if len( sys.argv ) != 3 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <basename> <id>" )
basename    = sys.argv[ 1 ]
characterID = int( sys.argv[ 2 ] )

# define link token offset to sentence id
def link( tokens, offsets ) :

	# initialize
	items = []
	
	# process each offset
	for offset in offsets :

		# find the token, get the identifier, and update
		identifier = list( tokens.loc[ tokens[ 'token_ID_within_document' ] == offset ][ 'sentence_ID' ] )[ 0 ]
		items.append( identifier )

	# done; return a set
	return set( items )
	

# given tokens and identifiers, return sentences
def identifiers2sentences( tokens, identifiers, directory, basename ) :

	# initialize
	sentences = []
	
	# process each identifier
	for identifier in identifiers :

		# parse
		items = tokens[ tokens[ 'sentence_ID' ] == identifier ][ 'word' ]
	
		# to the best of my ability, normalize; why are there tab characters here?
		sentence = ' '.join( items )
		sentence = re.sub( '\t+',  ' ',   sentence )
		sentence = re.sub( ' +',   ' ',   sentence )
		sentence = re.sub( '^ +',  '',    sentence )
		sentence = re.sub( ' +$',  '',    sentence )
		sentence = re.sub( ' \.',  '.',   sentence )
		sentence = re.sub( ' ,',   ',',   sentence )
		sentence = re.sub( ' ;',   ';',   sentence )
		sentence = re.sub( " 's ", "'s ", sentence )
			
		# update
		sentences.append( sentence )
			
	# create file name, (re-)initialize, and output
	file = directory + '/' + basename + '.txt'
	if path.exists( file ) : remove( file )
	with open( file, 'w' ) as handle : handle.write( '\n'.join( sentences ) )

	# done
	return( sentences )


# initialize
entities = ROOT + '/' + basename + '.entities'
tokens   = ROOT + '/' + basename + '.tokens'

# slurp up the entities and tokens as data frames
entities = pd.read_csv( entities, sep='\t' )
tokens   = pd.read_csv( tokens, sep='\t' )

# find the offsets for the given character
offsets     = list( entities.loc[ entities[ 'COREF' ] == characterID ][ 'start_token' ] )
identifiers = link( tokens, offsets )

# based on the identifiers, save a list of sentences
sentences = identifiers2sentences( tokens, identifiers, ROOT, basename )

# done
exit()

