#! /usr/bin/perl
use strict;
use warnings;
use Switch;  # installer med: sudo cpanm Switch
use feature ':all'; # få tilgang til bl.a. say

my $tekst = "Dette er en tekst";
my $tekst2 = "Dette er en tekst";

# if
if ($tekst) {
  say 'Variablen $tekst finnes';    # merk: enkle fnutter for å unngå interpolering
}

# if .. else
if ($tekst eq $tekst2) {
  say "Teksten er lik";
} else {
  say "teksten er ulik";
}

my $alder = 19;
my $myndig = 0;
# elsif
if ($alder>=21) {
  $myndig = 1;
  say "Du er myndig";
} elsif ($alder>=18 && $alder<21) {
  $myndig = 0;
  say "Du er ikke myndig, men kan kjøre bil hvis du har lappen";
} else {
  say "Du er ikke myndig";
}

# unless
unless ($tekst) {
  say "Du må lage en tekst-variabel";
}

# Switch
#Lag et tilfeldig tall mell om 1 og 10:
my $tall = 1+ int(rand(10));
say $tall;

switch ($tall) {
    case 1  {say "tallet er 1"}
    case [2..5] {say "tallet er mellom 2 og 5"}
    case [6,7] {say "tallet er 6 eller 7"}
    else { say "tallet er større enn 7"}
}
