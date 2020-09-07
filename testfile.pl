#!c:\strawberry\perl\bin\perl.exe

use strict;
use warnings;

use lib ("./library/");

use library;

my $vatsim_id = $ARGV[0];

print $vatsim_id."\n\n";

Vatita_module::connect_vatsim($vatsim_id);
