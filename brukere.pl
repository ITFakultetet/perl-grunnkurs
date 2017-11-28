#! /usr/bin/perl



my $filnavn = "/etc/passwd";
open my $brukere, '<', $filnavn
  or die "Kan ikke åpne < $filnavn: $!";

my $i = 1;
my %ord;

while (my $Line = <$kof>) {
	chomp $Line;
  my $line = lc($Line);
	foreach my $str($line =~ /\w+/g) {

		$ord{$str}++;
	}
	$i++;
}

