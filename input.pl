#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';


# input som parameter fra kommandilinjen
if (@ARGV) {
say "Du sendte meg dette argumentet: ".$ARGV[0];
} else {
  # Input fra stdin
  say "Tast inn navnet ditt:";
  my $input = <>;
  chomp $input;
  say "Navnet ditt har ",length($input), " bokstaver.";

  say "Tast inn et tall:";
  my $t1 = <>;

  say "Tast inn et tall til:";
  my $t2 = <>;
  chomp ($t1, $t2);

  say "Produktet av tallene $t1 og $t2 er ", $t1*$t2;
}
