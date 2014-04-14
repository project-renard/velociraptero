use Mojo::Base -strict;

use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('Velociraptero');
$t->get_ok('/')->status_is(200)->content_like(qr/Velociraptero/i);

done_testing();
