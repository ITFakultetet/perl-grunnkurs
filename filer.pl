#! /usr/bin/perl

my $filnavn = "war-and-peace.txt";
open my $kof, '<', $filnavn
  or die "Kan ikke åpne < $filnavn: $!";

my $i = 1;
my %ord;

while (my $line = <$kof>) {
	chomp $line;
	foreach my $str($line =~ /\w+/g) {
		$ord{$str}++;
	}
	$i++;
}

my $utfilnavn_alfa = 'kof_alfabetisk.txt';
my $utfilnavn_antall = 'kof_antall.txt';

unlink $utfilnavn_alfa;
unlink $utfilnavn_antall;

open my $kofut_alfa, '>>', $utfilnavn_alfa
  or die "Kan ikke lage eller skrive til < $utfilnavn_alfa: $!";

foreach my $str (sort keys %ord) {
	print $kofut_alfa "$str,$ord{$str}\n";
}

open my $kofut_antall, '>>', $utfilnavn_antall
  or die "Kan ikke lage eller skrive til < $utfilnavn_alfa: $!";

foreach my $str (sort { $ord{$a} <=> $ord{$b} or $a cmp $b } keys %ord) {
	print $kofut_antall "$str,$ord{$str}\n";
}


print "Antall linjer i filen: $i \n";
print "Antall unike ord i filen: ", scalar keys %ord,"\n";

close $kof or die "Kunne ikke lukke $filnavn: $!";
