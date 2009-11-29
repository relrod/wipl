#!/usr/bin/env perl
#@ Ricky Elrod - wikipedia.pl
#@ BSD License

use warnings;
use strict;
use WikiFuncs;
use TextFuncs;

package Wikipedia;
use base qw( Bot::BasicBot );
use Data::Dumper;

my $version = "1.0";

sub said {
	my $self       = shift;
	my $info       = shift;
	my $text       = $info->{body};
	my $nick       = $info->{who};
	my $rawnick    = $info->{raw_nick};
	my @rlmask     = split(/\@/,$rawnick);
	my $mask       = $rlmask[1];
	my $channel    = $info->{channel};

   if($text =~ /\[\[\[(.*)\]\]\]/i){
      return WPB::lookup($1);
   }

   	return;
}
   
my $eighthbit = Wikipedia->new(
   server      => "irc.eighthbit.net",
   port        => 6667,
   channels    => ["#bots"],
   nick        => "wikipedia",
   username    => "wiki",
   name        => "wikipedia bot",
   charset     => "utf-8",
   no_run      => 1,
);

$eighthbit->run();

use POE;
$poe_kernel->run();

