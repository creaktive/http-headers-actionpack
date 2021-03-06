package HTTP::Headers::ActionPack::Core::BaseAuthHeader;
# ABSTRACT: The base Auth Header

use strict;
use warnings;

our $VERSION = '0.10';

use Carp                            qw[ confess ];
use HTTP::Headers::ActionPack::Util qw[
    join_header_params
];

use parent 'HTTP::Headers::ActionPack::Core::BaseHeaderWithParams';

sub BUILDARGS {
    my $class = shift;
    my ($type, @params) = @_;

    confess "You must specify an auth-type" unless $type;

    return +{
        auth_type => $type,
        %{ $class->_prepare_params( @params ) }
    };
}

sub new_from_string {
    my ($class, $header_string) = @_;

    my @parts = HTTP::Headers::Util::_split_header_words( $header_string );
    splice @{ $parts[0] }, 1, 1;

    $class->new( map { @$_ } @parts );
}

sub auth_type { (shift)->{'auth_type'} }

sub as_string {
    my $self = shift;
    $self->auth_type . ' ' . join_header_params( ', ' => $self->params_in_order );
}

1;

__END__

=head1 SYNOPSIS

  use HTTP::Headers::ActionPack::Core::BaseAuthHeader;

=head1 DESCRIPTION

This is a base class for Auth-style headers; it inherits
from L<HTTP::Headers::ActionPack::Core::BaseHeaderWithParams>.

=head1 METHODS

=over 4

=item C<new ( %params )>

=item C<new_from_string ( $header_string )>

=item C<auth_type>

=item C<as_string>

=back

=cut
