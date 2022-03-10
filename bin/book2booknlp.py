#!/usr/bin/env python

# book2booknlp.py - a more readable version of the root to Python BookNLP pipeline
# see: https://github.com/booknlp/booknlp

# Claudia Carroll <ccarrol3@nd.edu> and Eric Lease Morgan <emorgan@nd.edu>
# (c) University of Notre Dame; distributed under a GNU Public License

# March 10, 2022 - first documentation


# configure
PARAMETERS = { "pipeline":"entity,quote,supersense,event,coref", "model":"small" }
LANGUAGE   = 'en'

# require
from booknlp.booknlp import BookNLP
import sys

# sanity check
if len( sys.argv ) != 4 : sys.exit( 'Usage: ' + sys.argv[ 0 ] + " <id> <file> <directory>\n" )

# get input
id        = sys.argv[ 1 ]
file      = sys.argv[ 2 ]
directory = sys.argv[ 3 ]

# initialize
booknlp = BookNLP( LANGUAGE, PARAMETERS )

# do the work and done
booknlp.process( file, directory, id )
exit()