#! /usr/bin/perl

my $result = random_die_roll();

print $result;

sub random_die_roll {
return 1 + int( rand(6) );
}