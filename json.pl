#! /usr/bin/perl
use feature ':all';
use JSON;

my @liste = (2, 4, 6);
push @liste, qw(1 2 3 4 5 6 7 8) ;

$json = JSON->new->allow_nonref;

my %adresse = (Gate=>'Kåsabakken 28',Postnr=>'3804',Poststed=>'Telemark');
my %navn = (Navn => 'Terje Berg-Hansen', Adresse =>\%adresse, Tall=>\@liste);

$json_text   = $json->pretty->encode( \%navn );

say "-----------------";
say $json_text;
say "-----------------";

# lagfil();

sub lagfil {
my $filnavn = 'terje.json';

open my $fil, '>', $filnavn
  or die "Kan ikke lagre til fil..$!";

print $fil $json_text;
}
