#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';

my %hosts;
my %angrep;

open my $logfil, '<', 'access.log'
    or die "Kan ikke åpne: $!";

 while (my $line=<$logfil>) {
   chomp $line;
   # Lagre linjen i ulike variabler basert på et regulært uttrykk
   my ($host,$date,$url_with_method,$status,$size,$referrer,$agent) = $line =~
          m/^(\S+) - - \[(\S+ [\-|\+]\d{4})\] "(\S+ \S+ [^"]+)" (\d{3}) (\d+|-) "(.*?)" "([^"]+)"$/;

   next if $host =~ m#127.0.0.1#;   # Ikke regn med egne hits, gå videre med next

   $hosts{$host}++;  # øk med 1 hit

   if ($url_with_method=~m/%22|unhex|select/) {
     $angrep{$host} .= $url_with_method."\n";
    }

 }

#  skriv ut hits
 foreach my $h (sort { $hosts{$a} <=> $hosts{$b} } keys %hosts) {
      say "Host: $h - Antall hits: $hosts{$h}";
    }

say "\n--------------------------";

#  skriv ut angrep
for my $ang (keys %angrep) {

say "Angrep fra $ang
--------------------------
$angrep{$ang}
--------------------------";

}
