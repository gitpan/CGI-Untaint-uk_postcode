package CGI::Untaint::uk_postcode;

use strict;
use base 'CGI::Untaint::object';

use vars qw/$VERSION/;
$VERSION = '0.02';

sub _untaint_re { 
  my @patterns = ('AN NAA', 'ANN NAA', 'AAN NAA', 'AANN NAA',
                  'ANA NAA', 'AANA NAA', 'AAA NAA');

  foreach (@patterns) {
    s/A/[A-Z]/g;
    s/N/\\d/g;
    s/ /\\s?/g;
  }

  my $re = join '|', @patterns;
  return qr/^($re)$/i;
}

=head1 NAME

CGI::Untaint::uk_postcode - validate a UK postcode

=head1 SYNOPSIS

  use CGI::Untaint;
  my $handler = CGI::Untaint->new($q->Vars);

  my $url = $handler->extract( -as_uk_postcode => 'postcode' );

=head1 DESCRIPTION

This CGI::Untaint input handler verifies that it is dealing with a
reasonable UK postcode, as defined by the Royal Mail. It does not check
that the postcode is valid.

=head1 SEE ALSO

L<CGI::Untaint>

=head1 AUTHOR

Tony Bowden, E<lt>kasei@tmtm.comE<gt>. Regular expression from
Craig Berry 

=head1 COPYRIGHT

Copyright (C) 2001 Tony Bowden. All rights reserved.

This module is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
