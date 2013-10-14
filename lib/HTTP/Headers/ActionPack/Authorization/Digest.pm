package HTTP::Headers::ActionPack::Authorization;
use v5.16;
use warnings;
use mop;

class Digest extends HTTP::Headers::ActionPack::Core::BaseAuthHeader {

    method username { $self->params->{'username'} }
    method realm    { $self->params->{'realm'}    }

}

1;

__END__

=head1 SYNOPSIS

  use HTTP::Headers::ActionPack::Authorization::Digest;

  # create from string
  my $auth = HTTP::Headers::ActionPack::Authorization::Digest->new_from_string(
      q{Digest
        username="jon.dough@mobile.biz",
        realm="RoamingUsers@mobile.biz",
        nonce="CjPk9mRqNuT25eRkajM09uTl9nM09uTl9nMz5OX25PZz==",
        uri="sip:home.mobile.biz",
        qop=auth-int,
        nc=00000001,
        cnonce="0a4f113b",
        response="6629fae49393a05397450978507c4ef1",
        opaque="5ccc069c403ebaf9f0171e9517f40e41"}
  );

  # create from parameters
  my $auth = HTTP::Headers::ActionPack::Authorization::Digest->new(
      'Digest' => (
          username => 'jon.dough@mobile.biz',
          realm    => 'RoamingUsers@mobile.biz',
          nonce    => "CjPk9mRqNuT25eRkajM09uTl9nM09uTl9nMz5OX25PZz==",
          uri      => "sip:home.mobile.biz",
          qop      => 'auth-int',
          nc       => '00000001',
          cnonce   => "0a4f113b",
          response => "6629fae49393a05397450978507c4ef1",
          opaque   => "5ccc069c403ebaf9f0171e9517f40e41"
      )
  );

=head1 DESCRIPTION

This class represents the Authorization header with the specific
focus on the 'Basic' type. It is just a simple subclass of
L<HTTP::Headers::ActionPack::Core::BaseAuthHeader>

=head1 METHODS

=over 4

=item C<new ( %params )>

=item C<new_from_string ( $header_string )>

=item C<username>

=item C<realm>

=item C<as_string>

=back

=cut
