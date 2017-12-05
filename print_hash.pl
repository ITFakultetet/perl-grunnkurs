#!/usr/bin/perl
use strict;
use feature ':all';
use Data::Dumper;

my %hash = ('Navn' => 'Terje', 'Epost' => ['terje@itfakultetet.no','terje@mongodb.no', 'terje1311@gmail.com']);


# Fuksjons-kall med parameter
PrintHash(%hash);

# funksjon som skriver ut en hash
sub PrintHash{
   my %hash = @_;  # Parametre som sendes til en funksjon lagres i arrayet @_
   say Dumper(\%hash);
}
