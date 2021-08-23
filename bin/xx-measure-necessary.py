#!/usr/bin/env python

# measure-necessary.py - give a text calculate the degree it is necessary
# or unnecessary to interpret its sentences in order to garner it meaning


# configure
MODEL       = 'en_core_web_lg'
HEADER      = [ 'name', 'id', 'size', 'necessary count', 'necessary percentage', 'unnecessary count', 'unnecessary percentage', 'sentence' ]
NECESSARY   = [ 'absence', 'account', 'air', 'among', 'and', 'attended', 'attending', 'books', 'breakfast', 'capable', 'character', 'congratulations', 'dances', 'discussion', 'each', 'edged', 'either', 'employments', 'endeavour', 'exercise', 'favourite', 'felicity', 'field', 'game', 'given', 'hall', 'hasty', 'have', 'head', 'how', 'immediately', 'invitation', 'kent', 'ladies', 'lambton', 'lawn', 'looks', 'misery', 'off', 'parsonage', 'pleased', 'prevent', 'put', 'quitted', 'readily', 'reading', 'rejoiced', 'running', 'satisfaction', 'seated', 'sent', 'several', 'shame', 'sitting', 'situation', 'sometimes', 'speaking', 'stairs', 'stood', 'struck', 'such', 'sunk', 'talk', 'talked', 'talking', 'tears', 'tour', 'usual', 'vain', 'warmth', 'what', 'where', 'william', 'work', 'young' ]
UNNECESSARY = [ 'after', 'again', 'all', 'and', 'answer', 'any', 'away', 'been', 'before', 'being', 'bingley', 'but', 'charlotte', 'collins', 'could', 'darcy', 'did', 'elizabeth', 'every', 'felt', 'first', 'for', 'from', 'had', 'have', 'heard', 'her', 'herself', 'him', 'his', 'into', 'its', 'jane', 'lady', 'little', 'looked', 'made', 'might', 'miss', 'more', 'mother', 'much', 'not', 'now', 'one', 'only', 'other', 'over', 'room', 'said', 'saw', 'see', 'she', 'sister', 'soon', 'such', 'than', 'that', 'their', 'them', 'there', 'they', 'this', 'though', 'two', 'very', 'was', 'were', 'what', 'when', 'which', 'who', 'wickham', 'with', 'would' ]

# require
import sys
import os
import spacy
import string

# sanity check; get input
if len( sys.argv ) < 2 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <file>" )
file = sys.argv[ 1 ]

# initialize
nlp       = spacy.load( MODEL )
text      = open( file ).read()
doc       = nlp( text )
sentences = list( doc.sents )
key       = os.path.splitext( os.path.basename( file ) )[ 0 ]

# start output
print( "\t".join( HEADER ) )

# process each sentence
s = 0
for sentence in sentences :

	# increment
	s += 1

	# process each token
	found = False
	for token in sentence :
	
		# check for person-like word
		if ( ( token.pos_ == 'PROPN' ) or ( token.pos_ == 'PRON' ) ) :
			
			# update and done
			found = True
			break
			
	# only continue of a person-like word was found
	if ( found == False ) : continue
	
	# normalize the sentence
	sentence = sentence.text.replace( '\r', '' ).replace ( '\n', '' ).lower()
	sentence = sentence.translate( str.maketrans( '', '', string.punctuation ) )	
	
	# skip empty sentences
	if ( sentence == '' ) : continue
	
	# tokenize the sentence
	tokens = sentence.split()
	length = len( tokens )
	
	# count necessary words and calculate percentage
	necessary_count = 0
	for word in NECESSARY : necessary_count += tokens.count( word )
	necessary_percent = round( ( necessary_count / length ) * 100 )

	# count unnecessary words and calculate percentage
	unnecessary_count = 0
	for word in UNNECESSARY : unnecessary_count += tokens.count( word )
	unnecessary_percent = round( ( unnecessary_count / length ) * 100 )

	# increment and output
	print( "\t".join( [ key, str( s ), str( length ), str( necessary_count ),  str( necessary_percent ), str( unnecessary_count ), str( unnecessary_percent ), sentence ] ) )
	
	
	
	#? fo bar
	
# done
exit
