#! /usr/bin/perl
use feature ':all';
my $filnavn = "/etc/passwd";
open my $brukerfil, '<', $filnavn
  or die "Kan ikke åpne < $filnavn: $!";

my @brukere;

while (my $Line = <$brukerfil>) {
	chomp $Line;
  say $Line;
  push  @brukere , (split /:/, $Line)[0] ;
}

for my $bruker (@brukere) {
say $bruker;  
}
