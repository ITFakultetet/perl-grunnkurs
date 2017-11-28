#! /usr/bin/perl
use Switch;
use feature ':all';
my $tekst = "Dette er en tekst";
my $tekst2 = "Dette er en tekst";

if ($tekst eq $tekst2) {
  say "Teksten er lik";
} else {
  say "teksten er ulik";
}

#Lag et tilfeldig tall mell om 1 og 10:
my $tall = 1+ int(rand(10));
say $tall;

switch ($tall) {
    case 1  {say "tallet er 1"}
    case [2..5] {say "tallet er mellom 2 og 5"}
    case [6,7] {say "tallet er 6 eller 7"}
    else { say "tallet er større enn 7"} 
} 