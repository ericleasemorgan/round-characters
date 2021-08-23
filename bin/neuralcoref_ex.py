#!/usr/bin/env python

# https://towardsdatascience.com/coreference-resolution-in-python-aca946541dec

FILE  = './pride/chapter-018.txt'
MODEL = 'en_core_web_lg'
WORD  = 'elizabeth'

# require
import spacy
import neuralcoref
import textacy.preprocessing

# initialize
text = open( FILE ).read()
nlp  = spacy.load( MODEL )
neuralcoref.add_to_pipe( nlp )

# normalize the text, just in case
text = textacy.preprocessing.normalize.normalize_hyphenated_words( text )
text = textacy.preprocessing.normalize.normalize_whitespace( text )
text = text.replace( '\n', ' ' )

# model the text
doc = nlp( text )

# get all the resolved sentences containing our given work
resolutions = doc._.coref_resolved
sentences   = [ sentence.string.strip() for sentence in nlp( resolutions ).sents ]
sentences   = [sentence for sentence in sentences if WORD in (' '.join([token.lemma_.lower() for token in nlp(sentence)]))]

# output
for sentence in sentences :
    print( sentence )
    print()