#!/usr/bin/env python

# https://spacy.io/universe/project/neuralcoref


# configure
MODEL = 'en_core_web_lg'
FILE  = './pride/austen_pride_1.txt'

# require
import neuralcoref
import spacy
import textacy.preprocessing


# initialize and augment the processing
nlp = spacy.load( MODEL )
neuralcoref.add_to_pipe ( nlp )

# open the text and normalize it
text = open( FILE ).read()
text = textacy.preprocessing.normalize.normalize_hyphenated_words( text )
text = textacy.preprocessing.normalize.normalize_whitespace( text )
text = text.replace( '\n', ' ' )

#doc1 = nlp( text )
#print(doc1._.coref_clusters)


doc2 = nlp( text )
for ent in doc2.ents:
    print(ent._.coref_cluster)
    