# Line-collapsing

Both DNA and protein files hold linebreaks along its sequence if those are downloaded from their corresponding respositories (e.g. GenBank). This actually ensure a quick sight and online exploration of stored data. These format, however, usually turns out certain issues when you attempt to conduct downstream procedures. Upon not having lines joined, find motifs or merge sequences from these non-collapsed sequences is not easily attainable. Here `oneline.pl` script is presented to deal with linebreaks shown along sequences:

```Perl
#!/usr/bin/perl -w

use strict;
use warnings;

my $input_fasta = $ARGV[0]; #use the first argument from the Linux terminal

unless(open(IN, "$input_fasta")){
	print "\nError upon opening \"$input_fasta\"\n\n";
	exit;
	} #if file is not correctly uploaded, print out an error message

my @lines  = <IN>; #store your all lines in an array
close IN; #stop modifying the file

my $line =  join("", @lines); #lines are separated by white spaces and then stored them in a scalar variable
my $results = ""; #rigth here is where results will be saved after the following loop:

for $line (@lines){
	if($line =~ m/^>/){#skip those line which starts with '>'
	$results .=  "\n$line"; #new line before printing. That is, header will be separated from the sequence.
	}else{
	$line =~ s/\s//g; #substite white spaces by nothing
	$results .=  $line;
	}
}

$results =~ s/^\n//g; #remove new line at the biginning of results
print "$results\n";
exit;
```
## Input

```
>Stellifer_lanceolatus
CTTTACCTGATTTTTGGTGCATGAGCCGGAATAGTGGGCACAGCTTTAAGCCTTCTTATCCGAGCTGAGCTGAGCCAGCC
CGGCTCACTCCTTGGAGACGACCAGATCTACAACGTAATCGTCACAGCCCATGCTTTCGTTATAATCTTCTTTATAGTAA
TGCCCGTCATGATTGGAGGGTTCGGGAACTGACTCATCCCACTAATAATCGGAGCCCCCGACATAGCATTCCCTCGAATG
AACAATATGAGCTTCTGACTTCTTCCCCCTTCTTTCCTCTTGCTCCTGACCTCTTCGGGAGTAGAAGCTGGGGCAGGAAC
CGGATGGACTGTTTATCCCCCACTCGCTGGTAATCTAGCACACGCAGGAGCTTCAGTCGACCTAGCAATCTTTTCCCTGC
ACCTTGCCGGTGTTTCTTCTATCCTGGGGGCCATTAACTTTATTACAACCATTATTAACATAAAACCTCCCGCTATTTCC
CAGTATCAGACCCCTCTGTTTGTGTGAGCTGTCCTAATTACAGCTGTTCTTTTACTGCTCTCACTCCCAGTTTTAGCTGC
AGGCATCACCATGCTTTTAACAGATCGAAACCTGAATACAACTTTCTTTGACCCAGCAGGAGGGGGTGATCCAATTCTCT
ACCAACACCTATTC

>Stellifer_lanceolatus2
CCTTTACCTGATTTTTGGTGCATGAGCCGGAATAGTGGGCACAGCTTTAAGCCTTCTTATCCGAGCTGAGCTGAGCCAGC
CCGGCTCACTCCTTGGAGACGACCAGATCTACAACGTAATCGTCACAGCCCATGCTTTCGTTATAATCTTCTTTATAGTA
ATGCCCGTCATGATTGGAGGGTTCGGGAACTGACTCATCCCACTAATAATCGGAGCCCCCGACATAGCATTCCCTCGAAT
GAACAATATGAGCTTCTGACTTCTTCCCCCTTCTTTCCTCTTGCTCCTGACCTCTTCGGGAGTAGAAGCTGGGGCAGGAA
CCGGATGGACTGTTTATCCCCCACTCGCTGGTAATCTAGCACACGCAGGAGCTTCAGTCGACCTAGCAATCTTTTCCCTG
CACCTTGCCGGTGTTTCTTCTATCCTGGGGGCCATTAACTTTATTACAACCATTATTAACATAAAACCTCCCGCTATTTC
CCAGTATCAGACCCCTCTGTTTGTGTGAGCTGTCCTAATTACAGCTGTTCTTTTACTGCTCTCACTCCCAGTTTTAGCTG
CAGGCATCACCATGCTTTTAACAGATCGAAACCTGAATACAACTTTCTTTGACCCAGCAGGAGGGGGTGATCCAATTCTC
TACCAACACCTA

>Bairdiella_ronchus2
CCTTTACCTGATTTTTGGTGCATGGGCCGGAATAGTAGGCACAGCCCTGAGCCTCCTCATCCGAGCTGAGCTAAGTCAGC
CCGGCTCACTTCTTGGGGACGACCAGATCTACAATGTAATCGTTACAGCTCACGCCTTTGTTATAATTTTCTTTATAGTA
ATGCCTGTTATGATCGGAGGATTTGGAAACTGGCTTGTTCCCCTAATAATTGGAGCCCCAGACATGGCCTTCCCTCGAAT
GAATAACATGAGCTTCTGACTTCTCCCTCCCTCCTTCCTTTTACTTCTAACCTCTTCAGGTGTAGAGGCTGGGGCGGGGA
CCGGGTGGACCGTATACCCACCGCTCGCTGGTAACCTGGCTCACGCAGGAGCCTCCGTCGACTTAGCCATCTTCTCCCTC
CATCTCGCAGGTGTCTCCTCCATCCTAGGGGCAATCAACTTTATTACAACAATTATTAATATGAAACCCCCCGCCATCTC
CCAATACCAGACACCCTTATTCGTCTGAGCTGTCCTAATTACAGCTGTTCTCCTATTACTCTCGCTTCCTGTCTTAGCTG
CTGGAATTACCATACTTCTAACAGACCGCAACCTAAACACAACCTTCTTTGACCCGGCAGGAGGTGGAGACCCCATTCTA
TATCAACACCTA
```
Given above input data, we can store it into  `sequence.fasta` and run the following comands in Linux:

