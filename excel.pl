#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';

use Excel::Writer::XLSX;
use Spreadsheet::Read qw(ReadData);


# Skriv til Excel
my $workbook  = Excel::Writer::XLSX->new( 'enkel.xlsx' );
my $worksheet = $workbook->add_worksheet();

my @data_for_rad = (1, 2, 3);
my @tabell = (
  [4, 5],
	[6, 7],
);
my @data_for_kolonne = (10, 11, 12);


$worksheet->write( "A1", "Hei Excel!" );
$worksheet->write( "A2", "Rad 2" );

$worksheet->write( "A3", \@data_for_rad );
$worksheet->write( 4, 0, \@tabell );
$worksheet->write( 0, 4, [ \@data_for_kolonne ] );

$workbook->close;

# Les fra Excel
my $book = ReadData ('enkel.xlsx');

# Les en tabellrute
say "------------------------------";
say "Her er tabellrute A1:";
say "------------------------------";
say 'A1: ' . $book->[1]{A1};

# Les en tabell-rad
say "------------------------------";
say "Her er hele rad 1:";
say "------------------------------";
my @row = Spreadsheet::Read::row($book->[1], 1);
for my $i (0 .. $#row) {
    say 'A' . ($i+1) . ' ' . ($row[$i] // '');
}

# Les hele regnearket
say "------------------------------";
say "Her er hele regnearket:";
say "------------------------------";
my @rows = Spreadsheet::Read::rows($book->[1]);
foreach my $i (1 .. scalar @rows) {
    foreach my $j (1 .. scalar $rows[$i-1]}) {
        say chr(64+$i) . " $j " . ($rows[$i-1][$j-1] // '');
    }
}
say "------------------------------";
