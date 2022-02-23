#!/usr/bin/env python

# measure-necessary.py - give a text calculate the degree it is necessary
# or unnecessary to interpret its sentences in order to garner it meaning

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 23, 2021 - originally written months and months ago, but tweaked for slightly different input
# February  16, 2022 - trying out stemming instead of lemmatizing


# configure
HEADER      = [ 'chapter', 'size', 'necessary count', 'necessary percentage', 'unnecessary count', 'unnecessary percentage', 'sentence' ]
NECESSARY   = './etc/tom-necessary.txt'
UNNECESSARY = './etc/tom-unnecessary.txt'
PATTERN     = '*.tom'

# require
import sys
import os
from nltk.stem import PorterStemmer
from glob import glob

# given a list of words, return their stems; not very pythonic
def stem( words ) :

	stems = []
	for word in words : stems.append( stemmer.stem( word ) )
	return stems
	
# sanity check and get input
if len( sys.argv ) < 2 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <directory>" )
directory = sys.argv[ 1 ]

# initialize
stemmer = PorterStemmer()
with open( NECESSARY )   as handle : tomNecessary  = handle.read().split( '\n' )
with open( UNNECESSARY ) as handle : tomUnecessary = handle.read().split( '\n' )

# stem the lists of necessary and unnecessary TOM words
tomNecessary  = stem( tomNecessary )
tomUnecessary = stem( tomUnecessary )

# initialize the output
print( '\t'.join( HEADER ) )

# process each file in the given directory and matching the configured pattern
for file in glob( directory + '/' + PATTERN ) :
	
	# get the key (chapter), open the file, stem the words, and count
	key = os.path.splitext( os.path.basename( file ) )[ 0 ]
	with open( file ) as handle : words = handle.read().split()
	stems  = stem( words )
	length = len( stems )

	# count necessary words and calculate percentage
	necessary_count = 0
	for word in tomNecessary : necessary_count += stems.count( word )
	try                      : necessary_percent = round( ( necessary_count / length ) * 100 )
	except ZeroDivisionError : necessary_percent = 0
	
	# count unnecessary words and calculate percentage
	unnecessary_count = 0
	for word in tomUnecessary : unnecessary_count += stems.count( word )
	try                      : unnecessary_percent = round( ( unnecessary_count / length ) * 100 )
	except ZeroDivisionError : unnecessary_percent = 0
	
	# output
	print( "\t".join( [ key, str( length ), str( necessary_count ), str( necessary_percent ), str( unnecessary_count ), str( unnecessary_percent ), ' '.join( words ) ] ) )
		
# done
exit
