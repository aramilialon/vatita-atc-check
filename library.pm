package Vatita_module;
#use strict;
use warnings;

require Exporter;
require WWW::Curl::Easy;

our @ISA=qw( Exporter );
our @EXPORT_OK = qw ( connect_vatsim );

sub connect_vatsim {
	my $curl = WWW::Curl::Easy->new;
	my $vatsim_id_requested = $1;
	print $vatsim_id_requested."\n";
	$curl->setopt(CURLOPT_URL, 'https://api.vatsim.net/api/ratings/$vatsim_id_requested/atcsessions/');
	my $curl_ops = $curl->perform;
	if ($curl_ops == 0){
		print $curl->getinfo(CURLINFO_HTTP_CODE)."\n";
	} else {
		print "Error: ".$curl->strerror($curl_ops)." ".$curl->errbuff."\n";
		}
	return (1);
}