#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';
use PerlIO::gzip;

$ENV{PATH} = '';

my $filnavn = "war-and-peace.txt.gz";

open my $fh, '<:gzip', $filnavn
    or die "Kan ikke lese fra $filnavn: $!";

while( <$fh> ) {
    print;

    }
