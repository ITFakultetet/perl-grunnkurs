#! /usr/bin/perl

use strict;
use warnings;
use diagnostics;
use feature ':all';

# lag en variabel som inneholder en lang tekst
my $lang_var = <<"END";
Dette er en lag variabel-tekst som
går over flere linjer
og slutter nedenfor
END

say $lang_var;

my $navn = "Terje Berg-Hansen";

say qq($navn er "ganske" 'snill');
 
say q($navn er "ganske" 'snill');

# Lag et array (en liste) @dager
my @dager = qw(mandag tirsdag onsdag torsdag fredag lørdag søndag);

say "\nHer er ukedagene: \n";
# loop gjennom listen @dager og lagre hvert element i variablen $dag
for my $dag (@dager) {
say $dag;
};


# Lag en hash (map) med dyr
my %dyr = qw(
truls katt
dagros ku
ola zebra
pan hund
ferdinand okse
);


for my $dyr (%dyr) {
say $dyr;
};

# bytt verdi på variabler
my $en = 1;
my $to = 2;

($en, $to) = ($to, $en);

say qq($en + $to) = qq($en,$to);






 
