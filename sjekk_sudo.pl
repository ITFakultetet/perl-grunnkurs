#!/usr/bin/perl

#Lag et array og fyll det med grep'ing for sudo
#i filen auth.log 
#----------------------------------------------------
@DATA = `grep sudo /var/log/auth.log`;

#Lag en variabel som teller linjer
#----------------------------------------------------
my $cnt = 0;

foreach my $line (@DATA)
{
     chomp($line);
     print "Linje ($cnt): $line\n";

     #Increment cnt-variablen
     $cnt++;
     print "-------------------------------------\n";
}