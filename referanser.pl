#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';

my $var = 10;

# Nå inneholder $r en referanse til skalaren $var.
my $r = \$var;

# Print verdien som er tilgjengelig i minnet som er lagret i $r.
say "Verdien til $var er: $$r";

my @var = (1, 2, 3);
# Nå inneholder $r en referanse til arrayet @var.
$r = \@var;
# Print verdien som er tilgjengelig i minnet som er lagret i $r.
say "Verdien til @var er: @$r";

my %var = ('key1' => 10, 'key2' => 20);
# Nå inneholder $r en referanse til hashen %var.
$r = \%var;
# Print verdien som er tilgjengelig i minnet som er lagret i $r.
print "Value of %var is : ", %$r, "\n";
