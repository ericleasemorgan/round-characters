#!/usr/bin/env python

# train.py - given a file name and a list of directories containing .txt files, create a model for classifying similar items
# see also: https://www.ritchieng.com/machine-learning-multinomial-naive-bayes-vectorization/

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public license

# January  11, 2020 - written for a book about machine learning in libraries
# November 26, 2021 - enhanced to output most significant features


# configure
FEATURES  = 10
STOPWORDS = './etc/stopwords.txt'

# require the libraries/modules that will do the work
from numpy                           import argsort, array
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.feature_selection       import chi2
from sklearn.model_selection         import train_test_split
from sklearn.naive_bayes             import MultinomialNB
import glob, os, pickle, sys
import pandas as pd

# sanity check; make sure the program has been given input
if len( sys.argv ) < 4 :
	sys.stderr.write( 'Usage: ' + sys.argv[ 0 ] + " <model> <directory> <another directory> [<another directory> ...]\n" )
	quit()

# get the name of the file where the model will be saved
model = sys.argv[ 1 ]

# get the rest of the input, the names of directories to process
directories = []
for i in range( 2, len( sys.argv ) ) : directories.append( sys.argv[ i ] )

# initialize the data to analyze and its associated labels; loop through each given directory
data   = []
labels = []
for directory in directories :

	# find all the text files and get the directory's name
	files = glob.glob( directory + "/*.txt" )
	label = os.path.basename( directory )
	
	# process each file
	for file in files :
		
		# open the file
		with open( file ) as handle :
		
			# add the contents of the file to the data and update the labels
			data.append( handle.read() )
			labels.append( label )

# divide the data/labels into training sets and testing sets; a best practice
data_train, data_test, labels_train, labels_test = train_test_split( data, labels )

# read stopwords
with open( STOPWORDS ) as handle: stopwords = handle.read().split( '\n' )

# initialize a vectorizer, and then count/tabulate the training data
vectorizer = CountVectorizer( stop_words = stopwords )
data_train = vectorizer.fit_transform( data_train )

# initialize a classification model, and then use Naive Bayes to create a model
classifier = MultinomialNB()
classifier.fit( data_train, labels_train )

# save the vectorizer and the classifier (the model) for future use
with open( model, 'wb' ) as handle : pickle.dump( ( vectorizer, classifier ), handle )


# everything below this line is used to evaluate the model

# compare and contrast tokens in each file; first all tokens, and then the count of each in each corpus
tokens            = vectorizer.get_feature_names()
necessary_token_count = classifier.feature_count_[ 0, : ]
unnecessary_token_count = classifier.feature_count_[ 1, : ]

# combine them into a data frame
tokens = pd.DataFrame( { 'words':tokens, 'necessary':necessary_token_count, 'unnecessary':unnecessary_token_count } ).set_index( 'words' )

# to avoid division by zero, increment each count by one 
tokens[ 'necessary' ] = tokens.necessary + 1
tokens[ 'unnecessary' ] = tokens.unnecessary + 1
 
# change each value to a ratio; calculate a relative weight
tokens[ 'necessary' ] = tokens.necessary / classifier.class_count_[ 0 ]
tokens[ 'unnecessary' ] = tokens.unnecessary / classifier.class_count_[ 1 ]

# compare the relative weights to each other and sort
tokens[ 'ratio' ] = tokens.necessary / tokens.unnecessary
tokens            = tokens.sort_values( 'ratio', ascending=False )

# output
print( "Most significant words in necessary:\n" )
print( tokens.head( FEATURES ) )
print()
print( "Most significant words in unnecessary:\n" )
print( tokens.tail( FEATURES ) )
print()

# count/tabulate the test data, and use the model to classify it
data_test       = vectorizer.transform( data_test )
classifications = classifier.predict( data_test )

# loop through each test classification; test for accuracy
count = 0
for i in range( len( classifications ) ) :
    
    # increment, if the calculated classification match the given classification
    if classifications[ i ] == labels_test[ i ] : count += 1

# calculate and output the accuracy score; above 75% begins to achieve success
print ( "Classification accuracy: %s%%" % ( int( ( count * 1.0 ) / len( classifications ) * 100 ) ) )
print()

# list and output most significant words used to create model
features = chi2( data_train, labels_train )
indexes  = argsort( features[ 0 ] )
names    = array( vectorizer.get_feature_names() )[ indexes ]
print( "Most significant words used to create this model: {}".format( '; '.join( names[ -FEATURES : ] ) ) )
print()

# done
exit()
