#! /usr/bin/perl
use strict;
use warnings;
use feature ':all';
use utf8;
# Dette er en enkel funksjon som kaster en terning
my $result = random_terningkast();

say "------------------------------------";
say "Terningkast: $result";
say "------------------------------------";

sub random_terningkast {
return 1 + int( rand(6) );
}


# Funksjon som lager et html-oppsett og tar imot parametre

my $ny_html = lag_html("Dette er tittelen","Dette er innholdet på siden","navy","white");
say "------------------------------------";
say "HTML:\n$ny_html";
say "------------------------------------";

# Skriv HTML til fil
open my $fh, '>' , 'index.html';
print $fh $ny_html;

sub lag_html {

my $html = <<"end"
<html>
<head>
<title>@_[0]</title>
</head>
<body style="background: @_[2]; color: @_[3]">
<p>@_[1]</p>
</body>
</html>
end

}
