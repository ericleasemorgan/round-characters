#!/usr/bin/env python

# character2sentence.py - given a file's basename, an ID, and a speaker, output a list of sentences

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 10, 2021 - first investigations
# September 20, 2021 - tweaked to add command-line input
# October   15, 2021 - hacking to accomodate speakers


# configure, in liu of command line input
TSV               = './tokens'
JSON              = './json'
SENTENCESMAIN     = './sentences-main'
SENTENCESNARRATOR = './sentences-narrator'

# require
from os import remove, path
import json
import pandas as pd
import re
import sys

# sanity check; get input
if len( sys.argv ) != 3 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <basename> <id>" )
basename    = sys.argv[ 1 ]
characterID = sys.argv[ 2 ]

# define link token offset to sentence id
def link( tokens, offsets ) :

	# initialize
	items = []
	
	# process each offset
	for offset in offsets :

		# find the token, get the identifier, and update
		identifier = list( tokens.loc[ tokens[ 'tokenId' ] == offset ][ 'sentenceID' ])[ 0 ]
		items.append( identifier )

	# done; return a set
	return set( items )
	

# define save sentences
def saveSentences( identifiers, directory, basename ) :

	# initialize
	sentences = []
	
	# process each identifier
	for identifier in identifiers :

		# parse
		items = tokens[ tokens[ 'sentenceID' ] == identifier ]['originalWord']
	
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
	return


# initialize
tsv    = TSV  + '/' + basename + '.tsv'
data   = JSON + '/' + basename + '.json'
main   = []
others = []

# slurp up the given json file
with open( data, 'r' ) as handle : data = json.load( handle )

# get and process each character
characters = data[ 'characters' ]
for character in characters :
		
	# get and process each spoken sentence
	sentences = character[ 'speaking' ]
	for sentence in sentences :
	
		# parse and update accordingly
		offset = sentence[ 'i' ]
		if str( character[ 'id' ] ) == characterID : main.append( offset )
		else : others.append( offset )

# slurp up the tokens
tokens = pd.read_csv( tsv, sep='\t' )

# link offsets to sentence identifiers; create sets of sentence identifiers
main   = link( tokens, main )
others = link( tokens, others )
	
# get all sentences regarding the given character; (falsely) assume they are all narrator sentences
narrator = set( tokens.loc[ tokens[ 'characterId' ] == characterID ][ 'sentenceID' ] )

# subtract the main character's and the other character's sentences to get true narrator sentences
narrator = narrator.difference( main )
narrator = narrator.difference( others )

# debug
print( "main character's sentences:", sorted( main ) )
print( "narrator sentences:", sorted( narrator ) )

# output
saveSentences( main, SENTENCESMAIN, basename )
saveSentences( narrator, SENTENCESNARRATOR, basename )

# done
exit()

