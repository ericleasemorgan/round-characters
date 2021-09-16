#!/usr/bin/env python

# character2sentence.py - given a character ID and tsv vile, output a list of sentences

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 10, 2021 - first investigations


# configure
CHARACTER = '6'
TSV       = './tokens/emma_009.tsv'

# require
import pandas as pd
import re

# initialize
tokens      = pd.read_csv( TSV, sep='\t' )
identifiers = sorted( set( tokens.loc[ tokens[ 'characterId' ] == CHARACTER ]['sentenceID'] ) )

# process each identifier
for identifier in identifiers :

	items = tokens[ tokens[ 'sentenceID' ] == identifier ]['originalWord']
	sentence = ' '.join( items )
	sentence = re.sub( '\W+' , ' ', sentence )
	sentence = re.sub( '^\W+' , '', sentence )
	sentence = re.sub( '\W+$' , '', sentence )
	print( sentence + '\n' )
