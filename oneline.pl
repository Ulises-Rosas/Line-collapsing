#!/usr/bin/perl -w

use strict;
use warnings;

my $input_fasta = $ARGV[0];

unless(open(IN, "$input_fasta")){
	print "\nError al abrir \"$input_fasta\"\n\n";
	exit;
	}

my @lineas  = <IN>;
close IN;

my $linea =  join("", @lineas);
my $results = "";

for $linea (@lineas){
	if($linea =~ m/^>/){
	$results .=  "\n$linea"; 
	}else{
	$linea =~ s/\s//g;
	$results .=  $linea;
	}
}

$results =~ s/^\n//g;
print "$results\n";
exit;