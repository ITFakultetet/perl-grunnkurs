#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';
use utf8;

# Enkel funksjon som simulerer et terningkast
my $result = terningkast();

say "------------------------------------";
say "Terningkast: $result";
say "------------------------------------";

sub terningkast {
return 1 + int( rand(6) );
}

# Funksjon som lager et html-oppsett og tar imot 4 parametre: tittel, innhold, bakgrunnsfarge og skriftfarge

my $side1 = lag_html("Dette er side 1","Dette er innholdet på side 1<p><a href=side2.html>Side 2</a>","silver","white");
my $side2 = lag_html("Dette er side 2","Dette er innholdet på side 2<p><a href=side1.html>Side 1</a>","black","white");


say "Side 1";
say "------------------------------------";
say "HTML:\n$side1";
say "------------------------------------";
say "Side 2";
say "------------------------------------";
say "HTML:\n$side2";
say "------------------------------------";

# Skriv HTML til fil
open my $fh, '>' , 'side1.html';
print $fh $side1;
close $fh;

open my $fh2, '>' , 'side2.html';
print $fh2 $side2;
close $fh2;



sub lag_html {

return my $html = <<"end"
<html>
<head>
<title>$_[0]</title>
</head>
<body style="background: $_[2]; color: $_[3]">
<p>$_[1]</p>
</body>
</html>
end

}
