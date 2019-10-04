#!/usr/bin/env perl
use strict;
use warnings;

my ($i, %l);
while (<>) {
	if (/^#\s+Sequence:\s+(\S+)/) { 
		$i=$1;
	} 
	elsif (/^\s+(\d+)\s+(\d+)\s+(-|\+)\s+pattern:N+[AGCTN]+\s+(\.)\s+([ACTGNagctn]{20})([ACTGNactgn]{3})/) { 
		next if exists $l{$5}; 
		$l{$5}++; 
		if ( $3 eq "+") { # forward strand match
			printf ">%s:%i-%i\n%s\n", $i, $1, $2-3,$5 ;
		} 
		else { #reverse complement match
			printf ">%s:%i-%i:rc\n%s\n", $i, $1+3, $2,$5 ;
		}
	}
}
