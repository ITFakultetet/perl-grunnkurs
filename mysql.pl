#!/usr/bin/perl

use DBI;
use strict;
use feature ':all';

unless (@ARGV) {
  die "Gi et statsoverhode som parameter til filen, feks. 'Harald V' eller 'Elisabeth III'";

}

my $driver = "mysql";
my $host = "s1.itfakultetet.no";
my $database = "world";
my $dsn = "DBI:$driver:database=$database;host=$host";
my $userid = "kurs";
my $password = "kurs123";

my $dbh = DBI->connect($dsn, $userid, $password ) or die $DBI::errstr;

my $sth = $dbh->prepare("SELECT name, population from country where headofstate=\'$ARGV[0]\' order by population");
$sth->execute() or die $DBI::errstr;

say "\nAntall land hvor $ARGV[0] er statsoverhode : ".$sth->rows;
say "-------------------------------------------------------";
while (my @row = $sth->fetchrow_array()) {
   my ($land, $befolkning ) = @row;
      say "$land - Befolkning: $befolkning";
}
$sth->finish();
