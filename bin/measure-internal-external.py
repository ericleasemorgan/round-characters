#!/usr/bin/env python

# measure-internal-external.py - given a text calculate the degree it is internal or external

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# September 23, 2021 - originally written months and months ago, but tweaked for slightly different input
# November  30, 2021 - now using pre-processed data


# configure
NECESSARY   = [ 'accompany', 'add', 'address', 'agree', 'announce', 'answer', 'appeal', 'arrive', 'assure', 'attempt', 'attend', 'carry', 'charm', 'close', 'close', 'consent', 'dance', 'declare', 'deliver', 'discuss', 'dissuade', 'eat', 'enter', 'entreat', 'explain', 'frown', 'glance', 'go', 'hit', 'hold', 'inform', 'inquire', 'join', 'laugh', 'leave', 'look', 'make', 'mention', 'nod', 'noise', 'obey', 'pass', 'perform', 'persuade', 'place', 'play', 'press', 'promote', 'put', 'quiet', 'quit', 'refuse', 'relate', 'replay', 'reply', 'require', 'return', 'run', 'scowl', 'see', 'shake', 'silent', 'sit', 'sleep', 'smile', 'speak', 'stand', 'tap', 'tell', 'thank', 'try', 'turn', 'walk', 'word', 'write' ]
UNNECESSARY = ['admire', 'agreeable', 'amaze', 'amuse', 'anxious', 'appreciate', 'approve', 'astonish', 'attention', 'aware', 'be', 'believe', 'calculate', 'can', 'comfort', 'convince', 'delight', 'desire', 'determine', 'dispose', 'doubt', 'enjoy', 'esteem', 'expect', 'fancy', 'fear', 'feel', 'find', 'fret', 'glad', 'goal', 'heart', 'honor', 'hope', 'horrify', 'idea', 'imagine', 'impatient', 'incline', 'indifferent', 'judgment', 'knowledge', 'lest', 'like', 'listen', 'long', 'necessary', 'observe', 'occur', 'patient', 'percieve', 'please', 'pleasure', 'purpose', 'realize', 'reflect', 'regard', 'resolve', 'seem', 'sensation', 'shame', 'sorry', 'suppose', 'suspect', 'suspicion', 'temper', 'think', 'trust', 'upset', 'vex', 'want', 'willing', 'willing', 'wish', 'wonder', 'worry' ]

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

# process each sentence
for sentence in sentences :

	# create a list of normalized tokens (words)
	sentence = sentence.translate( str.maketrans( '', '', string.punctuation ) )	
	tokens = [ token.lower() for token in sentence.split() ]

	# process each token
	for token in tokens :
	
		if token in NECESSARY   : necessary   += 1
		if token in UNNECESSARY : unnecessary += 1
	
# done
print( '\t'.join( [ key, str( necessary ), str( unnecessary ) ] ) )
exit()