```Bash
$ perl oneline.pl sequences.fasta
```
## Output
```
>Stellifer_lanceolatus
CTTTACCTGATTTTTGGTGCATGAGCCGGAATAGTGGGCACAGCTTTAAGCCTTCTTATCCGAGCTGAGCTGAGCCAGCCCGGCTCACTCCTTGGAGACGACCAGATCTACAACGTAATCGTCACAGCCCATGCTTTCGTTATAATCTTCTTTATAGTAATGCCCGTCATGATTGGAGGGTTCGGGAACTGACTCATCCCACTAATAATCGGAGCCCCCGACATAGCATTCCCTCGAATGAACAATATGAGCTTCTGACTTCTTCCCCCTTCTTTCCTCTTGCTCCTGACCTCTTCGGGAGTAGAAGCTGGGGCAGGAACCGGATGGACTGTTTATCCCCCACTCGCTGGTAATCTAGCACACGCAGGAGCTTCAGTCGACCTAGCAATCTTTTCCCTGCACCTTGCCGGTGTTTCTTCTATCCTGGGGGCCATTAACTTTATTACAACCATTATTAACATAAAACCTCCCGCTATTTCCCAGTATCAGACCCCTCTGTTTGTGTGAGCTGTCCTAATTACAGCTGTTCTTTTACTGCTCTCACTCCCAGTTTTAGCTGCAGGCATCACCATGCTTTTAACAGATCGAAACCTGAATACAACTTTCTTTGACCCAGCAGGAGGGGGTGATCCAATTCTCTACCAACACCTATTC
>Stellifer_lanceolatus2
CCTTTACCTGATTTTTGGTGCATGAGCCGGAATAGTGGGCACAGCTTTAAGCCTTCTTATCCGAGCTGAGCTGAGCCAGCCCGGCTCACTCCTTGGAGACGACCAGATCTACAACGTAATCGTCACAGCCCATGCTTTCGTTATAATCTTCTTTATAGTAATGCCCGTCATGATTGGAGGGTTCGGGAACTGACTCATCCCACTAATAATCGGAGCCCCCGACATAGCATTCCCTCGAATGAACAATATGAGCTTCTGACTTCTTCCCCCTTCTTTCCTCTTGCTCCTGACCTCTTCGGGAGTAGAAGCTGGGGCAGGAACCGGATGGACTGTTTATCCCCCACTCGCTGGTAATCTAGCACACGCAGGAGCTTCAGTCGACCTAGCAATCTTTTCCCTGCACCTTGCCGGTGTTTCTTCTATCCTGGGGGCCATTAACTTTATTACAACCATTATTAACATAAAACCTCCCGCTATTTCCCAGTATCAGACCCCTCTGTTTGTGTGAGCTGTCCTAATTACAGCTGTTCTTTTACTGCTCTCACTCCCAGTTTTAGCTGCAGGCATCACCATGCTTTTAACAGATCGAAACCTGAATACAACTTTCTTTGACCCAGCAGGAGGGGGTGATCCAATTCTCTACCAACACCTA
>Bairdiella_ronchus2
CCTTTACCTGATTTTTGGTGCATGGGCCGGAATAGTAGGCACAGCCCTGAGCCTCCTCATCCGAGCTGAGCTAAGTCAGCCCGGCTCACTTCTTGGGGACGACCAGATCTACAATGTAATCGTTACAGCTCACGCCTTTGTTATAATTTTCTTTATAGTAATGCCTGTTATGATCGGAGGATTTGGAAACTGGCTTGTTCCCCTAATAATTGGAGCCCCAGACATGGCCTTCCCTCGAATGAATAACATGAGCTTCTGACTTCTCCCTCCCTCCTTCCTTTTACTTCTAACCTCTTCAGGTGTAGAGGCTGGGGCGGGGACCGGGTGGACCGTATACCCACCGCTCGCTGGTAACCTGGCTCACGCAGGAGCCTCCGTCGACTTAGCCATCTTCTCCCTCCATCTCGCAGGTGTCTCCTCCATCCTAGGGGCAATCAACTTTATTACAACAATTATTAATATGAAACCCCCCGCCATCTCCCAATACCAGACACCCTTATTCGTCTGAGCTGTCCTAATTACAGCTGTTCTCCTATTACTCTCGCTTCCTGTCTTAGCTGCTGGAATTACCATACTTCTAACAGACCGCAACCTAAACACAACCTTCTTTGACCCGGCAGGAGGTGGAGACCCCATTCTATATCAACACCTA
```
