#!/usr/bin/perl

use IO::Socket;
use strict;

my $server = new IO::Socket::INET(
    Listen => 3,
    LocalAddr => '0.0.0.0',
    LocalPort => 8080,
    Proto => 'tcp',
    Reuse => 1
    );

die "IO::Socket $!" unless $server;

for (;;) {
    if (my $client = $server->accept()) {
        print "connected from " . $client->peerhost() . "\n";
        print $client "HTTP/1.1 200 OK\n";
        print $client "content-type: text/plain\n\n";
        print $client "カレーは汗をかくのでスポーツ\n";
        close $client;
        print "disconected...\n";
    }
}
close $server;
exit;
