#!/usr/bin/perl 

use strict;
use Getopt::Std;

open my $logfil, '<', '/var/log/httpd/access_log'
 or die "Kan ikke åpne: $!"; 

my $options = {};

# n how many urls?
# r print referers?
# f print from (which hosts)?
getopts("n:rfht:", $options);

my $methods = {};
my $urls    = {};

if ($options->{h}) {
  print "options:\n";  
  print "  -n <n>    print the top n visited urls\n";
  print "  -r        show referrers\n";
  print "  -f        show who has visited (f = from)\n";
  print "  -t <n>    show top <n> referrers and froms only\n";
  print "\n";
  exit;
}

my $ignoreHosts = {
  "xxx.yy.zzz.aaa" => {},
};

my $countGiven=0;
$countGiven = 1 if defined $options->{n};

while (my $line=<$logfil>) {
  my ($host,$date,$url_with_method,$status,$size,$referrer,$agent) = $line =~
          m/^(\S+) - - \[(\S+ [\-|\+]\d{4})\] "(\S+ \S+ [^"]+)" (\d{3}) (\d+|-) "(.*?)" "([^"]+)"$/;

  next unless $date =~ m#\d{1,2}/Feb/2002#;

  print $line unless $url_with_method;
  my ($method, $url, $http) = split /\s+/, $url_with_method;

  $url =~ s/\?(.*)//;
  $referrer=~ s/\?(.*)//;

  push @{$methods->{$method}}, $url;
  $urls->{$url} -> {host    } -> {$host}     ++;
  $urls->{$url} -> {count   }                ++;
  $urls->{$url} -> {referrer} -> {$referrer} ++;
} 

foreach my $m (keys %{$methods}) {
  print "$m : " . @{$methods->{$m}} . "\n";
}

my $nofUrls = 0;
foreach my $url (sort {$urls->{$b}->{count} <=> $urls->{$a}->{count} } keys %{$urls}) {

  printf "%5d %s\n\n", $urls->{$url}->{count}, $url;

  my @linesOut;

  if ($options->{f}) {
    my $currentLine=0;
    printf "  %6s%-35s"," ","hosts";
    foreach my $host (sort {$urls->{$url}->{host}->{$b} <=> $urls->{$url}->{host}->{$a} } keys %{$urls->{$url}->{host}}) {
      last if $currentLine > $options->{t};
      $linesOut[$currentLine] .= sprintf "  %5d %-35.35s" ,$urls->{$url}->{host}->{$host}, $host;
      $currentLine++;
    }
  }

  if ($options->{r}) {
    my $currentLine=0;
    printf "  %6s%-55s"," ","referrers";
    

    foreach my $referrer (sort {$urls->{$url}->{referrer}->{$b} <=> $urls->{$url}->{referrer}->{$a} } keys %{$urls->{$url}->{referrer}}) {
      last if $currentLine > $options->{t};
      $linesOut[$currentLine] .= sprintf "  %5d %-55.55s" ,$urls->{$url}->{referrer}->{$referrer}, $referrer;
      $currentLine++;
    }
  }
  print "\n";

  foreach my $line (@linesOut) {
    print "$line\n";
  }

  print "\n";
  if ($countGiven) {
    last if $nofUrls >= $options->{n};
  }
  $nofUrls++;
}
