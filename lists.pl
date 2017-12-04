#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';

my @frukt = qw(eple pære banan mango kiwi);

say "Skriv ut arrayet";
frukt();

push @frukt,'appelsin';

say '----------';

say "Skriv ut etter at vi har lagt til en frukt";

frukt();

sub frukt() {
  for my $f (@frukt) {
    say $f;
  }
}

say '----------';
 say "Hash med navn-dyr";

my %dyr = qw(
Truls Katt
Passopp Hund
Dagros Ku
Ferdinand Okse
Strofe Katt
);

# Hent nøkler og verdier til separate arrays.
my @v = values %dyr;  #
my @k = keys   %dyr;  #

# Legg til et dyr i hash'en
$dyr{'Mikke'} = "Mus";

say "skriv ut nøklene (navn), sortert";
for my $navn  (sort keys %dyr) {
  say $navn;
}
say "------------";

say "skriv ut verdiene (art) sortert";
foreach my $x (sort values %dyr) {
  say $x;
}
say "------------";

say "Skriv ut både nøkler og verdier";
while ( my ($navn, $dyr) = each %dyr ) {
  say $navn, " er en ", $dyr;}
say "------------";

# Eller med en foreach
say "Skriv ut nøkler og verdier med foreach";
foreach my $navn (keys %dyr) {
  say $navn, " er en ", $dyr{$navn};
}
say "------------";


# mer kompleks hash som inneholder bl.a et array og en hash
my %field = (
NAME => "dyr",
VALUES => ["camel", "llama", "ram", "wolf"],
DEFAULT => "camel",
LINEBREAK => "true",
LABELS=> \%dyr
);

say $field{VALUES}[0];  # = camel
say $field{LABELS}{Strofe};  #  = Katt
