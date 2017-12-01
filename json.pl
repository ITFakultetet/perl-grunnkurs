#! /usr/bin/perl
use feature ':all';
use JSON;
# binmode STDOUT, ":utf8";
# use utf8;

my @liste = (2, 4, 6);
push @liste, qw(1 2 3 4 5 6 7 8) ;

$json = JSON->new->allow_nonref;

my %adresse = (Gate=>'Kåsabakken 28',Postnr=>'3804',Poststed=>'Telemark');
my %navn = (Navn => 'Terje Berg-Hansen', Adresse =>\%adresse, Tall=>\@liste);

$json_text   = $json->pretty->encode( \%navn );

say "-----------------";
say $json_text;
say "-----------------";

lagfil();

sub lagfil {
my $filnavn = 'data.json';

open my $fil, '>', $filnavn
  or die "Kan ikke lagre til fil..$!";

print $fil $json_text;
}

# -------------------------------
# Les inn JSON-fil

my $json;
my $data;

lesfil();
# Print ut en variabel eller to
say "Navnet er: ".$data->{'Navn'};
say "Postnummeret er: ".$data->{'Adresse'}->{'Postnr'};
say "Tall nummer 4 er: ".$data->{'Tall'}->[3];

sub lesfil {
   local $/; #Enable 'slurp' mode, som leser inn filen i ett "jafs", og ikke linje for linje...
   open my $fh, "<", "data.json";
   $json = <$fh>;
   close $fh;

   $data = decode_json($json);
}
