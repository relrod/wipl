#!/usr/bin/env perl
use warnings;
use strict;

package WPB;
use Data::Dumper;
use WWW::Wikipedia;

my $w = WWW::Wikipedia->new();

sub lookup {
   my $search = shift;
   my $query = $w->search($search);

   return 0 if(!defined($query));

   my $return;

   # query has *something* in it now.
   if(!defined($query->{'text'})){
      if(defined($query->{'related'})){
         
         # If we get to this point it means there's no direct match,
         # but there are suggestions ("may refer to..."), so lets list some.

         $return = chr(2).$search.chr(2)." may refer to... ";
         my @related = $query->{'related'};
         $return .= join(' :: ', @related);
         return $return;
      } else {

         # We should never get to this point. If there's no
         # text and no suggestions we should have returned at :15.

         return 0;
      }
   } else {
      return $query->{'text'};
   }
   return 0;

}

1;
