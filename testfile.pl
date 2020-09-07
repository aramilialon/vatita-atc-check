#!c:\strawberry\perl\bin\perl.exe

use strict;
use warnings;

use lib ("./");

use library::library qw (Vatita_module);

Vatita_module::connect_vatsim("1");
