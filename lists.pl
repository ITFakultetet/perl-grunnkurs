#! /usr/bin/perl
use strict;
use feature ":all";

my @frukt = qw(eple pære banan mango kiwi);

frukt();

push @frukt,'appelsin';

say '----------';

frukt();


my %dyr = qw(
Truls Katt
Passopp Hund
Dagros Ku
Ferdinand Okse
Strofe Katt
);


for my $d  (sort keys %dyr) {
# skriv ut verdien til nøkkelen $d
say $d;
}


sub frukt() {
for my $f (@frukt) {
 say $f;
}
}



foreach my $x (sort values %dyr) {
  say $x;
}
