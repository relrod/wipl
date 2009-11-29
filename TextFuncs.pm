#!/usr/bin/env perl
use warnings;
use strict;

package Proc;
use Text::WikiText;
use Text::WikiText::Output::Pod;
use WikiFuncs;

sub prepare {
   my $wikitext = shift;
#   my $parser = Text::WikiText->new();
#   my $proc = $parser->parse($wikitext);
#   my $output = Text::WikiText::Output::Pod->new->dump($proc);
   $wikitext =~ s/<!--.*?-->//sgi;
   return $wikitext;
}

my $t = WPB::lookup($ARGV[0]);
print prepare($t);

