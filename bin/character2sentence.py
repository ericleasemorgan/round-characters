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
def identifiers2sentences( tokens, identifiers, directory, basename, type ) :

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
	file = directory + '/' + basename + '-' + type + '.txt'
	if path.exists( file ) : remove( file )
	with open( file, 'w' ) as handle : handle.write( '\n'.join( sentences ) )

	# done
	return( sentences )


# initialize
entities = ROOT + '/' + basename + '.entities'
quotes   = ROOT + '/' + basename + '.quotes'
tokens   = ROOT + '/' + basename + '.tokens'

# slurp up the entities, tokens, and quotes as data frames
entities = pd.read_csv( entities, sep='\t' )
quotes   = pd.read_csv( quotes, sep='\t' )
tokens   = pd.read_csv( tokens, sep='\t' )

# find the offsets of all sentences as well as the sentences spoken by the given character
allOffsets       = list( entities.loc[ entities[ 'COREF' ] == characterID ][ 'start_token' ] )
characterOffsets = list( quotes.loc[ quotes[ 'char_id' ] == characterID ][ 'quote_start' ] )

# use the offsets to get the sentence identifiers
allIdentifiers       = link( tokens, allOffsets )
characterIdentifiers = link( tokens, characterOffsets )

# subtract the character sentences from all the sentences to get the narrator sentences
narratorIdentifiers = allIdentifiers - characterIdentifiers

# based on the identifiers, save a list of sentences
narratorSentences  = identifiers2sentences( tokens, sorted( narratorIdentifiers ), ROOT, basename, 'narrator' )
characterSentences = identifiers2sentences( tokens, sorted( characterIdentifiers ), ROOT, basename, 'main' )

# done
exit()

