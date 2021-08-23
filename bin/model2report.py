#!/usr/bin/env python

# model2report.py - create a rudimentary report from a previously created MALLET model

# Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# August 4, 2020 - copied to Reader Toolbox


# configure
MALLETHOME      = 'tmp'
KEYS            = 'keys.tsv'
KEYSHEADER      = [ 'ids', 'weights', 'features' ]
DOCUMENTS       = 'documents.txt'
DOCUMENTSHEADER = [ 'ids', 'dids', 'files', 'proportions' ]

# require
import pandas as pd
import os

# initialize
cwd       = os.getcwd()
keys      = cwd + '/' + MALLETHOME + '/' + KEYS
documents = cwd + '/' + MALLETHOME + '/' + DOCUMENTS

# read and sort keys file
keys = pd.read_csv( keys, sep='\t', names=KEYSHEADER )
keys.sort_values( by='weights', ascending=False, inplace=True )

# create labels for each topic
labels = []
for index, row in keys.iterrows() :

	# parse
	features = row[ 'features' ].split()
	
	# loop through each feature
	for feature in features :
	
		# build the list, conditionally
		if feature in labels : continue
		labels.append( feature )
		break
	
# add the labels, rearrange (just for fun)
keys[ 'labels' ] = labels
keys = keys[ [ 'labels', 'weights', 'features' ] ]
print( keys )
print()

# create dictionary of labels (map), for future user
map = keys[ 'labels' ].to_dict()

# read the documents file
documents = pd.read_csv( documents, sep=' ', names=DOCUMENTSHEADER, skiprows=1 )

# map the ids to the documents, and add them to the data frame
labels = []
for index, row in documents.iterrows() : labels.append( map[ row[ 'ids' ] ] )
documents[ 'labels' ] = labels

# rearrange, just for fun
documents = documents[ [ 'ids', 'labels', 'files', 'proportions' ] ]

# process each label (topic) to 
for id in map :
	
	# get the label and create a subset of documents
	label = map[ id ]
	files = documents.loc[ documents[ 'labels'] == label ]
	
	# re-initialize output
	print( label )
	
	# process each item in the subset; output matching files
	for index, row in files.iterrows() : print( "  *", row[ 'files' ] )
	
	# delimit
	print()
	
# done
exit()