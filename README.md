# Line-collapsing
Perl-based utility which collapse lines of sequences from multifasta files

```Perl
#!/usr/bin/perl -w

use strict;
use warnings;

my $input_fasta = $ARGV[0];

unless(open(IN, "$input_fasta")){
	print "\nError upon opening \"$input_fasta\"\n\n";
	exit;
	}

my @lines  = <IN>;
close IN;

my $line =  join("", @lines);
my $results = "";

for $line (@lines){
	if($line =~ m/^>/){
	$results .=  "\n$line"; 
	}else{
	$line =~ s/\s//g;
	$results .=  $line;
	}
}

$results =~ s/^\n//g;
print "$results\n";
exit;
```
## Input


```Linux
cat sequences.txt
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
## Output

```Linux
perl oneline.pl sequences.fasta
>Stellifer_lanceolatus
CTTTACCTGATTTTTGGTGCATGAGCCGGAATAGTGGGCACAGCTTTAAGCCTTCTTATCCGAGCTGAGCTGAGCCAGCCCGGCTCACTCCTTGGAGACGACCAGATCTACAACGTAATCGTCACAGCCCATGCTTTCGTTATAATCTTCTTTATAGTAATGCCCGTCATGATTGGAGGGTTCGGGAACTGACTCATCCCACTAATAATCGGAGCCCCCGACATAGCATTCCCTCGAATGAACAATATGAGCTTCTGACTTCTTCCCCCTTCTTTCCTCTTGCTCCTGACCTCTTCGGGAGTAGAAGCTGGGGCAGGAACCGGATGGACTGTTTATCCCCCACTCGCTGGTAATCTAGCACACGCAGGAGCTTCAGTCGACCTAGCAATCTTTTCCCTGCACCTTGCCGGTGTTTCTTCTATCCTGGGGGCCATTAACTTTATTACAACCATTATTAACATAAAACCTCCCGCTATTTCCCAGTATCAGACCCCTCTGTTTGTGTGAGCTGTCCTAATTACAGCTGTTCTTTTACTGCTCTCACTCCCAGTTTTAGCTGCAGGCATCACCATGCTTTTAACAGATCGAAACCTGAATACAACTTTCTTTGACCCAGCAGGAGGGGGTGATCCAATTCTCTACCAACACCTATTC
>Stellifer_lanceolatus2
CCTTTACCTGATTTTTGGTGCATGAGCCGGAATAGTGGGCACAGCTTTAAGCCTTCTTATCCGAGCTGAGCTGAGCCAGCCCGGCTCACTCCTTGGAGACGACCAGATCTACAACGTAATCGTCACAGCCCATGCTTTCGTTATAATCTTCTTTATAGTAATGCCCGTCATGATTGGAGGGTTCGGGAACTGACTCATCCCACTAATAATCGGAGCCCCCGACATAGCATTCCCTCGAATGAACAATATGAGCTTCTGACTTCTTCCCCCTTCTTTCCTCTTGCTCCTGACCTCTTCGGGAGTAGAAGCTGGGGCAGGAACCGGATGGACTGTTTATCCCCCACTCGCTGGTAATCTAGCACACGCAGGAGCTTCAGTCGACCTAGCAATCTTTTCCCTGCACCTTGCCGGTGTTTCTTCTATCCTGGGGGCCATTAACTTTATTACAACCATTATTAACATAAAACCTCCCGCTATTTCCCAGTATCAGACCCCTCTGTTTGTGTGAGCTGTCCTAATTACAGCTGTTCTTTTACTGCTCTCACTCCCAGTTTTAGCTGCAGGCATCACCATGCTTTTAACAGATCGAAACCTGAATACAACTTTCTTTGACCCAGCAGGAGGGGGTGATCCAATTCTCTACCAACACCTA
>Bairdiella_ronchus2
CCTTTACCTGATTTTTGGTGCATGGGCCGGAATAGTAGGCACAGCCCTGAGCCTCCTCATCCGAGCTGAGCTAAGTCAGCCCGGCTCACTTCTTGGGGACGACCAGATCTACAATGTAATCGTTACAGCTCACGCCTTTGTTATAATTTTCTTTATAGTAATGCCTGTTATGATCGGAGGATTTGGAAACTGGCTTGTTCCCCTAATAATTGGAGCCCCAGACATGGCCTTCCCTCGAATGAATAACATGAGCTTCTGACTTCTCCCTCCCTCCTTCCTTTTACTTCTAACCTCTTCAGGTGTAGAGGCTGGGGCGGGGACCGGGTGGACCGTATACCCACCGCTCGCTGGTAACCTGGCTCACGCAGGAGCCTCCGTCGACTTAGCCATCTTCTCCCTCCATCTCGCAGGTGTCTCCTCCATCCTAGGGGCAATCAACTTTATTACAACAATTATTAATATGAAACCCCCCGCCATCTCCCAATACCAGACACCCTTATTCGTCTGAGCTGTCCTAATTACAGCTGTTCTCCTATTACTCTCGCTTCCTGTCTTAGCTGCTGGAATTACCATACTTCTAACAGACCGCAACCTAAACACAACCTTCTTTGACCCGGCAGGAGGTGGAGACCCCATTCTATATCAACACCTA
```
