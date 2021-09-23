#!/usr/bin/env python

# measure-necessary.py - give a text calculate the degree it is necessary
# or unnecessary to interpret its sentences in order to garner it meaning

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 23, 2021 - originally written months and months ago, but tweaked for slightly different input


# configure
MODEL       = 'en_core_web_sm'
HEADER      = [ 'chapter', 'id', 'size', 'necessary count', 'necessary percentage', 'unnecessary count', 'unnecessary percentage', 'sentence' ]
NECESSARY   = [ 'accompany', 'add', 'address', 'agree', 'announce', 'answer', 'appeal', 'arrive', 'assure', 'attempt', 'attend', 'carry', 'charm', 'close', 'close', 'consent', 'dance', 'declare', 'deliver', 'discuss', 'dissuade', 'eat', 'enter', 'entreat', 'explain', 'frown', 'glance', 'go', 'hit', 'hold', 'inform', 'inquire', 'join', 'laugh', 'leave', 'look', 'make', 'mention', 'nod', 'noise', 'obey', 'pass', 'perform', 'persuade', 'place', 'play', 'press', 'promote', 'put', 'quiet', 'quit', 'refuse', 'relate', 'replay', 'reply', 'require', 'return', 'run', 'scowl', 'see', 'shake', 'silent', 'sit', 'sleep', 'smile', 'speak', 'stand', 'tap', 'tell', 'thank', 'try', 'turn', 'walk', 'word', 'write' ]
UNNECESSARY = ['admire', 'agreeable', 'amaze', 'amuse', 'anxious', 'appreciate', 'approve', 'astonish', 'attention', 'aware', 'be', 'believe', 'calculate', 'can', 'comfort', 'convince', 'delight', 'desire', 'determine', 'dispose', 'doubt', 'enjoy', 'esteem', 'expect', 'fancy', 'fear', 'feel', 'find', 'fret', 'glad', 'goal', 'heart', 'honor', 'hope', 'horrify', 'idea', 'imagine', 'impatient', 'incline', 'indifferent', 'judgment', 'knowledge', 'lest', 'like', 'listen', 'long', 'necessary', 'observe', 'occur', 'patient', 'percieve', 'please', 'pleasure', 'purpose', 'realize', 'reflect', 'regard', 'resolve', 'seem', 'sensation', 'shame', 'sorry', 'suppose', 'suspect', 'suspicion', 'temper', 'think', 'trust', 'upset', 'vex', 'want', 'willing', 'willing', 'wish', 'wonder', 'worry' ]

# require
import sys
import os
import spacy
import string

# sanity check; get input
if len( sys.argv ) < 2 : sys.exit( "Usage: " + sys.argv[ 0 ] + " <file> <output>" )
file   = sys.argv[ 1 ]
output = sys.argv[ 2 ]

# initialize
nlp = spacy.load( MODEL )
key = os.path.splitext( os.path.basename( file ) )[ 0 ]

# start output
with open( output, 'w' ) as subhandle : subhandle.write( "\t".join( HEADER ) + '\n' )

# process each sentence
s = 0
with open( file ) as handle :

	# repeat forever
	while True :
	
		# get the next sentence
		sentence = handle.readline()
		if not sentence : break

		# increment
		s += 1

		sentence = nlp( sentence )
	
		# create a lemmatized "sentence"
		lemmas = ''
		for token in sentence : lemmas = lemmas + ' ' + token.lemma_

		# normalize the sentence
		sentence = sentence.text.replace( '\r', '' ).replace ( '\n', '' ).lower()
		sentence = sentence.translate( str.maketrans( '', '', string.punctuation ) )	
		
		# normalize the sentence
		lemmas = lemmas.replace( '\r', '' ).replace ( '\n', '' ).lower()
		lemmas = lemmas.translate( str.maketrans( '', '', string.punctuation ) )	
		
		# tokenize the sentence
		tokens = lemmas.split()
		length = len( tokens )
	
		# count necessary words and calculate percentage
		necessary_count = 0
		for word in NECESSARY : necessary_count += tokens.count( word )
		necessary_percent = round( ( necessary_count / length ) * 100 )

		# count unnecessary words and calculate percentage
		unnecessary_count = 0
		for word in UNNECESSARY : unnecessary_count += tokens.count( word )
		unnecessary_percent = round( ( unnecessary_count / length ) * 100 )

		# output
		with open( output, 'a' ) as subhandle : subhandle.write( "\t".join( [ key, str( s ), str( length ), str( necessary_count ),  str( necessary_percent ), str( unnecessary_count ), str( unnecessary_percent ), sentence ] ) + '\n' )
		
# done
exit
