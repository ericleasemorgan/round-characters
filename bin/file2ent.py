#!/usr/bin/env python

# file2ent.py - given a plain text file, output a frequency list of named entities of type PERSON

# Claudia Carroll <ccarrol3@nd.edu> and Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# January 28, 2022 - first cut


# configure
MODEL = 'en_core_web_sm'
TYPE  = 'PERSON'

# require
import os.path
import spacy
import sys

# sanity check
if len( sys.argv ) != 2 : sys.exit( 'Usage: ' + sys.argv[ 0 ] + " <file>" )

# get input
file = sys.argv[ 1 ]

# create a key; not used, but will probably be used in a later version
key = os.path.splitext( os.path.basename( file ) )[ 0 ]

# slurp up the file 
with open ( file ) as handle : text = handle.read()

# model the text
nlp            = spacy.load( MODEL )
nlp.max_length = ( len( text ) + 1 )
doc            = nlp( text )

# process each entity in the doc; create a list of all persons
persons = {}
for entity in doc.ents :
		
	# check for desired type
	if entity.label_ == TYPE :
	
		# get the entity and normalize it a bit
		token = entity.text
		
		# update the list of persons and their frequency
		if token not in persons : persons[ token ] =  1
		else                    : persons[ token ] += 1

# sort the list of persons by frequency
persons = sorted( persons.items(), key=lambda x:x[ 1 ], reverse=True )

# parse out the most frequently mentioned person and done
print( persons[ 0 ][ 0 ] )
exit
	