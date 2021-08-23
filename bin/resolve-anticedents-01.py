#!/usr/bin/env python

# resolve-antecedents-01.py - given a list of files, output plain text files with antecedents resolved
# usage: find ./pride -type f | xargs ./bin/resolve-anticedents-01.py

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# November 3, 2020 (Election Day) - first cut; see https://medium.com/swlh/make-your-bot-understand-the-context-of-a-discourse-4b740d46166c


# configure
MODEL     = 'en_core_web_lg'
PRONOUNS  = [ 'he', 'she', 'him', 'his', 'her', 'they', 'them', 'their' ]
DIRECTORY = './txt2anticedents-01'

# require
import os
import spacy
import sys
import textacy.preprocessing

# sanity check
if len( sys.argv ) < 2 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <file1> [<file2> ... ]" )

# define; find the names of people in the given sentence
def find_antecedents( sentence ) :

	for entity in sentence.ents :
		if entity.label_ == 'PERSON' : return entity.text

	return False


# return maximum size of a set of files
def get_maximum_size( files ) :
	
	# initialize
	maximum = 0
	
	# process each file
	for file in files :

		# get the size, compare, and conditionally update
		size = os.stat( file ).st_size
		if size > maximum : maximum = size
		
	# increase by one and done
	maximum += 1
	return maximum


# the hard work is defined here
def process_file( key, input_file, output_file ) :

	# re-initialize
	text = open( input_file ).read()

	# normalize
	text = textacy.preprocessing.normalize.normalize_hyphenated_words( text )
	text = textacy.preprocessing.normalize.normalize_whitespace( text )
	text = text.replace( '\n', ' ' )

	# create a spaCy object from the text and extract each sentence
	doc       = nlp( text )
	sentences = list( doc.sents )

	# create output file
	with open( output_file, 'w' ) as handle :

		# process each sentence
		for index, sentence in enumerate( sentences ) :
	
			# don't process the first sentence, just output it
			if ( index == 0 ) : 
				print( "\t".join( ( str( index ), sentence.text ) ), file=handle )
				print( file=handle )
				continue
	
			# re-initialize
			previous_sentence = sentences[ index - 1 ]
			current_sentence  = sentence
			updated_sentence  = current_sentence.text
	
			# process each token ("word") in the current sentence
			for token in current_sentence :
		
				# check to see of the token is a pronoun
				if ( token.tag_ == 'PRP' or token.tag_ == 'PRP$' ) and token.text.lower() in PRONOUNS :
			
					# try to find the name of a person in the previous sentence
					entity = find_antecedents( previous_sentence )
			
					# if found, then update the current sentence accordingly
					if entity :
						pronoun          = token.i - current_sentence[ 0 ].i
						updated_sentence = current_sentence[ :pronoun ].text + ' ' + entity + ' ' + current_sentence[ pronoun + 1: ].text

			# output
			print( "\t".join( ( str( index ), sentence.text ) ), file=handle )
			print( "\t".join( ( str( index ), updated_sentence ) ), file=handle )
			print( file=handle)


# initialize
files   = sys.argv[ 1: ]
maximum = get_maximum_size( files )
nlp     = spacy.load( MODEL, max_length=maximum )

# process each given file
for input_file in files :

	# get the key and compute the output file name
	key         = os.path.splitext( os.path.basename( input_file ) )[ 0 ]
	output_file = os.path.join( DIRECTORY, key + ".txt" )

	# try to do the work
	try : process_file( key, input_file, output_file )
	
	# output unsuccessful tries
	except ValueError as err : print( key, err )

# done
exit()
