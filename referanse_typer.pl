#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';

my $var = 10;
my $r = \$var;
print "Referansetype i r : ", ref($r), "\n";

my @var = (1, 2, 3);
$r = \@var;
print "Referansetype i r : ", ref($r), "\n";

my %var = ('key1' => 10, 'key2' => 20);
$r = \%var;
print "Referansetype i r : ", ref($r), "\n";
