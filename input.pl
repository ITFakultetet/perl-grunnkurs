#! /usr/bin/perl
use feature ':all';
say "Tast inn navnet ditt:";
my $input = <STDIN>;
chomp $input;
say "Navnet ditt har ",length($input), " bokstaver.";

say "Tast inn et tall:";
my $t1 = <STDIN>;

say "Tast inn et tall til:";
my $t2 = <STDIN>;

chomp ($t1, $t2);

say "Produktet av tallene $t1 og $t2 er ", $t1*$t2;