#!/usr/bin/env python


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