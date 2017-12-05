#!/usr/bin/perl
use strict;
use warnings;

use Path::Tiny;

my $dir = path('/home/terje/utvikling/perl','perl-grunnkurs'); # foo/bar

mappeinnhold($dir);

# Bla igjennom innholdet i mappen

sub mappeinnhold {
my $iter = $_[0]->iterator;

while (my $file = $iter->()) {

    # Sjekk om det er er en mappe
    if ($file->is_dir()) {
      mappeinnhold($file);
    }

    # Print out the file name and path
    print "$file\n";
}
}
