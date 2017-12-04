#! /usr/bin/perl

use strict;
use feature ':all';

my @host;

open my $logfil, '<', '/var/log/apache2/access.log'
    or die "Kan ikke åpne: $!";


 while (my $line=<$logfil>) {
    my ($host,$date,$url_with_method,$status,$size,$referrer,$agent) = $line =~
          m/^(\S+) - - \[(\S+ [\-|\+]\d{4})\] "(\S+ \S+ [^"]+)" (\d{3}) (\d+|-) "(.*?)" "([^"]+)"$/;
  

 next if $host =~ m#127.0.0.1#;
	
 push @host, $host; 
  


 foreach my $h (@host) {
      print "$h\n";
    }
 
}
