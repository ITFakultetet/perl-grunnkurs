#! /usr/bin/perl

# Dette er en enkel funksjon som kaster en terning
my $result = random_terningkast();

print "Terningkast: $result\n";

sub random_terningkast {
return 1 + int( rand(6) );
}

sub skrivut {


}
