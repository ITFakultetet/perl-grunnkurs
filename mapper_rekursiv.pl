#!/usr/bin/perl
use strict;
use warnings;
use feature ':all';

use Path::Tiny;

my $dir = path('/home/terje/utvikling/perl','perl-grunnkurs'); # foo/bar

les_mappe($dir);

# Bla igjennom innholdet i mappen

sub les_mappe {
my $iter = $_[0]->iterator;

while (my $file = $iter->()) {

    # Sjekk om det er er en mappe
    if ($file->is_dir()) {
      les_mappe($file);
    }

    # Skriv ut filnavn og sti til skjerm
    say $file;
}
}
