#!/usr/bin/env perl

# txt2chapters.pl - given a plain text file delimited by a patter, output "DIRECTORY"

# Claudia Carroll <ccarrol3@nd.edu> and Eric Lease Morgan <eric_morgan@infomotions.com>

# January 28, 2021 - because I couldn't sleep
# February 6, 2021 - writing as a stand-alone program


# require
use strict;

# initialize
my $file      = $ARGV[ 0 ];
my $pattern   = $ARGV[ 1 ];
my $directory = $ARGV[ 2 ];
my @lines    = ();
my $chapter  = 0;

# sanity check
if ( ! $file || ! $pattern || ! $directory ) {

	warn "Usage: $0 <file> <pattern> <directory\n";
	exit;
	
}

# initialize/enhance pattern
$pattern = "^$pattern ";

# open the file and process each line
open INPUT, " < $file" or die "Can't open $file ($!). Call Eric.\n";
while ( <INPUT> ) {

	# parse
	chop;
	my $line = $_;

	# check
	if ( $line =~ /$pattern/ ) {
			
		# first time through?
		if ( $chapter > 0 ) {
		
			# save
			&write( $directory, $chapter, [ @lines ] );

		}
		
		# re-initialize
		@lines = ( $line ); 
		$chapter++;
		
	}
	
	# update
	else { push( @lines, $line ) }
	
}


# save final chapter
&write( $directory, $chapter, [ @lines ] );

# clean up and done
close INPUT;
exit;


# write output
sub write {

	my $directory = shift;
	my $chapter   = shift;
	my $lines     = shift;
	
	my $file = "$directory/chapter-" . sprintf( "%03d", $chapter ) . ".txt";
	open OUTPUT, " > $file" or die "Can't open $file. Call Eric.\n";
	binmode( OUTPUT, ":utf8" );
	foreach ( @$lines ) { print OUTPUT "$_\n" }
	close OUTPUT;

	return;
	
}

