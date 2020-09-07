package Vatita_module;
use strict;
use warnings;

require Exporter;
require WWW::Curl::Easy;

our @ISA=qw( Exporter );
our @EXPORT_OK = qw ( connect_vatsim );

sub connect_vatsim {
        my $curl = WWW::Curl::Easy->new;
        my @vatsim_id_requested = @_;
        print "\n\nVatsim ID Requested: ".$vatsim_id_requested[0]."\n";
        $curl->setopt($curl->CURLOPT_HEADER,1);
        $curl->setopt($curl->CURLOPT_URL, "https://api.vatsim.net/api/ratings/$vatsim_id_requested[0]/atcsessions/");
        my $curl_ops = $curl->perform;
        if ($curl_ops == 0){
                print $curl->getinfo($curl->CURLINFO_HTTP_CODE)."\n";
        } else {
                print "Error: ".$curl->strerror($curl_ops)." ".$curl->errbuf."\n";
                }
        return (1);
}
