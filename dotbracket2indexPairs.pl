#!/usr/bin/perl

use strict;

# check arguments
if ($#ARGV < 0) {
	print "\n ERROR : dot-bracket structure missing in call\n";
	exit(-1);
}

# get structure 
my $structureString=$ARGV[0];

# check structure string alphabet
if ( $structureString !~ m/^[\.\(\)]+$/ ) {
	print "\n ERROR : structure is no valid dot-bracket string of alphabet '.()'\n";
	exit(-1);
}

# convert structure string to array
my @str = split('',$structureString);

my @lastOpenPos = ();

my $pairs = "";

for (my $i = 0; $i<=$#str; $i++) {
	# handle opening
	if ( $str[$i] eq '(' ) {
		push @lastOpenPos, $i;
	}
	# handle closing
	elsif ( $str[$i] eq ')' ) {
		# balancing check
		if ( $#lastOpenPos < 0 ) {
			print "\n ERROR : unbalanced structure : no opening for closing bracket at position ".($i+1)."\n";
			exit(-1);
		}
		# get position of according opening bracket
		my $lastOpen = pop(@lastOpenPos);
		# store base pair information
		$pairs .= " ".($lastOpen+1).":".($i+1);
	}
}

# final balancing check 
if ( $#lastOpenPos >= 0 ) {
	print @lastOpenPos;
	my $lastPos = pop @lastOpenPos;
	print "\n ERROR : unbalanced structure : no closing for opening bracket at position ".($lastPos+1)."\n";
	exit(-1);
}

# print pairs if available
print $pairs;

exit(0);
